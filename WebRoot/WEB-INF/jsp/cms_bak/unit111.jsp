<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<!--[if IE 7]><html class="ie7 lte9 lte8 lte7" lang="zh-cn"><![endif]-->
<!--[if IE 8]><html class="ie8 lte9 lte8" lang="zh-cn"><![endif]-->
<!--[if IE 9]><html class="ie9 lte9" lang="zh-cn"><![endif]-->
<!--[if gt IE 9]><!-->
<html lang="zh-cn"><!--<![endif]-->
  <head>
  	<base href="<%=basePath%>">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>单元 单元 |edX Demonstration Course|edX Studio</title>

    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta name="path_prefix" content="">
	
	<link type="text/css" rel="stylesheet" href="tcss/normalize.css">
	<link type="text/css" rel="stylesheet" href="tcss/font-awesome.css">
	<link type="text/css" rel="stylesheet" href="tcss/number-polyfill.css">
	<link type="text/css" rel="stylesheet" href="tcss/codemirror.css">
	<link type="text/css" rel="stylesheet" href="tcss/jquery-ui-1.8.22.custom.css">
	<link type="text/css" rel="stylesheet" href="tcss/jquery.qtip.min.css">
	<link type="text/css" rel="stylesheet" href="tcss/style.css">
	<link type="text/css" rel="stylesheet" href="tcss/content.min.css">
	<link type="text/css" rel="stylesheet" href="tcss/tinymce-studio-content.css">
	<link type="text/css" rel="stylesheet" href="tcss/skin.min.css">    
	<link type="text/css" rel="stylesheet" href="tcss/style-app.css">   
	<link type="text/css" rel="stylesheet" href="tcss/style-app-extend1.css">    
	<link type="text/css" rel="stylesheet" href="tcss/style-xmodule.css">

	<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="js/index.js"></script>
	<script type="text/javascript" src="js/jquery-ui.js"></script>  
    
    <script type="text/javascript">
        function edit() {
            var input = this.$('.xblock-field-input');
            this.$('.wrapper-xblock-field').addClass('is-editing');
            input.focus().select();            
        }
        function completeEdit(){
          	var currentValue=this.$('.xblock-field-input').val();
        	if (currentValue === "单元") {
                    this.$('.wrapper-xblock-field').removeClass('is-editing');
                }
            else{
            		this.$('.wrapper-xblock-field').removeClass('is-editing');
            		var oldvalue=document.getElementById("t11").innerHTML=currentValue;
            }        	
        } 
    </script>
</head>

<body class="is-signedin course container view-container hide-wip lang_zh-cn">


    <a class="nav-skip" href="#content">跳过本内容页</a>
    <script type="text/javascript" src="/static/452d696/js/vendor/require.js"></script>

<div class="wrapper wrapper-view">
        

<div class="wrapper-header wrapper" id="view-top">
  <header class="primary" role="banner">

    <div class="wrapper wrapper-l">
      <h1 class="branding"><a href="/"><img src="" alt="edX Studio" /></a></h1>

      
      <h2 class="info-course">
        <span class="sr">当前课程</span>
        <a class="course-link" href="/course/edX/Open_DemoX/edx_demo_course">
          <span class="course-org">edX</span><span class="course-number">Open_DemoX</span>
          <span class="course-title" title="edX Demonstration Course">edX Demonstration Course</span>
        </a>
      </h2>

      <nav class="nav-course nav-dd ui-left">
        <h2 class="sr">edX Demonstration Course导航：</h2>
        <ol>
          <li class="nav-item nav-course-courseware">
            <h3 class="title"><span class="label"><span class="label-prefix sr">课程 </span>内容</span> <i class="icon-caret-down ui-toggle-dd"></i></h3>

            <div class="wrapper wrapper-nav-sub">
              <div class="nav-sub">
                <ul>
                  <li class="nav-item nav-course-courseware-outline">
                    <a href="/course/edX/Open_DemoX/edx_demo_course">大纲</a>
                  </li>
                  <li class="nav-item nav-course-courseware-updates">
                    <a href="/course_info/edX/Open_DemoX/edx_demo_course">更新</a>
                  </li>
                  <li class="nav-item nav-course-courseware-uploads">
                    <a href="/assets/edX/Open_DemoX/edx_demo_course/">文件&amp;上传</a>
                  </li>
                </ul>
              </div>
            </div>
          </li>

          <li class="nav-item nav-course-settings">
            <h3 class="title"><span class="label"><span class="label-prefix sr">课程 </span>设置</span> <i class="icon-caret-down ui-toggle-dd"></i></h3>

            <div class="wrapper wrapper-nav-sub">
              <div class="nav-sub">
                <ul>
                  <li class="nav-item nav-course-settings-schedule">
                    <a href="/settings/details/edX/Open_DemoX/edx_demo_course">日程 &amp; 细节</a>
                  </li>
                  <li class="nav-item nav-course-settings-grading">
                    <a href="/settings/grading/edX/Open_DemoX/edx_demo_course">评分</a>
                  </li>
                  <li class="nav-item nav-course-settings-team">
                    <a href="/course_team/edX/Open_DemoX/edx_demo_course/">课程团队</a>
                  </li>
                  <li class="nav-item nav-course-settings-advanced">
                    <a href="/settings/advanced/edX/Open_DemoX/edx_demo_course">高级设置</a>
                  </li>
                </ul>
              </div>
            </div>
          </li>

          <li class="nav-item nav-course-tools">
            <h3 class="title"><span class="label">工具</span> <i class="icon-caret-down ui-toggle-dd"></i></h3>

            <div class="wrapper wrapper-nav-sub">
              <div class="nav-sub">
                <ul>
                  <li class="nav-item nav-course-tools-import">
                    <a href="/import/edX/Open_DemoX/edx_demo_course">导入</a>
                  </li>
                  <li class="nav-item nav-course-tools-export">
                    <a href="/export/edX/Open_DemoX/edx_demo_course">导出</a>
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
        <h2 class="sr">帮助 &amp; 账户导航</h2>
        <ol>
        
          <li class="nav-item nav-account-user">
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
          </li>
        </ol>
      </nav>

    </div>
  </header>
</div>



<div id="content">

			<div class="wrapper-mast wrapper">
				<header class="mast has-actions has-navigation has-subtitle">
					<div class="page-header">
						<small class="navigation navigation-parents subtitle"> 
							<a class="navigation-item navigation-link navigation-parent" href="/course/Haverd/No.010/2014_T2?show=i4x%3A//Haverd/No.010/chapter/67166e18dd91434ea599a538d64d748f">Section</a>

							<a class="navigation-item navigation-link navigation-parent" href="/course/Haverd/No.010/2014_T2?show=i4x%3A//Haverd/No.010/sequential/695e534c5d9647918ca9b15faece67a7">Subsection</a>
						</small>
						<div data-field-display-name="Display Name" data-field="display_name" class="wrapper-xblock-field incontext-editor is-editable">
							<h1 id="t11" class="page-header-title xblock-field-value incontext-editor-value">
								单元
							</h1>
							<div class="incontext-editor-action-wrapper">
								<a title="Edit the name" class="action-edit action-inline xblock-field-value-edit incontext-editor-open-action" onclick="edit()"> 
									<i class="icon-pencil"> </i>
										<span class="sr">Edit</span> 
								</a>
							</div>

							<div class="xblock-string-field-editor incontext-editor-form">
								<form>
									<label>
										<span class="sr">Edit Display Name	(required)</span> 
										<input type="text" title="Edit the name" data-metadata-name="display_name" class="xblock-field-input incontext-editor-input" value="单元" onblur="completeEdit()"/>
									</label>
									<button type="submit" name="submit" class="sr action action-primary">Save</button>
									<button type="button" name="cancel" class="sr action action-secondary">取消</button>
								</form>
							</div>
						</div>
					</div>

					<nav class="nav-actions">
						<h3 class="sr">页面操作</h3>
						<ul>
							<li class="action-item action-view nav-item"><a
								rel="external"
								class="button button-view action-button is-disabled"
								href="//localhost:8000/courses/Haverd/No.010/2014_T2/jump_to/i4x://Haverd/No.010/vertical/e2aaa68845c6474e9fef121281373c94"
								title="该链接将在新的浏览器窗口/标签打开" target="_blank"> <span
									class="action-button-text">View Live Version</span> </a></li>
							<li class="action-item action-preview nav-item"><a
								rel="external" class="button button-preview action-button"
								href="//preview.localhost:8000/courses/Haverd/No.010/2014_T2/courseware/67166e18dd91434ea599a538d64d748f/695e534c5d9647918ca9b15faece67a7/1"
								title="该链接将在新的浏览器窗口/标签打开" target="_blank"> <span
									class="action-button-text">Preview Changes</span> </a></li>
						</ul>
					</nav>
				</header>
			</div>

			<div class="wrapper-content wrapper">
				<div class="inner-wrapper">
					<section class="content-area">
						<article class="content-primary">
							<div class="container-message wrapper-message"></div>
							<section
								class="wrapper-xblock level-page is-hidden studio-xblock-wrapper"
								data-locator="i4x://edX/Open_DemoX/vertical/0a28cb559d5840e78c02fd5269968216"
								data-course-key="edX/Open_DemoX/edx_demo_course"></section>
							<div class="add-xblock-component new-component-item adding">
								<div class="new-component">
									<h5>Add New Component</h5>
									<ul class="new-component-type">
										<li>
											<a class="multiple-templates add-xblock-component-button"> 
												<span class="large-template-icon large-experiment-icon"></span> 
												<span class="name">实验</span>
											</a>
										</li>
									</ul>
								</div>
								<div class="new-component-templates new-component-html">
									<div id="tab1" class="tab current">
										<ul class="new-component-template">
											<li class="editor-md empty"><a data-category="html"
												href="#"> <span class="name">文本</span> </a></li>
											<li class="editor-md"><a
												data-boilerplate="announcement.yaml" data-category="html"
												href="#"> <span class="name">Announcement</span> </a></li>
											<li class="editor-md"><a
												data-boilerplate="anon_user_id.yaml" data-category="html"
												href="#"> <span class="name">Anonymous User ID</span> </a></li>
											<li class="editor-md"><a
												data-boilerplate="image_modal.yaml" data-category="html"
												href="#"> <span class="name">Full Screen Image</span> </a></li>
											<li class="editor-md"><a data-boilerplate="iframe.yaml"
												data-category="html" href="#"> <span class="name">IFrame</span>
											</a></li>
											<li class="editor-md"><a data-boilerplate="raw.yaml"
												data-category="html" href="#"> <span class="name">Raw
														HTML</span> </a></li>
											<li class="editor-md"><a
												data-boilerplate="zooming_image.yaml" data-category="html"
												href="#"> <span class="name">Zooming Image</span> </a></li>
										</ul>
									</div>
									<a class="cancel-button" >取消</a>
								</div>
							</div>
						</article>
						<aside role="complimentary" class="content-supplementary">
							<div id="publish-unit">
								<div class="bit-publishing has-warnings is-scheduled">
									<div class="wrapper-pub-actions bar-mod-actions">
										<ul class="action-list">
											<li class="action-item"><a href="" class="action-publish action-primary">Publish</a></li>
											<li class="action-item"><a href="" class="action-discard action-secondary is-disabled">Discard Changes </a></li>
										</ul>
									</div>
								</div>
							</div>
						</aside>
					</section>
				</div>
			</div>
		</div>



<div class="wrapper-sock wrapper">
  <ul class="list-actions list-cta">
    <li class="action-item">
      <a href="#sock" class="cta cta-show-sock"><i class="icon-question-sign"></i> <span class="copy">Looking for help with Studio?</span></a>
    </li>
  </ul>

  <div class="wrapper-inner wrapper">
    <section class="sock" id="sock">
      <header>
        <h2 class="title sr">edX Studio Documentation</h2>
      </header>

      <div class="support">
        <h3 class="title">edX Studio Documentation</h3>

        <div class="copy">
           <p>You can click Help in the upper right corner of any page to get more information about the page you're on. You can also use the links below to download the Building and Running an edX Course PDF file, to go to the edX Author Support site, or to enroll in edX101.</p>
        </div>

      <ul class="list-actions">
          <li class="action-item js-help-pdf">
            <a href="https://media.readthedocs.org/pdf/edx-partner-course-staff/latest/edx-partner-course-staff.pdf" target="_blank" rel="external" class="action action-primary">Building and Running an edX Course PDF</a>
          </li>

        <li class="action-item">
          <a href="http://help.edge.edx.org/" rel="external" class="action action-primary">edX Studio Author Support</a>
          <span class="tip">edX Studio Author Support</span>
        </li>
        <li class="action-item">
          <a href="https://edge.edx.org/courses/edX/edX101/How_to_Create_an_edX_Course/about" rel="external" class="action action-primary">注册edX101</a>
          <span class="tip">How to use edX Studio to build your course</span>
        </li>
      </ul>
      </div>

      <div class="feedback">
        <h3 class="title">Request help with edX Studio</h3>

        <div class="copy">
           <p>Have problems, questions, or suggestions about edX Studio?</p>
        </div>

        <ul class="list-actions">
          <li class="action-item">

            <a href="http://help.edge.edx.org/discussion/new" class="action action-primary show-tender" title="请使用工具Tender来分享您的反馈"><i class="icon-comments"></i>联系我们</a>
          </li>
        </ul>
      </div>
    </section>
  </div>
</div>


<div class="wrapper-footer wrapper">
  <footer class="primary" role="contentinfo">
    <div class="colophon">
      <p>&copy; 2014 <a href="http://www.edx.org" rel="external">edX</a>. 保留所有权利。</p>
    </div>

    <nav class="nav-peripheral">
      <ol>
        <li class="nav-item nav-peripheral-tos">
          <a data-rel="edx.org" href="#">服务条款</a>
        </li>
        <li class="nav-item nav-peripheral-pp">
          <a data-rel="edx.org" href="#">隐私政策</a>
        </li>
        <li class="nav-item nav-peripheral-feedback">
          <a href="http://help.edge.edx.org/discussion/new" class="show-tender" title="请使用工具Tender来分享您的反馈">联系我们</a>
        </li>
      </ol>
    </nav>
  </footer>
</div>

</div>

</body>
</html>
