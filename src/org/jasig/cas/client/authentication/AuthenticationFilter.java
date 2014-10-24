/*
 * Licensed to Jasig under one or more contributor license
 * agreements. See the NOTICE file distributed with this work
 * for additional information regarding copyright ownership.
 * Jasig licenses this file to you under the Apache License,
 * Version 2.0 (the "License"); you may not use this file
 * except in compliance with the License.  You may obtain a
 * copy of the License at the following location:
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
package org.jasig.cas.client.authentication;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jasig.cas.client.util.AbstractCasFilter;
import org.jasig.cas.client.util.CommonUtils;
import org.jasig.cas.client.util.ReflectUtils;
import org.jasig.cas.client.validation.Assertion;

/**
 * dhl 重写单点登录的验证模块，主要是增加排除验证的url
 */
public class AuthenticationFilter extends AbstractCasFilter {

	// 增加排除验证的url
	private static final String[] INHERENT_ESCAPE_URIS = {
			"getAllCategory.action", "getCourse.action",
			"getteamCategory.action", "getCourseByCategoryId.action",
			"getexamByCategoryId.action", "examlist.action",
			"recentcourse.action", "toregeister.action", "regeister.action",
			"getAllSchool.action", "getAllExamCategory.action",
			"tlogin.action", "totregeister.action", "tregeister.action","loginout.action","tloginout.action" };

	/**
	 * The URL to the CAS Server login.
	 */
	private String casServerLoginUrl;

	/**
	 * Whether to send the renew request or not.
	 */
	private boolean renew = false;

	/**
	 * Whether to send the gateway request or not.
	 */
	private boolean gateway = false;

	private GatewayResolver gatewayStorage = new DefaultGatewayResolverImpl();

	private AuthenticationRedirectStrategy authenticationRedirectStrategy = new DefaultAuthenticationRedirectStrategy();

	private UrlPatternMatcherStrategy ignoreUrlPatternMatcherStrategyClass = null;

	private static final Map<String, Class<? extends UrlPatternMatcherStrategy>> PATTERN_MATCHER_TYPES = new HashMap<String, Class<? extends UrlPatternMatcherStrategy>>();

	static {
		PATTERN_MATCHER_TYPES.put("CONTAINS",
				ContainsPatternUrlPatternMatcherStrategy.class);
		PATTERN_MATCHER_TYPES
				.put("REGEX", RegexUrlPatternMatcherStrategy.class);
		PATTERN_MATCHER_TYPES
				.put("EXACT", ExactUrlPatternMatcherStrategy.class);
	}

	protected void initInternal(final FilterConfig filterConfig)
			throws ServletException {
		if (!isIgnoreInitConfiguration()) {
			super.initInternal(filterConfig);
			setCasServerLoginUrl(getPropertyFromInitParams(filterConfig,
					"casServerLoginUrl", null));
			logger.trace("Loaded CasServerLoginUrl parameter: {}",
					this.casServerLoginUrl);
			setRenew(parseBoolean(getPropertyFromInitParams(filterConfig,
					"renew", "false")));
			logger.trace("Loaded renew parameter: {}", this.renew);
			setGateway(parseBoolean(getPropertyFromInitParams(filterConfig,
					"gateway", "false")));
			logger.trace("Loaded gateway parameter: {}", this.gateway);

			final String ignorePattern = getPropertyFromInitParams(
					filterConfig, "ignorePattern", null);
			logger.trace("Loaded ignorePattern parameter: {}", ignorePattern);

			final String ignoreUrlPatternType = getPropertyFromInitParams(
					filterConfig, "ignoreUrlPatternType", "REGEX");
			logger.trace("Loaded ignoreUrlPatternType parameter: {}",
					ignoreUrlPatternType);

			if (ignorePattern != null) {
				final Class<? extends UrlPatternMatcherStrategy> ignoreUrlMatcherClass = PATTERN_MATCHER_TYPES
						.get(ignoreUrlPatternType);
				if (ignoreUrlMatcherClass != null) {
					this.ignoreUrlPatternMatcherStrategyClass = ReflectUtils
							.newInstance(ignoreUrlMatcherClass.getName());
				} else {
					try {
						logger.trace(
								"Assuming {} is a qualified class name...",
								ignoreUrlPatternType);
						this.ignoreUrlPatternMatcherStrategyClass = ReflectUtils
								.newInstance(ignoreUrlPatternType);
					} catch (final IllegalArgumentException e) {
						logger.error("Could not instantiate class [{}]",
								ignoreUrlPatternType, e);
					}
				}
				if (this.ignoreUrlPatternMatcherStrategyClass != null) {
					this.ignoreUrlPatternMatcherStrategyClass
							.setPattern(ignorePattern);
				}
			}

			final String gatewayStorageClass = getPropertyFromInitParams(
					filterConfig, "gatewayStorageClass", null);

			if (gatewayStorageClass != null) {
				this.gatewayStorage = ReflectUtils
						.newInstance(gatewayStorageClass);
			}

			final String authenticationRedirectStrategyClass = getPropertyFromInitParams(
					filterConfig, "authenticationRedirectStrategyClass", null);

			if (authenticationRedirectStrategyClass != null) {
				this.authenticationRedirectStrategy = ReflectUtils
						.newInstance(authenticationRedirectStrategyClass);
			}
		}
	}

	public void init() {
		super.init();
		CommonUtils.assertNotNull(this.casServerLoginUrl,
				"casServerLoginUrl cannot be null.");
	}

	public final void doFilter(final ServletRequest servletRequest,
			final ServletResponse servletResponse, final FilterChain filterChain)
			throws IOException, ServletException {

		final HttpServletRequest request = (HttpServletRequest) servletRequest;
		final HttpServletResponse response = (HttpServletResponse) servletResponse;

		if (isRequestUrlExcluded(request)) {
			logger.debug("Request is ignored.");
			filterChain.doFilter(request, response);
			return;
		}

		final HttpSession session = request.getSession(false);
		final Assertion assertion = session != null ? (Assertion) session
				.getAttribute(CONST_CAS_ASSERTION) : null;

		if (assertion != null) {
			filterChain.doFilter(request, response);
			return;
		}

		final String serviceUrl = constructServiceUrl(request, response);
		// 排除不需要验证的url
		if (isURILogin(request.getRequestURI(), request)) {
			filterChain.doFilter(request, response);
			return;
		}

		final String ticket = retrieveTicketFromRequest(request);
		final boolean wasGatewayed = this.gateway
				&& this.gatewayStorage.hasGatewayedAlready(request, serviceUrl);

		if (CommonUtils.isNotBlank(ticket) || wasGatewayed) {
			filterChain.doFilter(request, response);
			return;
		}

		final String modifiedServiceUrl;

		logger.debug("no ticket and no assertion found");
		if (this.gateway) {
			logger.debug("setting gateway attribute in session");
			modifiedServiceUrl = this.gatewayStorage.storeGatewayInformation(
					request, serviceUrl);
		} else {
			modifiedServiceUrl = serviceUrl;
		}

		logger.debug("Constructed service url: {}", modifiedServiceUrl);

		final String urlToRedirectTo = CommonUtils.constructRedirectUrl(
				this.casServerLoginUrl, getServiceParameterName(),
				modifiedServiceUrl, this.renew, this.gateway);

		logger.debug("redirecting to \"{}\"", urlToRedirectTo);
		this.authenticationRedirectStrategy.redirect(request, response,
				urlToRedirectTo);
	}

	public final void setRenew(final boolean renew) {
		this.renew = renew;
	}

	public final void setGateway(final boolean gateway) {
		this.gateway = gateway;
	}

	public final void setCasServerLoginUrl(final String casServerLoginUrl) {
		this.casServerLoginUrl = casServerLoginUrl;
	}

	public final void setGatewayStorage(final GatewayResolver gatewayStorage) {
		this.gatewayStorage = gatewayStorage;
	}

	private boolean isRequestUrlExcluded(final HttpServletRequest request) {
		if (this.ignoreUrlPatternMatcherStrategyClass == null) {
			return false;
		}

		final StringBuffer urlBuffer = request.getRequestURL();
		if (request.getQueryString() != null) {
			urlBuffer.append("?").append(request.getQueryString());
		}
		final String requestUri = urlBuffer.toString();
		return this.ignoreUrlPatternMatcherStrategyClass.matches(requestUri);
	}

	/**
	 * 当前URI资源是否需要登录才能访问
	 * 
	 * @param requestURI
	 * @param request
	 * @return
	 */
	private boolean isURILogin(String requestURI, HttpServletRequest request) {
		if (request.getContextPath().equalsIgnoreCase(requestURI)
				|| (request.getContextPath() + "/")
						.equalsIgnoreCase(requestURI))
			return true;
		for (String uri : INHERENT_ESCAPE_URIS) {
			if (requestURI != null && requestURI.indexOf(uri) >= 0) {
				return true;
			}
		}
		return false;
	}
}
