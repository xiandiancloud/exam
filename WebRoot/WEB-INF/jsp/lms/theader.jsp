<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header>
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
</header>
