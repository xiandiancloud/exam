<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <header>
      <nav class='navbar navbar-default navbar-fixed-top'>
        <a class='navbar-brand' href='lms/getAllCategory.action'>
          <img width="81" height="21" class="logo" alt="Flatty" src="assets/images/logo.svg" />
          <!-- <img width="21" height="21" class="logo-xs" alt="Flatty" src="assets/images/logo_xs.svg" /> -->
        </a>
        <a class='toggle-nav btn pull-left' href='#'>
          <i class='icon-reorder'></i>
        </a>
        <ul class='nav navbar-left'>
		        <li class=""><a href="lms/getteamCategory.action">首页</a></li>
				<li class=""><a href="lms/mycourse.action">我的云课堂</a></li>
        </ul>
        <ul class='nav'>
	        <li class=''>
	           <a href="javascript:gotouppage();"><span
											class="glyphicon glyphicon-arrow-left">${course.name}</span></a>
			</li>
            <li class=''>
		            <a  href='javascript:pasueClock();'>
		              <i class='glyphicon glyphicon-pause'>暂停</i>
		            </a>
		    </li>
		    <li class=''>
		            <a><span class="glyphicon glyphicon-time" id="clock"></span></a>
		    </li>
        	<c:choose>
			  <c:when test="${empty USER_CONTEXT}">   
			      <li class='dropdown light only-icon'>
		            <a  href='lms/tologin.action'>
		              <i class='icon-signin'>登陆</i>
		            </a>
		          </li>
			  </c:when> 
			  <c:otherwise>   
				<li class='dropdown dark user-menu'>
	            <a class='dropdown-toggle' data-toggle='dropdown' href='#'>
	              <img width="23" height="23" alt="Mila Kunis" src="assets/images/avatar.jpg" />
	              <span class='user-name'>${USER_CONTEXT.username}</span>
	              <b class='caret'></b>
	            </a>
	            <ul class='dropdown-menu'>
	              <li>
	                <a href='lms/mycourse.action'>
	                  <i class='icon-signout'></i>
	                 	 我的云课堂
	                </a>
	              </li>
	              <li>
	                <a href='lms/setting.action?index=1'>
	                  <i class='icon-signout'></i>
	                 	设置
	                </a>
	              </li>
	              <li class='divider'></li>
	              <li>
	                <a href='lms/loginout.action'>
	                  <i class='icon-signout'></i>
	                 	 退出
	                </a>
	              </li>
	            </ul>
	          </li>
			  </c:otherwise> 
			</c:choose> 
        </ul>
      </nav>
</header> --%>
<header>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="container-fluid">
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
				<div class="collapse navbar-collapse" id="example-navbar-collapse">
					<!--向左对齐-->
					<ul class="nav navbar-nav navbar-left pleft15">
						<li><a href="lms/getteamCategory.action">首页</a></li>
						<li><a href="lms/examlist.action?currentpage=1">题库</a></li>
						<!-- <li><a href="cms/totcompetion.action">竞赛</a></li> -->
						<li><a href="lms/myexam.action">我的云试卷</a></li>
						<c:if test="${USER_CONTEXT.role.roleName=='老师'}">
						<li><a href="cms">制作课件</a></li>
						</c:if>
					</ul>
					<!--向右对齐-->
					<ul class="nav navbar-nav navbar-right">
					    <li class=''>
				           <a href="javascript:gotouppage();"><span
														class="glyphicon glyphicon-arrow-left">${exam.name}</span></a>
						</li>
<!-- 			            <li class=''>
					            <a  href='javascript:pasueClock();'>
					              <i class='glyphicon glyphicon-pause'>暂停</i>
					            </a>
					    </li>
					    <li class=''>
					            <a><span class="glyphicon glyphicon-time" id="clock"></span></a>
					    </li> -->
						<c:choose>
							<c:when test="${empty USER_CONTEXT}">
								<li class='dropdown light only-icon'><a
									href='lms/tologin.action'> <i class='icon-signin'>登陆</i>
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
										<li><a href='lms/myexam.action'> <i
												class='icon-signout'></i> 我的云试卷
										</a></li>
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
