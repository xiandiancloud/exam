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

<title>日程 &amp; 细节设置 </title>

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

</head>

<body
	class="is-signedin course schedule view-settings feature-upload hide-wip lang_zh-cn js">
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
											<label for="course-start-date">试卷开始时间</label> <input
												type="text"
												class="start-date date start datepicker hasDatepicker"
												id="starttimedetail" placeholder="yyyy-mm-dd hh:mm:ss"
												autocomplete="off" value="${exam.starttimedetail}">
											<span class="tip tip-stacked">试卷开始的时间</span>
										</div> <!--               <div class="field time" id="field-course-start-time">
                <label for="course-start-time">试卷开始时间</label>
                <input type="text" class="time start timepicker ui-timepicker-input" id="course-start-time" value="" placeholder="HH:MM" autocomplete="off">
                <span class="tip tip-stacked" id="timezone">(中国标准时间)</span>
              </div> -->
									</li>

									<li class="field-group field-group-course-end" id="course-end">
										<div class="field date" id="field-course-end-date">
											<label for="course-end-date">试卷结束时间</label> <input
												type="text" class="end-date date end hasDatepicker"
												id="endtimedetail" placeholder="yyyy-mm-dd hh:mm:ss"
												autocomplete="off" value="${exam.endtimedetail}"> <span
												class="tip tip-stacked">您试卷结束的时间</span>
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
			
			if (!isNull(starttimedetail))
			{
				if (!isDate(starttimedetail))
				{
					alert("试卷开始时间请输入格式正确的日期\n\r日期格式：yyyy-mm-dd hh-mm-ss\n\r例    如：2008-08-08 08:30:00\n\r");
					return;
				}
			}
			
			if (!isNull(endtimedetail))
			{
				if (!isDate(endtimedetail))
				{
					alert("试卷结束时间请输入格式正确的日期\n\r日期格式：yyyy-mm-dd hh-mm-ss\n\r例    如：2008-08-08 08:30:00\n\r");
					return;
				}
			}
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
      
</script>
</body>
</html>
