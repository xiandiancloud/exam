<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="navbar navbar-inverse navbar-fixed-top topone" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="" href="getAllCategory.action"><img src="images/logo.png" /></a>
		</div>
		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav">

				<li class="<c:if test='${navindex==1}'>active</c:if>"><a href="getAllCategory.action">首页</a></li>
				<li class="<c:if test='${navindex==2}'>active</c:if>"><a href="mycourse.action">我的云课堂</a></li>
				
				<!-- <li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Dropdown <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li class="divider"></li>
						<li class="dropdown-header">Nav header</li>
						<li><a href="#">Separated link</a></li>
						<li><a href="#">One more separated link</a></li>
					</ul></li> -->
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<c:choose>
				  <c:when test="${empty USER_CONTEXT}">   
				    <li class=""><a href="tologin.action">登陆</a></li>
				  </c:when> 
				  <c:otherwise>   
				   <li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown">${USER_CONTEXT.username}<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="mycourse.action">我的云课堂</a></li>
						<li><a href="setting.action?index=1">设置</a></li>
						<li class="divider"></li>
						<li><a href="loginout.action">退出</a></li>
					</ul></li>
				  </c:otherwise> 
				</c:choose> 

				
			</ul>
		</div>
		<!--/.nav-collapse -->
	</div>
</div>