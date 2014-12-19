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
        选择试卷导入
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

	<link href="tcss/content.min.css" rel="stylesheet" type="text/css" />
	<link href="tcss/tinymce-studio-content.css" rel="stylesheet" type="text/css" />
    <link href="tcss/skin.min.css" rel="stylesheet" type="text/css" />
    <link href="tcss/style-app.css" rel="stylesheet" type="text/css" />
    <link href="tcss/style-app-extend1.css" rel="stylesheet" type="text/css" />
    <link href="tcss/style-xmodule.css" rel="stylesheet" type="text/css" />
	<link href="tcss//style.css" rel="stylesheet" type="text/css" />
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
      <span class="sr">&gt; </span>选择试卷导入
    </h1>
  </header>
</div>
<div class="wrapper-content wrapper">
  <section class="content">
    <article class="content-primary" role="main">
      <div class="introduction">
          <p>在继续前请确保你想要导入一份试卷。当前试卷的所有内容会被导入的内容所取代。<strong> 选择试卷导入无法撤销 </strong>。我们建议先将当前试卷导出，这样你可以有个备份。</p>
      </div>
      <form id="fileupload" method="post" enctype="multipart/form-data" class="import-form">

        <h2 class="title">选择一份试卷</h2>

        <p class="error-block"></p>

		<select class="dhlselect" id="selectexam">
			<c:forEach var="exam" items="${examlist}">
				<option value="${exam.id}">${exam.name}</option>
			</c:forEach>
		</select>
        <a href="javascript:void(0);" class="action action-choose-file choose-file-button" onclick="exportsexam();">
         <i class="icon-upload"></i>
          <span class="copy">导入试卷</span>
        </a>
      </form>
    </article>

    <aside class="content-supplementary" role="complimentary">
      <div class="bit">
        <h3 class="title-3">为什么导入试卷？</h3>
        <p>您或者想为现有试卷创建新版本，或完全替换一个现有试卷，或您已在Studio之外创建了试卷。</p>
      </div>

      <div class="bit">
        <h3 class="title-3">哪些内容被导入了？</h3>
        <p>只有试卷内容和结构(包括章，节，单元)被导入了。其它数据，包括学生数据，分数信息，讨论数据，试卷设置的试卷团队信息，将沿用当前试卷。</p>
      </div>

      <div class="bit">
        <h3 class="title-3">注意：导入发生于试卷进行中</h3>
        <p>如果您在试卷进行中执行了导入，并更改了任意问题组件的URL名字(或url名字节点) ，与此问题组件相关的学生数据将可能丢失。这些数据包括学生问题得分。</p>
      </div>
    </aside>
  </section>
</div>

      </div>

<div class="wrapper-sock wrapper">
  <ul class="list-actions list-cta">
    <li class="action-item">
      <a href="#sock" class="cta cta-show-sock"><i class="icon-question-sign"></i> <span class="copy"> 向云考试平台求助?</span></a>
    </li>
  </ul>
</div>

<jsp:include page="tfooter.jsp"></jsp:include>
</div>

<script>
$(document).ready(function(){
});

function exportsexam()
{
	var examId = $("#selectexam").val();
	var texamId = "${exam.id}";
	var data = {examId:examId,texamId:texamId};
	$.ajax({
		url:"cms/importsexam.action",
		type:"post",
		data:data,
		success:function(s){
			var a=eval("("+s+")");	
		}
	});
}
</script>
</html>