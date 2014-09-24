<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<!--[if IE 7]><html class="ie7 lte9 lte8 lte7" lang="zh-cn"><![endif]-->
<!--[if IE 8]><html class="ie8 lte9 lte8" lang="zh-cn"><![endif]-->
<!--[if IE 9]><html class="ie9 lte9" lang="zh-cn"><![endif]-->
<!--[if gt IE 9]><!-->
<html lang="zh-cn"><!--<![endif]-->
  <head>
  <base href="<%=basePath%>">
  
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>Sign In | edX Studio</title>
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
	
	<script src="js/jquery-1.11.1.js"></script>
	<script src="js/index.js"></script>
  </head>

  <body class="not-signedin view-signin hide-wip lang_zh-cn">
    <a class="nav-skip" href="#content">跳过本内容页</a>

    <script type="text/javascript" src="/static/452d696/js/vendor/require.js"></script>

    <!-- view -->
	<div class="wrapper wrapper-view">
		<jsp:include page="theader.jsp"></jsp:include>
		<div id="page-alert"></div>

		<div id="content">
			<div class="wrapper-content wrapper">
				试卷已经锁定！
			</div>

		</div>
		<jsp:include page="tfooter.jsp"></jsp:include>
	</div>
	<script>
		$(function() {
		});
	</script>
</body>
</html>

