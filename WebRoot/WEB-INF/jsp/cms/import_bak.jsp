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
        课程导入 |
        
        先电云平台 |
        edX Studio
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
  <!-- dummy segment.io -->
<script type="text/javascript">
  var course_location_analytics = "cetc/CS201/2014_T1";
  var analytics = {
    "track": function() {}
  };
</script>
<!-- end dummy segment.io -->


    
  <script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="jquery" src="/static/10a0d74/js/vendor/jquery.min.js"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="js/models/course" src="/static/10a0d74/js/models/course.js"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="gettext" src="/i18n.js"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="js/sock" src="/static/10a0d74/js/sock.js"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="js/views/import" src="/static/10a0d74/js/views/import.js"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="tender" src="//edxedge.tenderapp.com/tender_widget.js"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="jquery.iframe-transport" src="/static/10a0d74/js/vendor/jQuery-File-Upload/js/jquery.iframe-transport.js"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="underscore" src="/static/10a0d74/js/vendor/underscore-min.js"></script><style type="text/css" charset="utf-8">#tender_window{ position: absolute; top: 20px; left: 10px; right: 10px; margin: auto; max-width:680px; height:715px; padding:3px; background:url(http://edxedge.tenderapp.com/images/widget/overlay_back.png); z-index:9999; }#tender_window iframe{ border:none; width:100%; height:100%; } #tender_window #tender_frame{ width:100%; height:100%; background:url(http://edxedge.tenderapp.com/images/widget/loader.gif) 50% 50% no-repeat #fff; } #tender_closer{ position:absolute; top:18px; right:18px; color:#fff; font-family:Helvetica, Arial, sans-serif; font-size:12px; font-weight:bold; text-decoration:none; border:none; } #tender_closer{ color: #80B3CC }#tender_toggler{ position:absolute; top:100px; right:0px; width:33px; height:105px; padding:3px 0 3px 3px; background:url(http://edxedge.tenderapp.com/images/widget/overlay_back.png); } #tender_toggler_link{ display:block; width:100%; height:100%; text-decoration:none; border:none; text-indent:-9999px; background: #006699 url(http://edxedge.tenderapp.com/images/widget/tab_text_right.gif) !important; } </style><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="domReady" src="/static/10a0d74/js/vendor/domReady.js"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="backbone" src="/static/10a0d74/js/vendor/backbone-min.js"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="js/base" src="/static/10a0d74/js/base.js"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="accessibility" src="/static/10a0d74/js/src/accessibility_tools.js"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="ieshim" src="/static/10a0d74/js/src/ie_shim.js"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="jquery.fileupload" src="/static/10a0d74/js/vendor/jQuery-File-Upload/js/jquery.fileupload.js"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="jquery.smoothScroll" src="/static/10a0d74/js/vendor/jquery.smooth-scroll.min.js"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="coffee/src/ajax_prefix" src="/static/10a0d74/coffee/src/ajax_prefix.js"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="jquery.timepicker" src="/static/10a0d74/js/vendor/timepicker/jquery.timepicker.js"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="tooltip_manager" src="/static/10a0d74/js/src/tooltip_manager.js"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="js/views/feedback_notification" src="/static/10a0d74/js/views/feedback_notification.js"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="js/views/feedback_prompt" src="/static/10a0d74/js/views/feedback_prompt.js"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="js/utils/date_utils" src="/static/10a0d74/js/utils/date_utils.js"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="js/utils/module" src="/static/10a0d74/js/utils/module.js"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="js/utils/handle_iframe_binding" src="/static/10a0d74/js/utils/handle_iframe_binding.js"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="jquery.leanModal" src="/static/10a0d74/js/vendor/jquery.leanModal.min.js"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="jquery.ui" src="/static/10a0d74/js/vendor/jquery-ui.min.js"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="jquery.form" src="/static/10a0d74/js/vendor/jquery.form.js"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="underscore.string" src="/static/10a0d74/js/vendor/underscore.string.min.js"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="js/views/feedback" src="/static/10a0d74/js/views/feedback.js"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="coffee/src/main" src="/static/10a0d74/coffee/src/main.js"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="coffee/src/logger" src="/static/10a0d74/coffee/src/logger.js"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="datepair" src="/static/10a0d74/js/vendor/timepicker/datepair.js"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="date" src="/static/10a0d74/js/vendor/date.js"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="js/utils/templates" src="/static/10a0d74/js/utils/templates.js"></script><script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="jquery.cookie" src="/static/10a0d74/js/vendor/jquery.cookie.js"></script></head>

  <body class="is-signedin course tools view-import hide-wip lang_zh-cn js">
    <a class="nav-skip" href="#content">跳过本内容页</a>

    <script type="text/javascript">
    window.baseUrl = "/static/10a0d74/";
    var require = {
        baseUrl: baseUrl,
        waitSeconds: 60,
        paths: {
            "domReady": "js/vendor/domReady",
            "gettext": "/i18n",
            "mustache": "js/vendor/mustache",
            "codemirror": "js/vendor/codemirror-compressed",
            "codemirror/stex": "js/vendor/CodeMirror/stex",
            "jquery": "js/vendor/jquery.min",
            "jquery.ui": "js/vendor/jquery-ui.min",
            "jquery.form": "js/vendor/jquery.form",
            "jquery.markitup": "js/vendor/markitup/jquery.markitup",
            "jquery.leanModal": "js/vendor/jquery.leanModal.min",
            "jquery.ajaxQueue": "js/vendor/jquery.ajaxQueue",
            "jquery.smoothScroll": "js/vendor/jquery.smooth-scroll.min",
            "jquery.timepicker": "js/vendor/timepicker/jquery.timepicker",
            "jquery.cookie": "js/vendor/jquery.cookie",
            "jquery.qtip": "js/vendor/jquery.qtip.min",
            "jquery.scrollTo": "js/vendor/jquery.scrollTo-1.4.2-min",
            "jquery.flot": "js/vendor/flot/jquery.flot.min",
            "jquery.fileupload": "js/vendor/jQuery-File-Upload/js/jquery.fileupload",
            "jquery.iframe-transport": "js/vendor/jQuery-File-Upload/js/jquery.iframe-transport",
            "jquery.inputnumber": "js/vendor/html5-input-polyfills/number-polyfill",
            "jquery.immediateDescendents": "coffee/src/jquery.immediateDescendents",
            "datepair": "js/vendor/timepicker/datepair",
            "date": "js/vendor/date",
            "tzAbbr": "js/vendor/tzAbbr",
            "underscore": "js/vendor/underscore-min",
            "underscore.string": "js/vendor/underscore.string.min",
            "backbone": "js/vendor/backbone-min",
            "backbone.associations": "js/vendor/backbone-associations-min",
            "backbone.paginator": "js/vendor/backbone.paginator.min",
            "tinymce": "js/vendor/tinymce/js/tinymce/tinymce.full.min",
            "jquery.tinymce": "js/vendor/tinymce/js/tinymce/jquery.tinymce.min",
            "xmodule": "/xmodule/xmodule",
            "xblock": "coffee/src/xblock",
            "utility": "js/src/utility",
            "accessibility": "js/src/accessibility_tools",
            "draggabilly": "js/vendor/draggabilly.pkgd",
            "URI": "js/vendor/URI.min",
            "ieshim": "js/src/ie_shim",
            "tooltip_manager": "js/src/tooltip_manager",
            
            // Files needed for Annotations feature
            "annotator": "js/vendor/ova/annotator-full",
            "annotator-harvardx": "js/vendor/ova/annotator-full-firebase-auth",
            "video.dev": "js/vendor/ova/video.dev",
            "vjs.youtube": 'js/vendor/ova/vjs.youtube',
            "rangeslider": 'js/vendor/ova/rangeslider',
            "share-annotator": 'js/vendor/ova/share-annotator',
            "richText-annotator": 'js/vendor/ova/richText-annotator',
            "reply-annotator": 'js/vendor/ova/reply-annotator',
            "grouping-annotator": 'js/vendor/ova/grouping-annotator',
            "tags-annotator": 'js/vendor/ova/tags-annotator',
            "diacritic-annotator": 'js/vendor/ova/diacritic-annotator',
            "flagging-annotator": 'js/vendor/ova/flagging-annotator',
            "jquery-Watch": 'js/vendor/ova/jquery-Watch',
            "openseadragon": 'js/vendor/ova/openseadragon',
            "osda": 'js/vendor/ova/OpenSeaDragonAnnotation',
            "ova": 'js/vendor/ova/ova',
            "catch": 'js/vendor/ova/catch/js/catch',
            "handlebars": 'js/vendor/ova/catch/js/handlebars-1.1.2',
            // end of Annotation tool files

            // externally hosted files
            "tender": [
                "//edxedge.tenderapp.com/tender_widget",
                // if tender fails to load, fallback on a local file
                // so that require doesn't fall over
                "js/src/tender_fallback"
            ],
            "mathjax": "//edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/MathJax.js?config=TeX-MML-AM_HTMLorMML-full&delayStartupUntil=configured",
            "youtube": [
                // youtube URL does not end in ".js". We add "?noext" to the path so
                // that require.js adds the ".js" to the query component of the URL,
                // and leaves the path component intact.
                "//www.youtube.com/player_api?noext",
                // if youtube fails to load, fallback on a local file
                // so that require doesn't fall over
                "js/src/youtube_fallback"
            ]
        },
        shim: {
            "gettext": {
                exports: "gettext"
            },
            "date": {
                exports: "Date"
            },
            "jquery.ui": {
                deps: ["jquery"],
                exports: "jQuery.ui"
            },
            "jquery.form": {
                deps: ["jquery"],
                exports: "jQuery.fn.ajaxForm"
            },
            "jquery.markitup": {
                deps: ["jquery"],
                exports: "jQuery.fn.markitup"
            },
            "jquery.leanmodal": {
                deps: ["jquery"],
                exports: "jQuery.fn.leanModal"
            },
            "jquery.ajaxQueue": {
                deps: ["jquery"],
                exports: "jQuery.fn.ajaxQueue"
            },
            "jquery.smoothScroll": {
                deps: ["jquery"],
                exports: "jQuery.fn.smoothScroll"
            },
            "jquery.cookie": {
                deps: ["jquery"],
                exports: "jQuery.fn.cookie"
            },
            "jquery.qtip": {
                deps: ["jquery"],
                exports: "jQuery.fn.qtip"
            },
            "jquery.scrollTo": {
                deps: ["jquery"],
                exports: "jQuery.fn.scrollTo",
            },
            "jquery.flot": {
                deps: ["jquery"],
                exports: "jQuery.fn.plot"
            },
            "jquery.fileupload": {
                deps: ["jquery.iframe-transport"],
                exports: "jQuery.fn.fileupload"
            },
            "jquery.inputnumber": {
                deps: ["jquery"],
                exports: "jQuery.fn.inputNumber"
            },
            "jquery.tinymce": {
                deps: ["jquery", "tinymce"],
                exports: "jQuery.fn.tinymce"
            },
            "datepair": {
                deps: ["jquery.ui", "jquery.timepicker"]
            },
            "underscore": {
                exports: "_"
            },
            "backbone": {
                deps: ["underscore", "jquery"],
                exports: "Backbone"
            },
            "backbone.associations": {
                deps: ["backbone"],
                exports: "Backbone.Associations"
            },
            "backbone.paginator": {
                deps: ["backbone"],
                exports: "Backbone.Paginator"
            },
            "tender": {
                exports: 'Tender'
            },
            "youtube": {
                exports: "YT"
            },
            "codemirror": {
                exports: "CodeMirror"
            },
            "codemirror/stex": {
                deps: ["codemirror"]
            },
            "tinymce": {
                exports: "tinymce"
            },
            "mathjax": {
                exports: "MathJax",
                init: function() {
                  MathJax.Hub.Config({
                    tex2jax: {
                      inlineMath: [
                        ["\\(","\\)"],
                        ['[mathjaxinline]','[/mathjaxinline]']
                      ],
                      displayMath: [
                        ["\\[","\\]"],
                        ['[mathjax]','[/mathjax]']
                      ]
                    }
                  });
                  MathJax.Hub.Configured();
                }
            },
            "URI": {
                exports: "URI"
            },
            "tooltip_manager": {
                deps: ["jquery", "underscore"]
            },
            "jquery.immediateDescendents": {
                deps: ["jquery"]
            },
            "xblock/core": {
                exports: "XBlock",
                deps: ["jquery", "jquery.immediateDescendents"]
            },
            "xblock/runtime.v1": {
                exports: "XBlock",
                deps: ["xblock/core"]
            },

            "coffee/src/main": {
                deps: ["coffee/src/ajax_prefix"]
            },
            "coffee/src/logger": {
                exports: "Logger",
                deps: ["coffee/src/ajax_prefix"]
            },

            // the following are all needed for annotation tools
            "video.dev": {
                exports:"videojs"
            },
            "vjs.youtube": {
                deps: ["video.dev"]
            },
            "rangeslider": {
                deps: ["video.dev"]
            },
            "annotator": {
                exports: "Annotator"
            },
            "annotator-harvardx":{
                deps: ["annotator"]
            },
            "share-annotator": {
                deps: ["annotator"]
            },
            "richText-annotator": {
                deps: ["annotator", "tinymce"]
            },
            "reply-annotator": {
                deps: ["annotator"]
            },
            "tags-annotator": {
                deps: ["annotator"]
            },
            "diacritic-annotator": {
                deps: ["annotator"]
            },
            "flagging-annotator": {
                deps: ["annotator"]
            },
            "grouping-annotator": {
                deps: ["annotator"]
            },
            "ova":{
                exports: "ova",
                deps: ["annotator", "annotator-harvardx", "video.dev", "vjs.youtube", "rangeslider", "share-annotator", "richText-annotator", "reply-annotator", "tags-annotator", "flagging-annotator", "grouping-annotator", "diacritic-annotator", "jquery-Watch", "catch", "handlebars", "URI"]
            },
            "osda":{
                exports: "osda",
                deps: ["annotator", "annotator-harvardx", "video.dev", "vjs.youtube", "rangeslider", "share-annotator", "richText-annotator", "reply-annotator", "tags-annotator", "flagging-annotator", "grouping-annotator", "diacritic-annotator", "openseadragon", "jquery-Watch", "catch", "handlebars", "URI"]
            },
            // end of annotation tool files
        },
        // load jquery and gettext automatically
        deps: ["jquery", "gettext"],
        callback: function() {
            // load other scripts on every page, after jquery loads
            require(["js/base", "coffee/src/main", "coffee/src/logger", "datepair", "accessibility", "ieshim", "tooltip_manager"]);
            // we need "datepair" because it dynamically modifies the page
            // when it is loaded -- yuck!
        }
    };
    </script>
    <script type="text/javascript" src="/static/10a0d74/js/vendor/require.js"></script>

    


        <script type="text/javascript">
        require(['js/models/course'], function(Course) {
            window.course = new Course({
                id: "cetc/CS201/2014_T1",
                name: "先电云平台",
                url_name: "2014_T1",
                org: "cetc",
                num: "CS201",
                revision: "None"
            });
        });
        </script>

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
        <div class="wrapper wrapper-file-name file-name-block">
            <h3 class="title">
              <span class="label">选中的文件：</span>
              <span class="file-name"></span>
            </h3>

          <input type="file" name="course-data" class="file-input">

          <input type="submit" value="用上面的课程替换我的课程" class="submit-button">
        </div>

        <div class="wrapper wrapper-status is-hidden">
          <h3 class="title">课程导入状态</h3>

          <ol class="status-progress list-progress">
            <li class="item-progresspoint item-progresspoint-upload is-complete">
              <span class="deco status-visual">
                <i class="icon-cog"></i>
                <i class="icon-warning-sign"></i>
              </span>

              <div class="status-detail">
                <h3 class="title">上传中</h3>
                <p class="copy">正在传输你的文件至服务器</p>
              </div>
            </li>

            <li class="item-progresspoint item-progresspoint-unpack is-started">
              <span class="deco status-visual">
                <i class="icon-cog icon-spin"></i>
                <i class="icon-warning-sign"></i>
              </span>

              <div class="status-detail">
                <h3 class="title">解压中</h3>
                <p class="copy">展开预定义的目录/文件结构(您现在可以安全地离开这个页面了，但在内容导入完成之前请尽量避免不必要的修改)</p>
              </div>
            </li>


            <li class="item-progresspoint item-progresspoint-verify is-not-started">
              <span class="deco status-visual">
                <i class="icon-cog"></i>
                <i class="icon-warning-sign"></i>
              </span>

              <div class="status-detail">
                <h3 class="title">检验中</h3>
                <p class="copy">复查语义、语法和必要数据</p>
              </div>
            </li>

            <li class="item-progresspoint item-progresspoint-import is-not-started">
              <span class="deco status-visual">
                <i class="icon-cog"></i>
                <i class="icon-warning-sign"></i>
              </span>

              <div class="status-detail">
                <h3 class="title">课程更新中</h3>
                <p class="copy">整合你导入的内容到课程，对大的课程这可能花费较多时间。</p>
              </div>
            </li>
            <li class="item-progresspoint item-progresspoint-success has-actions is-not-started">
              <span class="deco status-visual">
                <i class="icon-check"></i>
              </span>

              <div class="status-detail">
                <h3 class="title">成功</h3>
                <p class="copy">你导入的内容已经被整合进课程</p>

                <ul class="list-actions">
                  <li class="item-action">
                    <a href="/course/cetc/CS201/2014_T1" class="action action-primary">显示更新后的课程大纲</a>
                  </li>
                </ul>
              </div>
            </li>
          </ol>
        </div>
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

      <script type="text/javascript">
        require(['js/sock']);
      </script>
      


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
            <a href="https://media.readthedocs.org/pdf/edx-partner-course-staff/latest/edx-partner-course-staff.pdf" target="_blank" rel="external" class="action action-primary" title="该链接将在新的浏览器窗口/标签打开">Building and Running an edX Course PDF</a>
          </li>

        <li class="action-item">
          <a href="http://help.edge.edx.org/" rel="external" class="action action-primary" title="该链接将在新的浏览器窗口/标签打开" target="_blank">edX Studio Author Support</a>
          <span class="tip">edX Studio Author Support</span>
        </li>
        <li class="action-item">
          <a href="https://edge.edx.org/courses/edX/edX101/How_to_Create_an_edX_Course/about" rel="external" class="action action-primary" title="该链接将在新的浏览器窗口/标签打开" target="_blank">注册edX101</a>
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

<jsp:include page="tfooter.jsp"></jsp:include>

      <script type="text/javascript">
window.Tender = {
  hideToggle: true,
  title: '',
  body: '',
  hide_kb: 'true',
  widgetToggles: document.getElementsByClassName('show-tender')
}
require(['tender']);
</script>


      <div id="page-notification"></div>
    </div>

    <div id="page-prompt"></div>
    
<script>
require(
        ["js/views/import", "jquery", "gettext", "jquery.fileupload"],
        function(CourseImport, $, gettext) {

var file;
var bar = $('.progress-bar');
var fill = $('.progress-fill');
var percent = $('.percent');
var status = $('#status');
var statusBlock = $('.status-block');
var submitBtn = $('.submit-button');
var chooseBtn = $('.choose-file-button');

var allStats = $('#status-infos');

var feedbackUrl = "/import_status/cetc/CS201/2014_T1/fillerName";

var defaults = [
    "在文件上传发生错误\n",
    "在文件解压发生错误\n",
    "在验证您提交的文件时发现错误\n",
    "在导入新课程到数据库时发生错误\n"
];

$('#fileupload').fileupload({

    dataType: 'json',
    type: 'POST',

    maxChunkSize: 20 * 1000000, // 20 MB

    autoUpload: false,

    add: function(e, data) {
        CourseImport.clearImportDisplay();
        submitBtn.unbind('click');
        file = data.files[0];
        if (file.name.match(/tar\.gz$/)) {
            submitBtn.click(function(e){
                e.preventDefault();
                submitBtn.hide();
                data.submit().complete(function(result, textStatus, xhr) {
                    CourseImport.stopGetStatus = true;
                    window.onbeforeunload = null;
                    if (xhr.status != 200) {
                        if (!result.responseText) {
                            alert(gettext("Your browser has timed out, but the server is still processing your import. Please wait 5 minutes and verify that the new content has appeared."));
                            return;
                        }
                        var serverMsg = $.parseJSON(result.responseText);
                        var errMsg = serverMsg.hasOwnProperty("ErrMsg") ?  serverMsg.ErrMsg : "" ;
                        if (serverMsg.hasOwnProperty("Stage")) {
                            var stage = serverMsg.Stage;
                            CourseImport.stageError(stage, defaults[stage] + errMsg);
                        }
                        else {
                            alert("导入失败。\n\n" + errMsg);
                        }
                        chooseBtn.html("选择新文件").show();
                        bar.hide();
                    }
                    chooseBtn.html("选择新文件").show();
                    bar.hide();
                });
            });
        } else {
            data.files = [];
        }
    },

    progressall: function(e, data){
        var doneAt;
        var percentInt = data.loaded / data.total * 100
        var percentVal = parseInt(percentInt, 10) + "%";
        // Firefox makes ProgressEvent.loaded equal ProgressEvent.total only
        // after receiving a response from the server (see Mozilla bug 637002),
        // so for Firefox we jump the gun a little.
        if (navigator.userAgent.toLowerCase().indexOf('firefox') > -1) {
            doneAt = 95;
        } else {
            doneAt = 99;
        }
        if (percentInt >= doneAt) {
            bar.hide();
            CourseImport.startServerFeedback(feedbackUrl.replace("fillerName", file.name));
        } else {
            bar.show();
            fill.width(percentVal);
            percent.html(percentVal);
        }
    },
    done: function(e, data){
        bar.hide();
        window.onbeforeunload = null;
        CourseImport.displayFinishedImport();
    },
    start: function(e) {
        window.onbeforeunload = function() {
            return "导入进行中，离开当前页面将会中断导入过程。";
        }
    },
    sequentialUploads: true,
    notifyOnError: false

});

}); // end define()
</script>

    <div class="modal-cover"></div>
  
$(document).ready(function(){
	createUploader();
});
function createUploader() { 
	var uploader = new qq.FineUploader({ 
	element: document.getElementById('bootstrapped-fine-uploader'), 
	request: { 
	endpoint: 'cms/importCourse.action?courseId='+${courseId} 
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
