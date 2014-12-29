<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<header>
<nav class="navbar navbar-default" role="navigation">
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="navbar-header">
				      <button type="button" class="navbar-toggle" data-toggle="collapse" 
				         data-target="#example-navbar-collapse">
				         <span class="sr-only">切换导航</span>
				         <span class="icon-bar"></span>
				         <span class="icon-bar"></span>
				         <span class="icon-bar"></span>
				      </button>
					<a class='navbar-brand' href='lms/getteamCategory.action'> <img
						width="51" height="48" class="logo" src="images/logo.png" /><img width="160" height="30"
							class="logo" alt="Flatty" src="images/logo-lab.png" />
					</a>
				</div>
				<div class="collapse navbar-collapse l3back" id="example-navbar-collapse">
					<!--向左对齐--> 
					<ul class="nav navbar-nav navbar-left pleft15">
						<c:if test="${fn:contains(USER_PERMISSION,'首页') || USER_CONTEXT.role.roleName eq '老师'}"> 
							<li><a href="lms/getteamCategory.action">首页</a></li>
						</c:if>
						<c:if test="${fn:contains(USER_PERMISSION,'题库') || USER_CONTEXT.role.roleName eq '老师'}"> 
						<li><a href="lms/examlist.action?currentpage=1&c=0&r=0">题库</a></li>
						</c:if>
						<c:if test="${fn:contains(USER_PERMISSION,'竞赛') || USER_CONTEXT.role.roleName eq '老师'}"> 
						<li><a href="lms/competionlist.action">竞赛</a></li><!-- ?currentpage=1&c=0&r=0 -->
						</c:if>
						<c:if test="${fn:contains(USER_PERMISSION,'我的云试卷') || USER_CONTEXT.role.roleName eq '老师'}"> 
						<li><a href="lms/myexam.action">我的云试卷</a></li>
						</c:if>
						<%-- <c:if test="${USER_CONTEXT.role.roleName=='老师'}">
						<li><a href="cms">制作试卷</a></li>
						<li><a href="cms/totcompetion.action?competionId=-1">增加竞赛</a></li>
						</c:if> --%>
					</ul>
					<!--向右对齐-->
					<ul class="nav navbar-nav navbar-right">
						<c:choose>
							<c:when test="${empty USER_CONTEXT}">
								<li class='dropdown light only-icon'><a
									href='lms/toregeister.action'> <i class='icon-signin'>注册</i>
								</a></li>
								<li class='dropdown light only-icon'><a
									href='lms/tologin.action'> <i class='icon-signin'>登录</i>
								</a></li>
							</c:when>
							<c:otherwise>
								<li class='dropdown dark user-menu'><a
									class='dropdown-toggle' data-toggle='dropdown' href='#'> <img
										width="23" height="23" alt="" src="images/logo.png" /> <span
										class='user-name'>${USER_CONTEXT.username}</span> <b
										class='caret'></b>
								</a>
									<ul class='dropdown-menu'>
										<c:if test="${fn:contains(USER_PERMISSION,'我的云试卷') || USER_CONTEXT.role.roleName eq '老师'}"> 
										<li><a href='lms/myexam.action'> <i
												class='icon-signout'></i> 我的云试卷
										</a></li>
										</c:if>
										<c:if test="${USER_CONTEXT.role.roleName=='老师'}">
										<li><a href="cms"><i
												class='icon-signout'></i>制作试卷</a></li>
										<li><a href="cms/totcompetion.action?competionId=-1"><i
												class='icon-signout'></i>增加竞赛</a></li>
										</c:if>
										<li><a href='lms/mysetting.action'> <i
												class='icon-signout'></i> 设置
										</a></li>
										<li class='divider'></li>
										<li><a href='lms/loginout.action'> <i
												class='icon-signout'></i> 退出
										</a></li>
									</ul></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</div>
	</div>
</nav>
</header>