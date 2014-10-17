<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>
        课程导入
    </title>
    
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
	<link href="tcss/jquery-ui-1.8.22.custom.css" rel="stylesheet" type="text/css" />
	<link href="tcss/jquery.qtip.min.css" rel="stylesheet" type="text/css" />
	<link href="tcss//style.css" rel="stylesheet" type="text/css" />
	<link href="tcss/content.min.css" rel="stylesheet" type="text/css" />
	<link href="tcss/tinymce-studio-content.css" rel="stylesheet" type="text/css" />
    <link href="tcss/skin.min.css" rel="stylesheet" type="text/css" />
    <link href="tcss/style-app.css" rel="stylesheet" type="text/css" />
    <link href="tcss/style-app-extend1.css" rel="stylesheet" type="text/css" />
    <link href="tcss/style-xmodule.css" rel="stylesheet" type="text/css" />

<link href="css/fineuploader.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script> 
<script src="js/fineuploader.js"></script>

  <body class="is-signedin course tools view-import hide-wip lang_zh-cn js">
    <!-- view -->
    <div class="wrapper wrapper-view">
<jsp:include page="ttheader.jsp"></jsp:include>
      <div id="page-alert"></div>
      <div id="content">
<div class="wrapper-mast wrapper">
  <header class="mast has-subtitle">
    <h1 class="page-header">
      <small class="subtitle">工具</small>
      <span class="sr">&gt; </span>课程导入
    </h1>
  </header>
</div>
<div class="wrapper-content wrapper">
  <section class="content">
    <article class="content-primary" role="main">
      <div class="introduction">
          <p>在继续前请确保你想要导入一门课程。当前课程的所有内容会被导入的内容所取代。<strong> 课程导入无法撤销 </strong>。我们建议先将当前课程导出，这样你可以有个备份。</p>
          <p>你将要导入的课程必须为.tar.gz格式的文件( 即一个采用GNU zip压缩后的.tar文件)。这个.tar.gz文件必须包含一个course.xml文件。另外也可能包含其他文件。</p>
          <p>导入过程有五步。在前两步中，你必须停留在当前页面。而在解压步骤结束后你可以离开当前页面。不过，我们建议在导入操作结束前你都不要对课程做任何更改调整。</p>
      </div>
      <form id="fileupload" method="post" enctype="multipart/form-data" class="import-form">

        <h2 class="title">选择一个.tar.gz 文件以覆盖当前课程内容</h2>

        <p class="error-block"></p>

		
        <!-- <a href="javascript:void(0);" class="action action-choose-file choose-file-button">
         <i class="icon-upload"></i>
          <span class="copy">选择要导入的文件</span>
        </a> -->
		<div id="bootstrapped-fine-uploader"></div>
      </form>
    </article>

    <aside class="content-supplementary" role="complimentary">
      <div class="bit">
        <h3 class="title-3">为什么导入课程？</h3>
        <p>您或者想为现有课程创建新版本，或完全替换一个现有课程，或您已在Studio之外创建了课程。</p>
      </div>

      <div class="bit">
        <h3 class="title-3">哪些内容被导入了？</h3>
        <p>只有课程内容和结构(包括章，节，单元)被导入了。其它数据，包括学生数据，分数信息，讨论数据，课程设置的课程团队信息，将沿用当前课程。</p>
      </div>

      <div class="bit">
        <h3 class="title-3">注意：导入发生于课程进行中</h3>
        <p>如果您在课程进行中执行了导入，并更改了任意问题组件的URL名字(或url名字节点) ，与此问题组件相关的学生数据将可能丢失。这些数据包括学生问题得分。</p>
      </div>
    </aside>
  </section>
</div>

      </div>

<div class="wrapper-sock wrapper">
  <ul class="list-actions list-cta">
    <li class="action-item">
      <a href="#sock" class="cta cta-show-sock"><i class="icon-question-sign"></i> <span class="copy">Looking for help with Studio?</span></a>
    </li>
  </ul>
</div>

<jsp:include page="tfooter.jsp"></jsp:include>
</div>

<script>
$(document).ready(function(){
	createUploader();
});
function createUploader() { 
	var uploader = new qq.FineUploader({ 
	element: document.getElementById('bootstrapped-fine-uploader'), 
	request: { 
	endpoint: 'cms/importCourse.action?examId='+${examId}
	}, 
	text: { 
	uploadButton: '<button class="btn btn-warning"><i class="icon-upload"></i>选择要导入的文件</button>' 
	}, 
	validation:{
		allowedExtensions: ['tar.gz']
	},
	template: 
	'<div class="qq-uploader">' + 
	'<pre class="qq-upload-drop-area"><span>{dragZoneText}</span></pre>' + 
	'<div class="qq-upload-button action action-choose-file choose-file-button" style="width: auto;">选择要导入的文件</div>' + 
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
				alert("导入成功");
			}
		}
	},
	debug: true 
	}); 
	}

</script>
</html>