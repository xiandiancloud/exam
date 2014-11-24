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
        导出试卷
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

<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script> 
    

  <body class="is-signedin course tools view-export hide-wip lang_zh-cn js">
    <!-- view -->
    <div class="wrapper wrapper-view">
        
<jsp:include page="ttheader.jsp"></jsp:include>

      <div id="page-alert"></div>

      <div id="content">
      
<div class="wrapper-mast wrapper">
  <header class="mast has-subtitle">
    <h1 class="page-header">
      <small class="subtitle">工具</small>
      <span class="sr">&gt; </span>导出试卷
    </h1>
  </header>
</div>

<div class="wrapper-content wrapper">
  <section class="content">
    <article class="content-primary" role="main">

      <div class="introduction">
        <h2 class="title">关于导出试卷</h2>
        <div class="copy">
          <p>您可以导出试卷并在Studio之外编辑它们。导出的文件是.tar.gz类型的文件 (使用GNU Zip压缩格式的.tar文件)，包含试卷结构和内容。您也可以再次导入这些导出的试卷。</p>
        </div>
      </div>

      <div class="export-controls">
        <h2 class="title">导出我的试卷内容</h2>

        <ul class="list-actions">
          <li class="item-action">
            <a class="action action-export action-primary" href="cms/exportExam.action?examId=${examId}">
              <i class="icon-download"></i>
              <span class="copy">导出试卷内容</span>
            </a>
          </li>
        </ul>
      </div>

      <div class="export-contents">
        <div class="export-includes">
          <h3 class="title-3">随试卷<strong> 导出 </strong> 数据：</h3>
          <ul class="list-details list-export-includes">
            <li class="item-detail">试卷内容 (所有章节，小节和单元)</li>
            <li class="item-detail">试卷结构</li>
            <li class="item-detail">个别问题</li>
            <li class="item-detail">页面</li>
            <li class="item-detail">试卷资源</li>
            <li class="item-detail">试卷设置</li>
          </ul>
        </div>

        <div class="export-excludes">
          <h3 class="title-3">不随试卷<strong> 导出 </strong> 的数据：</h3>
          <ul class="list-details list-export-excludes">
            <li class="item-detail">用户数据</li>
            <li class="item-detail">试卷团队数据</li>
            <li class="item-detail">论坛/讨论数据</li>
            <li class="item-detail">证书</li>
          </ul>
        </div>
      </div>
    </article>

    <aside class="content-supplementary" role="complimentary">
      <div class="bit">
        <h3 class="title-3">为什么导出试卷？</h3>
        <p>您或许想在Studio之外直接编辑试卷的XML，或想为您的试卷建立备份，或想复制一份试卷供日后导入进另一个试卷实例和修改。</p>
      </div>

      <div class="bit">
        <h3 class="title-3">哪些内容被导出了？</h3>

        <p>只有试卷内容和结构(包括章，节，单元)被导出了。其它数据，包括学生数据，分数信息，讨论数据，试卷设置的试卷团队信息将不会被导出。</p>
      </div>

      <div class="bit">
        <h3 class="title-3">打开下载的文件</h3>
        <p>使用档案工具解压.tar.gz中的文件。解压后的数据包含coursex.xml，还有一些子目录，存放了试卷内容。</p>
      </div>
    </aside>
  </section>
</div>

      </div>

<div class="wrapper-sock wrapper">
  <ul class="list-actions list-cta">
    <li class="action-item">
      <a href="#sock" class="cta cta-show-sock"><i class="icon-question-sign"></i> <span class="copy">向云平台求助?</span></a>
    </li>
  </ul>

</div>
<jsp:include page="tfooter.jsp"></jsp:include>

</div>
</body>
</html>
