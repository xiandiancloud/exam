<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="wrapper-header wrapper" id="view-top">
  <header class="primary" role="banner">

    <div class="wrapper wrapper-l">
      <h1 class="branding"><a href="cms/totexamlist.action"><img src="images/cmslogo.png"/></a></h1>

      
      <h2 class="info-course">
        <span class="sr">当前试卷</span>
        <a class="course-link" href="cms/totexam.action?examId=${examId}">
          <span class="course-org">${exam.org}</span><span class="course-number">${exam.coursecode}</span>
          <span class="course-title" title="edX Demonstration Course">${exam.name}</span>
        </a>
      </h2>

      <nav class="nav-course nav-dd ui-left">
        <h2 class="sr">edX Demonstration Course导航：</h2>
        <ol>
          <li class="nav-item nav-course-courseware">
            <h3 class="title"><span class="label"><span class="label-prefix sr">试卷 </span>内容</span> <i class="icon-caret-down ui-toggle-dd"></i></h3>

            <div class="wrapper wrapper-nav-sub">
              <div class="nav-sub">
                <ul>
                  <li class="nav-item nav-course-courseware-outline">
                    <a href="cms/totexam.action?examId=${examId}">大纲</a>
                  </li>
                  <!--<li class="nav-item nav-course-courseware-updates">
                    <a href="cms/totupdate.action?courseId=${courseId}">更新</a>
                  </li>
                   <li class="nav-item nav-course-courseware-pages">
                    <a href="/tabs/edX/Open_DemoX/edx_demo_course">页面</a>
                  </li>
                  <li class="nav-item nav-course-courseware-uploads">
                    <a href="/assets/edX/Open_DemoX/edx_demo_course/">文件&amp;上传</a>
                  </li>
                  <li class="nav-item nav-course-courseware-textbooks">
                    <a href="/textbooks/edX/Open_DemoX/edx_demo_course">教材</a>
                  </li> -->
                </ul>
              </div>
            </div>
          </li>

          <li class="nav-item nav-course-settings">
            <h3 class="title"><span class="label"><span class="label-prefix sr">试卷 </span>设置</span> <i class="icon-caret-down ui-toggle-dd"></i></h3>

            <div class="wrapper wrapper-nav-sub">
              <div class="nav-sub">
                <ul>
                  <li class="nav-item nav-course-settings-schedule">
                    <a href="cms/totexamschedule.action?examId=${examId}">日程 &amp; 细节</a>
                  </li>
                  <li class="nav-item nav-course-settings-advanced">
                    <a href="cms/totsetting.action?examId=${examId}">高级设置</a>
                  </li>
                  
                 <!--  <li class="nav-item nav-course-settings-grading">
                    <a href="/settings/grading/edX/Open_DemoX/edx_demo_course">评分</a>
                  </li> 
                  <li class="nav-item nav-course-settings-team">
                    <a href="cms/totteam.action?courseId=${courseId}">试卷团队</a>
                  </li>-->
                <!--   <li class="nav-item nav-course-settings-advanced">
                    <a href="/settings/advanced/edX/Open_DemoX/edx_demo_course">高级设置</a>
                  </li> -->
                </ul>
              </div>
            </div>
          </li>

          <li class="nav-item nav-course-tools">
            <h3 class="title"><span class="label">工具</span> <i class="icon-caret-down ui-toggle-dd"></i></h3>

            <div class="wrapper wrapper-nav-sub">
              <div class="nav-sub">
                <ul>
                 <!--  <li class="nav-item nav-course-tools-checklists">
                    <a href="/checklists/edX/Open_DemoX/edx_demo_course/">核对表</a>
                  </li> -->
                  <li class="nav-item nav-course-tools-import">
                    <a href="cms/totimportexam.action?examId=${examId}">导入</a>
                  </li>
                  <li class="nav-item nav-course-tools-export">
                    <a href="cms/totexportexam.action?examId=${examId}">导出</a>
                  </li>
                  <li class="nav-item nav-course-tools-export">
                    <a href="cms/totexportexamword.action?examId=${examId}">导出Word</a>
                  </li>
                  <li class="nav-item nav-course-tools-export">
                    <a href="cms/totselectexam.action?examId=${examId}">选择试卷导入</a>
                  </li>
                </ul>
              </div>
            </div>
          </li>
        </ol>
      </nav>
    </div>

    <div class="wrapper wrapper-r">
      <nav class="nav-account nav-is-signedin nav-dd ui-right">
        <ol>
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
								<li class="nav-item nav-account-dashboard"><a href="cms/totexamlist.action">我的试卷</a>
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
</div>