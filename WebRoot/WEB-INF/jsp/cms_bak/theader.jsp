<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="wrapper-header wrapper" id="view-top">
	<header class="primary" role="banner">

		<div class="wrapper wrapper-l">
			<h1 class="branding">
				<a href="cms/totcourselist.action"><img src="" alt="edX Studio" /></a>
			</h1>

		</div>

		<div class="wrapper wrapper-r">
			<nav class="nav-account nav-is-signedin nav-dd ui-right">
				<!--  <h2 class="sr">帮助 &amp; 账户导航</h2> -->
				<ol>
					<!--           <li class="nav-item nav-account-help">
            <h3 class="title"><span class="label"><a href="http://edx.readthedocs.org/projects/edx-partner-course-staff/en/latest/getting_started/get_started.html" title="Contextual Online Help" target="_blank">帮助</a></span></h3>
          </li> -->

					<!--           <li class="nav-item nav-account-user">
            <h3 class="title"><span class="label"><span class="label-prefix sr">当前登录用户：</span><span class="account-username" title="staff">staff</span></span> <i class="icon-caret-down ui-toggle-dd"></i></h3>

            <div class="wrapper wrapper-nav-sub">
              <div class="nav-sub">
                <ul>
                  <li class="nav-item nav-account-dashboard">
                    <a href="/">我的课程</a>
                  </li>
                  <li class="nav-item nav-account-signout">
                    <a class="action action-signout" href="/logout">退出</a>
                  </li>
                </ul>
              </div>
            </div>
          </li> -->

					<c:choose>
						<c:when test="${empty USER_CONTEXT}">
							<li class="nav-item nav-not-signedin-signup"><a
								class="action action-signup" href="cms/totregeister.action">注册</a></li>
							<li class="nav-item nav-not-signedin-signin"><a
								class="action action-signin" href="cms/totlogin.action">登录</a></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item nav-account-user">
								<h3 class="title">
									<span class="label"><span class="label-prefix sr">当前登录用户：</span><span
										class="account-username" title="staff">${USER_CONTEXT.username}</span></span>
									<i class="icon-caret-down ui-toggle-dd"></i>
								</h3>

								<div class="wrapper wrapper-nav-sub">
									<div class="nav-sub">
										<ul>
											<li class="nav-item nav-account-dashboard"><a href="cms/totcourselist.action">我的课程</a>
											</li>
											<li class="nav-item nav-account-signout"><a
												class="action action-signout" href="cms/tloginout.action">退出</a></li>
										</ul>
									</div>
								</div>
							</li>
						</c:otherwise>
					</c:choose>

				</ol>
			</nav>

		</div>
	</header>
	<%-- <header class="primary" role="banner">

		<div class="wrapper wrapper-l">
			<h1 class="branding">
				<a href="/"><img src="/static/452d696/img/logo-edx-studio.png"
					alt="edX Studio" /> </a>
			</h1>

		</div>
		<div class="wrapper wrapper-r">
			<nav class="nav-not-signedin nav-pitch">
				<h2 class="sr">You're not currently signed in</h2>
				<ol>
					<li class="nav-item nav-not-signedin-help"><a
						href="http://edx.readthedocs.org/projects/edx-partner-course-staff/en/latest/getting_started/get_started.html"
						title="Contextual Online Help" target="_blank">帮助</a></li>
					<li class="nav-item nav-not-signedin-signup"><a
						class="action action-signup" href="signup.jsp">注册</a></li>
					<li class="nav-item nav-not-signedin-signin"><a
						class="action action-signin" href="signin.jsp">登录</a></li> 
					<c:choose>
						<c:when test="${empty USER_CONTEXT}">
							<li class="nav-item nav-not-signedin-signin"><a
								class="action action-signin" href="cms/totlogin.action">登录</a></li>
						</c:when>
						<c:otherwise>
								<li class="nav-item nav-not-signedin-signin"><a
								class="action action-signin" href="#">${USER_CONTEXT.username}</a></li>
						</c:otherwise>
					</c:choose>
				</ol>
			</nav>
		</div>
	</header> --%>
</div>