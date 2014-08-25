package com.dhl.cms;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.dhl.cons.CommonConstant;
import com.dhl.domain.Role;
import com.dhl.domain.User;
import com.dhl.service.UserService;

/**
 * 老师登录的拦截器
 * @author dhl
 *
 */
public class LoginInterceptor implements HandlerInterceptor {

	@Autowired
	private UserService userService;

	private static final String FILTERED_REQUEST = "@@session_context_filtered_request";

	private static final String[] INHERENT_ESCAPE_URIS = { "/totlogin.action",
			"/tlogin.action", "/totregeister.action","tregeister.action", "/bbb.action" };

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
	}

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object arg2) throws Exception {
		if (request != null && request.getAttribute(FILTERED_REQUEST) != null) {
			return true;
		} else {

			request.setAttribute(FILTERED_REQUEST, Boolean.TRUE);
			HttpServletRequest httpRequest = (HttpServletRequest) request;
			User user = getSessionUser(httpRequest);
			String contextPath = request.getContextPath();
			if (user == null
					&& !isURILogin(httpRequest.getRequestURI(), httpRequest)) {
				String toUrl = httpRequest.getRequestURL().toString();
				if (!StringUtils.isEmpty(httpRequest.getQueryString())) {
					toUrl += "?" + httpRequest.getQueryString();
				}

				httpRequest.getSession().setAttribute(
						CommonConstant.LOGIN_TO_URL, toUrl);

				response.sendRedirect(contextPath + "/cms/totlogin.action");
				return false;
			}

			//如果用户登录，且不是老师，除了不需要登录的action，其他都要跳转到登录
			if (user != null && !isURILogin(httpRequest.getRequestURI(), httpRequest)) {
				Role role = userService.getUserRoleByuserId(user.getId());
				if (!CommonConstant.ROLE_T.equals(role.getRoleName())) {
					String toUrl = httpRequest.getRequestURL().toString();
					if (!StringUtils.isEmpty(httpRequest.getQueryString())) {
						toUrl += "?" + httpRequest.getQueryString();
					}

					httpRequest.getSession().setAttribute(
							CommonConstant.LOGIN_TO_URL, toUrl);
					response.sendRedirect(contextPath + "/cms/totlogin.action");
//					request.getRequestDispatcher(contextPath + "/cms/totlogin.action").forward(request, response);
					return false;
				}
			}
			return true;
		}
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

	protected User getSessionUser(HttpServletRequest request) {
		return (User) request.getSession().getAttribute(
				CommonConstant.USER_CONTEXT);
	}
}
