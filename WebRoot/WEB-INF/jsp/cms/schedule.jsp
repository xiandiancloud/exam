<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!doctype html>
<html>
<head>
<base href="<%=basePath%>">

<title>日程 &amp; 细节设置 | 先电云平台 | edX Studio</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="tcss/normalize.css" rel="stylesheet" type="text/css" />
<link href="tcss/font-awesome.css" rel="stylesheet" type="text/css" />
<link href="tcss/number-polyfill.css" rel="stylesheet" type="text/css" />
<link href="tcss/codemirror.css" rel="stylesheet" type="text/css" />
<link href="tcss/jquery-ui-1.8.22.custom.css" rel="stylesheet"
	type="text/css" />
<link href="tcss/jquery.qtip.min.css" rel="stylesheet" type="text/css" />
<link href="tcss//style.css" rel="stylesheet" type="text/css" />
<link href="tcss/content.min.css" rel="stylesheet" type="text/css" />
<link href="tcss/tinymce-studio-content.css" rel="stylesheet"
	type="text/css" />
<link href="tcss/skin.min.css" rel="stylesheet" type="text/css" />
<link href="tcss/style-app.css" rel="stylesheet" type="text/css" />
<link href="tcss/style-app-extend1.css" rel="stylesheet" type="text/css" />
<link href="tcss/style-xmodule.css" rel="stylesheet" type="text/css" />
<link href="css/fineuploader.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script src="js/fineuploader.js"></script>
<script src="js/common.js"></script>

<style type="text/css" charset="utf-8">
#tender_window {
	position: absolute;
	top: 20px;
	left: 10px;
	right: 10px;
	margin: auto;
	max-width: 680px;
	height: 715px;
	padding: 3px;
	background:
		url(http://edxedge.tenderapp.com/images/widget/overlay_back.png);
	z-index: 9999;
}

#tender_window iframe {
	border: none;
	width: 100%;
	height: 100%;
}

#tender_window #tender_frame {
	width: 100%;
	height: 100%;
	background: url(http://edxedge.tenderapp.com/images/widget/loader.gif)
		50% 50% no-repeat #fff;
}

#tender_closer {
	position: absolute;
	top: 18px;
	right: 18px;
	color: #fff;
	font-family: Helvetica, Arial, sans-serif;
	font-size: 12px;
	font-weight: bold;
	text-decoration: none;
	border: none;
}

#tender_closer {
	color: #80B3CC
}

#tender_toggler {
	position: absolute;
	top: 100px;
	right: 0px;
	width: 33px;
	height: 105px;
	padding: 3px 0 3px 3px;
	background:
		url(http://edxedge.tenderapp.com/images/widget/overlay_back.png);
}

#tender_toggler_link {
	display: block;
	width: 100%;
	height: 100%;
	text-decoration: none;
	border: none;
	text-indent: -9999px;
	background: #006699
		url(http://edxedge.tenderapp.com/images/widget/tab_text_right.gif)
		!important;
}
</style>
</head>

<body
	class="is-signedin course schedule view-settings feature-upload hide-wip lang_zh-cn js">
	<a class="nav-skip" href="#content">跳过本内容页</a>


	<!-- view -->
	<div class="wrapper wrapper-view">

		<jsp:include page="ttheader.jsp"></jsp:include>

		<div id="page-alert"></div>

		<div id="content">

			<div class="wrapper-mast wrapper">
				<header class="mast has-subtitle">
					<h1 class="page-header">
						<small class="subtitle">设置</small> <span class="sr">&gt; </span>日程
						&amp; 细节
					</h1>
				</header>
			</div>

			<div class="wrapper-content wrapper">
				<section class="content">
					<article class="content-primary" role="main">
						<form id="settings_details" class="settings-details" method="post"
							action="">
							<section class="group-settings basic">
								<header>
									<h2 class="title-2">基本信息</h2>
									<span class="tip">您试卷的具体细节</span>
								</header>

								<ol class="list-input">
									<li class="field text is-not-editable"
										id="field-course-organization"><label
										for="course-organization">组织</label> <input
										title="该字段已禁用：信息不可修改。" type="text" class="long"
										id="course-organization" readonly="" value="${exam.org}">
									</li>

									<li class="field text is-not-editable" id="field-course-number">
										<label for="course-number">试卷代码</label> <input
										title="该字段已禁用：信息不可修改。" type="text" class="short"
										id="course-number" readonly="" value="${exam.coursecode}">
									</li>

									<li class="field text is-not-editable" id="field-course-name">
										<label for="course-name">开课时间</label> <input
										title="该字段已禁用：信息不可修改。" type="text" class="long"
										id="course-name" readonly="" value="${exam.starttime}">
									</li>
								</ol>



							</section>

							<hr class="divide">

							<section class="group-settings schedule">
								<header>
									<h2 class="title-2">试卷时间表</h2>
									<span class="tip">调整您的试卷可以浏览的日期</span>
								</header>

								<ol class="list-input">
									<li class="field-group field-group-course-start"
										id="course-start">
										<div class="field date" id="field-course-start-date">
											<label for="course-start-date">试卷开始日期</label> <input
												type="text"
												class="start-date date start datepicker hasDatepicker"
												id="starttimedetail" placeholder="YYYY-MM-DD"
												autocomplete="off" value="${exam.starttimedetail}">
											<span class="tip tip-stacked">试卷开始的第一天</span>
										</div> <!--               <div class="field time" id="field-course-start-time">
                <label for="course-start-time">试卷开始时间</label>
                <input type="text" class="time start timepicker ui-timepicker-input" id="course-start-time" value="" placeholder="HH:MM" autocomplete="off">
                <span class="tip tip-stacked" id="timezone">(中国标准时间)</span>
              </div> -->
									</li>

									<li class="field-group field-group-course-end" id="course-end">
										<div class="field date" id="field-course-end-date">
											<label for="course-end-date">试卷结束日期</label> <input
												type="text" class="end-date date end hasDatepicker"
												id="endtimedetail" placeholder="YYYY-MM-DD"
												autocomplete="off" value="${exam.endtimedetail}"> <span
												class="tip tip-stacked">您试卷结束的最后一天</span>
										</div> <!--               <div class="field time" id="field-course-end-time">
                <label for="course-end-time">试卷结束时间</label>
                <input type="text" class="time end ui-timepicker-input" id="course-end-time" value="" placeholder="HH:MM" autocomplete="off">
                <span class="tip tip-stacked" id="timezone">(中国标准时间)</span>
              </div> -->
									</li>
								</ol>



							</section>
							<hr class="divide">
							<section class="group-settings marketing">
								<header>
									<h2 class="title-2">介绍您的试卷</h2>
									<span class="tip">提供给预期学生的信息</span>
								</header>
								<ol class="list-input">
									<li class="field text" id="field-course-short-description">
										<label for="course-overview">试卷简介</label> <textarea
											class="text" id="describle"></textarea> <span
										class="tip tip-stacked">将在学生浏览试卷目录时出现。限制150个字符。</span>
									</li>



									<li class="field image" id="field-course-image"><label>试卷图片</label>
										<div class="current current-course-image">
											<span class="wrapper-course-image"> <img
												class="course-image" id="course-image" src="${exam.imgpath}"
												alt="试卷图片">
											</span>

											<!--                     <span class="msg msg-help">
                    该图片可以随您的其他<a href="#">文件 &amp; 上传</a>共同管理
                    </span> -->

										</div>

										<div class="wrapper-input">
											<div class="input">
												<input type="text" class="long new-course-image-url"
													id="imgpath" value="${exam.imgpath}" placeholder="试卷图片路径"
													autocomplete="off"> <span class="tip tip-stacked">请为您的试卷图片提供一个有效的路径和名字（注意：仅支持JPEG和PNG格式）</span>
											</div>
											<!-- <button type="button" class="action action-upload-image">上传试卷图片</button> -->
											<div id="bootstrapped-fine-uploader"></div>
										</div></li>

								</ol>
							</section>

							<hr class="divide">

							<!--             <section class="group-settings requirements">
              <header>
                <h2 class="title-2">要求</h2>
                <span class="tip">对参加本门试卷的学生的期望</span>
              </header>

              <ol class="list-input">
                <li class="field text" id="field-course-effort">
                  <label for="course-effort">每周投入试卷学习的小时数</label>
                  <input type="text" class="short time" id="course-effort" placeholder="HH:MM">
                  <span class="tip tip-inline">在整个试卷上投入的时间</span>
                </li>
              </ol>
            </section> -->
							<ul class="course-actions">
								<li class="action"><a href="javascript:void(0);"
									rel="external" onclick="updateCourse(${examId});"
									class="button view-button view-live-button">保存</a></li>
							</ul>
						</form>
					</article>
					<aside class="content-supplementary" role="complimentary">
						<div class="bit">
							<h3 class="title-3">如何使用这些设置？</h3>
							<p>您的试卷时间表决定何时学生可以注册和开始本门试卷。</p>

							<p>本页面的其他信息将会出现在你试卷的关于页面上。这些信息包括试卷概要，试卷图片，介绍视频，以及预估的时间要求。学生们使用关于页面来选择要上的试卷。</p>
						</div>

						<div class="bit">

							<h3 class="title-3">试卷其他设置</h3>
							<nav class="nav-related">
								<ul>
									<li class="nav-item"><a
										href="/settings/grading/cetc/CS201/2014_T1">评分</a></li>
									<li class="nav-item"><a
										href="/course_team/cetc/CS201/2014_T1/">试卷团队</a></li>
									<li class="nav-item"><a
										href="/settings/advanced/cetc/CS201/2014_T1">高级设置</a></li>
								</ul>
							</nav>
						</div>
					</aside>
				</section>
			</div>

		</div>


		<div class="wrapper-sock wrapper">
			<ul class="list-actions list-cta">
				<li class="action-item"><a href="#sock"
					class="cta cta-show-sock"><i class="icon-question-sign"></i> <span
						class="copy">
							<!-- Looking for help with Studio -->向云考试平台求助?
					</span></a></li>
			</ul>

			<div class="wrapper-inner wrapper">
				<section class="sock" id="sock">
					<header>
						<h2 class="title sr">edX Studio Documentation</h2>
					</header>

					<div class="support">
						<h3 class="title">edX Studio Documentation</h3>

						<div class="copy">
							<p>You can click Help in the upper right corner of any page
								to get more information about the page you're on. You can also
								use the links below to download the Building and Running an edX
								Course PDF file, to go to the edX Author Support site, or to
								enroll in edX101.</p>
						</div>

						<ul class="list-actions">
							<li class="action-item js-help-pdf"><a
								href="https://media.readthedocs.org/pdf/edx-partner-course-staff/latest/edx-partner-course-staff.pdf"
								target="_blank" rel="external" class="action action-primary"
								title="该链接将在新的浏览器窗口/标签打开">Building and Running an edX Course
									PDF</a></li>

							<li class="action-item"><a href="http://help.edge.edx.org/"
								rel="external" class="action action-primary"
								title="该链接将在新的浏览器窗口/标签打开" target="_blank">edX Studio Author
									Support</a> <span class="tip">edX Studio Author Support</span></li>
							<li class="action-item"><a
								href="https://edge.edx.org/courses/edX/edX101/How_to_Create_an_edX_Course/about"
								rel="external" class="action action-primary"
								title="该链接将在新的浏览器窗口/标签打开" target="_blank">注册edX101</a> <span
								class="tip">How to use edX Studio to build your course</span></li>
						</ul>
					</div>

					<div class="feedback">
						<h3 class="title">Request help with edX Studio</h3>

						<div class="copy">
							<p>Have problems, questions, or suggestions about edX Studio?</p>
						</div>

						<ul class="list-actions">
							<li class="action-item"><a
								href="http://help.edge.edx.org/discussion/new"
								class="action action-primary show-tender"
								title="请使用工具Tender来分享您的反馈"><i class="icon-comments"></i>联系我们</a>
							</li>
						</ul>
					</div>
				</section>
			</div>
		</div>

		<jsp:include page="tfooter.jsp"></jsp:include>

		<script type="text/javascript">
      $(document).ready(function(){
    	    var desc = replaceTextarea2('${course.describle}');
    	    $("#describle").html(desc);
    		createUploader();
    	});
    	function createUploader() { 
    		var uploader = new qq.FineUploader({ 
    		element: document.getElementById('bootstrapped-fine-uploader'), 
    		request: { 
    		endpoint: 'cms/importCourseimg.action'
    		}, 
    		text: { 
    		uploadButton: '<button class="btn btn-warning"><i class="icon-upload"></i>选择要导入的文件</button>' 
    		}, 
    		validation:{
    			allowedExtensions: ['png','PNG','jpeg','JPEG','jpg','JPG']
    		},
    		template: 
    		'<div class="qq-uploader">' + 
    		'<pre class="qq-upload-drop-area"><span>{dragZoneText}</span></pre>' + 
    		'<div class="qq-upload-button action action-upload-image" style="width: auto;">上传试卷图片</div>' + 
    		'<span class="qq-drop-processing"><span>{dropProcessingText}</span>'+ 
    		'<span class="qq-drop-processing-spinner"></span></span>' + 
    		'<ul class="qq-upload-list" style="margin-top: 10px; text-align: center;display:none"></ul>' + 
    		'</div>', 
    		classes: { 
    		success: 'alert alert-success', 
    		fail: 'alert alert-error' 
    		}, 
    		callbacks:{
    			onComplete: function(id,  fileName,  responseJSON){		
    				if (responseJSON.success == "true")
    				{
    					alert("上传成功");
    					$("#imgpath").attr("value",responseJSON.imgpath);
    					$("#course-image").attr("src",responseJSON.imgpath);
    				}
    			}
    		},
    		debug: true 
    		}); 
      }
      function updateCourse(courseId)
		{
			var describle = $("#describle").val();
			describle = replaceTextarea1(describle);
			var endtimedetail = $("#endtimedetail").val();
			var starttimedetail = $("#starttimedetail").val();
			var imgpath = $("#imgpath").val();
			var data = {examId:courseId,describle:describle,starttimedetail:starttimedetail,endtimedetail:endtimedetail,imgpath:imgpath};
			$.ajax({
				url:"cms/updateExam.action",
				type:"post",
				data:data,
				success:function(s){
					var a=eval("("+s+")");	
					if (a.sucess=="sucess")
					{
						alert("更新成功");
					}
				}
			});
		}
      
window.Tender = {
  hideToggle: true,
  title: '',
  body: '',
  hide_kb: 'true',
  widgetToggles: document.getElementsByClassName('show-tender')
}
</script>
</body>
</html>
