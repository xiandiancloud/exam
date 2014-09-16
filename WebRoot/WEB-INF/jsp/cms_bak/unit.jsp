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
<title>实验</title>

<meta name="viewport" content="width=device-width,initial-scale=1">
<meta name="path_prefix" content="">
<link type="text/css" rel="stylesheet" href="tcss/normalize.css">
<link type="text/css" rel="stylesheet" href="tcss/font-awesome.css">
<link type="text/css" rel="stylesheet" href="tcss/number-polyfill.css">
<link type="text/css" rel="stylesheet" href="tcss/codemirror.css">
<link type="text/css" rel="stylesheet"
	href="tcss/jquery-ui-1.8.22.custom.css">
<link type="text/css" rel="stylesheet" href="tcss/jquery.qtip.min.css">
<link type="text/css" rel="stylesheet" href="tcss/style.css">
<link type="text/css" rel="stylesheet" href="tcss/content.min.css">
<link type="text/css" rel="stylesheet"
	href="tcss/tinymce-studio-content.css">
<link type="text/css" rel="stylesheet" href="tcss/skin.min.css">
<link type="text/css" rel="stylesheet" href="tcss/style-app.css">
<link type="text/css" rel="stylesheet" href="tcss/style-app-extend1.css">
<link rel="stylesheet" type="text/css" href="tcss/jquery.timepicker.css" />


<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="js/index.js"></script>

<!-- dummy segment.io -->

<!-- end dummy segment.io -->
<script>
$(function() {
	//新建verticalId
	if ("${verticalId}" == -1)
	{
	   edit();
	}
	
});

function hidetrain()
{
	$("#traindiv").hide();
}
function showtrain(){
    //document.getElementById('traindiv').style.display='block'; 
	$("#traindiv").show();
}

function edit() {
    var input = this.$('.xblock-field-input');
    this.$('.wrapper-xblock-field').addClass('is-editing');
    input.focus().select();            
}
function completeEdit(){
  	var name=this.$('.xblock-field-input').val();
  	this.$('.wrapper-xblock-field').removeClass('is-editing');
  	savever(name);
	/*if (currentValue === "单元") {
            this.$('.wrapper-xblock-field').removeClass('is-editing');
        }
    else{
    		this.$('.wrapper-xblock-field').removeClass('is-editing');
    		document.getElementById("t11").innerHTML=currentValue;
    }*/
} 
function savever(name)
{
	var sequenticalId = parseInt("${sequentialId}");
	var verticalId = parseInt("${verticalId}");
	var courseId = parseInt("${courseId}");
	var data = {sequenticalId:sequenticalId,verticalId:verticalId,name:name};
	$.ajax({
		url:"cms/createVertical.action",
		type:"post",
		data:data,
		success:function(s){
			var a=eval("("+s+")");	
			if (a.sucess=="sucess")
			{
				location.href = "cms/tottrain.action?courseId="+courseId+"&sequentialId="+sequenticalId+"&verticalId="+a.verticalId;
			}
		}
	});
} 
</script>
<script>


    


<link rel="stylesheet" type="text/css" href="css/unit-css/jquery.timepicker.css">

  <script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="jquery" src="/static/acf03d7/js/vendor/jquery.min.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="js/models/course"
	src="/static/acf03d7/js/models/course.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="js/sock"
	src="/static/acf03d7/js/sock.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="domReady"
	src="/static/acf03d7/js/vendor/domReady.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="js/models/xblock_info"
	src="/static/acf03d7/js/models/xblock_info.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="js/views/pages/container"
	src="/static/acf03d7/js/views/pages/container.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="js/collections/component_template"
	src="/static/acf03d7/js/collections/component_template.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="xmodule"
	src="/xmodule/xmodule.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="xblock/cms.runtime.v1"
	src="/static/acf03d7/coffee/src/xblock/cms.runtime.v1.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="gettext" src="/i18n.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="tender"
	src="//edxedge.tenderapp.com/tender_widget.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="coffee/src/ajax_prefix"
	src="/static/acf03d7/coffee/src/ajax_prefix.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="underscore.string"
	src="/static/acf03d7/js/vendor/underscore.string.min.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="js/utils/module"
	src="/static/acf03d7/js/utils/module.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="js/models/component_template"
	src="/static/acf03d7/js/models/component_template.js"></script>
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
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="coffee/src/main"
	src="/static/acf03d7/coffee/src/main.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="js/views/pages/base_page"
	src="/static/acf03d7/js/views/pages/base_page.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="js/views/utils/view_utils"
	src="/static/acf03d7/js/views/utils/view_utils.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="js/views/container"
	src="/static/acf03d7/js/views/container.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="js/views/xblock"
	src="/static/acf03d7/js/views/xblock.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="js/views/components/add_xblock"
	src="/static/acf03d7/js/views/components/add_xblock.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="js/views/modals/edit_xblock"
	src="/static/acf03d7/js/views/modals/edit_xblock.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="js/views/xblock_string_field_editor"
	src="/static/acf03d7/js/views/xblock_string_field_editor.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="js/views/pages/container_subviews"
	src="/static/acf03d7/js/views/pages/container_subviews.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="js/views/unit_outline"
	src="/static/acf03d7/js/views/unit_outline.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="js/views/utils/xblock_utils"
	src="/static/acf03d7/js/views/utils/xblock_utils.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="utility"
	src="/static/acf03d7/js/src/utility.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="js/utils/modal"
	src="/static/acf03d7/js/utils/modal.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="js/views/feedback_notification"
	src="/static/acf03d7/js/views/feedback_notification.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="underscore"
	src="/static/acf03d7/js/vendor/underscore-min.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="js/base"
	src="/static/acf03d7/js/base.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="accessibility"
	src="/static/acf03d7/js/src/accessibility_tools.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="ieshim"
	src="/static/acf03d7/js/src/ie_shim.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="mathjax"
	src="//edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/MathJax.js?config=TeX-MML-AM_HTMLorMML-full&amp;delayStartupUntil=configured"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="codemirror"
	src="/static/acf03d7/js/vendor/codemirror-compressed.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="tinymce"
	src="/static/acf03d7/js/vendor/tinymce/js/tinymce/tinymce.full.min.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="jquery.qtip"
	src="/static/acf03d7/js/vendor/jquery.qtip.min.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="jquery.scrollTo"
	src="/static/acf03d7/js/vendor/jquery.scrollTo-1.4.2-min.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="jquery.flot"
	src="/static/acf03d7/js/vendor/flot/jquery.flot.min.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="jquery.cookie"
	src="/static/acf03d7/js/vendor/jquery.cookie.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="URI"
	src="/static/acf03d7/js/vendor/URI.min.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="jquery.smoothScroll"
	src="/static/acf03d7/js/vendor/jquery.smooth-scroll.min.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="coffee/src/logger"
	src="/static/acf03d7/coffee/src/logger.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="jquery.timepicker"
	src="/static/acf03d7/js/vendor/timepicker/jquery.timepicker.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="jquery.immediateDescendents"
	src="/static/acf03d7/coffee/src/jquery.immediateDescendents.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="jquery.ui"
	src="/static/acf03d7/js/vendor/jquery-ui.min.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="js/views/baseview"
	src="/static/acf03d7/js/views/baseview.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="js/views/feedback_prompt"
	src="/static/acf03d7/js/views/feedback_prompt.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="js/views/feedback"
	src="/static/acf03d7/js/views/feedback.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="js/views/components/add_xblock_button"
	src="/static/acf03d7/js/views/components/add_xblock_button.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="js/views/components/add_xblock_menu"
	src="/static/acf03d7/js/views/components/add_xblock_menu.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="js/views/modals/base_modal"
	src="/static/acf03d7/js/views/modals/base_modal.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="js/views/xblock_editor"
	src="/static/acf03d7/js/views/xblock_editor.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="js/views/xblock_outline"
	src="/static/acf03d7/js/views/xblock_outline.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="backbone"
	src="/static/acf03d7/js/vendor/backbone-min.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="tooltip_manager"
	src="/static/acf03d7/js/src/tooltip_manager.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="xblock/core"
	src="/static/acf03d7/coffee/src/xblock/core.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="jquery.tinymce"
	src="/static/acf03d7/js/vendor/tinymce/js/tinymce/jquery.tinymce.min.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="js/utils/date_utils"
	src="/static/acf03d7/js/utils/date_utils.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="js/utils/handle_iframe_binding"
	src="/static/acf03d7/js/utils/handle_iframe_binding.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="jquery.leanModal"
	src="/static/acf03d7/js/vendor/jquery.leanModal.min.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="js/utils/templates"
	src="/static/acf03d7/js/utils/templates.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="xblock/runtime.v1"
	src="/static/acf03d7/coffee/src/xblock/runtime.v1.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="datepair"
	src="/static/acf03d7/js/vendor/timepicker/datepair.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="js/views/metadata"
	src="/static/acf03d7/js/views/metadata.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="js/collections/metadata"
	src="/static/acf03d7/js/collections/metadata.js"></script>
<style type="text/css">
.MathJax_Hover_Frame {
	border-radius: .25em;
	-webkit-border-radius: .25em;
	-moz-border-radius: .25em;
	-khtml-border-radius: .25em;
	box-shadow: 0px 0px 15px #83A;
	-webkit-box-shadow: 0px 0px 15px #83A;
	-moz-box-shadow: 0px 0px 15px #83A;
	-khtml-box-shadow: 0px 0px 15px #83A;
	border: 1px solid #A6D ! important;
	display: inline-block;
	position: absolute
}

.MathJax_Hover_Arrow {
	position: absolute;
	width: 15px;
	height: 11px;
	cursor: pointer
}
</style>
<style type="text/css">
#MathJax_About {
	position: fixed;
	left: 50%;
	width: auto;
	text-align: center;
	border: 3px outset;
	padding: 1em 2em;
	background-color: #DDDDDD;
	color: black;
	cursor: default;
	font-family: message-box;
	font-size: 120%;
	font-style: normal;
	text-indent: 0;
	text-transform: none;
	line-height: normal;
	letter-spacing: normal;
	word-spacing: normal;
	word-wrap: normal;
	white-space: nowrap;
	float: none;
	z-index: 201;
	border-radius: 15px;
	-webkit-border-radius: 15px;
	-moz-border-radius: 15px;
	-khtml-border-radius: 15px;
	box-shadow: 0px 10px 20px #808080;
	-webkit-box-shadow: 0px 10px 20px #808080;
	-moz-box-shadow: 0px 10px 20px #808080;
	-khtml-box-shadow: 0px 10px 20px #808080;
	filter: progid:DXImageTransform.Microsoft.dropshadow(OffX=2, OffY=2,
		Color='gray', Positive='true' )
}

.MathJax_Menu {
	position: absolute;
	background-color: white;
	color: black;
	width: auto;
	padding: 2px;
	border: 1px solid #CCCCCC;
	margin: 0;
	cursor: default;
	font: menu;
	text-align: left;
	text-indent: 0;
	text-transform: none;
	line-height: normal;
	letter-spacing: normal;
	word-spacing: normal;
	word-wrap: normal;
	white-space: nowrap;
	float: none;
	z-index: 201;
	box-shadow: 0px 10px 20px #808080;
	-webkit-box-shadow: 0px 10px 20px #808080;
	-moz-box-shadow: 0px 10px 20px #808080;
	-khtml-box-shadow: 0px 10px 20px #808080;
	filter: progid:DXImageTransform.Microsoft.dropshadow(OffX=2, OffY=2,
		Color='gray', Positive='true' )
}

.MathJax_MenuItem {
	padding: 2px 2em;
	background: transparent
}

.MathJax_MenuArrow {
	position: absolute;
	right: .5em;
	color: #666666
}

.MathJax_MenuActive .MathJax_MenuArrow {
	color: white
}

.MathJax_MenuCheck {
	position: absolute;
	left: .7em
}

.MathJax_MenuRadioCheck {
	position: absolute;
	left: 1em
}

.MathJax_MenuLabel {
	padding: 2px 2em 4px 1.33em;
	font-style: italic
}

.MathJax_MenuRule {
	border-top: 1px solid #CCCCCC;
	margin: 4px 1px 0px
}

.MathJax_MenuDisabled {
	color: GrayText
}

.MathJax_MenuActive {
	background-color: Highlight;
	color: HighlightText
}

.MathJax_Menu_Close {
	position: absolute;
	width: 31px;
	height: 31px;
	top: -15px;
	left: -15px
}
</style>
<style type="text/css">
#MathJax_Zoom {
	position: absolute;
	background-color: #F0F0F0;
	overflow: auto;
	display: block;
	z-index: 301;
	padding: .5em;
	border: 1px solid black;
	margin: 0;
	font-weight: normal;
	font-style: normal;
	text-align: left;
	text-indent: 0;
	text-transform: none;
	line-height: normal;
	letter-spacing: normal;
	word-spacing: normal;
	word-wrap: normal;
	white-space: nowrap;
	float: none;
	box-shadow: 5px 5px 15px #AAAAAA;
	-webkit-box-shadow: 5px 5px 15px #AAAAAA;
	-moz-box-shadow: 5px 5px 15px #AAAAAA;
	-khtml-box-shadow: 5px 5px 15px #AAAAAA;
	filter: progid:DXImageTransform.Microsoft.dropshadow(OffX=2, OffY=2,
		Color='gray', Positive='true' )
}

#MathJax_ZoomOverlay {
	position: absolute;
	left: 0;
	top: 0;
	z-index: 300;
	display: inline-block;
	width: 100%;
	height: 100%;
	border: 0;
	padding: 0;
	margin: 0;
	background-color: white;
	opacity: 0;
	filter: alpha(opacity = 0)
}

#MathJax_ZoomFrame {
	position: relative;
	display: inline-block;
	height: 0;
	width: 0
}

#MathJax_ZoomEventTrap {
	position: absolute;
	left: 0;
	top: 0;
	z-index: 302;
	display: inline-block;
	border: 0;
	padding: 0;
	margin: 0;
	background-color: white;
	opacity: 0;
	filter: alpha(opacity = 0)
}
</style>
<style type="text/css">
.MathJax_Preview {
	color: #888
}

#MathJax_Message {
	position: fixed;
	left: 1em;
	bottom: 1.5em;
	background-color: #E6E6E6;
	border: 1px solid #959595;
	margin: 0px;
	padding: 2px 8px;
	z-index: 102;
	color: black;
	font-size: 80%;
	width: auto;
	white-space: nowrap
}

#MathJax_MSIE_Frame {
	position: absolute;
	top: 0;
	left: 0;
	width: 0px;
	z-index: 101;
	border: 0px;
	margin: 0px;
	padding: 0px
}

.MathJax_Error {
	color: #CC0000;
	font-style: italic
}
</style>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="jquery.form"
	src="/static/acf03d7/js/vendor/jquery.form.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/descriptors/js/000-38c1026a572b76f052cb032657dc6d93.js"
	src="/static/acf03d7/xmodule/descriptors/js/000-38c1026a572b76f052cb032657dc6d93.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/descriptors/js/000-5a624b61d868942153cefc31a9dc36c7.js"
	src="/static/acf03d7/xmodule/descriptors/js/000-5a624b61d868942153cefc31a9dc36c7.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/descriptors/js/000-5b4f5d368b61e60c0ec0a96da354835b.js"
	src="/static/acf03d7/xmodule/descriptors/js/000-5b4f5d368b61e60c0ec0a96da354835b.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/descriptors/js/000-6022911bfee6e7865b4457629ab2ff44.js"
	src="/static/acf03d7/xmodule/descriptors/js/000-6022911bfee6e7865b4457629ab2ff44.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/descriptors/js/000-77e70463a4253744c48f1687383e259e.js"
	src="/static/acf03d7/xmodule/descriptors/js/000-77e70463a4253744c48f1687383e259e.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/descriptors/js/000-79a64f2010d8b4cb8d0f0d6912c70c12.js"
	src="/static/acf03d7/xmodule/descriptors/js/000-79a64f2010d8b4cb8d0f0d6912c70c12.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/descriptors/js/000-bb51a36b4a29ce38be91a5102d77ad3c.js"
	src="/static/acf03d7/xmodule/descriptors/js/000-bb51a36b4a29ce38be91a5102d77ad3c.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/descriptors/js/000-bdf940d1aa93739db56b49bf7c25205e.js"
	src="/static/acf03d7/xmodule/descriptors/js/000-bdf940d1aa93739db56b49bf7c25205e.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/descriptors/js/000-c7b679d67306eff79b26fa5916c22ebb.js"
	src="/static/acf03d7/xmodule/descriptors/js/000-c7b679d67306eff79b26fa5916c22ebb.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/000-37c8e1c19b097587504b5f30c33aef11.js"
	src="/static/acf03d7/xmodule/modules/js/000-37c8e1c19b097587504b5f30c33aef11.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/000-38c1026a572b76f052cb032657dc6d93.js"
	src="/static/acf03d7/xmodule/modules/js/000-38c1026a572b76f052cb032657dc6d93.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/000-4b06b565ce07b7ec692a835beb968b0c.js"
	src="/static/acf03d7/xmodule/modules/js/000-4b06b565ce07b7ec692a835beb968b0c.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/000-4e789164fb697a2e6e6180f9f8255659.js"
	src="/static/acf03d7/xmodule/modules/js/000-4e789164fb697a2e6e6180f9f8255659.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/000-53c44c016974a4e7b767192c8fa16fe0.js"
	src="/static/acf03d7/xmodule/modules/js/000-53c44c016974a4e7b767192c8fa16fe0.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/000-c5eff3526bed9d24970f5ef629d53cef.js"
	src="/static/acf03d7/xmodule/modules/js/000-c5eff3526bed9d24970f5ef629d53cef.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/000-e2c8c1923afe3181bc3303bc662a409a.js"
	src="/static/acf03d7/xmodule/modules/js/000-e2c8c1923afe3181bc3303bc662a409a.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/000-e54b5c7f7b657100c24d82263144a4fd.js"
	src="/static/acf03d7/xmodule/modules/js/000-e54b5c7f7b657100c24d82263144a4fd.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/001-149e5f80fb129c93207c19c2cb17b45a.js"
	src="/static/acf03d7/xmodule/modules/js/001-149e5f80fb129c93207c19c2cb17b45a.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/001-224d365aed3a968d6876b75a9e39d877.js"
	src="/static/acf03d7/xmodule/modules/js/001-224d365aed3a968d6876b75a9e39d877.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/001-42a54bf42a889003f390bd8ac7fe77be.js"
	src="/static/acf03d7/xmodule/modules/js/001-42a54bf42a889003f390bd8ac7fe77be.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/001-53c44c016974a4e7b767192c8fa16fe0.js"
	src="/static/acf03d7/xmodule/modules/js/001-53c44c016974a4e7b767192c8fa16fe0.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/001-72c7856ac95c63cb8a2d71777e09eb37.js"
	src="/static/acf03d7/xmodule/modules/js/001-72c7856ac95c63cb8a2d71777e09eb37.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/001-831bfa7f0550106cead1942d7485d9b2.js"
	src="/static/acf03d7/xmodule/modules/js/001-831bfa7f0550106cead1942d7485d9b2.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/001-96d20c9f6be33c7f09c4fcf3d7e4633a.js"
	src="/static/acf03d7/xmodule/modules/js/001-96d20c9f6be33c7f09c4fcf3d7e4633a.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/001-c3d14b8d25e6e22ebcc6603d2e75d212.js"
	src="/static/acf03d7/xmodule/modules/js/001-c3d14b8d25e6e22ebcc6603d2e75d212.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/001-d1f81454cdec8eb05058f2be176cf63b.js"
	src="/static/acf03d7/xmodule/modules/js/001-d1f81454cdec8eb05058f2be176cf63b.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/001-ea624e6d121e8f7d64e5f36605158596.js"
	src="/static/acf03d7/xmodule/modules/js/001-ea624e6d121e8f7d64e5f36605158596.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/001-f78a251c463c5a6eb6b4ada613e6153e.js"
	src="/static/acf03d7/xmodule/modules/js/001-f78a251c463c5a6eb6b4ada613e6153e.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/002-2efdc26d48edfbb30a54c2e5875ddef3.js"
	src="/static/acf03d7/xmodule/modules/js/002-2efdc26d48edfbb30a54c2e5875ddef3.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/002-53c44c016974a4e7b767192c8fa16fe0.js"
	src="/static/acf03d7/xmodule/modules/js/002-53c44c016974a4e7b767192c8fa16fe0.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/002-5df836f1bff325803db265b4e6bdd400.js"
	src="/static/acf03d7/xmodule/modules/js/002-5df836f1bff325803db265b4e6bdd400.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/002-64f803bbfc8033bc9c4c434a59717369.js"
	src="/static/acf03d7/xmodule/modules/js/002-64f803bbfc8033bc9c4c434a59717369.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/002-c69e953ceece62d29352ef33330b37ae.js"
	src="/static/acf03d7/xmodule/modules/js/002-c69e953ceece62d29352ef33330b37ae.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/002-d33c65a4e461258e77ae8dc21df29a85.js"
	src="/static/acf03d7/xmodule/modules/js/002-d33c65a4e461258e77ae8dc21df29a85.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/002-d7b3578319f397f236353b00a25ba14d.js"
	src="/static/acf03d7/xmodule/modules/js/002-d7b3578319f397f236353b00a25ba14d.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/002-e8aaca26172f45bfdf948ac4325edd52.js"
	src="/static/acf03d7/xmodule/modules/js/002-e8aaca26172f45bfdf948ac4325edd52.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/003-222009e8c24f5628677581995d2488d9.js"
	src="/static/acf03d7/xmodule/modules/js/003-222009e8c24f5628677581995d2488d9.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/003-23394bdafb1e88a4de88e976222eb41e.js"
	src="/static/acf03d7/xmodule/modules/js/003-23394bdafb1e88a4de88e976222eb41e.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/003-6e8bf396002ae78ecc4f7bd88b572323.js"
	src="/static/acf03d7/xmodule/modules/js/003-6e8bf396002ae78ecc4f7bd88b572323.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/003-da1290f2b00e2c27e7305fcd42b548ae.js"
	src="/static/acf03d7/xmodule/modules/js/003-da1290f2b00e2c27e7305fcd42b548ae.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/003-ebf95d0ad35d03ed815c71728e84dc68.js"
	src="/static/acf03d7/xmodule/modules/js/003-ebf95d0ad35d03ed815c71728e84dc68.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/004-af44a8894b528bb391f901e7c7a32064.js"
	src="/static/acf03d7/xmodule/modules/js/004-af44a8894b528bb391f901e7c7a32064.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/004-d46fc8abde5a36d4c0ea0cd6af12bcff.js"
	src="/static/acf03d7/xmodule/modules/js/004-d46fc8abde5a36d4c0ea0cd6af12bcff.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/004-f713a3bce247ef33bf2fcd2af21cba8f.js"
	src="/static/acf03d7/xmodule/modules/js/004-f713a3bce247ef33bf2fcd2af21cba8f.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/005-16a4ddfb11dad336032f6a3a88692a46.js"
	src="/static/acf03d7/xmodule/modules/js/005-16a4ddfb11dad336032f6a3a88692a46.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/005-d5d57f05b365edd2e459922ac8a6bba3.js"
	src="/static/acf03d7/xmodule/modules/js/005-d5d57f05b365edd2e459922ac8a6bba3.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/006-378ac9c882e0b09f6a3553b10c967967.js"
	src="/static/acf03d7/xmodule/modules/js/006-378ac9c882e0b09f6a3553b10c967967.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/006-c048d2df9a279e40617f4b222e2f24c8.js"
	src="/static/acf03d7/xmodule/modules/js/006-c048d2df9a279e40617f4b222e2f24c8.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/007-8786e4f817f86a276ee538eecc45f0e6.js"
	src="/static/acf03d7/xmodule/modules/js/007-8786e4f817f86a276ee538eecc45f0e6.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/007-a3344151a7d92d40f881f592af41add9.js"
	src="/static/acf03d7/xmodule/modules/js/007-a3344151a7d92d40f881f592af41add9.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/008-afc7413769330ed39dab7ea366492aac.js"
	src="/static/acf03d7/xmodule/modules/js/008-afc7413769330ed39dab7ea366492aac.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/008-fd708bb4fac08ee85e47174ef0a31f6e.js"
	src="/static/acf03d7/xmodule/modules/js/008-fd708bb4fac08ee85e47174ef0a31f6e.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/009-235d1ae2f2146ddcec4c4f5626df30c8.js"
	src="/static/acf03d7/xmodule/modules/js/009-235d1ae2f2146ddcec4c4f5626df30c8.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/009-6099fb4c640ced238dd6a35ac69e95f0.js"
	src="/static/acf03d7/xmodule/modules/js/009-6099fb4c640ced238dd6a35ac69e95f0.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/010-afb5ca5ed2190d549dd16231c8f2cab3.js"
	src="/static/acf03d7/xmodule/modules/js/010-afb5ca5ed2190d549dd16231c8f2cab3.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/011-1dc143e7b45b9e03bd70bbbb68859d21.js"
	src="/static/acf03d7/xmodule/modules/js/011-1dc143e7b45b9e03bd70bbbb68859d21.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/012-88decd25db3d55879f3ab14cfb27e269.js"
	src="/static/acf03d7/xmodule/modules/js/012-88decd25db3d55879f3ab14cfb27e269.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/013-2840b06b336bec403b8ee961c659ba64.js"
	src="/static/acf03d7/xmodule/modules/js/013-2840b06b336bec403b8ee961c659ba64.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/014-c20187b4b3360a37b63676caa0eaeeb7.js"
	src="/static/acf03d7/xmodule/modules/js/014-c20187b4b3360a37b63676caa0eaeeb7.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/015-f84639f31755de1c4e87cf18d87f737a.js"
	src="/static/acf03d7/xmodule/modules/js/015-f84639f31755de1c4e87cf18d87f737a.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/016-67bb3bc970776f28d9b2c352879d69ed.js"
	src="/static/acf03d7/xmodule/modules/js/016-67bb3bc970776f28d9b2c352879d69ed.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/017-73ef5e3891bc49c3b858b02be34e00d0.js"
	src="/static/acf03d7/xmodule/modules/js/017-73ef5e3891bc49c3b858b02be34e00d0.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/xmodule/modules/js/018-cfe75d3c5362edca25a83c237ba533b6.js"
	src="/static/acf03d7/xmodule/modules/js/018-cfe75d3c5362edca25a83c237ba533b6.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/coffee/src/discussion/content.js"
	src="/static/acf03d7/coffee/src/discussion/content.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/coffee/src/discussion/discussion.js"
	src="/static/acf03d7/coffee/src/discussion/discussion.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/coffee/src/discussion/discussion_filter.js"
	src="/static/acf03d7/coffee/src/discussion/discussion_filter.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/coffee/src/discussion/discussion_module_view.js"
	src="/static/acf03d7/coffee/src/discussion/discussion_module_view.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/coffee/src/discussion/discussion_router.js"
	src="/static/acf03d7/coffee/src/discussion/discussion_router.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/coffee/src/discussion/main.js"
	src="/static/acf03d7/coffee/src/discussion/main.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/coffee/src/discussion/templates.js"
	src="/static/acf03d7/coffee/src/discussion/templates.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="/static/acf03d7/coffee/src/discussion/utils.js"
	src="/static/acf03d7/coffee/src/discussion/utils.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="jquery.inputnumber"
	src="/static/acf03d7/js/vendor/html5-input-polyfills/number-polyfill.js"></script>
<style type="text/css">
DIV.MathJax_MathML {
	text-align: center;
	margin: .75em 0px
}

.MathJax_MathML {
	font-style: normal;
	font-weight: normal;
	line-height: normal;
	font-size: 100%;
	font-size-adjust: none;
	text-indent: 0;
	text-align: left;
	text-transform: none;
	letter-spacing: normal;
	word-spacing: normal;
	word-wrap: normal;
	white-space: nowrap;
	float: none;
	direction: ltr;
	border: 0;
	padding: 0;
	margin: 0
}

span.MathJax_MathML {
	display: inline
}

div.MathJax_MathML {
	display: block
}

.MathJax_mmlExBox {
	display: block;
	overflow: hidden;
	height: 1px;
	width: 60ex;
	padding: 0;
	border: 0;
	margin: 0
}

[mathvariant="double-struck"] {
	font-family: MathJax_AMS, MathJax_AMS-WEB
}

[mathvariant="script"] {
	font-family: MathJax_Script, MathJax_Script-WEB
}

[mathvariant="fraktur"] {
	font-family: MathJax_Fraktur, MathJax_Fraktur-WEB
}

[mathvariant="bold-script"] {
	font-family: MathJax_Script, MathJax_Caligraphic-WEB;
	font-weight: bold
}

[mathvariant="bold-fraktur"] {
	font-family: MathJax_Fraktur, MathJax_Fraktur-WEB;
	font-weight: bold
}

[mathvariant="monospace"] {
	font-family: monospace
}

[mathvariant="sans-serif"] {
	font-family: sans-serif
}

[mathvariant="bold-sans-serif"] {
	font-family: sans-serif;
	font-weight: bold
}

[mathvariant="sans-serif-italic"] {
	font-family: sans-serif;
	font-style: italic
}

[mathvariant="sans-serif-bold-italic"] {
	font-family: sans-serif;
	font-style: italic;
	font-weight: bold
}

[class="MJX-tex-oldstyle"] {
	font-family: MathJax_Caligraphic, MathJax_Caligraphic-WEB
}

[class="MJX-tex-oldstyle-bold"] {
	font-family: MathJax_Caligraphic, MathJax_Caligraphic-WEB;
	font-weight: bold
}

[class="MJX-tex-caligraphic"] {
	font-family: MathJax_Caligraphic, MathJax_Caligraphic-WEB
}

[class="MJX-tex-caligraphic-bold"] {
	font-family: MathJax_Caligraphic, MathJax_Caligraphic-WEB;
	font-weight: bold
}

@font-face /*1*/ {
	font-family: MathJax_AMS-WEB;
	src:
		url('http://edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/fonts/HTML-CSS/TeX/otf/MathJax_AMS-Regular.otf')
}

@font-face /*2*/ {
	font-family: MathJax_Script-WEB;
	src:
		url('http://edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/fonts/HTML-CSS/TeX/otf/MathJax_Script-Regular.otf')
}

@font-face /*3*/ {
	font-family: MathJax_Fraktur-WEB;
	src:
		url('http://edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/fonts/HTML-CSS/TeX/otf/MathJax_Fraktur-Regular.otf')
}

@font-face /*4*/ {
	font-family: MathJax_Caligraphic-WEB;
	src:
		url('http://edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/fonts/HTML-CSS/TeX/otf/MathJax_Caligraphic-Regular.otf')
}

@font-face /*5*/ {
	font-family: MathJax_Fraktur-WEB;
	font-weight: bold;
	src:
		url('http://edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/fonts/HTML-CSS/TeX/otf/MathJax_Fraktur-Bold.otf')
}

@font-face /*6*/ {
	font-family: MathJax_Caligraphic-WEB;
	font-weight: bold;
	src:
		url('http://edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/fonts/HTML-CSS/TeX/otf/MathJax_Caligraphic-Bold.otf')
}
</style>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="date"
	src="/static/acf03d7/js/vendor/date.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="js/models/metadata"
	src="/static/acf03d7/js/models/metadata.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="js/views/abstract_editor"
	src="/static/acf03d7/js/views/abstract_editor.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="js/models/uploads"
	src="/static/acf03d7/js/models/uploads.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="js/views/uploads"
	src="/static/acf03d7/js/views/uploads.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="js/views/video/transcripts/metadata_videolist"
	src="/static/acf03d7/js/views/video/transcripts/metadata_videolist.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="js/views/video/translations_editor"
	src="/static/acf03d7/js/views/video/translations_editor.js"></script>
<style type="text/css">
.MathJax_Display {
	text-align: center;
	margin: 1em 0em;
	position: relative;
	display: block;
	width: 100%
}

.MathJax .merror {
	background-color: #FFFF88;
	color: #CC0000;
	border: 1px solid #CC0000;
	padding: 1px 3px;
	font-style: normal;
	font-size: 90%
}

#MathJax_Tooltip {
	background-color: InfoBackground;
	color: InfoText;
	border: 1px solid black;
	box-shadow: 2px 2px 5px #AAAAAA;
	-webkit-box-shadow: 2px 2px 5px #AAAAAA;
	-moz-box-shadow: 2px 2px 5px #AAAAAA;
	-khtml-box-shadow: 2px 2px 5px #AAAAAA;
	filter: progid:DXImageTransform.Microsoft.dropshadow(OffX=2, OffY=2,
		Color='gray', Positive='true' );
	padding: 3px 4px;
	z-index: 401;
	position: absolute;
	left: 0;
	top: 0;
	width: auto;
	height: auto;
	display: none
}

.MathJax {
	display: inline;
	font-style: normal;
	font-weight: normal;
	line-height: normal;
	font-size: 100%;
	font-size-adjust: none;
	text-indent: 0;
	text-align: left;
	text-transform: none;
	letter-spacing: normal;
	word-spacing: normal;
	word-wrap: normal;
	white-space: nowrap;
	float: none;
	direction: ltr;
	border: 0;
	padding: 0;
	margin: 0
}

.MathJax img,.MathJax nobr,.MathJax a {
	border: 0;
	padding: 0;
	margin: 0;
	max-width: none;
	max-height: none;
	vertical-align: 0;
	line-height: normal;
	text-decoration: none
}

img.MathJax_strut {
	border: 0 !important;
	padding: 0 !important;
	margin: 0 !important;
	vertical-align: 0 !important
}

.MathJax span {
	display: inline;
	position: static;
	border: 0;
	padding: 0;
	margin: 0;
	vertical-align: 0;
	line-height: normal;
	text-decoration: none
}

.MathJax nobr {
	white-space: nowrap ! important
}

.MathJax img {
	display: inline ! important;
	float: none ! important
}

.MathJax * {
	transition: none;
	-webkit-transition: none;
	-moz-transition: none;
	-ms-transition: none;
	-o-transition: none
}

.MathJax_Processing {
	visibility: hidden;
	position: fixed;
	width: 0;
	height: 0;
	overflow: hidden
}

.MathJax_Processed {
	display: none !important
}

.MathJax_ExBox {
	display: block;
	overflow: hidden;
	width: 1px;
	height: 60ex
}

.MathJax .MathJax_EmBox {
	display: block;
	overflow: hidden;
	width: 1px;
	height: 60em
}

.MathJax .MathJax_HitBox {
	cursor: text;
	background: white;
	opacity: 0;
	filter: alpha(opacity = 0)
}

.MathJax .MathJax_HitBox * {
	filter: none;
	opacity: 1;
	background: transparent
}

#MathJax_Tooltip * {
	filter: none;
	opacity: 1;
	background: transparent
}

@font-face {
	font-family: MathJax_Main;
	src:
		url('http://edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/fonts/HTML-CSS/TeX/woff/MathJax_Main-Regular.woff')
		format('woff'),
		url('http://edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/fonts/HTML-CSS/TeX/otf/MathJax_Main-Regular.otf')
		format('opentype')
}

@font-face {
	font-family: MathJax_Main;
	src:
		url('http://edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/fonts/HTML-CSS/TeX/woff/MathJax_Main-Bold.woff')
		format('woff'),
		url('http://edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/fonts/HTML-CSS/TeX/otf/MathJax_Main-Bold.otf')
		format('opentype');
	font-weight: bold
}

@font-face {
	font-family: MathJax_Main;
	src:
		url('http://edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/fonts/HTML-CSS/TeX/woff/MathJax_Main-Italic.woff')
		format('woff'),
		url('http://edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/fonts/HTML-CSS/TeX/otf/MathJax_Main-Italic.otf')
		format('opentype');
	font-style: italic
}

@font-face {
	font-family: MathJax_Math;
	src:
		url('http://edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/fonts/HTML-CSS/TeX/woff/MathJax_Math-Italic.woff')
		format('woff'),
		url('http://edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/fonts/HTML-CSS/TeX/otf/MathJax_Math-Italic.otf')
		format('opentype');
	font-style: italic
}

@font-face {
	font-family: MathJax_Caligraphic;
	src:
		url('http://edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/fonts/HTML-CSS/TeX/woff/MathJax_Caligraphic-Regular.woff')
		format('woff'),
		url('http://edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/fonts/HTML-CSS/TeX/otf/MathJax_Caligraphic-Regular.otf')
		format('opentype')
}

@font-face {
	font-family: MathJax_Size1;
	src:
		url('http://edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/fonts/HTML-CSS/TeX/woff/MathJax_Size1-Regular.woff')
		format('woff'),
		url('http://edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/fonts/HTML-CSS/TeX/otf/MathJax_Size1-Regular.otf')
		format('opentype')
}

@font-face {
	font-family: MathJax_Size2;
	src:
		url('http://edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/fonts/HTML-CSS/TeX/woff/MathJax_Size2-Regular.woff')
		format('woff'),
		url('http://edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/fonts/HTML-CSS/TeX/otf/MathJax_Size2-Regular.otf')
		format('opentype')
}

@font-face {
	font-family: MathJax_Size3;
	src:
		url('http://edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/fonts/HTML-CSS/TeX/woff/MathJax_Size3-Regular.woff')
		format('woff'),
		url('http://edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/fonts/HTML-CSS/TeX/otf/MathJax_Size3-Regular.otf')
		format('opentype')
}

@font-face {
	font-family: MathJax_Size4;
	src:
		url('http://edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/fonts/HTML-CSS/TeX/woff/MathJax_Size4-Regular.woff')
		format('woff'),
		url('http://edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/fonts/HTML-CSS/TeX/otf/MathJax_Size4-Regular.otf')
		format('opentype')
}

.MathJax .noError {
	vertical-align:;
	font-size: 90%;
	text-align: left;
	color: black;
	padding: 1px 3px;
	border: 1px solid
}
</style>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="js/views/video/transcripts/utils"
	src="/static/acf03d7/js/views/video/transcripts/utils.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="js/views/video/transcripts/message_manager"
	src="/static/acf03d7/js/views/video/transcripts/message_manager.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="js/views/video/transcripts/file_uploader"
	src="/static/acf03d7/js/views/video/transcripts/file_uploader.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="jquery.ajaxQueue"
	src="/static/acf03d7/js/vendor/jquery.ajaxQueue.js"></script>
</head>


<body
	class="is-signedin course container view-container hide-wip lang_en js">
	<div
		style="visibility: hidden; overflow: hidden; position: absolute; top: 0px; height: 1px; width: auto; padding: 0px; border: 0px; margin: 0px; text-align: left; text-indent: 0px; text-transform: none; line-height: normal; letter-spacing: normal; word-spacing: normal;">
		<div id="MathJax_Hidden"></div>
	</div>
	<div id="MathJax_Message" style="display: none;"></div>
	<a class="nav-skip" href="#content">Skip to this view's content</a>

	<script type="text/javascript">
    window.baseUrl = "./tjs/";
    var require = {
        baseUrl: baseUrl,
        waitSeconds: 60,
        paths: {
            "domReady": "domReady",
            "gettext": "i18n",
            "mustache": "mustache",
            "codemirror": "codemirror-compressed",
            "codemirror/stex": "stex",
            "jquery": "jquery.min",
            "jquery.ui": "jquery-ui.min",
            "jquery.form": "jquery.form",
            "jquery.markitup": "jquery.markitup",
            "jquery.leanModal": "jquery.leanModal.min",
            "jquery.ajaxQueue": "jquery.ajaxQueue",
            "jquery.smoothScroll": "jquery.smooth-scroll.min",
            "jquery.timepicker": "jquery.timepicker",
            "jquery.cookie": "jquery.cookie",
            "jquery.qtip": "jquery.qtip.min",
            "jquery.scrollTo": "jquery.scrollTo-1.4.2-min",
            "jquery.flot": "jjquery.flot.min",
            "jquery.fileupload": "jquery.fileupload",
            "jquery.iframe-transport": "jquery.iframe-transport",
            "jquery.inputnumber": "number-polyfill",
            "jquery.immediateDescendents": "jquery.immediateDescendents",
            "datepair": "datepair",
            "date": "date",
            "tzAbbr": "tzAbbr",
            "underscore": "underscore-min",
            "underscore.string": "underscore.string.min",
            "backbone": "backbone-min",
            "backbone.associations": "backbone-associations-min",
            "backbone.paginator": "backbone.paginator.min",
            "tinymce": "tinymce.full.min",
            "jquery.tinymce": "jquery.tinymce.min",
            "xmodule": "xmodule",
            "xblock": "xblock",
            "utility": "utility",
            "accessibility": "accessibility_tools",
            "draggabilly": "draggabilly.pkgd",
            "URI": "URI.min",
            "ieshim": "ie_shim",
            "tooltip_manager": "tooltip_manager",

            // externally hosted files
            "tender": [
                "//edxedge.tenderapp.com/tender_widget",
                // if tender fails to load, fallback on a local file
                // so that require doesn't fall over
                "tender_fallback"
            ],
            "mathjax": "//edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/MathJax.js?config=TeX-MML-AM_HTMLorMML-full&delayStartupUntil=configured",
            "youtube": [
                // youtube URL does not end in ".js". We add "?noext" to the path so
                // that require.js adds the ".js" to the query component of the URL,
                // and leaves the path component intact.
                "//www.youtube.com/player_api?noext",
                // if youtube fails to load, fallback on a local file
                // so that require doesn't fall over
                "youtube_fallback"
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
            "xblock/core": {
                exports: "XBlock",
                deps: ["jquery", "jquery.immediateDescendents"]
            },
            "xblock/runtime.v1": {
                exports: "XBlock",
                deps: ["core"]
            },

            "coffee/src/main": {
                deps: ["ajax_prefix"]
            },
            "coffee/src/logger": {
                exports: "Logger",
                deps: ["ajax_prefix"]
            }
        },
        // load jquery and gettext automatically
        deps: ["jquery", "gettext"],
        callback: function() {
            // load other scripts on every page, after jquery loads
            require(["base", "main", "logger", "datepair", "accessibility", "ieshim", "tooltip_manager"]);
            // we need "datepair" because it dynamically modifies the page
            // when it is loaded -- yuck!
        }
    };
    </script>
	<script type="text/javascript" src="tjs/require.js"></script>
	<script type="text/javascript">
        require(['js/models/course'], function(Course) {
            window.course = new Course({
                id: "Cetc55/Iaas-001/2014-01-01",
                name: "IaaS",
                url_name: "2014-01-01",
                org: "Cetc55",
                num: "Iaas-001",
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
				<header class="mast has-actions has-navigation has-subtitle">
					<div class="page-header">
						<small class="navigation navigation-parents subtitle"> <a
							
							class="navigation-item navigation-link navigation-parent">单元名</a>
							<!-- <a
							href="#"
							class="navigation-item navigation-link navigation-parent">小节</a> -->
						</small>
						<div data-field-display-name="Display Name" data-field="display_name" class="wrapper-xblock-field incontext-editor is-editable">
							<h1 id="t11" class="page-header-title xblock-field-value incontext-editor-value">
								<c:out value="${vertical.name}" default="单元"></c:out> 
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
										<input type="text" title="Edit the name" data-metadata-name="display_name" class="xblock-field-input incontext-editor-input" value="<c:out value='${vertical.name}' default='单元'></c:out>" onblur="completeEdit()"/>
									</label>
									<button type="submit" name="submit" class="sr action action-primary">Save</button>
									<button type="button" name="cancel" class="sr action action-secondary">取消</button>
								</form>
							</div>
						</div>
					</div>

					<nav class="nav-actions">
						<h3 class="sr">Page Actions</h3>
						<ul>
							<li class="action-item action-view nav-item"><a
								href="#"
								class="button button-view action-button" rel="external"
								title="This link will open in a new browser window/tab"
								target="_blank"> <span class="action-button-text">View
										Live Version</span>
							</a></li>
							<li class="action-item action-preview nav-item"><a
								href="#"
								class="button button-preview action-button" rel="external"
								title="This link will open in a new browser window/tab"
								target="_blank"> <span class="action-button-text">Preview
										Changes</span>
							</a></li>
						</ul>
					</nav>
				</header>
			</div>

			<div class="wrapper-content wrapper">
				<div class="inner-wrapper">
					<section class="content-area">

						<article class="content-primary">
							<div class="container-message wrapper-message"></div>
							<section class="wrapper-xblock level-page studio-xblock-wrapper"
								data-locator="#"
								data-course-key="Cetc55/Iaas-001/2014-01-01">
								<header class="xblock-header xblock-header-vertical">
									<div class="xblock-header-primary">
										<div class="header-details">
											<span class="xblock-display-name">单元</span>
										</div>
										<div class="header-actions">
											<ul class="actions-list">
											</ul>
										</div>
									</div>
								</header>
								<article class="xblock-render">
									<div
										class="xblock xblock-author_view xmodule_display xmodule_VerticalModule xblock-initialized"
										data-runtime-class="PreviewRuntime"
										data-init="XBlockToXModuleShim" data-runtime-version="1"
										data-usage-id="#"
										data-type="None" data-block-type="vertical">
										<c:forEach var="vt" items="${vtlist}">
										<ol class="reorderable-container ui-sortable" style="">
										 <li class="studio-xblock-wrapper is-draggable" data-locator="#" data-course-key="">

										    <section class="wrapper-xblock level-element ">
										<header class="xblock-header xblock-header-problem">
										    <div class="xblock-header-primary">
										        <div class="header-details">
										            <span class="xblock-display-name">实验名：${vt.train.name}</span>
										        </div>
										        <div class="header-actions">
										            <ul class="actions-list">
									                        <li class="action-item action-edit">
									                            <a href="#" class="edit-button action-button">
									                                <i class="icon-pencil"></i>
									                                <span class="action-button-text">编辑</span>
									                            </a>
									                        </li>
										                    <li class="action-item action-delete">
										                        <a href="#" data-tooltip="删除" class="delete-button action-button">
										                        <i class="icon-trash"></i>
										                        <span class="sr">删除</span>
										                        </a>
										                    </li>
										            </ul>
										        </div>
										    </div>
										 </header>
										    <article class="xblock-render">
										    实验题目：</br>${vt.train.conContent}
										    </article>
										
										    </section>
										        </li>
										</ol>
										</c:forEach>
										<div id="traindiv" style="display:none;">
										<!-- <iframe width="100%" scrolling="no" height="1729" frameborder="0"   src="experiment.jsp" ></iframe> -->
										<jsp:include page="experiment.jsp"></jsp:include>
										</div>
										<div class="add-xblock-component new-component-item adding">
											<div class="new-component">
												<h5>Add New Component</h5>
												<ul class="new-component-type">
													<li><a
														class="multiple-templates add-xblock-component-button"
														data-type="problem"> <span
															class="large-template-icon large-problem-icon"></span> <span
															class="name">问题</span>
													</a></li>
													<li><a onclick="showtrain()"
														class="multiple-templates add-xblock-component-button"
														data-type="experiment"> <span
															class="large-template-icon large-experiment-icon"></span>
															<span class="name">实验</span>
													</a></li>
												</ul>
											</div>

										</div>

									</div>

								</article>

							</section>
							<div class="ui-loading is-hidden">
								<p>
									<span class="spin"><i class="icon-refresh"></i></span> <span
										class="copy">Loading...</span>
								</p>
							</div>
						</article>
						<aside class="content-supplementary" role="complimentary">
							<div id="publish-unit">

								<div class="bit-publishing is-staff-only is-scheduled">
									<h3 class="bar-mod-title pub-status">
										<span class="sr">Publishing Status</span> Visible to Staff
										Only
									</h3>

									<div class="wrapper-last-draft bar-mod-content">
										<p class="copy meta">

											Draft saved on <span class="date">Aug 24, 2014 at
												03:28 UTC</span> by <span class="user">staff</span>

										</p>
									</div>

									<div class="wrapper-release bar-mod-content">
										<h5 class="title">Release:</h5>
										<p class="copy">


											<span class="release-date">Jan 01, 2014 at 00:00 UTC</span>
											with <span class="release-with">Section "Section1"</span>

										</p>
									</div>



									<div class="wrapper-pub-actions bar-mod-actions">
										<ul class="action-list">
											<li class="action-item"><a
												class="action-publish action-primary " href="">Publish </a>
											</li>
											<li class="action-item"><a
												class="action-discard action-secondary " href="">Discard
													Changes </a></li>
										</ul>
									</div>
								</div>

							</div>
							<div id="publish-history" class="unit-publish-history">


								<div class="wrapper-last-publish">
									<p class="copy">
										Last published <span class="date">Aug 20, 2014 at 01:21
											UTC</span> by <span class="user">staff</span>
									</p>
								</div>

							</div>
							</ol>
				</div>
				</li>
				</ol>
			</div>
			</li>
			</ol>
		</div>
	</div>
	</ol>
	</div>
	</div>
	</div>
	</div>
	</aside>
	</section>
	</div>
	</div>

	</div>

	<script type="text/javascript">
        require(['js/sock']);
      </script>
	<div class="wrapper-sock wrapper">
		<ul class="list-actions list-cta">
			<li class="action-item"><a href="#sock"
				class="cta cta-show-sock"><i class="icon-question-sign"></i> <span
					class="copy">Looking for help with Studio?</span></a></li>
		</ul>

		<div class="wrapper-inner wrapper">
			<section class="sock" id="sock">
				<header>
					<h2 class="title sr">edX Studio Documentation</h2>
				</header>

				<div class="support">
					<h3 class="title">edX Studio Documentation</h3>

					<div class="copy">
						<p>You can click Help in the upper right corner of any page to
							get more information about the page you're on. You can also use
							the links below to download the Building and Running an edX
							Course PDF file, to go to the edX Author Support site, or to
							enroll in edX101.</p>
					</div>

					<ul class="list-actions">
						<li class="action-item js-help-pdf"><a
							href="https://media.readthedocs.org/pdf/edx-partner-course-staff/latest/edx-partner-course-staff.pdf"
							target="_blank" rel="external" class="action action-primary"
							title="This link will open in a new browser window/tab">Building
								and Running an edX Course PDF</a></li>

						<li class="action-item"><a href="http://help.edge.edx.org/"
							rel="external" class="action action-primary"
							title="This link will open in a new browser window/tab"
							target="_blank">edX Studio Author Support</a> <span class="tip">edX
								Studio Author Support</span></li>
						<li class="action-item"><a
							href="https://edge.edx.org/courses/edX/edX101/How_to_Create_an_edX_Course/about"
							rel="external" class="action action-primary"
							title="This link will open in a new browser window/tab"
							target="_blank">Enroll in edX101</a> <span class="tip">How
								to use edX Studio to build your course</span></li>
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
							title="Use our feedback tool, Tender, to share your feedback"><i
								class="icon-comments"></i>Contact Us</a></li>
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

	<script type="text/javascript">
    require(["domReady!", "jquery", "js/models/xblock_info", "js/views/pages/container",
        "js/collections/component_template", "xmodule", "coffee/src/main", "xblock/cms.runtime.v1"],
            function(doc, $, XBlockInfo, ContainerPage, ComponentTemplates, xmoduleLoader) {
                var templates = new ComponentTemplates([{"templates": [{"category": "discussion", "boilerplate_name": null, "display_name": "Discussion", "is_common": false}], "display_name": "Discussion", "type": "discussion"}, {"templates": [{"category": "html", "boilerplate_name": null, "display_name": "Text", "is_common": false}, {"category": "html", "boilerplate_name": "anon_user_id.yaml", "display_name": "Anonymous User ID", "is_common": false}, {"category": "html", "boilerplate_name": "zooming_image.yaml", "display_name": "Zooming Image", "is_common": false}, {"category": "html", "boilerplate_name": "announcement.yaml", "display_name": "Announcement", "is_common": false}, {"category": "html", "boilerplate_name": "raw.yaml", "display_name": "Raw HTML", "is_common": false}, {"category": "html", "boilerplate_name": "image_modal.yaml", "display_name": "Full Screen Image", "is_common": false}, {"category": "html", "boilerplate_name": "iframe.yaml", "display_name": "IFrame", "is_common": false}], "display_name": "HTML", "type": "html"}, {"templates": [{"category": "problem", "boilerplate_name": null, "display_name": "Blank Advanced Problem", "is_common": false}, {"category": "problem", "boilerplate_name": "checkboxes_response.yaml", "display_name": "Checkboxes", "is_common": true}, {"category": "problem", "boilerplate_name": "optionresponse.yaml", "display_name": "Dropdown", "is_common": true}, {"category": "problem", "boilerplate_name": "multiplechoice.yaml", "display_name": "Multiple Choice", "is_common": true}, {"category": "problem", "boilerplate_name": "forumularesponse.yaml", "display_name": "Math Expression Input", "is_common": false}, {"category": "problem", "boilerplate_name": "string_response.yaml", "display_name": "Text Input", "is_common": true}, {"category": "problem", "boilerplate_name": "numericalresponse.yaml", "display_name": "Numerical Input", "is_common": true}, {"category": "problem", "boilerplate_name": "problem_with_hint.yaml", "display_name": "Problem with Adaptive Hint", "is_common": false}, {"category": "problem", "boilerplate_name": "blank_common.yaml", "display_name": "Blank Common Problem", "is_common": true}, {"category": "problem", "boilerplate_name": "circuitschematic.yaml", "display_name": "Circuit Schematic Builder", "is_common": false}, {"category": "problem", "boilerplate_name": "customgrader.yaml", "display_name": "Custom Python-Evaluated Input", "is_common": false}, {"category": "problem", "boilerplate_name": "jsinput_response.yaml", "display_name": "Custom Javascript Display and Grading", "is_common": false}, {"category": "problem", "boilerplate_name": "imageresponse.yaml", "display_name": "Image Mapped Input", "is_common": false}, {"category": "problem", "boilerplate_name": "drag_and_drop.yaml", "display_name": "Drag and Drop", "is_common": false}, {"category": "openassessment", "boilerplate_name": null, "display_name": "Peer Assessment", "is_common": false}], "display_name": "Problem", "type": "problem"}, {"templates": [{"category": "video", "boilerplate_name": null, "display_name": "Video", "is_common": false}], "display_name": "Video", "type": "video"}, {"templates": [{"category": "experiment", "boilerplate_name": "checkboxes_response.yaml", "display_name": "abc", "is_common": false}, {"category": "experiment", "boilerplate_name": "checkboxes_response.yaml", "display_name": "cde", "is_common": false}, {"category": "experiment", "boilerplate_name": "checkboxes_response.yaml", "display_name": "efg", "is_common": false}, {"category": "experiment", "boilerplate_name": "checkboxes_response.yaml", "display_name": "ghi", "is_common": false}, {"category": "experiment", "boilerplate_name": "checkboxes_response.yaml", "display_name": "ijk", "is_common": false}, {"category": "experiment", "boilerplate_name": "checkboxes_response.yaml", "display_name": "klm", "is_common": false}], "display_name": "Experiment", "type": "experiment"}], {parse: true});
                var mainXBlockInfo = new XBlockInfo({"graded": false, "ancestor_info": {"ancestors": [{"category": "sequential", "due_date": "", "published_on": null, "display_name": "\u5c0f\u8282", "graded": false, "format": null, "release_date": "Jan 01, 2014 at 00:00 UTC", "due": null, "studio_url": "/course/Cetc55/Iaas-001/2014-01-01?show=i4x%3A//Cetc55/Iaas-001/sequential/73d9ad89218a4cbd9351deecc2754f27", "child_info": {"category": "vertical", "display_name": "Unit", "children": [{"category": "vertical", "due_date": "", "published_on": "Aug 20, 2014 at 01:21 UTC", "display_name": "\u5355\u5143", "graded": false, "format": null, "has_changes": true, "release_date": "Jan 01, 2014 at 00:00 UTC", "due": null, "studio_url": "/container/i4x://Cetc55/Iaas-001/vertical/aeeb4518311e496b8348d04b32cfe693", "start": "2014-01-01T00:00:00Z", "released_to_students": true, "edited_on": "Aug 20, 2014 at 01:44 UTC", "visibility_state": "staff_only", "published": true, "published_by": "staff", "course_graders": "[\"Homework\", \"Lab\", \"Midterm Exam\", \"Final Exam\"]", "release_date_from": "Section \"Section1\"", "edited_by": "staff", "id": "i4x://Cetc55/Iaas-001/vertical/aeeb4518311e496b8348d04b32cfe693", "currently_visible_to_students": false}, {"category": "vertical", "due_date": "", "published_on": null, "display_name": "Unit", "graded": false, "format": null, "has_changes": true, "release_date": "Jan 01, 2014 at 00:00 UTC", "due": null, "studio_url": "/container/i4x://Cetc55/Iaas-001/vertical/95352aa39c6d4c79bf07f7d223bfbde1", "start": "2014-01-01T00:00:00Z", "released_to_students": true, "edited_on": "Aug 20, 2014 at 01:20 UTC", "visibility_state": "needs_attention", "published": false, "published_by": null, "course_graders": "[\"Homework\", \"Lab\", \"Midterm Exam\", \"Final Exam\"]", "release_date_from": "Section \"Section1\"", "edited_by": "staff", "id": "i4x://Cetc55/Iaas-001/vertical/95352aa39c6d4c79bf07f7d223bfbde1", "currently_visible_to_students": false}, {"category": "vertical", "due_date": "", "published_on": null, "display_name": "Unit", "graded": false, "format": null, "has_changes": true, "release_date": "Jan 01, 2014 at 00:00 UTC", "due": null, "studio_url": "/container/i4x://Cetc55/Iaas-001/vertical/ef0258c27490497686eda1191837ba63", "start": "2014-01-01T00:00:00Z", "released_to_students": true, "edited_on": "Aug 20, 2014 at 01:31 UTC", "visibility_state": "needs_attention", "published": false, "published_by": null, "course_graders": "[\"Homework\", \"Lab\", \"Midterm Exam\", \"Final Exam\"]", "release_date_from": "Section \"Section1\"", "edited_by": "staff", "id": "i4x://Cetc55/Iaas-001/vertical/ef0258c27490497686eda1191837ba63", "currently_visible_to_students": false}]}, "start": "2014-01-01T00:00:00Z", "released_to_students": true, "edited_on": "Aug 20, 2014 at 01:44 UTC", "visibility_state": "needs_attention", "published": true, "course_graders": "[\"Homework\", \"Lab\", \"Midterm Exam\", \"Final Exam\"]", "id": "i4x://Cetc55/Iaas-001/sequential/73d9ad89218a4cbd9351deecc2754f27"}, {"category": "chapter", "due_date": "", "published_on": null, "display_name": "Section1", "graded": false, "format": null, "release_date": "Jan 01, 2014 at 00:00 UTC", "due": null, "studio_url": "/course/Cetc55/Iaas-001/2014-01-01?show=i4x%3A//Cetc55/Iaas-001/chapter/153179c50dc0412ab165e03aaab49cb0", "start": "2014-01-01T00:00:00Z", "released_to_students": true, "edited_on": "Aug 20, 2014 at 01:44 UTC", "visibility_state": "live", "published": true, "course_graders": "[\"Homework\", \"Lab\", \"Midterm Exam\", \"Final Exam\"]", "id": "i4x://Cetc55/Iaas-001/chapter/153179c50dc0412ab165e03aaab49cb0"}, {"category": "course", "due_date": "", "published_on": null, "display_name": "IaaS", "graded": false, "format": null, "release_date": null, "due": null, "studio_url": "/course/Cetc55/Iaas-001/2014-01-01", "start": "2030-01-01T00:00:00Z", "released_to_students": false, "edited_on": "Aug 20, 2014 at 01:44 UTC", "visibility_state": null, "published": true, "course_graders": "[\"Homework\", \"Lab\", \"Midterm Exam\", \"Final Exam\"]", "id": "i4x://Cetc55/Iaas-001/course/2014-01-01"}]}, "id": "i4x://Cetc55/Iaas-001/vertical/aeeb4518311e496b8348d04b32cfe693", "currently_visible_to_students": false, "category": "vertical", "published_on": "Aug 20, 2014 at 01:21 UTC", "display_name": "\u5355\u5143", "release_date_from": "Section \"Section1\"", "due": null, "studio_url": "/container/i4x://Cetc55/Iaas-001/vertical/aeeb4518311e496b8348d04b32cfe693", "start": "2014-01-01T00:00:00Z", "edited_on": "Aug 20, 2014 at 01:44 UTC", "has_changes": true, "course_graders": "[\"Homework\", \"Lab\", \"Midterm Exam\", \"Final Exam\"]", "due_date": "", "edited_by": "staff", "format": null, "visibility_state": "staff_only", "released_to_students": true, "release_date": "Jan 01, 2014 at 00:00 UTC", "published_by": "staff", "published": true}, {parse: true});
                var isUnitPage = true

                xmoduleLoader.done(function () {
                    var view = new ContainerPage({
                        el: $('#content'),
                        model: mainXBlockInfo,
                        action: "view",
                        templates: templates,
                        isUnitPage: isUnitPage
                    });
                    view.render();
                });
            });
</script>


	<div class="modal-cover"></div>

	<style type="text/css">
@media print {
	#djDebug {
		display: none;
	}
}

.clearfix:after {
	content: ".";
	display: block;
	height: 0;
	clear: both;
	visibility: hidden;
}

.clearfix {
	display: inline-block;
} /* Hides from IE-mac \*/
.clearfix {
	display: block;
}

* html .clearfix {
	height: 1%;
} /* end hide from IE-mac */
#djDebug {
	color: #000;
	background: #FFF;
}

#djDebug,#djDebug div,#djDebug span,#djDebug applet,#djDebug object,#djDebug iframe,#djDebug h1,#djDebug h2,#djDebug h3,#djDebug h4,#djDebug h5,#djDebug h6,#djDebug p,#djDebug blockquote,#djDebug pre,#djDebug a,#djDebug abbr,#djDebug acronym,#djDebug address,#djDebug big,#djDebug cite,#djDebug code,#djDebug del,#djDebug dfn,#djDebug em,#djDebug font,#djDebug img,#djDebug ins,#djDebug kbd,#djDebug q,#djDebug s,#djDebug samp,#djDebug small,#djDebug strike,#djDebug strong,#djDebug sub,#djDebug sup,#djDebug tt,#djDebug var,#djDebug b,#djDebug u,#djDebug i,#djDebug center,#djDebug dl,#djDebug dt,#djDebug dd,#djDebug ol,#djDebug ul,#djDebug li,#djDebug fieldset,#djDebug form,#djDebug label,#djDebug legend,#djDebug table,#djDebug caption,#djDebug tbody,#djDebug tfoot,#djDebug thead,#djDebug tr,#djDebug th,#djDebug td
	{
	margin: 0;
	padding: 0;
	border: 0;
	outline: 0;
	font-size: 12px;
	line-height: 1.5em;
	color: #000;
	vertical-align: baseline;
	background: transparent;
	font-family: sans-serif;
	text-align: left;
}

#djDebug #djDebugToolbar {
	background: #111;
	width: 200px;
	z-index: 100000000;
	position: fixed;
	top: 0;
	bottom: 0;
	right: 0;
	opacity: .9;
}

#djDebug #djDebugToolbar small {
	color: #999;
}

#djDebug #djDebugToolbar ul {
	margin: 0;
	padding: 0;
	list-style: none;
}

#djDebug #djDebugToolbar li {
	border-bottom: 1px solid #222;
	color: #fff;
	display: block;
	font-weight: bold;
	float: none;
	margin: 0;
	padding: 0;
	position: relative;
	width: auto;
}

#djDebug #djDebugToolbar li>a,#djDebug #djDebugToolbar li>div.contentless
	{
	font-weight: normal;
	font-style: normal;
	text-decoration: none;
	display: block;
	font-size: 16px;
	padding: 10px 10px 5px 25px;
	color: #fff;
}

#djDebug #djDebugToolbar li a:hover {
	color: #111;
	background-color: #ffc;
}

#djDebug #djDebugToolbar li.active {
	background-image: url(../img/indicator.png);
	background-image:
		url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAgFJREFUeNqUlE1LAmEQx11fesNeDLt08hZ4KcgvIF7EgxcR9CT4IQwErx47WhFBdvPgwUNQeOiogiLRQSQUQaKD6Vpba7ar20izMe4+bjTwY5/Zl//OMzPPcCaTaRUwAxbTjynAdAHq84XGARuADQXN+MGEIJG1QmCaOZVK7WKUdmCdYMf7K/hDKwagwjRLPp9/cLvdzUKh8Ab+GgosExGz5hvFSJAbDAYKmFSpVM4DgUABX57l6wsYAR/AO64/MQUyyauiE1SdTqdTC4fDZ61W6x0FRUAAXvEqElGJCP5qzG3H5XIdFovFdCgUOgB3B3AC28AmyekSKSDH3LL2piRJcjabvU4kEnfg8sAL0Me1GulYE+ViQdWq1ep9NBrN9vv9J3B7KPyKOf3EtNAe1VVwzjwez36pVDoKBoMu3KpNs13dlg0FZ+ZwOJx+v3+PHATO6H2r0UOe54fJZPIil8vVSLtMjE7LQsFGo/EYiUSuut3uM/aimjPJSFQnCE0+hVNzE4/Hb1FoyOjBCasHdYKiKPLpdPo0k8k0GY1NKyvTyjIFe71eLRaLHZfLZYFx9AS8jhgR6gXb7faJ1+u9FATBglWU8cMxRjki0RmOMmu9Xo/4fL4y9pmVzEMZBcakGPJfw3YWzRY2rA19dWLLBMNCaAXXNHNPIVFO/zOtZ/YtwADKQgq0l7HbRAAAAABJRU5ErkJggg==);
	background-repeat: no-repeat;
	background-position: left center;
	background-color: #333;
	padding-left: 10px;
}

#djDebug #djDebugToolbar li.active a:hover {
	color: #b36a60;
	background-color: transparent;
}

#djDebug #djDebugToolbar li small {
	font-size: 12px;
	color: #999;
	font-style: normal;
	text-decoration: none;
	font-variant: small-caps;
}

#djDebug #djDebugToolbarHandle {
	position: fixed;
	background: #fff;
	border: 1px solid #111;
	top: 30px;
	right: 0;
	z-index: 100000000;
	opacity: .75;
}

#djDebug a#djShowToolBarButton {
	display: block;
	height: 75px;
	width: 30px;
	border-right: none;
	border-bottom: 4px solid #fff;
	border-top: 4px solid #fff;
	border-left: 4px solid #fff;
	color: #fff;
	font-size: 10px;
	font-weight: bold;
	text-decoration: none;
	text-align: center;
	text-indent: -999999px;
	background: #000 url(../img/djdt_vertical.png) no-repeat left center;
	background-image:
		url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAABLCAYAAAACnsWZAAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAAN1wAADdcBQiibeAAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoAAATCSURBVGiB7ZlvSBtnHMe/sckZY5aMw06r7aTLjGOwTKOMEWYs7M2EaaUdjG6+GDoQ9mIyupUxGIONwVZfDHwxg2E4igym24s5sFB0oDRq1yi1G0RijTjhjJBI86fR/LvbC+nFs7ncXR7jMsgXDp67e57vffI8v/s9z3NRAeBQxCr7rwGkVAIkVQmQVCVAUpUASVX0gGqxGxaLBTabDVqtFn6/H5OTk4jFYifJxovLdgwNDXGH1dDQkLVeoY+iH+KiBxSNwaOy2+0wmUyKzH0+H7xer2Koo5IVg/loZGSkuGOwtraW2KOggHt7e8QesmMwEomAZVlF5uvr64qBjko2YEtLC9bW1ogfqFRFn2b+v4CpVIovsyyrOP6OSyrksS8uKysDTdNQq9XY3d1FIpEoAFpGshJma2sr53A4OI/Hw7EsK0jIDMNw4+PjXFdXVyEWDLkr6PV6bmJiQvbs4XK5uJqampMBpCiKW1hYUDzF+Xw+zmAwFB5wcHBQMdxjDQ8PHwug6EtC0zS2trag0+kE16enp7G4uAiv14tUKgWz2Qyr1YrOzk6oVCq+XjweR11dHYLBYDZ7RcpK3tvbK+iRcDjMdXR0iP5Sm83GMQwjaNPX11e4IR4dHRU8bGBgQNKsp6dH0MbpdBYO0OVyCR5mNBolzTQaDZdOp/k2c3NzxICiMwlN03x5e3sboVBIrCqvZDIJhmH4c6PRKNlGSqKrGYqi+HJFRQX6+/tlGWq12qxlEmXt2pWVlbxTzGMtLS0VbogjkQjxLw+Hw8QeooA7OzvE5n6/n9hDNAbdbrfibeZRLS8vE7UH8lxunaSKfkUte9MEAAa6EhrqVNZ7HAc8DETBpo935a1oiJ1zH6O5rUH0fmI/iQ2PH1Nji/jpuxlwHHn0KOpBKVFaDRqbz6Gx+RysdjOudn9P7FmwGGy/+DLa3rQQ++QNmEykEA3t8UcsGn+izhvvvEIEBxAM8c2xO/iy74bgWu35KjhmPkLt+SoAwFnTaTI6HPMQMxsBLM1mvgdqdVSO2vKkqAdvXL+FuzOrYFkOd/9YzVqHfsbAlze95NNlnht3FQx0JU6pyxDejSGZyHyFOGs6DWu7GVVnjLh3+wGWZ8m+sMoGfLG1Ht3vvwZruxn1jdWCDVJgO4R7tx9gauwO5iZXiIAUA+r05fhi9D28/pZVluH9+XV8ctmBoJ98qQVIAGooNUZmr+KlV59TZMpsBHCl6Ss8Cu+T8uV+iz/4+qJiOOAg3Xz47eW8oQ5LtAcNdCWmtr55IlX8Oe3BX4sb2PTuIJ1Ko95cjResz6Kt0yKIy0Q8hY66awgFHxEBiqaZC91NArhYZB+fvu3E/M2/s9a32Ey4/ks/qs4c7OSocjUudDfhtx9cRICiQ9zc9rzgfPjzSVE44ODlGLr2q+BaPuFxVKKA9eZqwfnvP85Lmt362Q2WzURMfWN1jtryJApooCv5cmA7hGhI+j+PVDKNAPOQP9cbKwjxcsSghsrcKq/Q4FK/XZYhpdVk2h0q5ytRwFg0k8OeelqHzxzvKjbPtgRTKtEhjkXIzQuaqIM75FNV0C/9wUlKokPscW8SLzhXl/8hag+UNu7kKgGSqgRIqhIgqUqApCp6wH8B9cAOKo9Os8wAAAAASUVORK5CYII=);
	opacity: .5;
}

#djDebug a#djShowToolBarButton:hover {
	background-color: #111;
	padding-right: 6px;
	border-top-color: #FFE761;
	border-left-color: #FFE761;
	border-bottom-color: #FFE761;
	opacity: 1.0;
}

#djDebug code {
	display: block;
	font-family: Consolas, Monaco, "Bitstream Vera Sans Mono",
		"Lucida Console", monospace;
	white-space: pre;
	overflow: auto;
}

#djDebug tr.djDebugOdd {
	background-color: #f5f5f5;
}

#djDebug .panelContent {
	display: none;
	position: fixed;
	margin: 0;
	top: 0;
	right: 200px;
	bottom: 0;
	left: 0;
	background-color: #eee;
	color: #666;
	z-index: 100000000;
}

#djDebug .panelContent>div {
	border-bottom: 1px solid #ddd;
}

#djDebug .djDebugPanelTitle {
	position: absolute;
	background-color: #ffc;
	color: #666;
	padding-left: 20px;
	top: 0;
	right: 0;
	left: 0;
	height: 50px;
}

#djDebug .djDebugPanelTitle code {
	display: inline;
	font-size: inherit;
}

#djDebug .djDebugPanelContent {
	position: absolute;
	top: 50px;
	right: 0;
	bottom: 0;
	left: 0;
	height: auto;
	padding: 5px 0 0 20px;
}

#djDebug .djDebugPanelContent .scroll {
	height: 100%;
	overflow: auto;
	display: block;
	padding: 0 10px 0 0;
}

#djDebug h3 {
	font-size: 24px;
	font-weight: normal;
	line-height: 50px;
}

#djDebug h4 {
	font-size: 20px;
	font-weight: bold;
	margin-top: .8em;
}

#djDebug .panelContent table {
	border: 1px solid #ccc;
	border-collapse: collapse;
	width: 100%;
	background-color: #fff;
	display: block;
	margin-top: .8em;
	overflow: auto;
}

#djDebug .panelContent tbody td,#djDebug .panelContent tbody th {
	vertical-align: top;
	padding: 2px 3px;
}

#djDebug .panelContent thead th {
	padding: 1px 6px 1px 3px;
	text-align: left;
	font-weight: bold;
	font-size: 14px;
}

#djDebug .panelContent tbody th {
	width: 12em;
	text-align: right;
	color: #666;
	padding-right: .5em;
}

#djDebug .djTemplateHideContextDiv {
	background-color: #fff;
}

#djDebug .panelContent .djDebugClose {
	text-indent: -9999999px;
	display: block;
	position: absolute;
	top: 4px;
	right: 15px;
	height: 40px;
	width: 40px;
	background: url(../img/close.png) no-repeat center center;
	background-image:
		url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACIAAAAiCAYAAAA6RwvCAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA7dJREFUeNqsWM1PE0EU3+7ShdJKoTRA8UYgIUKM3rmaEI0euXsw0YMHIZEbxBijEiIHLkb/A44SDYlXzkYPGBM+ri1NWz7aUmhp6+9tps10mLfdfrzkl2535r39zc77mvUdHh4abUoUCAD3xP/fQAFItWJkYmLC+e1p8eGPgQcC08ycf8BPgW2vhr0SeQa8AWIe5k4LvATiwCrwtZmS2WT8IfAL+OKRhCoxoftH2GqLyBLwHbhvdC53ha2lVrfmE/DKzbLP5yubplnt7e310f+rq6tqpVLxVatVy0VtHbgNLHohsupGIhQKFQG7v79f+8CLiwsjl8sVAZsxQbYTwFrDwpTwpaj4ptPu6+vLDw4OBkHA014QobOzs3yhUAgyUx4BP2rhq/rIe53GwMBAeXx83DMJEpobi8WCpMtMWeOc9TkwoyMRjUattrMedBkyM+KZN4isqDMDgUCuExIyGbKlGVpRiSzo8kQ4HA4ZXRLGVuzo6GhBJjKviw6dT5TLZSOTyRinp6cGQrV+n67hnEY6nTaur6+1PkM2NWTm5fCd0xDRhh89CKHpXCMijLGxMef6+PjYiRSSUqlUv6/arOlKMlcjQlV0qsGDTZPehpYIxurXRCSRSFByq5NQ56hvhWwj8cm2p7A9UdKYVBX8fn+F2+tIJGIgmzaQkUnYtm0MDw+zvsLYniQiEc2q/WxxwmqRHxrISA9xxiyLDzTGdsRsJwJoK3QPo3vctnhpAzLqTexhiVOg6JAdU5bLy0vHZ+Ro8mg7Q0QO1LvwenZZJycnN3yCIPsMRRYnjO0DU/SY+wprW7fiWmjKJMgnUIcafEaeoxZCJWJI9lH4UjV2u6pSPp/XJR9jaGiIKrERDAbrjllzYOQJZ4zm6ISxuSsntB3gqTyazWZtMowa0aBFb4HegC6aRkZG2C2hLSObmqEdOcVvUdJUZyBlZ7tVa1ASdEUvjW3ZUqvvO82e3kqlUuVOSZANvBFd0fugawM2VKclOT8/tzohQ7pkgzn/rHNdvLbLJkPxeDzHRRIXIaTDkCB57XacoJPZW8bZQpSskslk0Y0QjdEcmstsB8myegrsYbqmENfJU3dOpZyOEwjdCqLIWUyxWKygVzHFccJ2eVkbar/qdq5ZFC3/R5dUb6EBsqQmyEtLuawj0eykRwpPgL0uRO+esLXW7tmX9nEWeAEk2yCQFLqzzb4MeK3Zn4FRsapNEXqGy2eJTTF3VOh27bOE/Ia2pQ81YeCO+P+XknGrH2pq8l+AAQDv/n2Gmq99BgAAAABJRU5ErkJggg==);
}

#djDebug .panelContent .djDebugClose:hover {
	background-image: url(../img/close_hover.png);
	background-image:
		url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACIAAAAiCAYAAAA6RwvCAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAABCVJREFUeNqsWG1IU1EYfjfd0i1bTc2WFTW3tG2aFWlEf4KkMIrCvhH6U9DnjxTyV0ZEXxIVGBH1JyKIPiBK8kf1syCKwu8M3VQsK7OV6ba2udZ7bmd6d+85827zhYftnnPe5z73nvc95z1X5XQ6IUHLQqQjiul1E8KHGIqHxGw2C7+pcd58E6KMooAzphPxnKJBKbFSIfsRpxAmBWMLKI4iviBOIm5O5qSepL8c8R5xQ6EIqZmobzPlSkhINeIpYhkkb0WUqzreqbmEOBaTOjQGf/0+CHz7Klxqc+aAehrGbkrM2b6IyEVUKRFyMpYI38dW8HS0gc/5kdmfnpcPepsD0vMLeRSEm6ivEzeqJOlLsuIJyzs40Au/Xr+CP64uRXORZraCoXQ1aHMX8YZsRDRG0lcqpA1hl3p4mt+C+/nThILDWLYR9EtXsrraEY6IEHGwHmCJGG16k7AIYsTX0/KO1WWn95QJqZWODHxyws8XjUmnjPtZg8DFsFqpkB2sdWL4zWuYKuNwmVwu1w6xkA2s7GAFpnaGAcxbd8H8snJQa7QTUZ+aCrlr10NexR5Iy8yW+REuwsmwDeL0XSOLjfYW5pNZtldC9orS/4FoK4LWa5cgHP4L9n1HILNoudCuM82F1qsXgcXJSOs1ESFkF7WKe8JBfxifQMVMY8/o+P+Z+TYoPFwNoYAfMh3FE2udz8d8CPJWCLdKM03MbcXpySJTY5EtmsNuFW+uex4/gJFe14SYxUuiRHi/fIaue7f5CzKb20KEGKWtYx4Pl2jM54WW+joY6euR9Xm/DkDT5bMQHB3h+7O5jepEMiAUDDBvRtpCfn9CWUWEuGUbkF7PdSDZQQLTaC+S9Rks+VB4qCoqmxRyu4mQbmlrisEY5hEtLN8ynh2RmBjt74sK4LyK3VwhHO5uNa0xoxYMEtVk02KZbk7uxB400C/ERPOVc1EBrMsxcTdCScYQ68L9ZiiyjryUprC+wM5c0PoaH4EmIwMCv4eh6+6t8VghAWzdtVdYzHoaHjKFEE6GvRTvvmSZvScd8f3hHfjT2z0lS3zaQgtkb6tkde3EN3I/kjX3ET9kwVdSOmV7jaF0Fav5BxEh3X3PyPaVBVaYta48aRGkJtHOt7C6zrPKgMvSoCU2vbhEIEpGBKcw6qQ1LLNmrWaVioRIk2kUtvK4SsWSVaCdl8cbcjxW8UxOZqcRJ2TThITZCO+HZvB2dsQsnnUFNtAtWRpLZ430FKjinH0VHSdCXg8EhwaFS03WbEjR6Sc7TkRCoErp2beKlvwX+EtkKqRkGATEYTXSY4SSkx5x2Eyr7WStnXLVJXr2JfPoQBxEDCYgYJD6Oib7MqC0DLiOyKFPVU9TD2J8lqinY3Oo75R9lhC/oQbRhxoSIDZ63UGK9Xg/1ETsnwADAJrrTk7nZiozAAAAAElFTkSuQmCC);
}

#djDebug .panelContent .djDebugClose.djDebugBack {
	background-image: url(../img/back.png);
	background-image:
		url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACIAAAAiCAYAAAA6RwvCAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA7FJREFUeNrMWM1PE0EU3+7S7bZdKSFNSIFgJJAgINE7VxOi0SP/gYkePAiJ3CDGGJUQOXAx+h9wlGhIvHI2fgQ08mEkkjZNIZR2+7Httr63zMoyOzPdthx8yS+bnZn3m9/OvDcfG9jd3ZVatDggDLhO3j8DioBMMySDg4P2s6PJzu8AbhKMcNr8AHwkWPNL7FfIPcATQMJH2xGCh4AkYAHwtpGT3KD+FuAT4I1PEbQliO8XwtWSkFnAe8ANqX2bIFyzzU7NK8AjEXMgELBkWa6HQqEAvpfL5XqtVgvU63VF4LYE6APM+BGyIBKh67oJUCORCLPDQqEg5fN5E6ByKJA7BVg892FU+mJWvGN5a5pmdHV1RUGAr7lAQdls1igWi1FOk9uAD0760jHynOXR2dlp9fb2+haBhm0TiUQUfTlNFnnBeh8wxhIRj8eVllc98OWIGSN9eoTM0y3D4XC+HRFuMcjFqJqnhUyz1olYLKa730uVCrMjXrmIy1ln9vb2pt1CpljZQcdE1ihIW/sHHrayWbHLq1ZNGDPIyaiacguZZAhhph+K+fpr39Ppqcg/wtHhcE46QnAXHT4XwbJssjJECwbtp1EqS99AjNNpSD0r//77wH7yRgW5qeJhmJ44ChmiHYLBIHOMY9GINDrQ9y8uHDEoEMs7FNl+x5HhieFwD6GQbs8GJMtBbtCBmIkrA3anOD0YH2ci+21RWJ4vldibG5u7W5b+E8O95oguhM0LP1PhBauTOfj1Tnxg+c+DpD0aOFq6pjE75HAfoZAdunGlUpH9iLh6uc9+nsaFt5xlHO4dmZwxtynVKm5avIUrqoWkaxAnTmdOnGC5SARyIjdVvA0bX8ZRt0E7GYZhNgpWb0b1c0UIODfcC9o6XZvL5VTYwrnp6zaMEyd9eYZcyMmoWncLWQUcemIim82xFjTeQiey4+Nj1qZ3CNOySu++zxhzeimTyVjtpiZywIiwNr0XrGPAMh20aCcnJ0o7YtAXOTj3nyXeKZ55ykaiZDKZZ2WS6KiIPhwRaI9F1wm8mT3lBJueSqWkdDptigRhHbbBtpzpQJujb4EdnFOTzjvJ4+kcYF8nFEWpqapqf4xpmjXLsmRynVAFg7VMn1dF95oZcuR/yWPDDqvVKsIp8nOknGOJaHTTQ4e7gM0L2NM2Cddiq3dfnMdxwANAugUBaeI73ujPgN9jwGtAD/mqFZJ6kuC3xApp20N8L+y3hHuE1lw/amKAUfK+hYtxsz9qHPsrwACHs5P9Qys/0AAAAABJRU5ErkJggg==);
}

#djDebug .panelContent .djDebugClose.djDebugBack:hover {
	background-image: url(../img/back_hover.png);
	background-image:
		url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACIAAAAiCAYAAAA6RwvCAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA6hJREFUeNrMWF1Ik1EYPtt0pkuGa/aDJTY3nNvSfkglvEwQpa7CbrosKAghBedNikKgEgVe1m03SVeJXmSXBmIozpxpuiUS/eicSc75m73vx/nGt7Nzvm8/BR14+Pjec85znp297znv++kCgQBJs1kBuYDz9H0KEAWEUiGx2WzSMyvFxa8B6iicgjFzgBGKwWSJdUnuyB1AF+BUisK/AToBz7V2RK9B1ACYBDxLQwShc3Cuj3IJm5qQVsAQ4ALJvFVQrlbRAJGPPAE8UKU+2Ce/d6Jk98d36dV44iTR54DvGlTd7jGgCNCSjJBONRHR+Q8kMjtDooF5bn9uaRkxuTwkt+yciAK5UX2fmrNiVLzmzd77ukR+jr0j28GFpP6LIzYHMVdfIcais6IhjYBh2VlZITMANzsj4ntPwiNDaTmHpa6RmCov87r8AA8vau7yRGxOjactAhvOjUxP8LrcdM0EIR3syN0vAbL+djjjkAm/GZS4OK2DFdLEOyc2xsfi/3frcb4/COxqXPI5EwwGm5RC6nnRwTpmgdNNKpq9iZFiLZTsWXkmoRDkQk5Oq1cKqU3wDf80lxDFXGzvTlhUFqm2OwLOWlkI3qIOZc/h3s4hL0y3QyvSM7+4hFxq74otGg2txuyVzW3SU7QryM2YHfD3WFGIPeHQ3AjreETrc34y3d8b8wtZDApE+/5WRHrHnRGJEXDbUYiFte5HIsLtRTGTPR3Sovj3oH8oRaIotB8t5h9kAm6LnvwnDe+acILRJPZ+ZeTgr5f9A+2u2/el3cDd2lz+zF+Qzx1GIYus1WC2oEPptET4+vukp+wXrJ3XBNyLeppjxoWILjtHh5eW6OD6tbxEJno6Y4vJfoJ2NRHIidyMeQHum5DsI6PsJJPTremsvIgSiVDhHFXevnjMvmRHrL56QbaXFuN2hLeQyB43psROCm/c4nXdhB0ZkHdkALDGjjBXVXMPNNFBp9bM1TU88xqKYG/fR+woY7GDFFxtyDg0MScxnrHzunpEGdon9rj/h4kR1j/logKrlZcqIlH2MYt0laeUKlbVEOPpUtGQNq0CqxvwUDR766OPbM3NqibPeU4XySuvVNPplZNnUc6aUjlxACG8Rx01GyLHgKmBQbOKfaosJ7Rq3xaa8vcK6WBBQ75ZQgrNy5YRyVR6OOE6zbYzbX7K1ZdOyUloNe8B3AOspCFghc71aH0Z0KX4feSvf5bQctZkP9Sgg7jo+ywm6+l+qPkjwADNS26fFM/O1QAAAABJRU5ErkJggg==);
}

#djDebug .panelContent dt,#djDebug .panelContent dd {
	display: block;
}

#djDebug .panelContent dt {
	margin-top: .75em;
}

#djDebug .panelContent dd {
	margin-left: 10px;
}

#djDebug a.toggleTemplate {
	padding: 4px;
	background-color: #bbb;
	-moz-border-radius: 3px;
	-webkit-border-radius: 3px;
}

#djDebug a.toggleTemplate:hover {
	padding: 4px;
	background-color: #444;
	color: #ffe761;
	-moz-border-radius: 3px;
	-webkit-border-radius: 3px;
}

#djDebug a.djTemplateShowContext,#djDebug a.djTemplateShowContext span.toggleArrow
	{
	color: #999;
}

#djDebug a.djTemplateShowContext:hover,#djDebug a.djTemplateShowContext:hover span.toggleArrow
	{
	color: #000;
	cursor: pointer;
}

#djDebug .djDebugSqlWrap {
	position: relative;
}

#djDebug .djDebugCollapsed {
	display: none;
	text-decoration: none;
	color: #333;
}

#djDebug .djDebugUncollapsed {
	color: #333;
	text-decoration: none;
}

#djDebug .djUnselected {
	display: none;
}

#djDebug tr.djHiddenByDefault {
	display: none;
}

#djDebug tr.djSelected {
	display: table-row;
}

#djDebug .djDebugSql {
	z-index: 100000002;
}

#djDebug .djSQLDetailsDiv tbody th {
	text-align: left;
}

#djDebug .djSqlExplain td {
	white-space: pre;
}

#djDebug span.djDebugLineChart {
	background-color: #777;
	height: 3px;
	position: absolute;
	bottom: 0;
	top: 0;
	left: 0;
	display: block;
	z-index: 1000000001;
}

#djDebug span.djDebugLineChartWarning {
	background-color: #900;
}

#djDebug .highlight {
	color: #000;
}

#djDebug .highlight .err {
	color: #000;
}

#djDebug .highlight .g {
	color: #000;
}

#djDebug .highlight .k {
	color: #000;
	font-weight: bold;
}

#djDebug .highlight .o {
	color: #000;
}

#djDebug .highlight .n {
	color: #000;
}

#djDebug .highlight .mi {
	color: #000;
	font-weight: bold;
}

#djDebug .highlight .l {
	color: #000;
}

#djDebug .highlight .x {
	color: #000;
}

#djDebug .highlight .p {
	color: #000;
}

#djDebug .highlight .m {
	color: #000;
	font-weight: bold;
}

#djDebug .highlight .s {
	color: #333;
}

#djDebug .highlight .w {
	color: #888;
}

#djDebug .highlight .il {
	color: #000;
	font-weight: bold;
}

#djDebug .highlight .na {
	color: #333;
}

#djDebug .highlight .nt {
	color: #000;
	font-weight: bold;
}

#djDebug .highlight .nv {
	color: #333;
}

#djDebug .highlight .s2 {
	color: #333;
}

#djDebug .highlight .cp {
	color: #333;
}

#djDebug .timeline {
	width: 30%;
}

#djDebug .djDebugTimeline {
	position: relative;
	height: 100%;
	min-height: 100%;
}

#djDebug div.djDebugLineChart {
	position: absolute;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	vertical-align: middle;
}

#djDebug div.djDebugLineChart strong {
	text-indent: -10000em;
	display: block;
	font-weight: normal;
	vertical-align: middle;
	background-color: #ccc;
}

#djDebug div.djDebugLineChartWarning strong {
	background-color: #900;
}

#djDebug .djDebugInTransaction div.djDebugLineChart strong {
	background-color: #d3ff82;
}

#djDebug .djDebugStartTransaction div.djDebugLineChart strong {
	border-left: 1px solid #94b24d;
}

#djDebug .djDebugEndTransaction div.djDebugLineChart strong {
	border-right: 1px solid #94b24d;
}

#djDebug .djDebugHover div.djDebugLineChart strong {
	background-color: #000;
}

#djDebug .djDebugInTransaction.djDebugHover div.djDebugLineChart strong
	{
	background-color: #94b24d;
}

#djDebug .panelContent ul.stats {
	position: relative;
}

#djDebug .panelContent ul.stats li {
	width: 30%;
	float: left;
}

#djDebug .panelContent ul.stats li strong.label {
	display: block;
}

#djDebug .panelContent ul.stats li span.color {
	height: 12px;
	width: 3px;
	display: inline-block;
}

#djDebug .panelContent ul.stats li span.info {
	display: block;
	padding-left: 5px;
}

#djDebug .panelcontent thead th {
	white-space: nowrap;
}

#djDebug .djDebugRowWarning .time {
	color: red;
}

#djdebug .panelcontent table .toggle {
	width: 14px;
	padding-top: 3px;
}

#djdebug .panelcontent table .actions {
	min-width: 70px;
}

#djdebug .panelcontent table .color {
	width: 3px;
}

#djdebug .panelcontent table .color span {
	width: 3px;
	height: 12px;
	overflow: hidden;
	padding: 0;
}

#djDebug .djToggleSwitch {
	text-decoration: none;
	border: 1px solid #999;
	height: 12px;
	width: 12px;
	line-height: 12px;
	text-align: center;
	color: #777;
	display: inline-block;
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#FFF',
		endColorstr='#DCDCDC' );
	background: -webkit-gradient(linear, left top, left bottom, from(#FFF),
		to(#DCDCDC) );
	background: -moz-linear-gradient(center top, #FFF 0, #DCDCDC 100%)
		repeat scroll 0 0 transparent;
}

#djDebug .djNoToggleSwitch {
	height: 14px;
	width: 14px;
	display: inline-block;
}

#djDebug .djSQLDetailsDiv {
	margin-top: .8em;
}

#djDebug pre {
	white-space: pre-wrap;
	white-space: -moz-pre-wrap;
	white-space: -pre-wrap;
	white-space: -o-pre-wrap;
	word-wrap: break-word;
	color: #555;
	border: 1px solid #ccc;
	border-collapse: collapse;
	background-color: #fff;
	display: block;
	overflow: auto;
	padding: 2px 3px;
	margin-bottom: 3px;
	font-family: Consolas, Monaco, "Bitstream Vera Sans Mono",
		"Lucida Console", monospace;
}

#djDebug .stack span {
	color: #000;
	font-weight: bold;
}

#djDebug .stack span.path {
	color: #777;
	font-weight: normal;
}

#djDebug .stack span.code {
	font-weight: normal;
}

@media print {
	#djDebug {
		display: none;
	}
}
</style>
	<script type="text/javascript">/*
 * jQuery JavaScript Library v1.4.1
 * http://jquery.com/
 *
 * Copyright 2010, John Resig
 * Dual licensed under the MIT or GPL Version 2 licenses.
 * http://jquery.org/license
 *
 * Includes Sizzle.js
 * http://sizzlejs.com/
 * Copyright 2010, The Dojo Foundation
 * Released under the MIT, BSD, and GPL Licenses.
 *
 * Date: Mon Jan 25 19:43:33 2010 -0500
 */
(function(aI,B){var a=function(aU,aV){return new a.fn.init(aU,aV)},n=aI.jQuery,Q=aI.$,aa=aI.document,W,O=/^[^<]*(<[\w\W]+>)[^>]*$|^#([\w-]+)$/,aS=/^.[^:#\[\.,]*$/,au=/\S/,L=/^(\s|\u00A0)+|(\s|\u00A0)+$/g,e=/^<(\w+)\s*\/?>(?:<\/\1>)?$/,b=navigator.userAgent,u,I=false,ac=[],aC,aq=Object.prototype.toString,an=Object.prototype.hasOwnProperty,g=Array.prototype.push,D=Array.prototype.slice,s=Array.prototype.indexOf;a.fn=a.prototype={init:function(aU,aX){var aW,aY,aV,aZ;if(!aU){return this}if(aU.nodeType){this.context=this[0]=aU;this.length=1;return this}if(typeof aU==="string"){aW=O.exec(aU);if(aW&&(aW[1]||!aX)){if(aW[1]){aZ=(aX?aX.ownerDocument||aX:aa);aV=e.exec(aU);if(aV){if(a.isPlainObject(aX)){aU=[aa.createElement(aV[1])];a.fn.attr.call(aU,aX,true)}else{aU=[aZ.createElement(aV[1])]}}else{aV=H([aW[1]],[aZ]);aU=(aV.cacheable?aV.fragment.cloneNode(true):aV.fragment).childNodes}}else{aY=aa.getElementById(aW[2]);if(aY){if(aY.id!==aW[2]){return W.find(aU)}this.length=1;this[0]=aY}this.context=aa;this.selector=aU;return this}}else{if(!aX&&/^\w+$/.test(aU)){this.selector=aU;this.context=aa;aU=aa.getElementsByTagName(aU)}else{if(!aX||aX.jquery){return(aX||W).find(aU)}else{return a(aX).find(aU)}}}}else{if(a.isFunction(aU)){return W.ready(aU)}}if(aU.selector!==B){this.selector=aU.selector;this.context=aU.context}return a.isArray(aU)?this.setArray(aU):a.makeArray(aU,this)},selector:"",jquery:"1.4.1",length:0,size:function(){return this.length},toArray:function(){return D.call(this,0)},get:function(aU){return aU==null?this.toArray():(aU<0?this.slice(aU)[0]:this[aU])},pushStack:function(aV,aX,aU){var aW=a(aV||null);aW.prevObject=this;aW.context=this.context;if(aX==="find"){aW.selector=this.selector+(this.selector?" ":"")+aU}else{if(aX){aW.selector=this.selector+"."+aX+"("+aU+")"}}return aW},setArray:function(aU){this.length=0;g.apply(this,aU);return this},each:function(aV,aU){return a.each(this,aV,aU)},ready:function(aU){a.bindReady();if(a.isReady){aU.call(aa,a)}else{if(ac){ac.push(aU)}}return this},eq:function(aU){return aU===-1?this.slice(aU):this.slice(aU,+aU+1)},first:function(){return this.eq(0)},last:function(){return this.eq(-1)},slice:function(){return this.pushStack(D.apply(this,arguments),"slice",D.call(arguments).join(","))},map:function(aU){return this.pushStack(a.map(this,function(aW,aV){return aU.call(aW,aV,aW)}))},end:function(){return this.prevObject||a(null)},push:g,sort:[].sort,splice:[].splice};a.fn.init.prototype=a.fn;a.extend=a.fn.extend=function(){var aZ=arguments[0]||{},aY=1,aX=arguments.length,a1=false,a2,aW,aU,aV;if(typeof aZ==="boolean"){a1=aZ;aZ=arguments[1]||{};aY=2}if(typeof aZ!=="object"&&!a.isFunction(aZ)){aZ={}}if(aX===aY){aZ=this;--aY}for(;aY<aX;aY++){if((a2=arguments[aY])!=null){for(aW in a2){aU=aZ[aW];aV=a2[aW];if(aZ===aV){continue}if(a1&&aV&&(a.isPlainObject(aV)||a.isArray(aV))){var a0=aU&&(a.isPlainObject(aU)||a.isArray(aU))?aU:a.isArray(aV)?[]:{};aZ[aW]=a.extend(a1,a0,aV)}else{if(aV!==B){aZ[aW]=aV}}}}}return aZ};a.extend({noConflict:function(aU){aI.$=Q;if(aU){aI.jQuery=n}return a},isReady:false,ready:function(){if(!a.isReady){if(!aa.body){return setTimeout(a.ready,13)}a.isReady=true;if(ac){var aV,aU=0;while((aV=ac[aU++])){aV.call(aa,a)}ac=null}if(a.fn.triggerHandler){a(aa).triggerHandler("ready")}}},bindReady:function(){if(I){return}I=true;if(aa.readyState==="complete"){return a.ready()}if(aa.addEventListener){aa.addEventListener("DOMContentLoaded",aC,false);aI.addEventListener("load",a.ready,false)}else{if(aa.attachEvent){aa.attachEvent("onreadystatechange",aC);aI.attachEvent("onload",a.ready);var aU=false;try{aU=aI.frameElement==null}catch(aV){}if(aa.documentElement.doScroll&&aU){w()}}}},isFunction:function(aU){return aq.call(aU)==="[object Function]"},isArray:function(aU){return aq.call(aU)==="[object Array]"},isPlainObject:function(aV){if(!aV||aq.call(aV)!=="[object Object]"||aV.nodeType||aV.setInterval){return false}if(aV.constructor&&!an.call(aV,"constructor")&&!an.call(aV.constructor.prototype,"isPrototypeOf")){return false}var aU;for(aU in aV){}return aU===B||an.call(aV,aU)},isEmptyObject:function(aV){for(var aU in aV){return false}return true},error:function(aU){throw aU},parseJSON:function(aU){if(typeof aU!=="string"||!aU){return null}if(/^[\],:{}\s]*$/.test(aU.replace(/\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g,"@").replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g,"]").replace(/(?:^|:|,)(?:\s*\[)+/g,""))){return aI.JSON&&aI.JSON.parse?aI.JSON.parse(aU):(new Function("return "+aU))()}else{a.error("Invalid JSON: "+aU)}},noop:function(){},globalEval:function(aW){if(aW&&au.test(aW)){var aV=aa.getElementsByTagName("head")[0]||aa.documentElement,aU=aa.createElement("script");aU.type="text/javascript";if(a.support.scriptEval){aU.appendChild(aa.createTextNode(aW))}else{aU.text=aW}aV.insertBefore(aU,aV.firstChild);aV.removeChild(aU)}},nodeName:function(aV,aU){return aV.nodeName&&aV.nodeName.toUpperCase()===aU.toUpperCase()},each:function(aX,a1,aW){var aV,aY=0,aZ=aX.length,aU=aZ===B||a.isFunction(aX);if(aW){if(aU){for(aV in aX){if(a1.apply(aX[aV],aW)===false){break}}}else{for(;aY<aZ;){if(a1.apply(aX[aY++],aW)===false){break}}}}else{if(aU){for(aV in aX){if(a1.call(aX[aV],aV,aX[aV])===false){break}}}else{for(var a0=aX[0];aY<aZ&&a1.call(a0,aY,a0)!==false;a0=aX[++aY]){}}}return aX},trim:function(aU){return(aU||"").replace(L,"")},makeArray:function(aW,aV){var aU=aV||[];if(aW!=null){if(aW.length==null||typeof aW==="string"||a.isFunction(aW)||(typeof aW!=="function"&&aW.setInterval)){g.call(aU,aW)}else{a.merge(aU,aW)}}return aU},inArray:function(aW,aX){if(aX.indexOf){return aX.indexOf(aW)}for(var aU=0,aV=aX.length;aU<aV;aU++){if(aX[aU]===aW){return aU}}return -1},merge:function(aY,aW){var aX=aY.length,aV=0;if(typeof aW.length==="number"){for(var aU=aW.length;aV<aU;aV++){aY[aX++]=aW[aV]}}else{while(aW[aV]!==B){aY[aX++]=aW[aV++]}}aY.length=aX;return aY},grep:function(aV,aZ,aU){var aW=[];for(var aX=0,aY=aV.length;aX<aY;aX++){if(!aU!==!aZ(aV[aX],aX)){aW.push(aV[aX])}}return aW},map:function(aV,a0,aU){var aW=[],aZ;for(var aX=0,aY=aV.length;aX<aY;aX++){aZ=a0(aV[aX],aX,aU);if(aZ!=null){aW[aW.length]=aZ}}return aW.concat.apply([],aW)},guid:1,proxy:function(aW,aV,aU){if(arguments.length===2){if(typeof aV==="string"){aU=aW;aW=aU[aV];aV=B}else{if(aV&&!a.isFunction(aV)){aU=aV;aV=B}}}if(!aV&&aW){aV=function(){return aW.apply(aU||this,arguments)}}if(aW){aV.guid=aW.guid=aW.guid||aV.guid||a.guid++}return aV},uaMatch:function(aV){aV=aV.toLowerCase();var aU=/(webkit)[ \/]([\w.]+)/.exec(aV)||/(opera)(?:.*version)?[ \/]([\w.]+)/.exec(aV)||/(msie) ([\w.]+)/.exec(aV)||!/compatible/.test(aV)&&/(mozilla)(?:.*? rv:([\w.]+))?/.exec(aV)||[];return{browser:aU[1]||"",version:aU[2]||"0"}},browser:{}});u=a.uaMatch(b);if(u.browser){a.browser[u.browser]=true;a.browser.version=u.version}if(a.browser.webkit){a.browser.safari=true}if(s){a.inArray=function(aU,aV){return s.call(aV,aU)}}W=a(aa);if(aa.addEventListener){aC=function(){aa.removeEventListener("DOMContentLoaded",aC,false);a.ready()}}else{if(aa.attachEvent){aC=function(){if(aa.readyState==="complete"){aa.detachEvent("onreadystatechange",aC);a.ready()}}}}function w(){if(a.isReady){return}try{aa.documentElement.doScroll("left")}catch(aU){setTimeout(w,1);return}a.ready()}function aR(aU,aV){if(aV.src){a.ajax({url:aV.src,async:false,dataType:"script"})}else{a.globalEval(aV.text||aV.textContent||aV.innerHTML||"")}if(aV.parentNode){aV.parentNode.removeChild(aV)}}function al(aU,a2,a0,aW,aZ,a1){var aV=aU.length;if(typeof a2==="object"){for(var aX in a2){al(aU,aX,a2[aX],aW,aZ,a0)}return aU}if(a0!==B){aW=!a1&&aW&&a.isFunction(a0);for(var aY=0;aY<aV;aY++){aZ(aU[aY],a2,aW?a0.call(aU[aY],aY,aZ(aU[aY],a2)):a0,a1)}return aU}return aV?aZ(aU[0],a2):null}function aL(){return(new Date).getTime()}(function(){a.support={};var a0=aa.documentElement,aZ=aa.createElement("script"),aU=aa.createElement("div"),aV="script"+aL();aU.style.display="none";aU.innerHTML="   <link/><table></table><a href='/a' style='color:red;float:left;opacity:.55;'>a</a><input type='checkbox'/>";var a2=aU.getElementsByTagName("*"),a1=aU.getElementsByTagName("a")[0];if(!a2||!a2.length||!a1){return}a.support={leadingWhitespace:aU.firstChild.nodeType===3,tbody:!aU.getElementsByTagName("tbody").length,htmlSerialize:!!aU.getElementsByTagName("link").length,style:/red/.test(a1.getAttribute("style")),hrefNormalized:a1.getAttribute("href")==="/a",opacity:/^0.55$/.test(a1.style.opacity),cssFloat:!!a1.style.cssFloat,checkOn:aU.getElementsByTagName("input")[0].value==="on",optSelected:aa.createElement("select").appendChild(aa.createElement("option")).selected,checkClone:false,scriptEval:false,noCloneEvent:true,boxModel:null};aZ.type="text/javascript";try{aZ.appendChild(aa.createTextNode("window."+aV+"=1;"))}catch(aX){}a0.insertBefore(aZ,a0.firstChild);if(aI[aV]){a.support.scriptEval=true;delete aI[aV]}a0.removeChild(aZ);if(aU.attachEvent&&aU.fireEvent){aU.attachEvent("onclick",function a3(){a.support.noCloneEvent=false;aU.detachEvent("onclick",a3)});aU.cloneNode(true).fireEvent("onclick")}aU=aa.createElement("div");aU.innerHTML="<input type='radio' name='radiotest' checked='checked'/>";var aW=aa.createDocumentFragment();aW.appendChild(aU.firstChild);a.support.checkClone=aW.cloneNode(true).cloneNode(true).lastChild.checked;a(function(){var a4=aa.createElement("div");a4.style.width=a4.style.paddingLeft="1px";aa.body.appendChild(a4);a.boxModel=a.support.boxModel=a4.offsetWidth===2;aa.body.removeChild(a4).style.display="none";a4=null});var aY=function(a4){var a6=aa.createElement("div");a4="on"+a4;var a5=(a4 in a6);if(!a5){a6.setAttribute(a4,"return;");a5=typeof a6[a4]==="function"}a6=null;return a5};a.support.submitBubbles=aY("submit");a.support.changeBubbles=aY("change");a0=aZ=aU=a2=a1=null})();a.props={"for":"htmlFor","class":"className",readonly:"readOnly",maxlength:"maxLength",cellspacing:"cellSpacing",rowspan:"rowSpan",colspan:"colSpan",tabindex:"tabIndex",usemap:"useMap",frameborder:"frameBorder"};var aE="jQuery"+aL(),aD=0,aP={};var K={};a.extend({cache:{},expando:aE,noData:{embed:true,object:true,applet:true},data:function(aW,aV,aY){if(aW.nodeName&&a.noData[aW.nodeName.toLowerCase()]){return}aW=aW==aI?aP:aW;var aZ=aW[aE],aU=a.cache,aX;if(!aV&&!aZ){return null}if(!aZ){aZ=++aD}if(typeof aV==="object"){aW[aE]=aZ;aX=aU[aZ]=a.extend(true,{},aV)}else{if(aU[aZ]){aX=aU[aZ]}else{if(typeof aY==="undefined"){aX=K}else{aX=aU[aZ]={}}}}if(aY!==B){aW[aE]=aZ;aX[aV]=aY}return typeof aV==="string"?aX[aV]:aX},removeData:function(aW,aV){if(aW.nodeName&&a.noData[aW.nodeName.toLowerCase()]){return}aW=aW==aI?aP:aW;var aZ=aW[aE],aU=a.cache,aX=aU[aZ];if(aV){if(aX){delete aX[aV];if(a.isEmptyObject(aX)){a.removeData(aW)}}}else{try{delete aW[aE]}catch(aY){if(aW.removeAttribute){aW.removeAttribute(aE)}}delete aU[aZ]}}});a.fn.extend({data:function(aU,aW){if(typeof aU==="undefined"&&this.length){return a.data(this[0])}else{if(typeof aU==="object"){return this.each(function(){a.data(this,aU)})}}var aX=aU.split(".");aX[1]=aX[1]?"."+aX[1]:"";if(aW===B){var aV=this.triggerHandler("getData"+aX[1]+"!",[aX[0]]);if(aV===B&&this.length){aV=a.data(this[0],aU)}return aV===B&&aX[1]?this.data(aX[0]):aV}else{return this.trigger("setData"+aX[1]+"!",[aX[0],aW]).each(function(){a.data(this,aU,aW)})}},removeData:function(aU){return this.each(function(){a.removeData(this,aU)})}});a.extend({queue:function(aV,aU,aX){if(!aV){return}aU=(aU||"fx")+"queue";var aW=a.data(aV,aU);if(!aX){return aW||[]}if(!aW||a.isArray(aX)){aW=a.data(aV,aU,a.makeArray(aX))}else{aW.push(aX)}return aW},dequeue:function(aX,aW){aW=aW||"fx";var aU=a.queue(aX,aW),aV=aU.shift();if(aV==="inprogress"){aV=aU.shift()}if(aV){if(aW==="fx"){aU.unshift("inprogress")}aV.call(aX,function(){a.dequeue(aX,aW)})}}});a.fn.extend({queue:function(aU,aV){if(typeof aU!=="string"){aV=aU;aU="fx"}if(aV===B){return a.queue(this[0],aU)}return this.each(function(aX,aY){var aW=a.queue(this,aU,aV);if(aU==="fx"&&aW[0]!=="inprogress"){a.dequeue(this,aU)}})},dequeue:function(aU){return this.each(function(){a.dequeue(this,aU)})},delay:function(aV,aU){aV=a.fx?a.fx.speeds[aV]||aV:aV;aU=aU||"fx";return this.queue(aU,function(){var aW=this;setTimeout(function(){a.dequeue(aW,aU)},aV)})},clearQueue:function(aU){return this.queue(aU||"fx",[])}});var am=/[\n\t]/g,R=/\s+/,at=/\r/g,aM=/href|src|style/,d=/(button|input)/i,y=/(button|input|object|select|textarea)/i,j=/^(a|area)$/i,G=/radio|checkbox/;a.fn.extend({attr:function(aU,aV){return al(this,aU,aV,true,a.attr)},removeAttr:function(aU,aV){return this.each(function(){a.attr(this,aU,"");if(this.nodeType===1){this.removeAttribute(aU)}})},addClass:function(aZ){if(a.isFunction(aZ)){return this.each(function(a3){var a2=a(this);a2.addClass(aZ.call(this,a3,a2.attr("class")))})}if(aZ&&typeof aZ==="string"){var a0=(aZ||"").split(R);for(var aW=0,aV=this.length;aW<aV;aW++){var aY=this[aW];if(aY.nodeType===1){if(!aY.className){aY.className=aZ}else{var aX=" "+aY.className+" ";for(var a1=0,aU=a0.length;a1<aU;a1++){if(aX.indexOf(" "+a0[a1]+" ")<0){aY.className+=" "+a0[a1]}}}}}}return this},removeClass:function(aZ){if(a.isFunction(aZ)){return this.each(function(a3){var a2=a(this);a2.removeClass(aZ.call(this,a3,a2.attr("class")))})}if((aZ&&typeof aZ==="string")||aZ===B){var a0=(aZ||"").split(R);for(var aW=0,aV=this.length;aW<aV;aW++){var aY=this[aW];if(aY.nodeType===1&&aY.className){if(aZ){var aX=(" "+aY.className+" ").replace(am," ");for(var a1=0,aU=a0.length;a1<aU;a1++){aX=aX.replace(" "+a0[a1]+" "," ")}aY.className=aX.substring(1,aX.length-1)}else{aY.className=""}}}}return this},toggleClass:function(aX,aV){var aW=typeof aX,aU=typeof aV==="boolean";if(a.isFunction(aX)){return this.each(function(aZ){var aY=a(this);aY.toggleClass(aX.call(this,aZ,aY.attr("class"),aV),aV)})}return this.each(function(){if(aW==="string"){var a0,aZ=0,aY=a(this),a1=aV,a2=aX.split(R);while((a0=a2[aZ++])){a1=aU?a1:!aY.hasClass(a0);aY[a1?"addClass":"removeClass"](a0)}}else{if(aW==="undefined"||aW==="boolean"){if(this.className){a.data(this,"__className__",this.className)}this.className=this.className||aX===false?"":a.data(this,"__className__")||""}}})},hasClass:function(aU){var aX=" "+aU+" ";for(var aW=0,aV=this.length;aW<aV;aW++){if((" "+this[aW].className+" ").replace(am," ").indexOf(aX)>-1){return true}}return false},val:function(a1){if(a1===B){var aV=this[0];if(aV){if(a.nodeName(aV,"option")){return(aV.attributes.value||{}).specified?aV.value:aV.text}if(a.nodeName(aV,"select")){var aZ=aV.selectedIndex,a2=[],a3=aV.options,aY=aV.type==="select-one";if(aZ<0){return null}for(var aW=aY?aZ:0,a0=aY?aZ+1:a3.length;aW<a0;aW++){var aX=a3[aW];if(aX.selected){a1=a(aX).val();if(aY){return a1}a2.push(a1)}}return a2}if(G.test(aV.type)&&!a.support.checkOn){return aV.getAttribute("value")===null?"on":aV.value}return(aV.value||"").replace(at,"")}return B}var aU=a.isFunction(a1);return this.each(function(a6){var a5=a(this),a7=a1;if(this.nodeType!==1){return}if(aU){a7=a1.call(this,a6,a5.val())}if(typeof a7==="number"){a7+=""}if(a.isArray(a7)&&G.test(this.type)){this.checked=a.inArray(a5.val(),a7)>=0}else{if(a.nodeName(this,"select")){var a4=a.makeArray(a7);a("option",this).each(function(){this.selected=a.inArray(a(this).val(),a4)>=0});if(!a4.length){this.selectedIndex=-1}}else{this.value=a7}}})}});a.extend({attrFn:{val:true,css:true,html:true,text:true,data:true,width:true,height:true,offset:true},attr:function(aV,aU,a0,a3){if(!aV||aV.nodeType===3||aV.nodeType===8){return B}if(a3&&aU in a.attrFn){return a(aV)[aU](a0)}var aW=aV.nodeType!==1||!a.isXMLDoc(aV),aZ=a0!==B;aU=aW&&a.props[aU]||aU;if(aV.nodeType===1){var aY=aM.test(aU);if(aU==="selected"&&!a.support.optSelected){var a1=aV.parentNode;if(a1){a1.selectedIndex;if(a1.parentNode){a1.parentNode.selectedIndex}}}if(aU in aV&&aW&&!aY){if(aZ){if(aU==="type"&&d.test(aV.nodeName)&&aV.parentNode){a.error("type property can't be changed")}aV[aU]=a0}if(a.nodeName(aV,"form")&&aV.getAttributeNode(aU)){return aV.getAttributeNode(aU).nodeValue}if(aU==="tabIndex"){var a2=aV.getAttributeNode("tabIndex");return a2&&a2.specified?a2.value:y.test(aV.nodeName)||j.test(aV.nodeName)&&aV.href?0:B}return aV[aU]}if(!a.support.style&&aW&&aU==="style"){if(aZ){aV.style.cssText=""+a0}return aV.style.cssText}if(aZ){aV.setAttribute(aU,""+a0)}var aX=!a.support.hrefNormalized&&aW&&aY?aV.getAttribute(aU,2):aV.getAttribute(aU);return aX===null?B:aX}return a.style(aV,aU,a0)}});var z=function(aU){return aU.replace(/[^\w\s\.\|`]/g,function(aV){return"\\"+aV})};a.event={add:function(aW,a1,a6,aY){if(aW.nodeType===3||aW.nodeType===8){return}if(aW.setInterval&&(aW!==aI&&!aW.frameElement)){aW=aI}if(!a6.guid){a6.guid=a.guid++}if(aY!==B){var a4=a6;a6=a.proxy(a4);a6.data=aY}var a7=a.data(aW,"events")||a.data(aW,"events",{}),a0=a.data(aW,"handle"),aZ;if(!a0){aZ=function(){return typeof a!=="undefined"&&!a.event.triggered?a.event.handle.apply(aZ.elem,arguments):B};a0=a.data(aW,"handle",aZ)}if(!a0){return}a0.elem=aW;a1=a1.split(/\s+/);var a3,aX=0;while((a3=a1[aX++])){var aU=a3.split(".");a3=aU.shift();if(aX>1){a6=a.proxy(a6);if(aY!==B){a6.data=aY}}a6.type=aU.slice(0).sort().join(".");var aV=a7[a3],a2=this.special[a3]||{};if(!aV){aV=a7[a3]={};if(!a2.setup||a2.setup.call(aW,aY,aU,a6)===false){if(aW.addEventListener){aW.addEventListener(a3,a0,false)}else{if(aW.attachEvent){aW.attachEvent("on"+a3,a0)}}}}if(a2.add){var a5=a2.add.call(aW,a6,aY,aU,aV);if(a5&&a.isFunction(a5)){a5.guid=a5.guid||a6.guid;a5.data=a5.data||a6.data;a5.type=a5.type||a6.type;a6=a5}}aV[a6.guid]=a6;this.global[a3]=true}aW=null},global:{},remove:function(aW,a0,a6){if(aW.nodeType===3||aW.nodeType===8){return}var a7=a.data(aW,"events"),a1,a3,a4;if(a7){if(a0===B||(typeof a0==="string"&&a0.charAt(0)===".")){for(a3 in a7){this.remove(aW,a3+(a0||""))}}else{if(a0.type){a6=a0.handler;a0=a0.type}a0=a0.split(/\s+/);var aY=0;while((a3=a0[aY++])){var aU=a3.split(".");a3=aU.shift();var a5=!aU.length,aV=a.map(aU.slice(0).sort(),z),aX=new RegExp("(^|\\.)"+aV.join("\\.(?:.*\\.)?")+"(\\.|$)"),a2=this.special[a3]||{};if(a7[a3]){if(a6){a4=a7[a3][a6.guid];delete a7[a3][a6.guid]}else{for(var aZ in a7[a3]){if(a5||aX.test(a7[a3][aZ].type)){delete a7[a3][aZ]}}}if(a2.remove){a2.remove.call(aW,aU,a4)}for(a1 in a7[a3]){break}if(!a1){if(!a2.teardown||a2.teardown.call(aW,aU)===false){if(aW.removeEventListener){aW.removeEventListener(a3,a.data(aW,"handle"),false)}else{if(aW.detachEvent){aW.detachEvent("on"+a3,a.data(aW,"handle"))}}}a1=null;delete a7[a3]}}}}for(a1 in a7){break}if(!a1){var aZ=a.data(aW,"handle");if(aZ){aZ.elem=null}a.removeData(aW,"events");a.removeData(aW,"handle")}}},trigger:function(aU,aY,aW){var a2=aU.type||aU,aX=arguments[3];if(!aX){aU=typeof aU==="object"?aU[aE]?aU:a.extend(a.Event(a2),aU):a.Event(a2);if(a2.indexOf("!")>=0){aU.type=a2=a2.slice(0,-1);aU.exclusive=true}if(!aW){aU.stopPropagation();if(this.global[a2]){a.each(a.cache,function(){if(this.events&&this.events[a2]){a.event.trigger(aU,aY,this.handle.elem)}})}}if(!aW||aW.nodeType===3||aW.nodeType===8){return B}aU.result=B;aU.target=aW;aY=a.makeArray(aY);aY.unshift(aU)}aU.currentTarget=aW;var aZ=a.data(aW,"handle");if(aZ){aZ.apply(aW,aY)}var a3=aW.parentNode||aW.ownerDocument;try{if(!(aW&&aW.nodeName&&a.noData[aW.nodeName.toLowerCase()])){if(aW["on"+a2]&&aW["on"+a2].apply(aW,aY)===false){aU.result=false}}}catch(a1){}if(!aU.isPropagationStopped()&&a3){a.event.trigger(aU,aY,a3,true)}else{if(!aU.isDefaultPrevented()){var a0=aU.target,aV,a4=a.nodeName(a0,"a")&&a2==="click";if(!a4&&!(a0&&a0.nodeName&&a.noData[a0.nodeName.toLowerCase()])){try{if(a0[a2]){aV=a0["on"+a2];if(aV){a0["on"+a2]=null}this.triggered=true;a0[a2]()}}catch(a1){}if(aV){a0["on"+a2]=aV}this.triggered=false}}}},handle:function(a0){var aZ,aU;a0=arguments[0]=a.event.fix(a0||aI.event);a0.currentTarget=this;var a1=a0.type.split(".");a0.type=a1.shift();aZ=!a1.length&&!a0.exclusive;var aY=new RegExp("(^|\\.)"+a1.slice(0).sort().join("\\.(?:.*\\.)?")+"(\\.|$)");aU=(a.data(this,"events")||{})[a0.type];for(var aW in aU){var aX=aU[aW];if(aZ||aY.test(aX.type)){a0.handler=aX;a0.data=aX.data;var aV=aX.apply(this,arguments);if(aV!==B){a0.result=aV;if(aV===false){a0.preventDefault();a0.stopPropagation()}}if(a0.isImmediatePropagationStopped()){break}}}return a0.result},props:"altKey attrChange attrName bubbles button cancelable charCode clientX clientY ctrlKey currentTarget data detail eventPhase fromElement handler keyCode layerX layerY metaKey newValue offsetX offsetY originalTarget pageX pageY prevValue relatedNode relatedTarget screenX screenY shiftKey srcElement target toElement view wheelDelta which".split(" "),fix:function(aX){if(aX[aE]){return aX}var aV=aX;aX=a.Event(aV);for(var aW=this.props.length,aZ;aW;){aZ=this.props[--aW];aX[aZ]=aV[aZ]}if(!aX.target){aX.target=aX.srcElement||aa}if(aX.target.nodeType===3){aX.target=aX.target.parentNode}if(!aX.relatedTarget&&aX.fromElement){aX.relatedTarget=aX.fromElement===aX.target?aX.toElement:aX.fromElement}if(aX.pageX==null&&aX.clientX!=null){var aY=aa.documentElement,aU=aa.body;aX.pageX=aX.clientX+(aY&&aY.scrollLeft||aU&&aU.scrollLeft||0)-(aY&&aY.clientLeft||aU&&aU.clientLeft||0);aX.pageY=aX.clientY+(aY&&aY.scrollTop||aU&&aU.scrollTop||0)-(aY&&aY.clientTop||aU&&aU.clientTop||0)}if(!aX.which&&((aX.charCode||aX.charCode===0)?aX.charCode:aX.keyCode)){aX.which=aX.charCode||aX.keyCode}if(!aX.metaKey&&aX.ctrlKey){aX.metaKey=aX.ctrlKey}if(!aX.which&&aX.button!==B){aX.which=(aX.button&1?1:(aX.button&2?3:(aX.button&4?2:0)))}return aX},guid:100000000,proxy:a.proxy,special:{ready:{setup:a.bindReady,teardown:a.noop},live:{add:function(aU,aX,aW,aV){a.extend(aU,aX||{});aU.guid+=aX.selector+aX.live;aX.liveProxy=aU;a.event.add(this,aX.live,U,aX)},remove:function(aW){if(aW.length){var aU=0,aV=new RegExp("(^|\\.)"+aW[0]+"(\\.|$)");a.each((a.data(this,"events").live||{}),function(){if(aV.test(this.type)){aU++}});if(aU<1){a.event.remove(this,aW[0],U)}}},special:{}},beforeunload:{setup:function(aW,aV,aU){if(this.setInterval){this.onbeforeunload=aU}return false},teardown:function(aV,aU){if(this.onbeforeunload===aU){this.onbeforeunload=null}}}}};a.Event=function(aU){if(!this.preventDefault){return new a.Event(aU)}if(aU&&aU.type){this.originalEvent=aU;this.type=aU.type}else{this.type=aU}this.timeStamp=aL();this[aE]=true};function aN(){return false}function f(){return true}a.Event.prototype={preventDefault:function(){this.isDefaultPrevented=f;var aU=this.originalEvent;if(!aU){return}if(aU.preventDefault){aU.preventDefault()}aU.returnValue=false},stopPropagation:function(){this.isPropagationStopped=f;var aU=this.originalEvent;if(!aU){return}if(aU.stopPropagation){aU.stopPropagation()}aU.cancelBubble=true},stopImmediatePropagation:function(){this.isImmediatePropagationStopped=f;this.stopPropagation()},isDefaultPrevented:aN,isPropagationStopped:aN,isImmediatePropagationStopped:aN};var P=function(aV){var aU=aV.relatedTarget;while(aU&&aU!==this){try{aU=aU.parentNode}catch(aW){break}}if(aU!==this){aV.type=aV.data;a.event.handle.apply(this,arguments)}},av=function(aU){aU.type=aU.data;a.event.handle.apply(this,arguments)};a.each({mouseenter:"mouseover",mouseleave:"mouseout"},function(aV,aU){a.event.special[aV]={setup:function(aW){a.event.add(this,aU,aW&&aW.selector?av:P,aV)},teardown:function(aW){a.event.remove(this,aU,aW&&aW.selector?av:P)}}});if(!a.support.submitBubbles){a.event.special.submit={setup:function(aW,aV,aU){if(this.nodeName.toLowerCase()!=="form"){a.event.add(this,"click.specialSubmit."+aU.guid,function(aZ){var aY=aZ.target,aX=aY.type;if((aX==="submit"||aX==="image")&&a(aY).closest("form").length){return ax("submit",this,arguments)}});a.event.add(this,"keypress.specialSubmit."+aU.guid,function(aZ){var aY=aZ.target,aX=aY.type;if((aX==="text"||aX==="password")&&a(aY).closest("form").length&&aZ.keyCode===13){return ax("submit",this,arguments)}})}else{return false}},remove:function(aV,aU){a.event.remove(this,"click.specialSubmit"+(aU?"."+aU.guid:""));a.event.remove(this,"keypress.specialSubmit"+(aU?"."+aU.guid:""))}}}if(!a.support.changeBubbles){var ao=/textarea|input|select/i;function i(aV){var aU=aV.type,aW=aV.value;if(aU==="radio"||aU==="checkbox"){aW=aV.checked}else{if(aU==="select-multiple"){aW=aV.selectedIndex>-1?a.map(aV.options,function(aX){return aX.selected}).join("-"):""}else{if(aV.nodeName.toLowerCase()==="select"){aW=aV.selectedIndex}}}return aW}function N(aW){var aU=aW.target,aV,aX;if(!ao.test(aU.nodeName)||aU.readOnly){return}aV=a.data(aU,"_change_data");aX=i(aU);if(aW.type!=="focusout"||aU.type!=="radio"){a.data(aU,"_change_data",aX)}if(aV===B||aX===aV){return}if(aV!=null||aX){aW.type="change";return a.event.trigger(aW,arguments[1],aU)}}a.event.special.change={filters:{focusout:N,click:function(aW){var aV=aW.target,aU=aV.type;if(aU==="radio"||aU==="checkbox"||aV.nodeName.toLowerCase()==="select"){return N.call(this,aW)}},keydown:function(aW){var aV=aW.target,aU=aV.type;if((aW.keyCode===13&&aV.nodeName.toLowerCase()!=="textarea")||(aW.keyCode===32&&(aU==="checkbox"||aU==="radio"))||aU==="select-multiple"){return N.call(this,aW)}},beforeactivate:function(aV){var aU=aV.target;if(aU.nodeName.toLowerCase()==="input"&&aU.type==="radio"){a.data(aU,"_change_data",i(aU))}}},setup:function(aX,aW,aV){for(var aU in aO){a.event.add(this,aU+".specialChange."+aV.guid,aO[aU])}return ao.test(this.nodeName)},remove:function(aW,aV){for(var aU in aO){a.event.remove(this,aU+".specialChange"+(aV?"."+aV.guid:""),aO[aU])}return ao.test(this.nodeName)}};var aO=a.event.special.change.filters}function ax(aV,aW,aU){aU[0].type=aV;return a.event.handle.apply(aW,aU)}if(aa.addEventListener){a.each({focus:"focusin",blur:"focusout"},function(aW,aU){a.event.special[aU]={setup:function(){this.addEventListener(aW,aV,true)},teardown:function(){this.removeEventListener(aW,aV,true)}};function aV(aX){aX=a.event.fix(aX);aX.type=aU;return a.event.handle.call(this,aX)}})}a.each(["bind","one"],function(aV,aU){a.fn[aU]=function(aZ,a0,aY){if(typeof aZ==="object"){for(var aW in aZ){this[aU](aW,a0,aZ[aW],aY)}return this}if(a.isFunction(a0)){aY=a0;a0=B}var aX=aU==="one"?a.proxy(aY,function(a1){a(this).unbind(a1,aX);return aY.apply(this,arguments)}):aY;return aZ==="unload"&&aU!=="one"?this.one(aZ,a0,aY):this.each(function(){a.event.add(this,aZ,aX,a0)})}});a.fn.extend({unbind:function(aW,aV){if(typeof aW==="object"&&!aW.preventDefault){for(var aU in aW){this.unbind(aU,aW[aU])}return this}return this.each(function(){a.event.remove(this,aW,aV)})},trigger:function(aU,aV){return this.each(function(){a.event.trigger(aU,aV,this)})},triggerHandler:function(aU,aW){if(this[0]){var aV=a.Event(aU);aV.preventDefault();aV.stopPropagation();a.event.trigger(aV,aW,this[0]);return aV.result}},toggle:function(aW){var aU=arguments,aV=1;while(aV<aU.length){a.proxy(aW,aU[aV++])}return this.click(a.proxy(aW,function(aX){var aY=(a.data(this,"lastToggle"+aW.guid)||0)%aV;a.data(this,"lastToggle"+aW.guid,aY+1);aX.preventDefault();return aU[aY].apply(this,arguments)||false}))},hover:function(aU,aV){return this.mouseenter(aU).mouseleave(aV||aU)}});a.each(["live","die"],function(aV,aU){a.fn[aU]=function(aX,a0,aZ){var aY,aW=0;if(a.isFunction(a0)){aZ=a0;a0=B}aX=(aX||"").split(/\s+/);while((aY=aX[aW++])!=null){aY=aY==="focus"?"focusin":aY==="blur"?"focusout":aY==="hover"?aX.push("mouseleave")&&"mouseenter":aY;if(aU==="live"){a(this.context).bind(m(aY,this.selector),{data:a0,selector:this.selector,live:aY},aZ)}else{a(this.context).unbind(m(aY,this.selector),aZ?{guid:aZ.guid+this.selector+aY}:null)}}return this}});function U(aU){var a5,aV=[],a7=[],a3=arguments,a6,a2,a4,aX,aZ,a1,aY,a0,aW=a.extend({},a.data(this,"events").live);if(aU.button&&aU.type==="click"){return}for(aZ in aW){a4=aW[aZ];if(a4.live===aU.type||a4.altLive&&a.inArray(aU.type,a4.altLive)>-1){a0=a4.data;if(!(a0.beforeFilter&&a0.beforeFilter[aU.type]&&!a0.beforeFilter[aU.type](aU))){a7.push(a4.selector)}}else{delete aW[aZ]}}a2=a(aU.target).closest(a7,aU.currentTarget);for(a1=0,aY=a2.length;a1<aY;a1++){for(aZ in aW){a4=aW[aZ];aX=a2[a1].elem;a6=null;if(a2[a1].selector===a4.selector){if(a4.live==="mouseenter"||a4.live==="mouseleave"){a6=a(aU.relatedTarget).closest(a4.selector)[0]}if(!a6||a6!==aX){aV.push({elem:aX,fn:a4})}}}}for(a1=0,aY=aV.length;a1<aY;a1++){a2=aV[a1];aU.currentTarget=a2.elem;aU.data=a2.fn.data;if(a2.fn.apply(a2.elem,a3)===false){a5=false;break}}return a5}function m(aV,aU){return"live."+(aV?aV+".":"")+aU.replace(/\./g,"`").replace(/ /g,"&")}a.each(("blur focus focusin focusout load resize scroll unload click dblclick mousedown mouseup mousemove mouseover mouseout mouseenter mouseleave change select submit keydown keypress keyup error").split(" "),function(aV,aU){a.fn[aU]=function(aW){return aW?this.bind(aU,aW):this.trigger(aU)};if(a.attrFn){a.attrFn[aU]=true}});if(aI.attachEvent&&!aI.addEventListener){aI.attachEvent("onunload",function(){for(var aV in a.cache){if(a.cache[aV].handle){try{a.event.remove(a.cache[aV].handle.elem)}catch(aU){}}}});
/*
 * Sizzle CSS Selector Engine - v1.0
 *  Copyright 2009, The Dojo Foundation
 *  Released under the MIT, BSD, and GPL Licenses.
 *  More information: http://sizzlejs.com/
 */
}(function(){var a5=/((?:\((?:\([^()]+\)|[^()]+)+\)|\[(?:\[[^[\]]*\]|['"][^'"]*['"]|[^[\]'"]+)+\]|\\.|[^ >+~,(\[\\]+)+|[>+~])(\s*,\s*)?((?:.|\r|\n)*)/g,a6=0,a8=Object.prototype.toString,a0=false,aZ=true;[0,0].sort(function(){aZ=false;return 0});var aW=function(bh,bc,bk,bl){bk=bk||[];var bn=bc=bc||aa;if(bc.nodeType!==1&&bc.nodeType!==9){return[]}if(!bh||typeof bh!=="string"){return bk}var bi=[],be,bp,bs,bd,bg=true,bf=aX(bc),bm=bh;while((a5.exec(""),be=a5.exec(bm))!==null){bm=be[3];bi.push(be[1]);if(be[2]){bd=be[3];break}}if(bi.length>1&&a1.exec(bh)){if(bi.length===2&&a2.relative[bi[0]]){bp=a9(bi[0]+bi[1],bc)}else{bp=a2.relative[bi[0]]?[bc]:aW(bi.shift(),bc);while(bi.length){bh=bi.shift();if(a2.relative[bh]){bh+=bi.shift()}bp=a9(bh,bp)}}}else{if(!bl&&bi.length>1&&bc.nodeType===9&&!bf&&a2.match.ID.test(bi[0])&&!a2.match.ID.test(bi[bi.length-1])){var bo=aW.find(bi.shift(),bc,bf);bc=bo.expr?aW.filter(bo.expr,bo.set)[0]:bo.set[0]}if(bc){var bo=bl?{expr:bi.pop(),set:a4(bl)}:aW.find(bi.pop(),bi.length===1&&(bi[0]==="~"||bi[0]==="+")&&bc.parentNode?bc.parentNode:bc,bf);bp=bo.expr?aW.filter(bo.expr,bo.set):bo.set;if(bi.length>0){bs=a4(bp)}else{bg=false}while(bi.length){var br=bi.pop(),bq=br;if(!a2.relative[br]){br=""}else{bq=bi.pop()}if(bq==null){bq=bc}a2.relative[br](bs,bq,bf)}}else{bs=bi=[]}}if(!bs){bs=bp}if(!bs){aW.error(br||bh)}if(a8.call(bs)==="[object Array]"){if(!bg){bk.push.apply(bk,bs)}else{if(bc&&bc.nodeType===1){for(var bj=0;bs[bj]!=null;bj++){if(bs[bj]&&(bs[bj]===true||bs[bj].nodeType===1&&a3(bc,bs[bj]))){bk.push(bp[bj])}}}else{for(var bj=0;bs[bj]!=null;bj++){if(bs[bj]&&bs[bj].nodeType===1){bk.push(bp[bj])}}}}}else{a4(bs,bk)}if(bd){aW(bd,bn,bk,bl);aW.uniqueSort(bk)}return bk};aW.uniqueSort=function(bd){if(a7){a0=aZ;bd.sort(a7);if(a0){for(var bc=1;bc<bd.length;bc++){if(bd[bc]===bd[bc-1]){bd.splice(bc--,1)}}}}return bd};aW.matches=function(bc,bd){return aW(bc,null,null,bd)};aW.find=function(bj,bc,bk){var bi,bg;if(!bj){return[]}for(var bf=0,be=a2.order.length;bf<be;bf++){var bh=a2.order[bf],bg;if((bg=a2.leftMatch[bh].exec(bj))){var bd=bg[1];bg.splice(1,1);if(bd.substr(bd.length-1)!=="\\"){bg[1]=(bg[1]||"").replace(/\\/g,"");bi=a2.find[bh](bg,bc,bk);if(bi!=null){bj=bj.replace(a2.match[bh],"");break}}}}if(!bi){bi=bc.getElementsByTagName("*")}return{set:bi,expr:bj}};aW.filter=function(bn,bm,bq,bg){var be=bn,bs=[],bk=bm,bi,bc,bj=bm&&bm[0]&&aX(bm[0]);while(bn&&bm.length){for(var bl in a2.filter){if((bi=a2.leftMatch[bl].exec(bn))!=null&&bi[2]){var bd=a2.filter[bl],br,bp,bf=bi[1];bc=false;bi.splice(1,1);if(bf.substr(bf.length-1)==="\\"){continue}if(bk===bs){bs=[]}if(a2.preFilter[bl]){bi=a2.preFilter[bl](bi,bk,bq,bs,bg,bj);if(!bi){bc=br=true}else{if(bi===true){continue}}}if(bi){for(var bh=0;(bp=bk[bh])!=null;bh++){if(bp){br=bd(bp,bi,bh,bk);var bo=bg^!!br;if(bq&&br!=null){if(bo){bc=true}else{bk[bh]=false}}else{if(bo){bs.push(bp);bc=true}}}}}if(br!==B){if(!bq){bk=bs}bn=bn.replace(a2.match[bl],"");if(!bc){return[]}break}}}if(bn===be){if(bc==null){aW.error(bn)}else{break}}be=bn}return bk};aW.error=function(bc){throw"Syntax error, unrecognized expression: "+bc};var a2=aW.selectors={order:["ID","NAME","TAG"],match:{ID:/#((?:[\w\u00c0-\uFFFF-]|\\.)+)/,CLASS:/\.((?:[\w\u00c0-\uFFFF-]|\\.)+)/,NAME:/\[name=['"]*((?:[\w\u00c0-\uFFFF-]|\\.)+)['"]*\]/,ATTR:/\[\s*((?:[\w\u00c0-\uFFFF-]|\\.)+)\s*(?:(\S?=)\s*(['"]*)(.*?)\3|)\s*\]/,TAG:/^((?:[\w\u00c0-\uFFFF\*-]|\\.)+)/,CHILD:/:(only|nth|last|first)-child(?:\((even|odd|[\dn+-]*)\))?/,POS:/:(nth|eq|gt|lt|first|last|even|odd)(?:\((\d*)\))?(?=[^-]|$)/,PSEUDO:/:((?:[\w\u00c0-\uFFFF-]|\\.)+)(?:\((['"]?)((?:\([^\)]+\)|[^\(\)]*)+)\2\))?/},leftMatch:{},attrMap:{"class":"className","for":"htmlFor"},attrHandle:{href:function(bc){return bc.getAttribute("href")}},relative:{"+":function(bi,bd){var bf=typeof bd==="string",bh=bf&&!/\W/.test(bd),bj=bf&&!bh;if(bh){bd=bd.toLowerCase()}for(var be=0,bc=bi.length,bg;be<bc;be++){if((bg=bi[be])){while((bg=bg.previousSibling)&&bg.nodeType!==1){}bi[be]=bj||bg&&bg.nodeName.toLowerCase()===bd?bg||false:bg===bd}}if(bj){aW.filter(bd,bi,true)}},">":function(bi,bd){var bg=typeof bd==="string";if(bg&&!/\W/.test(bd)){bd=bd.toLowerCase();for(var be=0,bc=bi.length;be<bc;be++){var bh=bi[be];if(bh){var bf=bh.parentNode;bi[be]=bf.nodeName.toLowerCase()===bd?bf:false}}}else{for(var be=0,bc=bi.length;be<bc;be++){var bh=bi[be];if(bh){bi[be]=bg?bh.parentNode:bh.parentNode===bd}}if(bg){aW.filter(bd,bi,true)}}},"":function(bf,bd,bh){var be=a6++,bc=ba;if(typeof bd==="string"&&!/\W/.test(bd)){var bg=bd=bd.toLowerCase();bc=aU}bc("parentNode",bd,be,bf,bg,bh)},"~":function(bf,bd,bh){var be=a6++,bc=ba;if(typeof bd==="string"&&!/\W/.test(bd)){var bg=bd=bd.toLowerCase();bc=aU}bc("previousSibling",bd,be,bf,bg,bh)}},find:{ID:function(bd,be,bf){if(typeof be.getElementById!=="undefined"&&!bf){var bc=be.getElementById(bd[1]);return bc?[bc]:[]}},NAME:function(be,bh){if(typeof bh.getElementsByName!=="undefined"){var bd=[],bg=bh.getElementsByName(be[1]);for(var bf=0,bc=bg.length;bf<bc;bf++){if(bg[bf].getAttribute("name")===be[1]){bd.push(bg[bf])}}return bd.length===0?null:bd}},TAG:function(bc,bd){return bd.getElementsByTagName(bc[1])}},preFilter:{CLASS:function(bf,bd,be,bc,bi,bj){bf=" "+bf[1].replace(/\\/g,"")+" ";if(bj){return bf}for(var bg=0,bh;(bh=bd[bg])!=null;bg++){if(bh){if(bi^(bh.className&&(" "+bh.className+" ").replace(/[\t\n]/g," ").indexOf(bf)>=0)){if(!be){bc.push(bh)}}else{if(be){bd[bg]=false}}}}return false},ID:function(bc){return bc[1].replace(/\\/g,"")},TAG:function(bd,bc){return bd[1].toLowerCase()},CHILD:function(bc){if(bc[1]==="nth"){var bd=/(-?)(\d*)n((?:\+|-)?\d*)/.exec(bc[2]==="even"&&"2n"||bc[2]==="odd"&&"2n+1"||!/\D/.test(bc[2])&&"0n+"+bc[2]||bc[2]);bc[2]=(bd[1]+(bd[2]||1))-0;bc[3]=bd[3]-0}bc[0]=a6++;return bc},ATTR:function(bg,bd,be,bc,bh,bi){var bf=bg[1].replace(/\\/g,"");if(!bi&&a2.attrMap[bf]){bg[1]=a2.attrMap[bf]}if(bg[2]==="~="){bg[4]=" "+bg[4]+" "}return bg},PSEUDO:function(bg,bd,be,bc,bh){if(bg[1]==="not"){if((a5.exec(bg[3])||"").length>1||/^\w/.test(bg[3])){bg[3]=aW(bg[3],null,null,bd)}else{var bf=aW.filter(bg[3],bd,be,true^bh);if(!be){bc.push.apply(bc,bf)}return false}}else{if(a2.match.POS.test(bg[0])||a2.match.CHILD.test(bg[0])){return true}}return bg},POS:function(bc){bc.unshift(true);return bc}},filters:{enabled:function(bc){return bc.disabled===false&&bc.type!=="hidden"},disabled:function(bc){return bc.disabled===true},checked:function(bc){return bc.checked===true},selected:function(bc){bc.parentNode.selectedIndex;return bc.selected===true},parent:function(bc){return !!bc.firstChild},empty:function(bc){return !bc.firstChild},has:function(be,bd,bc){return !!aW(bc[3],be).length},header:function(bc){return/h\d/i.test(bc.nodeName)},text:function(bc){return"text"===bc.type},radio:function(bc){return"radio"===bc.type},checkbox:function(bc){return"checkbox"===bc.type},file:function(bc){return"file"===bc.type},password:function(bc){return"password"===bc.type},submit:function(bc){return"submit"===bc.type},image:function(bc){return"image"===bc.type},reset:function(bc){return"reset"===bc.type},button:function(bc){return"button"===bc.type||bc.nodeName.toLowerCase()==="button"},input:function(bc){return/input|select|textarea|button/i.test(bc.nodeName)}},setFilters:{first:function(bd,bc){return bc===0},last:function(be,bd,bc,bf){return bd===bf.length-1},even:function(bd,bc){return bc%2===0},odd:function(bd,bc){return bc%2===1},lt:function(be,bd,bc){return bd<bc[3]-0},gt:function(be,bd,bc){return bd>bc[3]-0},nth:function(be,bd,bc){return bc[3]-0===bd},eq:function(be,bd,bc){return bc[3]-0===bd}},filter:{PSEUDO:function(bi,be,bf,bj){var bd=be[1],bg=a2.filters[bd];if(bg){return bg(bi,bf,be,bj)}else{if(bd==="contains"){return(bi.textContent||bi.innerText||aV([bi])||"").indexOf(be[3])>=0}else{if(bd==="not"){var bh=be[3];for(var bf=0,bc=bh.length;bf<bc;bf++){if(bh[bf]===bi){return false}}return true}else{aW.error("Syntax error, unrecognized expression: "+bd)}}}},CHILD:function(bc,bf){var bi=bf[1],bd=bc;switch(bi){case"only":case"first":while((bd=bd.previousSibling)){if(bd.nodeType===1){return false}}if(bi==="first"){return true}bd=bc;case"last":while((bd=bd.nextSibling)){if(bd.nodeType===1){return false}}return true;case"nth":var be=bf[2],bl=bf[3];if(be===1&&bl===0){return true}var bh=bf[0],bk=bc.parentNode;if(bk&&(bk.sizcache!==bh||!bc.nodeIndex)){var bg=0;for(bd=bk.firstChild;bd;bd=bd.nextSibling){if(bd.nodeType===1){bd.nodeIndex=++bg}}bk.sizcache=bh}var bj=bc.nodeIndex-bl;if(be===0){return bj===0}else{return(bj%be===0&&bj/be>=0)}}},ID:function(bd,bc){return bd.nodeType===1&&bd.getAttribute("id")===bc},TAG:function(bd,bc){return(bc==="*"&&bd.nodeType===1)||bd.nodeName.toLowerCase()===bc},CLASS:function(bd,bc){return(" "+(bd.className||bd.getAttribute("class"))+" ").indexOf(bc)>-1},ATTR:function(bh,bf){var be=bf[1],bc=a2.attrHandle[be]?a2.attrHandle[be](bh):bh[be]!=null?bh[be]:bh.getAttribute(be),bi=bc+"",bg=bf[2],bd=bf[4];return bc==null?bg==="!=":bg==="="?bi===bd:bg==="*="?bi.indexOf(bd)>=0:bg==="~="?(" "+bi+" ").indexOf(bd)>=0:!bd?bi&&bc!==false:bg==="!="?bi!==bd:bg==="^="?bi.indexOf(bd)===0:bg==="$="?bi.substr(bi.length-bd.length)===bd:bg==="|="?bi===bd||bi.substr(0,bd.length+1)===bd+"-":false},POS:function(bg,bd,be,bh){var bc=bd[2],bf=a2.setFilters[bc];if(bf){return bf(bg,be,bd,bh)}}}};var a1=a2.match.POS;for(var aY in a2.match){a2.match[aY]=new RegExp(a2.match[aY].source+/(?![^\[]*\])(?![^\(]*\))/.source);a2.leftMatch[aY]=new RegExp(/(^(?:.|\r|\n)*?)/.source+a2.match[aY].source.replace(/\\(\d+)/g,function(bd,bc){return"\\"+(bc-0+1)}))}var a4=function(bd,bc){bd=Array.prototype.slice.call(bd,0);if(bc){bc.push.apply(bc,bd);return bc}return bd};try{Array.prototype.slice.call(aa.documentElement.childNodes,0)}catch(bb){a4=function(bg,bf){var bd=bf||[];if(a8.call(bg)==="[object Array]"){Array.prototype.push.apply(bd,bg)}else{if(typeof bg.length==="number"){for(var be=0,bc=bg.length;be<bc;be++){bd.push(bg[be])}}else{for(var be=0;bg[be];be++){bd.push(bg[be])}}}return bd}}var a7;if(aa.documentElement.compareDocumentPosition){a7=function(bd,bc){if(!bd.compareDocumentPosition||!bc.compareDocumentPosition){if(bd==bc){a0=true}return bd.compareDocumentPosition?-1:1}var be=bd.compareDocumentPosition(bc)&4?-1:bd===bc?0:1;if(be===0){a0=true}return be}}else{if("sourceIndex" in aa.documentElement){a7=function(bd,bc){if(!bd.sourceIndex||!bc.sourceIndex){if(bd==bc){a0=true}return bd.sourceIndex?-1:1}var be=bd.sourceIndex-bc.sourceIndex;if(be===0){a0=true}return be}}else{if(aa.createRange){a7=function(bf,bd){if(!bf.ownerDocument||!bd.ownerDocument){if(bf==bd){a0=true}return bf.ownerDocument?-1:1}var be=bf.ownerDocument.createRange(),bc=bd.ownerDocument.createRange();be.setStart(bf,0);be.setEnd(bf,0);bc.setStart(bd,0);bc.setEnd(bd,0);var bg=be.compareBoundaryPoints(Range.START_TO_END,bc);if(bg===0){a0=true}return bg}}}}function aV(bc){var bd="",bf;for(var be=0;bc[be];be++){bf=bc[be];if(bf.nodeType===3||bf.nodeType===4){bd+=bf.nodeValue}else{if(bf.nodeType!==8){bd+=aV(bf.childNodes)}}}return bd}(function(){var bd=aa.createElement("div"),be="script"+(new Date).getTime();bd.innerHTML="<a name='"+be+"'/>";var bc=aa.documentElement;bc.insertBefore(bd,bc.firstChild);if(aa.getElementById(be)){a2.find.ID=function(bg,bh,bi){if(typeof bh.getElementById!=="undefined"&&!bi){var bf=bh.getElementById(bg[1]);return bf?bf.id===bg[1]||typeof bf.getAttributeNode!=="undefined"&&bf.getAttributeNode("id").nodeValue===bg[1]?[bf]:B:[]}};a2.filter.ID=function(bh,bf){var bg=typeof bh.getAttributeNode!=="undefined"&&bh.getAttributeNode("id");return bh.nodeType===1&&bg&&bg.nodeValue===bf}}bc.removeChild(bd);bc=bd=null})();(function(){var bc=aa.createElement("div");bc.appendChild(aa.createComment(""));if(bc.getElementsByTagName("*").length>0){a2.find.TAG=function(bd,bh){var bg=bh.getElementsByTagName(bd[1]);if(bd[1]==="*"){var bf=[];for(var be=0;bg[be];be++){if(bg[be].nodeType===1){bf.push(bg[be])}}bg=bf}return bg}}bc.innerHTML="<a href='#'></a>";if(bc.firstChild&&typeof bc.firstChild.getAttribute!=="undefined"&&bc.firstChild.getAttribute("href")!=="#"){a2.attrHandle.href=function(bd){return bd.getAttribute("href",2)}}bc=null})();if(aa.querySelectorAll){(function(){var bc=aW,be=aa.createElement("div");be.innerHTML="<p class='TEST'></p>";if(be.querySelectorAll&&be.querySelectorAll(".TEST").length===0){return}aW=function(bi,bh,bf,bg){bh=bh||aa;if(!bg&&bh.nodeType===9&&!aX(bh)){try{return a4(bh.querySelectorAll(bi),bf)}catch(bj){}}return bc(bi,bh,bf,bg)};for(var bd in bc){aW[bd]=bc[bd]}be=null})()}(function(){var bc=aa.createElement("div");bc.innerHTML="<div class='test e'></div><div class='test'></div>";if(!bc.getElementsByClassName||bc.getElementsByClassName("e").length===0){return}bc.lastChild.className="e";if(bc.getElementsByClassName("e").length===1){return}a2.order.splice(1,0,"CLASS");a2.find.CLASS=function(bd,be,bf){if(typeof be.getElementsByClassName!=="undefined"&&!bf){return be.getElementsByClassName(bd[1])}};bc=null})();function aU(bd,bi,bh,bl,bj,bk){for(var bf=0,be=bl.length;bf<be;bf++){var bc=bl[bf];if(bc){bc=bc[bd];var bg=false;while(bc){if(bc.sizcache===bh){bg=bl[bc.sizset];break}if(bc.nodeType===1&&!bk){bc.sizcache=bh;bc.sizset=bf}if(bc.nodeName.toLowerCase()===bi){bg=bc;break}bc=bc[bd]}bl[bf]=bg}}}function ba(bd,bi,bh,bl,bj,bk){for(var bf=0,be=bl.length;bf<be;bf++){var bc=bl[bf];if(bc){bc=bc[bd];var bg=false;while(bc){if(bc.sizcache===bh){bg=bl[bc.sizset];break}if(bc.nodeType===1){if(!bk){bc.sizcache=bh;bc.sizset=bf}if(typeof bi!=="string"){if(bc===bi){bg=true;break}}else{if(aW.filter(bi,[bc]).length>0){bg=bc;break}}}bc=bc[bd]}bl[bf]=bg}}}var a3=aa.compareDocumentPosition?function(bd,bc){return bd.compareDocumentPosition(bc)&16}:function(bd,bc){return bd!==bc&&(bd.contains?bd.contains(bc):true)};var aX=function(bc){var bd=(bc?bc.ownerDocument||bc:0).documentElement;return bd?bd.nodeName!=="HTML":false};var a9=function(bc,bj){var bf=[],bg="",bh,be=bj.nodeType?[bj]:bj;while((bh=a2.match.PSEUDO.exec(bc))){bg+=bh[0];bc=bc.replace(a2.match.PSEUDO,"")}bc=a2.relative[bc]?bc+"*":bc;for(var bi=0,bd=be.length;bi<bd;bi++){aW(bc,be[bi],bf)}return aW.filter(bg,bf)};a.find=aW;a.expr=aW.selectors;a.expr[":"]=a.expr.filters;a.unique=aW.uniqueSort;a.getText=aV;a.isXMLDoc=aX;a.contains=a3;return;aI.Sizzle=aW})();var M=/Until$/,X=/^(?:parents|prevUntil|prevAll)/,aH=/,/,D=Array.prototype.slice;var ag=function(aX,aW,aU){if(a.isFunction(aW)){return a.grep(aX,function(aZ,aY){return !!aW.call(aZ,aY,aZ)===aU})}else{if(aW.nodeType){return a.grep(aX,function(aZ,aY){return(aZ===aW)===aU})}else{if(typeof aW==="string"){var aV=a.grep(aX,function(aY){return aY.nodeType===1});if(aS.test(aW)){return a.filter(aW,aV,!aU)}else{aW=a.filter(aW,aV)}}}}return a.grep(aX,function(aZ,aY){return(a.inArray(aZ,aW)>=0)===aU})};a.fn.extend({find:function(aU){var aW=this.pushStack("","find",aU),aZ=0;for(var aX=0,aV=this.length;aX<aV;aX++){aZ=aW.length;a.find(aU,this[aX],aW);if(aX>0){for(var a0=aZ;a0<aW.length;a0++){for(var aY=0;aY<aZ;aY++){if(aW[aY]===aW[a0]){aW.splice(a0--,1);break}}}}}return aW},has:function(aV){var aU=a(aV);return this.filter(function(){for(var aX=0,aW=aU.length;aX<aW;aX++){if(a.contains(this,aU[aX])){return true}}})},not:function(aU){return this.pushStack(ag(this,aU,false),"not",aU)},filter:function(aU){return this.pushStack(ag(this,aU,true),"filter",aU)},is:function(aU){return !!aU&&a.filter(aU,this).length>0},closest:function(a3,aU){if(a.isArray(a3)){var a0=[],a2=this[0],aZ,aY={},aW;if(a2&&a3.length){for(var aX=0,aV=a3.length;aX<aV;aX++){aW=a3[aX];if(!aY[aW]){aY[aW]=a.expr.match.POS.test(aW)?a(aW,aU||this.context):aW}}while(a2&&a2.ownerDocument&&a2!==aU){for(aW in aY){aZ=aY[aW];if(aZ.jquery?aZ.index(a2)>-1:a(a2).is(aZ)){a0.push({selector:aW,elem:a2});delete aY[aW]}}a2=a2.parentNode}}return a0}var a1=a.expr.match.POS.test(a3)?a(a3,aU||this.context):null;return this.map(function(a4,a5){while(a5&&a5.ownerDocument&&a5!==aU){if(a1?a1.index(a5)>-1:a(a5).is(a3)){return a5}a5=a5.parentNode}return null})},index:function(aU){if(!aU||typeof aU==="string"){return a.inArray(this[0],aU?a(aU):this.parent().children())}return a.inArray(aU.jquery?aU[0]:aU,this)},add:function(aU,aV){var aX=typeof aU==="string"?a(aU,aV||this.context):a.makeArray(aU),aW=a.merge(this.get(),aX);return this.pushStack(x(aX[0])||x(aW[0])?aW:a.unique(aW))},andSelf:function(){return this.add(this.prevObject)}});function x(aU){return !aU||!aU.parentNode||aU.parentNode.nodeType===11}a.each({parent:function(aV){var aU=aV.parentNode;return aU&&aU.nodeType!==11?aU:null},parents:function(aU){return a.dir(aU,"parentNode")},parentsUntil:function(aV,aU,aW){return a.dir(aV,"parentNode",aW)},next:function(aU){return a.nth(aU,2,"nextSibling")},prev:function(aU){return a.nth(aU,2,"previousSibling")},nextAll:function(aU){return a.dir(aU,"nextSibling")},prevAll:function(aU){return a.dir(aU,"previousSibling")},nextUntil:function(aV,aU,aW){return a.dir(aV,"nextSibling",aW)},prevUntil:function(aV,aU,aW){return a.dir(aV,"previousSibling",aW)},siblings:function(aU){return a.sibling(aU.parentNode.firstChild,aU)},children:function(aU){return a.sibling(aU.firstChild)},contents:function(aU){return a.nodeName(aU,"iframe")?aU.contentDocument||aU.contentWindow.document:a.makeArray(aU.childNodes)}},function(aU,aV){a.fn[aU]=function(aY,aW){var aX=a.map(this,aV,aY);if(!M.test(aU)){aW=aY}if(aW&&typeof aW==="string"){aX=a.filter(aW,aX)}aX=this.length>1?a.unique(aX):aX;if((this.length>1||aH.test(aW))&&X.test(aU)){aX=aX.reverse()}return this.pushStack(aX,aU,D.call(arguments).join(","))}});a.extend({filter:function(aW,aU,aV){if(aV){aW=":not("+aW+")"}return a.find.matches(aW,aU)},dir:function(aW,aV,aY){var aU=[],aX=aW[aV];while(aX&&aX.nodeType!==9&&(aY===B||aX.nodeType!==1||!a(aX).is(aY))){if(aX.nodeType===1){aU.push(aX)}aX=aX[aV]}return aU},nth:function(aY,aU,aW,aX){aU=aU||1;var aV=0;for(;aY;aY=aY[aW]){if(aY.nodeType===1&&++aV===aU){break}}return aY},sibling:function(aW,aV){var aU=[];for(;aW;aW=aW.nextSibling){if(aW.nodeType===1&&aW!==aV){aU.push(aW)}}return aU}});var S=/ jQuery\d+="(?:\d+|null)"/g,Y=/^\s+/,F=/(<([\w:]+)[^>]*?)\/>/g,aj=/^(?:area|br|col|embed|hr|img|input|link|meta|param)$/i,c=/<([\w:]+)/,t=/<tbody/i,J=/<|&\w+;/,l=/checked\s*(?:[^=]|=\s*.checked.)/i,p=function(aV,aW,aU){return aj.test(aU)?aV:aW+"></"+aU+">"},ab={option:[1,"<select multiple='multiple'>","</select>"],legend:[1,"<fieldset>","</fieldset>"],thead:[1,"<table>","</table>"],tr:[2,"<table><tbody>","</tbody></table>"],td:[3,"<table><tbody><tr>","</tr></tbody></table>"],col:[2,"<table><tbody></tbody><colgroup>","</colgroup></table>"],area:[1,"<map>","</map>"],_default:[0,"",""]};ab.optgroup=ab.option;ab.tbody=ab.tfoot=ab.colgroup=ab.caption=ab.thead;ab.th=ab.td;if(!a.support.htmlSerialize){ab._default=[1,"div<div>","</div>"]}a.fn.extend({text:function(aU){if(a.isFunction(aU)){return this.each(function(aW){var aV=a(this);aV.text(aU.call(this,aW,aV.text()))})}if(typeof aU!=="object"&&aU!==B){return this.empty().append((this[0]&&this[0].ownerDocument||aa).createTextNode(aU))}return a.getText(this)},wrapAll:function(aU){if(a.isFunction(aU)){return this.each(function(aW){a(this).wrapAll(aU.call(this,aW))})}if(this[0]){var aV=a(aU,this[0].ownerDocument).eq(0).clone(true);if(this[0].parentNode){aV.insertBefore(this[0])}aV.map(function(){var aW=this;while(aW.firstChild&&aW.firstChild.nodeType===1){aW=aW.firstChild}return aW}).append(this)}return this},wrapInner:function(aU){if(a.isFunction(aU)){return this.each(function(aV){a(this).wrapInner(aU.call(this,aV))})}return this.each(function(){var aV=a(this),aW=aV.contents();if(aW.length){aW.wrapAll(aU)}else{aV.append(aU)}})},wrap:function(aU){return this.each(function(){a(this).wrapAll(aU)})},unwrap:function(){return this.parent().each(function(){if(!a.nodeName(this,"body")){a(this).replaceWith(this.childNodes)}}).end()},append:function(){return this.domManip(arguments,true,function(aU){if(this.nodeType===1){this.appendChild(aU)}})},prepend:function(){return this.domManip(arguments,true,function(aU){if(this.nodeType===1){this.insertBefore(aU,this.firstChild)}})},before:function(){if(this[0]&&this[0].parentNode){return this.domManip(arguments,false,function(aV){this.parentNode.insertBefore(aV,this)})}else{if(arguments.length){var aU=a(arguments[0]);aU.push.apply(aU,this.toArray());return this.pushStack(aU,"before",arguments)}}},after:function(){if(this[0]&&this[0].parentNode){return this.domManip(arguments,false,function(aV){this.parentNode.insertBefore(aV,this.nextSibling)})}else{if(arguments.length){var aU=this.pushStack(this,"after",arguments);aU.push.apply(aU,a(arguments[0]).toArray());return aU}}},clone:function(aV){var aU=this.map(function(){if(!a.support.noCloneEvent&&!a.isXMLDoc(this)){var aX=this.outerHTML,aW=this.ownerDocument;if(!aX){var aY=aW.createElement("div");aY.appendChild(this.cloneNode(true));aX=aY.innerHTML}return a.clean([aX.replace(S,"").replace(Y,"")],aW)[0]}else{return this.cloneNode(true)}});if(aV===true){q(this,aU);q(this.find("*"),aU.find("*"))}return aU},html:function(aW){if(aW===B){return this[0]&&this[0].nodeType===1?this[0].innerHTML.replace(S,""):null}else{if(typeof aW==="string"&&!/<script/i.test(aW)&&(a.support.leadingWhitespace||!Y.test(aW))&&!ab[(c.exec(aW)||["",""])[1].toLowerCase()]){aW=aW.replace(F,p);try{for(var aV=0,aU=this.length;aV<aU;aV++){if(this[aV].nodeType===1){a.cleanData(this[aV].getElementsByTagName("*"));this[aV].innerHTML=aW}}}catch(aX){this.empty().append(aW)}}else{if(a.isFunction(aW)){this.each(function(a0){var aZ=a(this),aY=aZ.html();aZ.empty().append(function(){return aW.call(this,a0,aY)})})}else{this.empty().append(aW)}}}return this},replaceWith:function(aU){if(this[0]&&this[0].parentNode){if(!a.isFunction(aU)){aU=a(aU).detach()}else{return this.each(function(aX){var aW=a(this),aV=aW.html();aW.replaceWith(aU.call(this,aX,aV))})}return this.each(function(){var aW=this.nextSibling,aV=this.parentNode;a(this).remove();if(aW){a(aW).before(aU)}else{a(aV).append(aU)}})}else{return this.pushStack(a(a.isFunction(aU)?aU():aU),"replaceWith",aU)}},detach:function(aU){return this.remove(aU,true)},domManip:function(aZ,a3,a2){var aW,aY,a1=aZ[0],aV=[];if(!a.support.checkClone&&arguments.length===3&&typeof a1==="string"&&l.test(a1)){return this.each(function(){a(this).domManip(aZ,a3,a2,true)})}if(a.isFunction(a1)){return this.each(function(a5){var a4=a(this);aZ[0]=a1.call(this,a5,a3?a4.html():B);a4.domManip(aZ,a3,a2)})}if(this[0]){if(aZ[0]&&aZ[0].parentNode&&aZ[0].parentNode.nodeType===11){aW={fragment:aZ[0].parentNode}}else{aW=H(aZ,this,aV)}aY=aW.fragment.firstChild;if(aY){a3=a3&&a.nodeName(aY,"tr");for(var aX=0,aU=this.length;aX<aU;aX++){a2.call(a3?a0(this[aX],aY):this[aX],aW.cacheable||this.length>1||aX>0?aW.fragment.cloneNode(true):aW.fragment)}}if(aV){a.each(aV,aR)}}return this;function a0(a4,a5){return a.nodeName(a4,"table")?(a4.getElementsByTagName("tbody")[0]||a4.appendChild(a4.ownerDocument.createElement("tbody"))):a4}}});function q(aW,aU){var aV=0;aU.each(function(){if(this.nodeName!==(aW[aV]&&aW[aV].nodeName)){return}var a1=a.data(aW[aV++]),a0=a.data(this,a1),aX=a1&&a1.events;if(aX){delete a0.handle;a0.events={};for(var aZ in aX){for(var aY in aX[aZ]){a.event.add(this,aZ,aX[aZ][aY],aX[aZ][aY].data)}}}})}function H(aZ,aX,aV){var aY,aU,aW,a0;if(aZ.length===1&&typeof aZ[0]==="string"&&aZ[0].length<512&&aZ[0].indexOf("<option")<0&&(a.support.checkClone||!l.test(aZ[0]))){aU=true;aW=a.fragments[aZ[0]];if(aW){if(aW!==1){aY=aW}}}if(!aY){a0=(aX&&aX[0]?aX[0].ownerDocument||aX[0]:aa);aY=a0.createDocumentFragment();a.clean(aZ,a0,aY,aV)}if(aU){a.fragments[aZ[0]]=aW?aY:1}return{fragment:aY,cacheable:aU}}a.fragments={};a.each({appendTo:"append",prependTo:"prepend",insertBefore:"before",insertAfter:"after",replaceAll:"replaceWith"},function(aU,aV){a.fn[aU]=function(aW){var aZ=[],a1=a(aW);for(var a0=0,aX=a1.length;a0<aX;a0++){var aY=(a0>0?this.clone(true):this).get();a.fn[aV].apply(a(a1[a0]),aY);aZ=aZ.concat(aY)}return this.pushStack(aZ,aU,a1.selector)}});a.each({remove:function(aU,aV){if(!aU||a.filter(aU,[this]).length){if(!aV&&this.nodeType===1){a.cleanData(this.getElementsByTagName("*"));a.cleanData([this])}if(this.parentNode){this.parentNode.removeChild(this)}}},empty:function(){if(this.nodeType===1){a.cleanData(this.getElementsByTagName("*"))}while(this.firstChild){this.removeChild(this.firstChild)}}},function(aU,aV){a.fn[aU]=function(){return this.each(aV,arguments)}});a.extend({clean:function(aV,aZ,aX,aU){aZ=aZ||aa;if(typeof aZ.createElement==="undefined"){aZ=aZ.ownerDocument||aZ[0]&&aZ[0].ownerDocument||aa}var aW=[];a.each(aV,function(a6,a3){if(typeof a3==="number"){a3+=""}if(!a3){return}if(typeof a3==="string"&&!J.test(a3)){a3=aZ.createTextNode(a3)}else{if(typeof a3==="string"){a3=a3.replace(F,p);var a8=(c.exec(a3)||["",""])[1].toLowerCase(),a2=ab[a8]||ab._default,a5=a2[0],a0=aZ.createElement("div");a0.innerHTML=a2[1]+a3+a2[2];while(a5--){a0=a0.lastChild}if(!a.support.tbody){var a1=t.test(a3),a7=a8==="table"&&!a1?a0.firstChild&&a0.firstChild.childNodes:a2[1]==="<table>"&&!a1?a0.childNodes:[];for(var a4=a7.length-1;a4>=0;--a4){if(a.nodeName(a7[a4],"tbody")&&!a7[a4].childNodes.length){a7[a4].parentNode.removeChild(a7[a4])}}}if(!a.support.leadingWhitespace&&Y.test(a3)){a0.insertBefore(aZ.createTextNode(Y.exec(a3)[0]),a0.firstChild)}a3=a.makeArray(a0.childNodes)}}if(a3.nodeType){aW.push(a3)}else{aW=a.merge(aW,a3)}});if(aX){for(var aY=0;aW[aY];aY++){if(aU&&a.nodeName(aW[aY],"script")&&(!aW[aY].type||aW[aY].type.toLowerCase()==="text/javascript")){aU.push(aW[aY].parentNode?aW[aY].parentNode.removeChild(aW[aY]):aW[aY])}else{if(aW[aY].nodeType===1){aW.splice.apply(aW,[aY+1,0].concat(a.makeArray(aW[aY].getElementsByTagName("script"))))}aX.appendChild(aW[aY])}}}return aW},cleanData:function(aU){for(var aV=0,aW,aX;(aW=aU[aV])!=null;aV++){a.event.remove(aW);a.removeData(aW)}}});var ap=/z-?index|font-?weight|opacity|zoom|line-?height/i,T=/alpha\([^)]*\)/,Z=/opacity=([^)]*)/,af=/float/i,aw=/-([a-z])/ig,v=/([A-Z])/g,aK=/^-?\d+(?:px)?$/i,aQ=/^-?\d/,aG={position:"absolute",visibility:"hidden",display:"block"},V=["Left","Right"],aA=["Top","Bottom"],ai=aa.defaultView&&aa.defaultView.getComputedStyle,aJ=a.support.cssFloat?"cssFloat":"styleFloat",k=function(aU,aV){return aV.toUpperCase()};a.fn.css=function(aU,aV){return al(this,aU,aV,true,function(aX,aW,aY){if(aY===B){return a.curCSS(aX,aW)}if(typeof aY==="number"&&!ap.test(aW)){aY+="px"}a.style(aX,aW,aY)})};a.extend({style:function(aY,aV,aZ){if(!aY||aY.nodeType===3||aY.nodeType===8){return B}if((aV==="width"||aV==="height")&&parseFloat(aZ)<0){aZ=B}var aX=aY.style||aY,a0=aZ!==B;if(!a.support.opacity&&aV==="opacity"){if(a0){aX.zoom=1;var aU=parseInt(aZ,10)+""==="NaN"?"":"alpha(opacity="+aZ*100+")";var aW=aX.filter||a.curCSS(aY,"filter")||"";aX.filter=T.test(aW)?aW.replace(T,aU):aU}return aX.filter&&aX.filter.indexOf("opacity=")>=0?(parseFloat(Z.exec(aX.filter)[1])/100)+"":""}if(af.test(aV)){aV=aJ}aV=aV.replace(aw,k);if(a0){aX[aV]=aZ}return aX[aV]},css:function(aX,aV,aZ,aU){if(aV==="width"||aV==="height"){var a1,aW=aG,a0=aV==="width"?V:aA;function aY(){a1=aV==="width"?aX.offsetWidth:aX.offsetHeight;if(aU==="border"){return}a.each(a0,function(){if(!aU){a1-=parseFloat(a.curCSS(aX,"padding"+this,true))||0}if(aU==="margin"){a1+=parseFloat(a.curCSS(aX,"margin"+this,true))||0}else{a1-=parseFloat(a.curCSS(aX,"border"+this+"Width",true))||0}})}if(aX.offsetWidth!==0){aY()}else{a.swap(aX,aW,aY)}return Math.max(0,Math.round(a1))}return a.curCSS(aX,aV,aZ)},curCSS:function(a0,aV,aW){var a3,aU=a0.style,aX;if(!a.support.opacity&&aV==="opacity"&&a0.currentStyle){a3=Z.test(a0.currentStyle.filter||"")?(parseFloat(RegExp.$1)/100)+"":"";return a3===""?"1":a3}if(af.test(aV)){aV=aJ}if(!aW&&aU&&aU[aV]){a3=aU[aV]}else{if(ai){if(af.test(aV)){aV="float"}aV=aV.replace(v,"-$1").toLowerCase();var a2=a0.ownerDocument.defaultView;if(!a2){return null}var a4=a2.getComputedStyle(a0,null);if(a4){a3=a4.getPropertyValue(aV)}if(aV==="opacity"&&a3===""){a3="1"}}else{if(a0.currentStyle){var aZ=aV.replace(aw,k);a3=a0.currentStyle[aV]||a0.currentStyle[aZ];if(!aK.test(a3)&&aQ.test(a3)){var aY=aU.left,a1=a0.runtimeStyle.left;a0.runtimeStyle.left=a0.currentStyle.left;aU.left=aZ==="fontSize"?"1em":(a3||0);a3=aU.pixelLeft+"px";aU.left=aY;a0.runtimeStyle.left=a1}}}}return a3},swap:function(aX,aW,aY){var aU={};for(var aV in aW){aU[aV]=aX.style[aV];aX.style[aV]=aW[aV]}aY.call(aX);for(var aV in aW){aX.style[aV]=aU[aV]}}});if(a.expr&&a.expr.filters){a.expr.filters.hidden=function(aX){var aV=aX.offsetWidth,aU=aX.offsetHeight,aW=aX.nodeName.toLowerCase()==="tr";return aV===0&&aU===0&&!aW?true:aV>0&&aU>0&&!aW?false:a.curCSS(aX,"display")==="none"};a.expr.filters.visible=function(aU){return !a.expr.filters.hidden(aU)}}var ae=aL(),aF=/<script(.|\s)*?\/script>/gi,o=/select|textarea/i,ay=/color|date|datetime|email|hidden|month|number|password|range|search|tel|text|time|url|week/i,r=/=\?(&|$)/,C=/\?/,aT=/(\?|&)_=.*?(&|$)/,A=/^(\w+:)?\/\/([^\/?#]+)/,h=/%20/g;a.fn.extend({_load:a.fn.load,load:function(aW,aZ,a0){if(typeof aW!=="string"){return this._load(aW)}else{if(!this.length){return this}}var aY=aW.indexOf(" ");if(aY>=0){var aU=aW.slice(aY,aW.length);aW=aW.slice(0,aY)}var aX="GET";if(aZ){if(a.isFunction(aZ)){a0=aZ;aZ=null}else{if(typeof aZ==="object"){aZ=a.param(aZ,a.ajaxSettings.traditional);aX="POST"}}}var aV=this;a.ajax({url:aW,type:aX,dataType:"html",data:aZ,complete:function(a2,a1){if(a1==="success"||a1==="notmodified"){aV.html(aU?a("<div />").append(a2.responseText.replace(aF,"")).find(aU):a2.responseText)}if(a0){aV.each(a0,[a2.responseText,a1,a2])}}});return this},serialize:function(){return a.param(this.serializeArray())},serializeArray:function(){return this.map(function(){return this.elements?a.makeArray(this.elements):this}).filter(function(){return this.name&&!this.disabled&&(this.checked||o.test(this.nodeName)||ay.test(this.type))}).map(function(aU,aV){var aW=a(this).val();return aW==null?null:a.isArray(aW)?a.map(aW,function(aY,aX){return{name:aV.name,value:aY}}):{name:aV.name,value:aW}}).get()}});a.each("ajaxStart ajaxStop ajaxComplete ajaxError ajaxSuccess ajaxSend".split(" "),function(aU,aV){a.fn[aV]=function(aW){return this.bind(aV,aW)}});a.extend({get:function(aU,aW,aX,aV){if(a.isFunction(aW)){aV=aV||aX;aX=aW;aW=null}return a.ajax({type:"GET",url:aU,data:aW,success:aX,dataType:aV})},getScript:function(aU,aV){return a.get(aU,null,aV,"script")},getJSON:function(aU,aV,aW){return a.get(aU,aV,aW,"json")},post:function(aU,aW,aX,aV){if(a.isFunction(aW)){aV=aV||aX;aX=aW;aW={}}return a.ajax({type:"POST",url:aU,data:aW,success:aX,dataType:aV})},ajaxSetup:function(aU){a.extend(a.ajaxSettings,aU)},ajaxSettings:{url:location.href,global:true,type:"GET",contentType:"application/x-www-form-urlencoded",processData:true,async:true,xhr:aI.XMLHttpRequest&&(aI.location.protocol!=="file:"||!aI.ActiveXObject)?function(){return new aI.XMLHttpRequest()}:function(){try{return new aI.ActiveXObject("Microsoft.XMLHTTP")}catch(aU){}},accepts:{xml:"application/xml, text/xml",html:"text/html",script:"text/javascript, application/javascript",json:"application/json, text/javascript",text:"text/plain",_default:"*/*"}},lastModified:{},etag:{},ajax:function(a9){var a4=a.extend(true,{},a.ajaxSettings,a9);var be,a8,bd,bf=a9&&a9.context||a4,aW=a4.type.toUpperCase();if(a4.data&&a4.processData&&typeof a4.data!=="string"){a4.data=a.param(a4.data,a4.traditional)}if(a4.dataType==="jsonp"){if(aW==="GET"){if(!r.test(a4.url)){a4.url+=(C.test(a4.url)?"&":"?")+(a4.jsonp||"callback")+"=?"}}else{if(!a4.data||!r.test(a4.data)){a4.data=(a4.data?a4.data+"&":"")+(a4.jsonp||"callback")+"=?"}}a4.dataType="json"}if(a4.dataType==="json"&&(a4.data&&r.test(a4.data)||r.test(a4.url))){be=a4.jsonpCallback||("jsonp"+ae++);if(a4.data){a4.data=(a4.data+"").replace(r,"="+be+"$1")}a4.url=a4.url.replace(r,"="+be+"$1");a4.dataType="script";aI[be]=aI[be]||function(bg){bd=bg;aZ();a2();aI[be]=B;try{delete aI[be]}catch(bh){}if(aX){aX.removeChild(bb)}}}if(a4.dataType==="script"&&a4.cache===null){a4.cache=false}if(a4.cache===false&&aW==="GET"){var aU=aL();var bc=a4.url.replace(aT,"$1_="+aU+"$2");a4.url=bc+((bc===a4.url)?(C.test(a4.url)?"&":"?")+"_="+aU:"")}if(a4.data&&aW==="GET"){a4.url+=(C.test(a4.url)?"&":"?")+a4.data}if(a4.global&&!a.active++){a.event.trigger("ajaxStart")}var a7=A.exec(a4.url),aY=a7&&(a7[1]&&a7[1]!==location.protocol||a7[2]!==location.host);if(a4.dataType==="script"&&aW==="GET"&&aY){var aX=aa.getElementsByTagName("head")[0]||aa.documentElement;var bb=aa.createElement("script");bb.src=a4.url;if(a4.scriptCharset){bb.charset=a4.scriptCharset}if(!be){var a6=false;bb.onload=bb.onreadystatechange=function(){if(!a6&&(!this.readyState||this.readyState==="loaded"||this.readyState==="complete")){a6=true;aZ();a2();bb.onload=bb.onreadystatechange=null;if(aX&&bb.parentNode){aX.removeChild(bb)}}}}aX.insertBefore(bb,aX.firstChild);return B}var a1=false;var a0=a4.xhr();if(!a0){return}if(a4.username){a0.open(aW,a4.url,a4.async,a4.username,a4.password)}else{a0.open(aW,a4.url,a4.async)}try{if(a4.data||a9&&a9.contentType){a0.setRequestHeader("Content-Type",a4.contentType)}if(a4.ifModified){if(a.lastModified[a4.url]){a0.setRequestHeader("If-Modified-Since",a.lastModified[a4.url])}if(a.etag[a4.url]){a0.setRequestHeader("If-None-Match",a.etag[a4.url])}}if(!aY){a0.setRequestHeader("X-Requested-With","XMLHttpRequest")}a0.setRequestHeader("Accept",a4.dataType&&a4.accepts[a4.dataType]?a4.accepts[a4.dataType]+", */*":a4.accepts._default)}catch(ba){}if(a4.beforeSend&&a4.beforeSend.call(bf,a0,a4)===false){if(a4.global&&!--a.active){a.event.trigger("ajaxStop")}a0.abort();return false}if(a4.global){a5("ajaxSend",[a0,a4])}var a3=a0.onreadystatechange=function(bg){if(!a0||a0.readyState===0||bg==="abort"){if(!a1){a2()}a1=true;if(a0){a0.onreadystatechange=a.noop}}else{if(!a1&&a0&&(a0.readyState===4||bg==="timeout")){a1=true;a0.onreadystatechange=a.noop;a8=bg==="timeout"?"timeout":!a.httpSuccess(a0)?"error":a4.ifModified&&a.httpNotModified(a0,a4.url)?"notmodified":"success";var bi;if(a8==="success"){try{bd=a.httpData(a0,a4.dataType,a4)}catch(bh){a8="parsererror";bi=bh}}if(a8==="success"||a8==="notmodified"){if(!be){aZ()}}else{a.handleError(a4,a0,a8,bi)}a2();if(bg==="timeout"){a0.abort()}if(a4.async){a0=null}}}};try{var aV=a0.abort;a0.abort=function(){if(a0){aV.call(a0)}a3("abort")}}catch(ba){}if(a4.async&&a4.timeout>0){setTimeout(function(){if(a0&&!a1){a3("timeout")}},a4.timeout)}try{a0.send(aW==="POST"||aW==="PUT"||aW==="DELETE"?a4.data:null)}catch(ba){a.handleError(a4,a0,null,ba);a2()}if(!a4.async){a3()}function aZ(){if(a4.success){a4.success.call(bf,bd,a8,a0)}if(a4.global){a5("ajaxSuccess",[a0,a4])}}function a2(){if(a4.complete){a4.complete.call(bf,a0,a8)}if(a4.global){a5("ajaxComplete",[a0,a4])}if(a4.global&&!--a.active){a.event.trigger("ajaxStop")}}function a5(bh,bg){(a4.context?a(a4.context):a.event).trigger(bh,bg)}return a0},handleError:function(aV,aX,aU,aW){if(aV.error){aV.error.call(aV.context||aV,aX,aU,aW)}if(aV.global){(aV.context?a(aV.context):a.event).trigger("ajaxError",[aX,aV,aW])}},active:0,httpSuccess:function(aV){try{return !aV.status&&location.protocol==="file:"||(aV.status>=200&&aV.status<300)||aV.status===304||aV.status===1223||aV.status===0}catch(aU){}return false},httpNotModified:function(aX,aU){var aW=aX.getResponseHeader("Last-Modified"),aV=aX.getResponseHeader("Etag");if(aW){a.lastModified[aU]=aW}if(aV){a.etag[aU]=aV}return aX.status===304||aX.status===0},httpData:function(aZ,aX,aW){var aV=aZ.getResponseHeader("content-type")||"",aU=aX==="xml"||!aX&&aV.indexOf("xml")>=0,aY=aU?aZ.responseXML:aZ.responseText;if(aU&&aY.documentElement.nodeName==="parsererror"){a.error("parsererror")}if(aW&&aW.dataFilter){aY=aW.dataFilter(aY,aX)}if(typeof aY==="string"){if(aX==="json"||!aX&&aV.indexOf("json")>=0){aY=a.parseJSON(aY)}else{if(aX==="script"||!aX&&aV.indexOf("javascript")>=0){a.globalEval(aY)}}}return aY},param:function(aU,aX){var aV=[];if(aX===B){aX=a.ajaxSettings.traditional}if(a.isArray(aU)||aU.jquery){a.each(aU,function(){aZ(this.name,this.value)})}else{for(var aY in aU){aW(aY,aU[aY])}}return aV.join("&").replace(h,"+");function aW(a0,a1){if(a.isArray(a1)){a.each(a1,function(a3,a2){if(aX){aZ(a0,a2)}else{aW(a0+"["+(typeof a2==="object"||a.isArray(a2)?a3:"")+"]",a2)}})}else{if(!aX&&a1!=null&&typeof a1==="object"){a.each(a1,function(a3,a2){aW(a0+"["+a3+"]",a2)})}else{aZ(a0,a1)}}}function aZ(a0,a1){a1=a.isFunction(a1)?a1():a1;aV[aV.length]=encodeURIComponent(a0)+"="+encodeURIComponent(a1)}}});var E={},ad=/toggle|show|hide/,ar=/^([+-]=)?([\d+-.]+)(.*)$/,aB,ah=[["height","marginTop","marginBottom","paddingTop","paddingBottom"],["width","marginLeft","marginRight","paddingLeft","paddingRight"],["opacity"]];a.fn.extend({show:function(aV,a3){if(aV||aV===0){return this.animate(az("show",3),aV,a3)}else{for(var a0=0,aX=this.length;a0<aX;a0++){var aU=a.data(this[a0],"olddisplay");this[a0].style.display=aU||"";if(a.css(this[a0],"display")==="none"){var a2=this[a0].nodeName,a1;if(E[a2]){a1=E[a2]}else{var aW=a("<"+a2+" />").appendTo("body");a1=aW.css("display");if(a1==="none"){a1="block"}aW.remove();E[a2]=a1}a.data(this[a0],"olddisplay",a1)}}for(var aZ=0,aY=this.length;aZ<aY;aZ++){this[aZ].style.display=a.data(this[aZ],"olddisplay")||""}return this}},hide:function(aZ,a0){if(aZ||aZ===0){return this.animate(az("hide",3),aZ,a0)}else{for(var aY=0,aV=this.length;aY<aV;aY++){var aU=a.data(this[aY],"olddisplay");if(!aU&&aU!=="none"){a.data(this[aY],"olddisplay",a.css(this[aY],"display"))}}for(var aX=0,aW=this.length;aX<aW;aX++){this[aX].style.display="none"}return this}},_toggle:a.fn.toggle,toggle:function(aW,aV){var aU=typeof aW==="boolean";if(a.isFunction(aW)&&a.isFunction(aV)){this._toggle.apply(this,arguments)}else{if(aW==null||aU){this.each(function(){var aX=aU?aW:a(this).is(":hidden");a(this)[aX?"show":"hide"]()})}else{this.animate(az("toggle",3),aW,aV)}}return this},fadeTo:function(aU,aW,aV){return this.filter(":hidden").css("opacity",0).show().end().animate({opacity:aW},aU,aV)},animate:function(aY,aV,aX,aW){var aU=a.speed(aV,aX,aW);if(a.isEmptyObject(aY)){return this.each(aU.complete)}return this[aU.queue===false?"each":"queue"](function(){var a1=a.extend({},aU),a3,a2=this.nodeType===1&&a(this).is(":hidden"),aZ=this;for(a3 in aY){var a0=a3.replace(aw,k);if(a3!==a0){aY[a0]=aY[a3];delete aY[a3];a3=a0}if(aY[a3]==="hide"&&a2||aY[a3]==="show"&&!a2){return a1.complete.call(this)}if((a3==="height"||a3==="width")&&this.style){a1.display=a.css(this,"display");a1.overflow=this.style.overflow}if(a.isArray(aY[a3])){(a1.specialEasing=a1.specialEasing||{})[a3]=aY[a3][1];aY[a3]=aY[a3][0]}}if(a1.overflow!=null){this.style.overflow="hidden"}a1.curAnim=a.extend({},aY);a.each(aY,function(a5,a9){var a8=new a.fx(aZ,a1,a5);if(ad.test(a9)){a8[a9==="toggle"?a2?"show":"hide":a9](aY)}else{var a7=ar.exec(a9),ba=a8.cur(true)||0;if(a7){var a4=parseFloat(a7[2]),a6=a7[3]||"px";if(a6!=="px"){aZ.style[a5]=(a4||1)+a6;ba=((a4||1)/a8.cur(true))*ba;aZ.style[a5]=ba+a6}if(a7[1]){a4=((a7[1]==="-="?-1:1)*a4)+ba}a8.custom(ba,a4,a6)}else{a8.custom(ba,a9,"")}}});return true})},stop:function(aV,aU){var aW=a.timers;if(aV){this.queue([])}this.each(function(){for(var aX=aW.length-1;aX>=0;aX--){if(aW[aX].elem===this){if(aU){aW[aX](true)}aW.splice(aX,1)}}});if(!aU){this.dequeue()}return this}});a.each({slideDown:az("show",1),slideUp:az("hide",1),slideToggle:az("toggle",1),fadeIn:{opacity:"show"},fadeOut:{opacity:"hide"}},function(aU,aV){a.fn[aU]=function(aW,aX){return this.animate(aV,aW,aX)}});a.extend({speed:function(aW,aX,aV){var aU=aW&&typeof aW==="object"?aW:{complete:aV||!aV&&aX||a.isFunction(aW)&&aW,duration:aW,easing:aV&&aX||aX&&!a.isFunction(aX)&&aX};aU.duration=a.fx.off?0:typeof aU.duration==="number"?aU.duration:a.fx.speeds[aU.duration]||a.fx.speeds._default;aU.old=aU.complete;aU.complete=function(){if(aU.queue!==false){a(this).dequeue()}if(a.isFunction(aU.old)){aU.old.call(this)}};return aU},easing:{linear:function(aW,aX,aU,aV){return aU+aV*aW},swing:function(aW,aX,aU,aV){return((-Math.cos(aW*Math.PI)/2)+0.5)*aV+aU}},timers:[],fx:function(aV,aU,aW){this.options=aU;this.elem=aV;this.prop=aW;if(!aU.orig){aU.orig={}}}});a.fx.prototype={update:function(){if(this.options.step){this.options.step.call(this.elem,this.now,this)}(a.fx.step[this.prop]||a.fx.step._default)(this);if((this.prop==="height"||this.prop==="width")&&this.elem.style){this.elem.style.display="block"}},cur:function(aV){if(this.elem[this.prop]!=null&&(!this.elem.style||this.elem.style[this.prop]==null)){return this.elem[this.prop]}var aU=parseFloat(a.css(this.elem,this.prop,aV));return aU&&aU>-10000?aU:parseFloat(a.curCSS(this.elem,this.prop))||0},custom:function(aY,aX,aW){this.startTime=aL();this.start=aY;this.end=aX;this.unit=aW||this.unit||"px";this.now=this.start;this.pos=this.state=0;var aU=this;function aV(aZ){return aU.step(aZ)}aV.elem=this.elem;if(aV()&&a.timers.push(aV)&&!aB){aB=setInterval(a.fx.tick,13)}},show:function(){this.options.orig[this.prop]=a.style(this.elem,this.prop);this.options.show=true;this.custom(this.prop==="width"||this.prop==="height"?1:0,this.cur());a(this.elem).show()},hide:function(){this.options.orig[this.prop]=a.style(this.elem,this.prop);this.options.hide=true;this.custom(this.cur(),0)},step:function(aX){var a2=aL(),aY=true;if(aX||a2>=this.options.duration+this.startTime){this.now=this.end;this.pos=this.state=1;this.update();this.options.curAnim[this.prop]=true;for(var aZ in this.options.curAnim){if(this.options.curAnim[aZ]!==true){aY=false}}if(aY){if(this.options.display!=null){this.elem.style.overflow=this.options.overflow;var aW=a.data(this.elem,"olddisplay");this.elem.style.display=aW?aW:this.options.display;if(a.css(this.elem,"display")==="none"){this.elem.style.display="block"}}if(this.options.hide){a(this.elem).hide()}if(this.options.hide||this.options.show){for(var aU in this.options.curAnim){a.style(this.elem,aU,this.options.orig[aU])}}this.options.complete.call(this.elem)}return false}else{var aV=a2-this.startTime;this.state=aV/this.options.duration;var a0=this.options.specialEasing&&this.options.specialEasing[this.prop];var a1=this.options.easing||(a.easing.swing?"swing":"linear");this.pos=a.easing[a0||a1](this.state,aV,0,1,this.options.duration);this.now=this.start+((this.end-this.start)*this.pos);this.update()}return true}};a.extend(a.fx,{tick:function(){var aV=a.timers;for(var aU=0;aU<aV.length;aU++){if(!aV[aU]()){aV.splice(aU--,1)}}if(!aV.length){a.fx.stop()}},stop:function(){clearInterval(aB);aB=null},speeds:{slow:600,fast:200,_default:400},step:{opacity:function(aU){a.style(aU.elem,"opacity",aU.now)},_default:function(aU){if(aU.elem.style&&aU.elem.style[aU.prop]!=null){aU.elem.style[aU.prop]=(aU.prop==="width"||aU.prop==="height"?Math.max(0,aU.now):aU.now)+aU.unit}else{aU.elem[aU.prop]=aU.now}}}});if(a.expr&&a.expr.filters){a.expr.filters.animated=function(aU){return a.grep(a.timers,function(aV){return aU===aV.elem}).length}}function az(aV,aU){var aW={};a.each(ah.concat.apply([],ah.slice(0,aU)),function(){aW[this]=aV});return aW}if("getBoundingClientRect" in aa.documentElement){a.fn.offset=function(a3){var aW=this[0];if(a3){return this.each(function(a4){a.offset.setOffset(this,a3,a4)})}if(!aW||!aW.ownerDocument){return null}if(aW===aW.ownerDocument.body){return a.offset.bodyOffset(aW)}var aY=aW.getBoundingClientRect(),a2=aW.ownerDocument,aZ=a2.body,aU=a2.documentElement,aX=aU.clientTop||aZ.clientTop||0,a0=aU.clientLeft||aZ.clientLeft||0,a1=aY.top+(self.pageYOffset||a.support.boxModel&&aU.scrollTop||aZ.scrollTop)-aX,aV=aY.left+(self.pageXOffset||a.support.boxModel&&aU.scrollLeft||aZ.scrollLeft)-a0;return{top:a1,left:aV}}}else{a.fn.offset=function(a5){var aZ=this[0];if(a5){return this.each(function(a6){a.offset.setOffset(this,a5,a6)})}if(!aZ||!aZ.ownerDocument){return null}if(aZ===aZ.ownerDocument.body){return a.offset.bodyOffset(aZ)}a.offset.initialize();var aW=aZ.offsetParent,aV=aZ,a4=aZ.ownerDocument,a2,aX=a4.documentElement,a0=a4.body,a1=a4.defaultView,aU=a1?a1.getComputedStyle(aZ,null):aZ.currentStyle,a3=aZ.offsetTop,aY=aZ.offsetLeft;while((aZ=aZ.parentNode)&&aZ!==a0&&aZ!==aX){if(a.offset.supportsFixedPosition&&aU.position==="fixed"){break}a2=a1?a1.getComputedStyle(aZ,null):aZ.currentStyle;a3-=aZ.scrollTop;aY-=aZ.scrollLeft;if(aZ===aW){a3+=aZ.offsetTop;aY+=aZ.offsetLeft;if(a.offset.doesNotAddBorder&&!(a.offset.doesAddBorderForTableAndCells&&/^t(able|d|h)$/i.test(aZ.nodeName))){a3+=parseFloat(a2.borderTopWidth)||0;aY+=parseFloat(a2.borderLeftWidth)||0}aV=aW,aW=aZ.offsetParent}if(a.offset.subtractsBorderForOverflowNotVisible&&a2.overflow!=="visible"){a3+=parseFloat(a2.borderTopWidth)||0;aY+=parseFloat(a2.borderLeftWidth)||0}aU=a2}if(aU.position==="relative"||aU.position==="static"){a3+=a0.offsetTop;aY+=a0.offsetLeft}if(a.offset.supportsFixedPosition&&aU.position==="fixed"){a3+=Math.max(aX.scrollTop,a0.scrollTop);aY+=Math.max(aX.scrollLeft,a0.scrollLeft)}return{top:a3,left:aY}}}a.offset={initialize:function(){var aU=aa.body,aV=aa.createElement("div"),aY,a0,aZ,a1,aW=parseFloat(a.curCSS(aU,"marginTop",true))||0,aX="<div style='position:absolute;top:0;left:0;margin:0;border:5px solid #000;padding:0;width:1px;height:1px;'><div></div></div><table style='position:absolute;top:0;left:0;margin:0;border:5px solid #000;padding:0;width:1px;height:1px;' cellpadding='0' cellspacing='0'><tr><td></td></tr></table>";a.extend(aV.style,{position:"absolute",top:0,left:0,margin:0,border:0,width:"1px",height:"1px",visibility:"hidden"});aV.innerHTML=aX;aU.insertBefore(aV,aU.firstChild);aY=aV.firstChild;a0=aY.firstChild;a1=aY.nextSibling.firstChild.firstChild;this.doesNotAddBorder=(a0.offsetTop!==5);this.doesAddBorderForTableAndCells=(a1.offsetTop===5);a0.style.position="fixed",a0.style.top="20px";this.supportsFixedPosition=(a0.offsetTop===20||a0.offsetTop===15);a0.style.position=a0.style.top="";aY.style.overflow="hidden",aY.style.position="relative";this.subtractsBorderForOverflowNotVisible=(a0.offsetTop===-5);this.doesNotIncludeMarginInBodyOffset=(aU.offsetTop!==aW);aU.removeChild(aV);aU=aV=aY=a0=aZ=a1=null;a.offset.initialize=a.noop},bodyOffset:function(aU){var aW=aU.offsetTop,aV=aU.offsetLeft;a.offset.initialize();if(a.offset.doesNotIncludeMarginInBodyOffset){aW+=parseFloat(a.curCSS(aU,"marginTop",true))||0;aV+=parseFloat(a.curCSS(aU,"marginLeft",true))||0}return{top:aW,left:aV}},setOffset:function(aZ,aV,aW){if(/static/.test(a.curCSS(aZ,"position"))){aZ.style.position="relative"}var aY=a(aZ),a1=aY.offset(),aU=parseInt(a.curCSS(aZ,"top",true),10)||0,a0=parseInt(a.curCSS(aZ,"left",true),10)||0;if(a.isFunction(aV)){aV=aV.call(aZ,aW,a1)}var aX={top:(aV.top-a1.top)+aU,left:(aV.left-a1.left)+a0};if("using" in aV){aV.using.call(aZ,aX)}else{aY.css(aX)}}};a.fn.extend({position:function(){if(!this[0]){return null}var aW=this[0],aV=this.offsetParent(),aX=this.offset(),aU=/^body|html$/i.test(aV[0].nodeName)?{top:0,left:0}:aV.offset();aX.top-=parseFloat(a.curCSS(aW,"marginTop",true))||0;aX.left-=parseFloat(a.curCSS(aW,"marginLeft",true))||0;aU.top+=parseFloat(a.curCSS(aV[0],"borderTopWidth",true))||0;aU.left+=parseFloat(a.curCSS(aV[0],"borderLeftWidth",true))||0;return{top:aX.top-aU.top,left:aX.left-aU.left}},offsetParent:function(){return this.map(function(){var aU=this.offsetParent||aa.body;while(aU&&(!/^body|html$/i.test(aU.nodeName)&&a.css(aU,"position")==="static")){aU=aU.offsetParent}return aU})}});a.each(["Left","Top"],function(aV,aU){var aW="scroll"+aU;a.fn[aW]=function(aZ){var aX=this[0],aY;if(!aX){return null}if(aZ!==B){return this.each(function(){aY=ak(this);if(aY){aY.scrollTo(!aV?aZ:a(aY).scrollLeft(),aV?aZ:a(aY).scrollTop())}else{this[aW]=aZ}})}else{aY=ak(aX);return aY?("pageXOffset" in aY)?aY[aV?"pageYOffset":"pageXOffset"]:a.support.boxModel&&aY.document.documentElement[aW]||aY.document.body[aW]:aX[aW]}}});function ak(aU){return("scrollTo" in aU&&aU.document)?aU:aU.nodeType===9?aU.defaultView||aU.parentWindow:false}a.each(["Height","Width"],function(aV,aU){var aW=aU.toLowerCase();a.fn["inner"+aU]=function(){return this[0]?a.css(this[0],aW,false,"padding"):null};a.fn["outer"+aU]=function(aX){return this[0]?a.css(this[0],aW,false,aX?"margin":"border"):null};a.fn[aW]=function(aX){var aY=this[0];if(!aY){return aX==null?null:this}if(a.isFunction(aX)){return this.each(function(a0){var aZ=a(this);aZ[aW](aX.call(this,a0,aZ[aW]()))})}return("scrollTo" in aY&&aY.document)?aY.document.compatMode==="CSS1Compat"&&aY.document.documentElement["client"+aU]||aY.document.body["client"+aU]:(aY.nodeType===9)?Math.max(aY.documentElement["client"+aU],aY.body["scroll"+aU],aY.documentElement["scroll"+aU],aY.body["offset"+aU],aY.documentElement["offset"+aU]):aX===B?a.css(aY,aW):this.css(aW,typeof aX==="string"?aX:aX+"px")}});aI.jQuery=aI.$=a})(window);window.djdt=(function(b,a,e){e.cookie=function(h,p,s){if(typeof p!="undefined"){s=s||{};if(p===null){p="";s.expires=-1}var l="";if(s.expires&&(typeof s.expires=="number"||s.expires.toUTCString)){var m;if(typeof s.expires=="number"){m=new Date();m.setTime(m.getTime()+(s.expires*24*60*60*1000))}else{m=s.expires}l="; expires="+m.toUTCString()}var r=s.path?"; path="+(s.path):"";var n=s.domain?"; domain="+(s.domain):"";var g=s.secure?"; secure":"";a.cookie=[h,"=",encodeURIComponent(p),l,r,n,g].join("")}else{var k=null;if(a.cookie&&a.cookie!=""){var q=a.cookie.split(";");for(var o=0;o<q.length;o++){var j=c.trim(q[o]);if(j.substring(0,h.length+1)==(h+"=")){k=decodeURIComponent(j.substring(h.length+1));break}}}return k}};var c=e;var f="djdt";var d={jQuery:e,events:{ready:[]},isReady:false,init:function(){c("#djDebug").show();var i=null;c("#djDebugPanelList li a").live("click",function(){if(!this.className){return false}i=c("#djDebug #"+this.className);if(i.is(":visible")){c(a).trigger("close.djDebug");c(this).parent().removeClass("active")}else{c(".panelContent").hide();i.show();c("#djDebugToolbar li").removeClass("active");c(this).parent().addClass("active")}return false});c("#djDebug a.djDebugClose").live("click",function(){c(a).trigger("close.djDebug");c("#djDebugToolbar li").removeClass("active");return false});c("#djDebug a.remoteCall").live("click",function(){c("#djDebugWindow").load(this.href,function(k,j,m){if(j=="error"){var l='<div class="djDebugPanelTitle"><a class="djDebugClose djDebugBack" href="">Back</a><h3>'+m.status+": "+m.statusText+"</h3></div>";c("#djDebugWindow").html(l)}c("#djDebugWindow a.djDebugBack").live("click",function(){c(this).parent().parent().hide();return false})});c("#djDebugWindow").show();return false});c("#djDebugTemplatePanel a.djTemplateShowContext").live("click",function(){d.toggle_arrow(c(this).children(".toggleArrow"));d.toggle_content(c(this).parent().next());return false});c("#djDebug a.djDebugToggle").live("click",function(j){j.preventDefault();c(this).parent().find(".djDebugCollapsed").toggle();c(this).parent().find(".djDebugUncollapsed").toggle()});c("#djDebug a.djToggleSwitch").live("click",function(l){l.preventDefault();var j=c(this);var m=j.attr("data-toggle-id");var k=j.text()==j.attr("data-toggle-open");if(m===""||!m){return}j.parents(".djDebugPanelContent").find("#sqlMain_"+m).find(".djDebugCollapsed").toggle(k);j.parents(".djDebugPanelContent").find("#sqlMain_"+m).find(".djDebugUncollapsed").toggle(!k);c(this).parents(".djDebugPanelContent").find(".djToggleDetails_"+m).each(function(){var n=c(this);if(k){n.addClass("djSelected");n.removeClass("djUnselected");j.text(j.attr("data-toggle-close"));n.find(".djToggleSwitch").text(j.text())}else{n.removeClass("djSelected");n.addClass("djUnselected");j.text(j.attr("data-toggle-open"));n.find(".djToggleSwitch").text(j.text())}});return});function g(j){var k=j.attr("id");return c('.djDebugProfileRow[id^="'+k+'_"]')}function h(l){var k=g(l);var j=parseInt(l.attr("depth"),10)+1;return k.filter("[depth="+j+"]")}c(".djDebugProfileRow .djDebugProfileToggle").live("click",function(){var k=c(this).closest(".djDebugProfileRow");var j=g(k);if(j.css("display")=="none"){h(k).show()}else{j.hide()}});c("#djHideToolBarButton").click(function(){d.hide_toolbar(true);return false});c("#djShowToolBarButton").click(function(){d.show_toolbar();return false});c(a).bind("close.djDebug",function(){if(c("#djDebugWindow").is(":visible")){c("#djDebugWindow").hide();return}if(c(".panelContent").is(":visible")){c(".panelContent").hide();return}if(c("#djDebugToolbar").is(":visible")){d.hide_toolbar(true);return}});if(c.cookie(f)){d.hide_toolbar(false)}else{d.show_toolbar(false)}c("#djDebug .djDebugHoverable").hover(function(){c(this).addClass("djDebugHover")},function(){c(this).removeClass("djDebugHover")});d.isReady=true;c.each(d.events.ready,function(j,k){k(d)})},toggle_content:function(g){if(g.is(":visible")){g.hide()}else{g.show()}},close:function(){c(a).trigger("close.djDebug");return false},hide_toolbar:function(g){c("#djDebugWindow").hide();c(".panelContent").hide();c("#djDebugToolbar li").removeClass("active");c("#djDebugToolbar").hide("fast");c("#djDebugToolbarHandle").show();c(a).unbind("keydown.djDebug");if(g){c.cookie(f,"hide",{path:"/",expires:10})}},show_toolbar:function(g){c(a).bind("keydown.djDebug",function(h){if(h.keyCode==27){d.close()}});c("#djDebugToolbarHandle").hide();if(g){c("#djDebugToolbar").show("fast")}else{c("#djDebugToolbar").show()}c.cookie(f,null,{path:"/",expires:-1})},toggle_arrow:function(h){var g=String.fromCharCode(9654);var i=String.fromCharCode(9660);h.html(h.html()==g?i:g)},ready:function(g){if(d.isReady){g(d)}else{d.events.ready.push(g)}}};c(a).ready(function(){d.init()});return d}(window,document,jQuery.noConflict(true)));</script>
	<div id="djDebug" style="" dir="ltr">

		<div style="" id="djDebugToolbarHandle">
			<a title="Show Toolbar" id="djShowToolBarButton" href="#">«</a>
		</div>


		<div id="djDebugVersionPanel" class="panelContent"
			style="display: none;">
			<div class="djDebugPanelTitle">
				<a href="" class="djDebugClose">Close</a>
				<h3>Versions</h3>
			</div>
			<div class="djDebugPanelContent">
				<div class="scroll">


					<table>
						<thead>
							<tr>
								<th>Package</th>
								<th>Version</th>
							</tr>
						</thead>
						<tbody>

							<tr class="djDebugOdd">
								<td>Django nose</td>
								<td>1.1.0</td>
							</tr>

							<tr class="djDebugEven">
								<td>Debug toolbar</td>
								<td>0.9.4</td>
							</tr>

							<tr class="djDebugOdd">
								<td>Method override</td>
								<td>0.1.0</td>
							</tr>

							<tr class="djDebugEven">
								<td>Python</td>
								<td>2.7.3</td>
							</tr>

							<tr class="djDebugOdd">
								<td>Djcelery</td>
								<td>3.0.17</td>
							</tr>

							<tr class="djDebugEven">
								<td>Django</td>
								<td>1.4.12</td>
							</tr>

							<tr class="djDebugOdd">
								<td>Staticfiles</td>
								<td>1.2.1</td>
							</tr>

							<tr class="djDebugEven">
								<td>Debug toolbar mongo</td>
								<td>0.1.10.final.0</td>
							</tr>

							<tr class="djDebugOdd">
								<td>South</td>
								<td>0.7.6</td>
							</tr>

						</tbody>
					</table>

				</div>
			</div>
		</div>



		<div id="djDebugTimerPanel" class="panelContent"
			style="display: none;">
			<div class="djDebugPanelTitle">
				<a href="" class="djDebugClose">Close</a>
				<h3>Resource Usage</h3>
			</div>
			<div class="djDebugPanelContent">
				<div class="scroll">

					<table>
						<colgroup>
							<col style="width:20%">
							<col>
						</colgroup>
						<thead>
							<tr>
								<th>Resource</th>
								<th>Value</th>
							</tr>
						</thead>
						<tbody>

							<tr class="djDebugOdd">
								<td>User CPU time</td>
								<td>348.022 msec</td>
							</tr>

							<tr class="djDebugEven">
								<td>System CPU time</td>
								<td>64.004 msec</td>
							</tr>

							<tr class="djDebugOdd">
								<td>Total CPU time</td>
								<td>412.026 msec</td>
							</tr>

							<tr class="djDebugEven">
								<td>Elapsed time</td>
								<td>529.339 msec</td>
							</tr>

							<tr class="djDebugOdd">
								<td>Context switches</td>
								<td>247 voluntary, 73 involuntary</td>
							</tr>

						</tbody>
					</table>

				</div>
			</div>
		</div>



		<div id="djDebugSettingsVarsPanel" class="panelContent"
			style="display: none;">
			<div class="djDebugPanelTitle">
				<a href="" class="djDebugClose">Close</a>
				<h3>
					Settings from
					<code>cms.envs.devstack</code>
				</h3>
			</div>
			<div class="djDebugPanelContent">
				<div class="scroll">

					<table>
						<thead>
							<tr>
								<th>Setting</th>
								<th>Value</th>
							</tr>
						</thead>
						<tbody>

							<tr class="djDebugOdd">
								<td>MAX_FAILED_LOGIN_ATTEMPTS_ALLOWED</td>
								<td><code>5</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>PIPELINE_JS_COMPRESSOR</td>
								<td><code>None</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>DEBUG_TOOLBAR_PANELS</td>
								<td><code>('debug_toolbar.panels.version.VersionDebugPanel',
										'debug_toolbar.panels.timer.TimerDebugPanel',
										'debug_toolbar.panels.settings_vars.SettingsVarsDebugPanel',
										'debug_toolbar.panels.headers.HeaderDebugPanel',
										'debug_toolbar.panels.request_vars.RequestVarsDebugPanel',
										'debug_toolbar.panels.sql.SQLDebugPanel',
										'debug_toolbar.panels.signals.SignalDebugPanel',
										'debug_toolbar.panels.logger.LoggingPanel')</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>MICROSITE_CONFIGURATION</td>
								<td><code>{}</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>USE_L10N</td>
								<td><code>True</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>CELERY_STORE_ERRORS_EVEN_IF_IGNORED</td>
								<td><code>True</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>CELERY_CREATE_MISSING_QUEUES</td>
								<td><code>True</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>WSGI_APPLICATION</td>
								<td><code>None</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>EDX_ROOT_URL</td>
								<td><code>''</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>CSRF_COOKIE_SECURE</td>
								<td><code>False</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>CELERY_DEFAULT_QUEUE</td>
								<td><code>'edx.cms.core.default'</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>STATICFILES_IGNORE_PATTERNS</td>
								<td><code>('*.py', '*.pycsass/*.scss',
										'sass/*/*.scss', 'sass/*/*/*.scss', 'sass/*/*/*/*.scss',
										'coffee/*.coffee', 'coffee/*/*.coffee', 'coffee/*/*/*.coffee',
										'coffee/*/*/*/*.coffee', 'xmodule_js', 'common_static')</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>CONTENTSTORE</td>
								<td><code>{u'ADDITIONAL_OPTIONS': {},
										u'DOC_STORE_CONFIG': {u'collection': u'modulestore', u'db':
										u'edxapp', u'host': [u'localhost'], u'password': u'password',
										u'port': 27017, u'user': u'edxapp'}, u'ENGINE':
										u'xmodule.contentstore.mongo.MongoContentStore', u'OPTIONS':
										{u'db': u'edxapp', u'host': [u'localhost'], u'password':
										u'password', u'port': 27017, u'user': u'edxapp'}}</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>LANGUAGE_CODE</td>
								<td><code>u'en'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>CELERY_SEND_TASK_SENT_EVENT</td>
								<td><code>True</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>LOGIN_URL</td>
								<td><code>'/signin'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>BROKER_URL</td>
								<td><code>'amqp://celery:celery@localhost/'</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>EMAIL_HOST_PASSWORD</td>
								<td><code>u'********************'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>DEFAULT_CHARSET</td>
								<td><code>'utf-8'</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>IGNORABLE_404_URLS</td>
								<td><code>()</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>CELERY_DEFAULT_EXCHANGE_TYPE</td>
								<td><code>'direct'</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>STATIC_ROOT</td>
								<td><code>path(u'/edx/var/edxapp/staticfiles/acf03d7')</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>EVENT_TRACKING_BACKENDS</td>
								<td><code>{'logger': {'ENGINE':
										'eventtracking.backends.logger.LoggerBackend', 'OPTIONS':
										{'max_event_size': 50000, 'name': 'tracking'}}}</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>USE_THOUSAND_SEPARATOR</td>
								<td><code>False</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>REPO_ROOT</td>
								<td><code>path(u'/edx/app/edxapp/edx-platform')</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>FIXTURE_DIRS</td>
								<td><code>()</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>MICROSITE_ROOT_DIR</td>
								<td><code>path(u'/edx/app/edxapp/edx-microsite')</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>ALLOWED_HOSTS</td>
								<td><code>['*']</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>MESSAGE_STORAGE</td>
								<td><code>'django.contrib.messages.storage.session.SessionStorage'</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>EVENT_TRACKING_ENABLED</td>
								<td><code>True</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>EMAIL_SUBJECT_PREFIX</td>
								<td><code>'[Django] '</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>SEND_BROKEN_LINK_EMAILS</td>
								<td><code>False</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>BROKER_HEARTBEAT</td>
								<td><code>10.0</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>URL_VALIDATOR_USER_AGENT</td>
								<td><code>'Django/1.4.12
										(https://www.djangoproject.com)'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>CELERY_RESULT_SERIALIZER</td>
								<td><code>'json'</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>STATICFILES_FINDERS</td>
								<td><code>('staticfiles.finders.FileSystemFinder',
										'staticfiles.finders.AppDirectoriesFinder',
										'pipeline.finders.PipelineFinder')</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>PIPELINE_COMPILERS</td>
								<td><code>('pipeline.compilers.coffee.CoffeeScriptCompiler',)</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>PLATFORM_NAME</td>
								<td><code>u'Your Platform Name Here'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>SESSION_COOKIE_DOMAIN</td>
								<td><code>u''</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>SESSION_COOKIE_NAME</td>
								<td><code>'sessionid'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>ADMIN_FOR</td>
								<td><code>()</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>TIME_INPUT_FORMATS</td>
								<td><code>('%H:%M:%S', '%H:%M')</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>DATABASES</td>
								<td><code>{u'default': {u'ENGINE':
										u'django.db.backends.mysql', u'HOST': u'localhost', u'NAME':
										u'edxapp', 'OPTIONS': {}, u'PASSWORD':
										u'********************', u'PORT': u'3306', 'TEST_CHARSET':
										None, 'TEST_COLLATION': None, 'TEST_MIRROR': None,
										'TEST_NAME': None, 'TIME_ZONE': 'UTC', u'USER': u'edxapp001'},
										u'read_replica': {u'ENGINE': u'django.db.backends.mysql',
										u'HOST': u'localhost', u'NAME': u'edxapp', 'OPTIONS': {},
										u'PASSWORD': u'********************', u'PORT': u'3306',
										'TEST_CHARSET': None, 'TEST_COLLATION': None, 'TEST_MIRROR':
										None, 'TEST_NAME': None, 'TIME_ZONE': 'UTC', u'USER':
										u'edxapp001'}}</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>TEMPLATE_DEBUG</td>
								<td><code>True</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>TRACK_MAX_EVENT</td>
								<td><code>50000</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>PASSWORD_COMPLEXITY</td>
								<td><code>u'********************'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>FILE_UPLOAD_PERMISSIONS</td>
								<td><code>None</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>TIME_FORMAT</td>
								<td><code>'P'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>FILE_UPLOAD_HANDLERS</td>
								<td><code>('django.core.files.uploadhandler.MemoryFileUploadHandler',
										'django.core.files.uploadhandler.TemporaryFileUploadHandler')</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>PIPELINE_JS</td>
								<td><code>{'module-js': {'output_filename':
										'js/cms-modules.js', 'source_filenames':
										[u'xmodule/descriptors/js/000-38c1026a572b76f052cb032657dc6d93.js',
										u'xmodule/descriptors/js/000-5a624b61d868942153cefc31a9dc36c7.js',
										u'xmodule/descriptors/js/000-5b4f5d368b61e60c0ec0a96da354835b.js',
										u'xmodule/descriptors/js/000-6022911bfee6e7865b4457629ab2ff44.js',
										u'xmodule/descriptors/js/000-77e70463a4253744c48f1687383e259e.js',
										u'xmodule/descriptors/js/000-79a64f2010d8b4cb8d0f0d6912c70c12.js',
										u'xmodule/descriptors/js/000-bb51a36b4a29ce38be91a5102d77ad3c.js',
										u'xmodule/descriptors/js/000-bdf940d1aa93739db56b49bf7c25205e.js',
										u'xmodule/descriptors/js/000-c7b679d67306eff79b26fa5916c22ebb.js',
										u'xmodule/modules/js/000-37c8e1c19b097587504b5f30c33aef11.js',
										u'xmodule/modules/js/000-38c1026a572b76f052cb032657dc6d93.js',
										u'xmodule/modules/js/000-4b06b565ce07b7ec692a835beb968b0c.js',
										u'xmodule/modules/js/000-4e789164fb697a2e6e6180f9f8255659.js',
										u'xmodule/modules/js/000-53c44c016974a4e7b767192c8fa16fe0.js',
										u'xmodule/modules/js/000-c5eff3526bed9d24970f5ef629d53cef.js',
										u'xmodule/modules/js/000-e2c8c1923afe3181bc3303bc662a409a.js',
										u'xmodule/modules/js/000-e54b5c7f7b657100c24d82263144a4fd.js',
										u'xmodule/modules/js/001-149e5f80fb129c93207c19c2cb17b45a.js',
										u'xmodule/modules/js/001-224d365aed3a968d6876b75a9e39d877.js',
										u'xmodule/modules/js/001-42a54bf42a889003f390bd8ac7fe77be.js',
										u'xmodule/modules/js/001-53c44c016974a4e7b767192c8fa16fe0.js',
										u'xmodule/modules/js/001-72c7856ac95c63cb8a2d71777e09eb37.js',
										u'xmodule/modules/js/001-831bfa7f0550106cead1942d7485d9b2.js',
										u'xmodule/modules/js/001-96d20c9f6be33c7f09c4fcf3d7e4633a.js',
										u'xmodule/modules/js/001-c3d14b8d25e6e22ebcc6603d2e75d212.js',
										u'xmodule/modules/js/001-d1f81454cdec8eb05058f2be176cf63b.js',
										u'xmodule/modules/js/001-ea624e6d121e8f7d64e5f36605158596.js',
										u'xmodule/modules/js/001-f78a251c463c5a6eb6b4ada613e6153e.js',
										u'xmodule/modules/js/002-2efdc26d48edfbb30a54c2e5875ddef3.js',
										u'xmodule/modules/js/002-53c44c016974a4e7b767192c8fa16fe0.js',
										u'xmodule/modules/js/002-5df836f1bff325803db265b4e6bdd400.js',
										u'xmodule/modules/js/002-64f803bbfc8033bc9c4c434a59717369.js',
										u'xmodule/modules/js/002-c69e953ceece62d29352ef33330b37ae.js',
										u'xmodule/modules/js/002-d33c65a4e461258e77ae8dc21df29a85.js',
										u'xmodule/modules/js/002-d7b3578319f397f236353b00a25ba14d.js',
										u'xmodule/modules/js/002-e8aaca26172f45bfdf948ac4325edd52.js',
										u'xmodule/modules/js/003-222009e8c24f5628677581995d2488d9.js',
										u'xmodule/modules/js/003-23394bdafb1e88a4de88e976222eb41e.js',
										u'xmodule/modules/js/003-6e8bf396002ae78ecc4f7bd88b572323.js',
										u'xmodule/modules/js/003-da1290f2b00e2c27e7305fcd42b548ae.js',
										u'xmodule/modules/js/003-ebf95d0ad35d03ed815c71728e84dc68.js',
										u'xmodule/modules/js/004-af44a8894b528bb391f901e7c7a32064.js',
										u'xmodule/modules/js/004-d46fc8abde5a36d4c0ea0cd6af12bcff.js',
										u'xmodule/modules/js/004-f713a3bce247ef33bf2fcd2af21cba8f.js',
										u'xmodule/modules/js/005-16a4ddfb11dad336032f6a3a88692a46.js',
										u'xmodule/modules/js/005-d5d57f05b365edd2e459922ac8a6bba3.js',
										u'xmodule/modules/js/006-378ac9c882e0b09f6a3553b10c967967.js',
										u'xmodule/modules/js/006-c048d2df9a279e40617f4b222e2f24c8.js',
										u'xmodule/modules/js/007-8786e4f817f86a276ee538eecc45f0e6.js',
										u'xmodule/modules/js/007-a3344151a7d92d40f881f592af41add9.js',
										u'xmodule/modules/js/008-afc7413769330ed39dab7ea366492aac.js',
										u'xmodule/modules/js/008-fd708bb4fac08ee85e47174ef0a31f6e.js',
										u'xmodule/modules/js/009-235d1ae2f2146ddcec4c4f5626df30c8.js',
										u'xmodule/modules/js/009-6099fb4c640ced238dd6a35ac69e95f0.js',
										u'xmodule/modules/js/010-afb5ca5ed2190d549dd16231c8f2cab3.js',
										u'xmodule/modules/js/011-1dc143e7b45b9e03bd70bbbb68859d21.js',
										u'xmodule/modules/js/012-88decd25db3d55879f3ab14cfb27e269.js',
										u'xmodule/modules/js/013-2840b06b336bec403b8ee961c659ba64.js',
										u'xmodule/modules/js/014-c20187b4b3360a37b63676caa0eaeeb7.js',
										u'xmodule/modules/js/015-f84639f31755de1c4e87cf18d87f737a.js',
										u'xmodule/modules/js/016-67bb3bc970776f28d9b2c352879d69ed.js',
										u'xmodule/modules/js/017-73ef5e3891bc49c3b858b02be34e00d0.js',
										u'xmodule/modules/js/018-cfe75d3c5362edca25a83c237ba533b6.js',
										u'coffee/src/discussion/content.js',
										u'coffee/src/discussion/discussion.js',
										u'coffee/src/discussion/discussion_filter.js',
										u'coffee/src/discussion/discussion_module_view.js',
										u'coffee/src/discussion/discussion_router.js',
										u'coffee/src/discussion/main.js',
										u'coffee/src/discussion/templates.js',
										u'coffee/src/discussion/utils.js'], 'test_order': 1}}</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>DEFAULT_CONTENT_TYPE</td>
								<td><code>'text/html'</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>CONFIG_ROOT</td>
								<td><code>path(u'/edx/app/edxapp')</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>APPEND_SLASH</td>
								<td><code>True</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>FIRST_DAY_OF_WEEK</td>
								<td><code>0</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>DATABASE_ROUTERS</td>
								<td><code>[]</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>MKTG_URLS</td>
								<td><code>{}</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>PASSWORD_MIN_LENGTH</td>
								<td><code>u'********************'</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>CELERY_TRACK_STARTED</td>
								<td><code>True</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>YEAR_MONTH_FORMAT</td>
								<td><code>'F Y'</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>MODULESTORE_BRANCH</td>
								<td><code>'draft-preferred'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>STATICFILES_STORAGE</td>
								<td><code>'pipeline.storage.PipelineCachedStorage'</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>CACHES</td>
								<td><code>{u'celery': {u'BACKEND':
										u'django.core.cache.backends.memcached.MemcachedCache',
										u'KEY_FUNCTION': u'********************', u'KEY_PREFIX':
										u'********************', u'LOCATION': [u'localhost:11211'],
										u'TIMEOUT': u'7200'}, u'default': {u'BACKEND':
										u'django.core.cache.backends.memcached.MemcachedCache',
										u'KEY_FUNCTION': u'********************', u'KEY_PREFIX':
										u'********************', u'LOCATION': [u'localhost:11211']},
										u'general': {u'BACKEND':
										u'django.core.cache.backends.memcached.MemcachedCache',
										u'KEY_FUNCTION': u'********************', u'KEY_PREFIX':
										u'********************', u'LOCATION': [u'localhost:11211']},
										'loc_cache': {'BACKEND':
										'django.core.cache.backends.locmem.LocMemCache', 'LOCATION':
										'edx_location_mem_cache'}, u'mongo_metadata_inheritance':
										{u'BACKEND':
										u'django.core.cache.backends.memcached.MemcachedCache',
										u'KEY_FUNCTION': u'********************', u'KEY_PREFIX':
										u'********************', u'LOCATION': [u'localhost:11211'],
										u'TIMEOUT': 300}, u'staticfiles': {u'BACKEND':
										u'django.core.cache.backends.memcached.MemcachedCache',
										u'KEY_FUNCTION': u'********************', u'KEY_PREFIX':
										u'********************', u'LOCATION': [u'localhost:11211']}}</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>GIT_REPO_EXPORT_DIR</td>
								<td><code>'/edx/var/edxapp/export_course_repos'</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>XQUEUE_INTERFACE</td>
								<td><code>{'basic_auth': None, 'django_auth':
										{'password': 'local', 'username': 'local'}, 'url':
										'http://localhost:8888'}</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>SESSION_INACTIVITY_TIMEOUT_IN_SECONDS</td>
								<td><code>None</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>CAS_EXTRA_LOGIN_PARAMS</td>
								<td><code>u''</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>HIGH_PRIORITY_QUEUE</td>
								<td><code>'edx.cms.core.high'</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>SERVER_EMAIL</td>
								<td><code>u'devops@example.com'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>SESSION_COOKIE_PATH</td>
								<td><code>'/'</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>PIPELINE_YUI_BINARY</td>
								<td><code>'yui-compressor'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>YOUTUBE</td>
								<td><code>{'API': u'********************',
										'TEST_URL': 'gdata.youtube.com/feeds/api/videos/', 'TEXT_API':
										u'********************'}</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>ROOT_URLCONF</td>
								<td><code>'cms.urls'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>MKTG_URL_LINK_MAP</td>
								<td><code>{}</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>SESSION_EXPIRE_AT_BROWSER_CLOSE</td>
								<td><code>False</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>FILE_UPLOAD_TEMP_DIR</td>
								<td><code>None</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>MIDDLEWARE_CLASSES</td>
								<td><code>('request_cache.middleware.RequestCache',
										'django.middleware.cache.UpdateCacheMiddleware',
										'django.middleware.common.CommonMiddleware',
										'django.middleware.csrf.CsrfViewMiddleware',
										'django.contrib.sessions.middleware.SessionMiddleware',
										'method_override.middleware.MethodOverrideMiddleware',
										'cache_toolbox.middleware.CacheBackedAuthenticationMiddleware',
										'student.middleware.UserStandingMiddleware',
										'contentserver.middleware.StaticContentServer',
										'crum.CurrentRequestUserMiddleware',
										'django.contrib.messages.middleware.MessageMiddleware',
										'track.middleware.TrackMiddleware',
										'dark_lang.middleware.DarkLangMiddleware',
										'embargo.middleware.EmbargoMiddleware',
										'django.middleware.locale.LocaleMiddleware',
										'django.middleware.transaction.TransactionMiddleware',
										'edxmako.middleware.MakoMiddleware',
										'ratelimitbackend.middleware.RateLimitMiddleware',
										'session_inactivity_timeout.middleware.SessionInactivityTimeout',
										'django.middleware.clickjacking.XFrameOptionsMiddleware',
										'debug_toolbar.middleware.DebugToolbarMiddleware')</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>USE_I18N</td>
								<td><code>True</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>THOUSAND_SEPARATOR</td>
								<td><code>','</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>SECRET_KEY</td>
								<td><code>u'********************'</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>LANGUAGE_COOKIE_NAME</td>
								<td><code>'django_language'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>DEFAULT_INDEX_TABLESPACE</td>
								<td><code>''</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>THEME_NAME</td>
								<td><code>u''</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>DEBUG_TOOLBAR_MONGO_STACKTRACES</td>
								<td><code>False</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>LOGGING_CONFIG</td>
								<td><code>'django.utils.log.dictConfig'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>GITHUB_REPO_ROOT</td>
								<td><code>u'/edx/var/edxapp/data'</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>SEGMENT_IO_KEY</td>
								<td><code>u'********************'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>BROKER_POOL_LIMIT</td>
								<td><code>0</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>TEMPLATE_LOADERS</td>
								<td><code>('django.template.loaders.filesystem.Loader',
										'django.template.loaders.app_directories.Loader')</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>LMS_BASE</td>
								<td><code>'localhost:8000'</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>FORCE_SCRIPT_NAME</td>
								<td><code>None</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>LOG_DIR</td>
								<td><code>u'/edx/var/logs/edx'</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>COMMON_ROOT</td>
								<td><code>path(u'/edx/app/edxapp/edx-platform/common')</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>X_FRAME_OPTIONS</td>
								<td><code>'ALLOW'</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>CSRF_COOKIE_NAME</td>
								<td><code>'csrftoken'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>CELERY_DEFAULT_EXCHANGE</td>
								<td><code>'edx.cms.core'</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>ALL_LANGUAGES</td>
								<td><code>([u'aa', u'Afar'], [u'ab', u'Abkhazian'],
										[u'af', u'Afrikaans'], [u'ak', u'Akan'], [u'sq', u'Albanian'],
										[u'am', u'Amharic'], [u'ar', u'Arabic'], [u'an',
										u'Aragonese'], [u'hy', u'Armenian'], [u'as', u'Assamese'],
										[u'av', u'Avaric'], [u'ae', u'Avestan'], [u'ay', u'Aymara'],
										[u'az', u'Azerbaijani'], [u'ba', u'Bashkir'], [u'bm',
										u'Bambara'], [u'eu', u'Basque'], [u'be', u'Belarusian'],
										[u'bn', u'Bengali'], [u'bh', u'Bihari languages'], [u'bi',
										u'Bislama'], [u'bs', u'Bosnian'], [u'br', u'Breton'], [u'bg',
										u'Bulgarian'], [u'my', u'Burmese'], [u'ca', u'Catalan'],
										[u'ch', u'Chamorro'], [u'ce', u'Chechen'], [u'zh',
										u'Chinese'], [u'cu', u'Church Slavic'], [u'cv', u'Chuvash'],
										[u'kw', u'Cornish'], [u'co', u'Corsican'], [u'cr', u'Cree'],
										[u'cs', u'Czech'], [u'da', u'Danish'], [u'dv', u'Divehi'],
										[u'nl', u'Dutch'], [u'dz', u'Dzongkha'], [u'en', u'English'],
										[u'eo', u'Esperanto'], [u'et', u'Estonian'], [u'ee', u'Ewe'],
										[u'fo', u'Faroese'], [u'fj', u'Fijian'], [u'fi', u'Finnish'],
										[u'fr', u'French'], [u'fy', u'Western Frisian'], [u'ff',
										u'Fulah'], [u'ka', u'Georgian'], [u'de', u'German'], [u'gd',
										u'Gaelic'], [u'ga', u'Irish'], [u'gl', u'Galician'], [u'gv',
										u'Manx'], [u'el', u'Greek'], [u'gn', u'Guarani'], [u'gu',
										u'Gujarati'], [u'ht', u'Haitian'], [u'ha', u'Hausa'], [u'he',
										u'Hebrew'], [u'hz', u'Herero'], [u'hi', u'Hindi'], [u'ho',
										u'Hiri Motu'], [u'hr', u'Croatian'], [u'hu', u'Hungarian'],
										[u'ig', u'Igbo'], [u'is', u'Icelandic'], [u'io', u'Ido'],
										[u'ii', u'Sichuan Yi'], [u'iu', u'Inuktitut'], [u'ie',
										u'Interlingue'], [u'ia', u'Interlingua'], [u'id',
										u'Indonesian'], [u'ik', u'Inupiaq'], [u'it', u'Italian'],
										[u'jv', u'Javanese'], [u'ja', u'Japanese'], [u'kl',
										u'Kalaallisut'], [u'kn', u'Kannada'], [u'ks', u'Kashmiri'],
										[u'kr', u'Kanuri'], [u'kk', u'Kazakh'], [u'km', u'Central
										Khmer'], [u'ki', u'Kikuyu'], [u'rw', u'Kinyarwanda'], [u'ky',
										u'Kirghiz'], [u'kv', u'Komi'], [u'kg', u'Kongo'], [u'ko',
										u'Korean'], [u'kj', u'Kuanyama'], [u'ku', u'Kurdish'], [u'lo',
										u'Lao'], [u'la', u'Latin'], [u'lv', u'Latvian'], [u'li',
										u'Limburgan'], [u'ln', u'Lingala'], [u'lt', u'Lithuanian'],
										[u'lb', u'Luxembourgish'], [u'lu', u'Luba-Katanga'], [u'lg',
										u'Ganda'], [u'mk', u'Macedonian'], [u'mh', u'Marshallese'],
										[u'ml', u'Malayalam'], [u'mi', u'Maori'], [u'mr', u'Marathi'],
										[u'ms', u'Malay'], [u'mg', u'Malagasy'], [u'mt', u'Maltese'],
										[u'mn', u'Mongolian'], [u'na', u'Nauru'], [u'nv', u'Navajo'],
										[u'nr', u'Ndebele, South'], [u'nd', u'Ndebele, North'],
										[u'ng', u'Ndonga'], [u'ne', u'Nepali'], [u'nn', u'Norwegian
										Nynorsk'], [u'nb', u'Bokm\xe5l, Norwegian'], [u'no',
										u'Norwegian'], [u'ny', u'Chichewa'], [u'oc', u'Occitan'],
										[u'oj', u'Ojibwa'], [u'or', u'Oriya'], [u'om', u'Oromo'],
										[u'os', u'Ossetian'], [u'pa', u'Panjabi'], [u'fa',
										u'Persian'], [u'pi', u'Pali'], [u'pl', u'Polish'], [u'pt',
										u'Portuguese'], [u'ps', u'Pushto'], [u'qu', u'Quechua'],
										[u'rm', u'Romansh'], [u'ro', u'Romanian'], [u'rn', u'Rundi'],
										[u'ru', u'Russian'], [u'sg', u'Sango'], [u'sa', u'Sanskrit'],
										[u'si', u'Sinhala'], [u'sk', u'Slovak'], [u'sl',
										u'Slovenian'], [u'se', u'Northern Sami'], [u'sm', u'Samoan'],
										[u'sn', u'Shona'], [u'sd', u'Sindhi'], [u'so', u'Somali'],
										[u'st', u'Sotho, Southern'], [u'es', u'Spanish'], [u'sc',
										u'Sardinian'], [u'sr', u'Serbian'], [u'ss', u'Swati'], [u'su',
										u'Sundanese'], [u'sw', u'Swahili'], [u'sv', u'Swedish'],
										[u'ty', u'Tahitian'], [u'ta', u'Tamil'], [u'tt', u'Tatar'],
										[u'te', u'Telugu'], [u'tg', u'Tajik'], [u'tl', u'Tagalog'],
										[u'th', u'Thai'], [u'bo', u'Tibetan'], [u'ti', u'Tigrinya'],
										[u'to', u'Tonga (Tonga Islands)'], [u'tn', u'Tswana'], [u'ts',
										u'Tsonga'], [u'tk', u'Turkmen'], [u'tr', u'Turkish'], [u'tw',
										u'Twi'], [u'ug', u'Uighur'], [u'uk', u'Ukrainian'], [u'ur',
										u'Urdu'], [u'uz', u'Uzbek'], [u've', u'Venda'], [u'vi',
										u'Vietnamese'], [u'vo', u'Volap\xfck'], [u'cy', u'Welsh'],
										[u'wa', u'Walloon'], [u'wo', u'Wolof'], [u'xh', u'Xhosa'],
										[u'yi', u'Yiddish'], [u'yo', u'Yoruba'], [u'za', u'Zhuang'],
										[u'zu', u'Zulu'])</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>CELERY_DEFAULT_ROUTING_KEY</td>
								<td><code>u'********************'</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>USE_X_FORWARDED_HOST</td>
								<td><code>False</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>CELERY_ALWAYS_EAGER</td>
								<td><code>True</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>SIGNING_BACKEND</td>
								<td><code>'django.core.signing.TimestampSigner'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>CELERY_BROKER_HOSTNAME</td>
								<td><code>u'localhost'</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>SESSION_COOKIE_SECURE</td>
								<td><code>False</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>EVENT_TRACKING_PROCESSORS</td>
								<td><code>[{'ENGINE':
										'track.shim.LegacyFieldMappingProcessor'}]</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>CSRF_COOKIE_DOMAIN</td>
								<td><code>None</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>FILE_CHARSET</td>
								<td><code>'utf-8'</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>DEBUG</td>
								<td><code>True</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>DOC_STORE_CONFIG</td>
								<td><code>{u'collection': u'modulestore', u'db':
										u'edxapp', u'host': [u'localhost'], u'password': u'password',
										u'port': 27017, u'user': u'edxapp'}</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>CELERY_QUEUE_HA_POLICY</td>
								<td><code>'all'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>SESSION_FILE_PATH</td>
								<td><code>None</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>AWS_ACCESS_KEY_ID</td>
								<td><code>u'********************'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>CELERY_BROKER_USER</td>
								<td><code>u'celery'</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>INSTALLED_APPS</td>
								<td><code>('django.contrib.auth',
										'django.contrib.contenttypes', 'django.contrib.sessions',
										'django.contrib.sites', 'django.contrib.messages', 'djcelery',
										'south', 'method_override', 'config_models', 'service_status',
										'django_nose', 'contentstore', 'course_creators', 'student',
										'course_groups', 'track', 'eventtracking.django', 'datadog',
										'edxmako', 'pipeline', 'staticfiles', 'static_replace',
										'django_comment_common', 'django.contrib.admin',
										'course_modes', 'dark_lang', 'reverification', 'user_api',
										'django_openid_auth', 'embargo', 'monitoring',
										'course_action_state', 'submissions', 'openassessment',
										'openassessment.assessment', 'openassessment.fileupload',
										'openassessment.workflow', 'openassessment.xblock',
										'debug_toolbar', 'debug_toolbar_mongo')</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>ENV_FEATURES</td>
								<td><code>{u'AUTH_USE_OPENID_PROVIDER': True,
										u'AUTOMATIC_AUTH_FOR_TESTING': False, u'CERTIFICATES_ENABLED':
										True, u'ENABLE_DISCUSSION_SERVICE': True,
										u'ENABLE_INSTRUCTOR_ANALYTICS': True,
										u'ENABLE_S3_GRADE_DOWNLOADS': True, u'PREVIEW_LMS_BASE': u'',
										u'SUBDOMAIN_BRANDING': False, u'SUBDOMAIN_COURSE_LISTINGS':
										False, u'USE_CUSTOM_THEME': False}</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>BROKER_CONNECTION_TIMEOUT</td>
								<td><code>1</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>DEFAULT_PRIORITY_QUEUE</td>
								<td><code>'edx.cms.core.default'</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>SUBDOMAIN_BRANDING</td>
								<td><code>{}</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>PASSWORD_DICTIONARY</td>
								<td><code>u'********************'</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>STATICFILES_DIRS</td>
								<td><code>[path(u'/edx/app/edxapp/edx-platform/common/static'),
										path(u'/edx/app/edxapp/edx-platform/cms/static'),
										path(u'/edx/app/edxapp/edx-platform/lms/static')]</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>MAX_FAILED_LOGIN_ATTEMPTS_LOCKOUT_PERIOD_SECS</td>
								<td><code>900</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>PREPEND_WWW</td>
								<td><code>False</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>SECURE_PROXY_SSL_HEADER</td>
								<td><code>None</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>MAKO_TEMPLATES</td>
								<td><code>{'lms.main':
										[path(u'/edx/app/edxapp/edx-platform/lms/templates'),
										path(u'/edx/app/edxapp/edx-platform/common/templates'),
										path(u'/edx/app/edxapp/edx-platform/common/lib/capa/capa/templates'),
										path(u'/edx/app/edxapp/edx-platform/common/djangoapps/pipeline_mako/templates')],
										'main': [path(u'/edx/app/edxapp/edx-platform/cms/templates'),
										path(u'/edx/app/edxapp/edx-platform/common/templates'),
										path(u'/edx/app/edxapp/edx-platform/common/djangoapps/pipeline_mako/templates'),
										path(u'/edx/app/edxapp/edx-platform/common/djangoapps/pipeline_js/templates')]}</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>SESSION_COOKIE_HTTPONLY</td>
								<td><code>True</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>AWS_SECRET_ACCESS_KEY</td>
								<td><code>u'********************'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>DEBUG_PROPAGATE_EXCEPTIONS</td>
								<td><code>False</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>CELERYD_PREFETCH_MULTIPLIER</td>
								<td><code>1</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>WIKI_ENABLED</td>
								<td><code>True</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>MEDIA_URL</td>
								<td><code>''</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>ENV_TOKENS</td>
								<td><code>u'********************'</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>TRANSACTIONS_MANAGED</td>
								<td><code>False</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>EMAIL_FILE_PATH</td>
								<td><code>None</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>LMS_ROOT</td>
								<td><code>path(u'/edx/app/edxapp/edx-platform/lms')</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>MONTH_DAY_FORMAT</td>
								<td><code>'F j'</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>EDXMKTG_COOKIE_NAME</td>
								<td><code>'edxloggedin'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>FEATURES</td>
								<td><code>{'ADVANCED_SECURITY': False,
										'ALLOW_ALL_ADVANCED_COMPONENTS': True,
										'ALLOW_UNICODE_COURSE_ID': False, 'AUTH_USE_CERTIFICATES':
										False, u'AUTH_USE_OPENID_PROVIDER': True,
										u'AUTOMATIC_AUTH_FOR_TESTING': False, 'AUTOPLAY_VIDEOS':
										False, u'CERTIFICATES_ENABLED': True,
										'DEFAULT_STORE_FOR_NEW_COURSE': 'mongo',
										'EDITABLE_SHORT_DESCRIPTION': True, 'EMBARGO': False,
										'ENABLE_CREATOR_GROUP': False, 'ENABLE_DISCUSSION_SERVICE':
										True, 'ENABLE_GROUP_CONFIGURATIONS': None,
										u'ENABLE_INSTRUCTOR_ANALYTICS': True,
										'ENABLE_MAX_FAILED_LOGIN_ATTEMPTS': False,
										u'ENABLE_S3_GRADE_DOWNLOADS': True, 'ENABLE_SERVICE_STATUS':
										False, 'ENABLE_STUDENT_NOTES': True, 'ENABLE_TEXTBOOK': True,
										'ENFORCE_PASSWORD_POLICY': u'********************',
										'GITHUB_PUSH': False, 'PREVENT_CONCURRENT_LOGINS': False,
										u'PREVIEW_LMS_BASE': 'preview.localhost:8000', 'SEGMENT_IO':
										False, 'SITE_EMBARGOED': False, 'SQUELCH_PII_IN_LOGS': False,
										'STUDIO_REQUEST_EMAIL': '', u'SUBDOMAIN_BRANDING': False,
										u'SUBDOMAIN_COURSE_LISTINGS': False, u'USE_CUSTOM_THEME':
										False, 'USE_DJANGO_PIPELINE': True, 'USE_MICROSITES': False}</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>COURSE_KEY_PATTERN</td>
								<td><code>u'********************'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>TRACKING_BACKENDS</td>
								<td><code>{'logger': {'ENGINE':
										'track.backends.logger.LoggerBackend', 'OPTIONS': {'name':
										'tracking'}}}</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>LOW_PRIORITY_QUEUE</td>
								<td><code>'edx.cms.core.low'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>ENV_ROOT</td>
								<td><code>path(u'/edx/app/edxapp')</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>CELERY_IGNORE_RESULT</td>
								<td><code>False</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>GEOIP_PATH</td>
								<td><code>path(u'/edx/app/edxapp/edx-platform/common/static/data/geoip/GeoIP.dat')</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>DATE_INPUT_FORMATS</td>
								<td><code>('%Y-%m-%d', '%m/%d/%Y', '%m/%d/%y', '%b
										%d %Y', '%b %d, %Y', '%d %b %Y', '%d %b, %Y', '%B %d %Y', '%B
										%d, %Y', '%d %B %Y', '%d %B, %Y')</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>ASSET_IGNORE_REGEX</td>
								<td><code>'(^\\._.*$)|(^\\.DS_Store$)|(^.*~$)'</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>CELERY_BROKER_VHOST</td>
								<td><code>''</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>AUTHENTICATION_BACKENDS</td>
								<td><code>('ratelimitbackend.backends.RateLimitModelBackend',)</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>CONFIG_PREFIX</td>
								<td><code>'cms.'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>QUEUE_VARIANT</td>
								<td><code>'cms.'</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>STATICFILES_URL</td>
								<td><code>'/static/acf03d7/'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>PASSWORD_RESET_TIMEOUT_DAYS</td>
								<td><code>u'********************'</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>CACHE_MIDDLEWARE_ALIAS</td>
								<td><code>'default'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>SESSION_SAVE_EVERY_REQUEST</td>
								<td><code>False</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>ADMIN_MEDIA_PREFIX</td>
								<td><code>'/static/admin/'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>NUMBER_GROUPING</td>
								<td><code>0</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>SESSION_ENGINE</td>
								<td><code>'django.contrib.sessions.backends.cache'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>DEFAULT_FILE_STORAGE</td>
								<td><code>'django.core.files.storage.FileSystemStorage'</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>CSRF_FAILURE_VIEW</td>
								<td><code>'django.views.csrf.csrf_failure'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>CSRF_COOKIE_PATH</td>
								<td><code>'/'</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>LOGIN_REDIRECT_URL</td>
								<td><code>'/signin'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>CELERY_TASK_SERIALIZER</td>
								<td><code>'json'</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>XBLOCK_MIXINS</td>
								<td><code>(&lt;class
										'lms.lib.xblock.mixin.LmsBlockMixin'&gt;, &lt;class
										'xmodule.modulestore.inheritance.InheritanceMixin'&gt;,
										&lt;class 'xmodule.x_module.XModuleMixin'&gt;)</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>ENABLE_JASMINE</td>
								<td><code>False</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>PROJECT_ROOT</td>
								<td><code>path(u'/edx/app/edxapp/edx-platform/cms')</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>STATIC_URL_BASE</td>
								<td><code>u'/static/'</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>DECIMAL_SEPARATOR</td>
								<td><code>'.'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>CELERY_SEND_EVENTS</td>
								<td><code>True</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>SERVICE_VARIANT</td>
								<td><code>'cms'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>LOCALE_PATHS</td>
								<td><code>(path(u'/edx/app/edxapp/edx-platform/conf/locale'),)</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>PIPELINE_CSS_COMPRESSOR</td>
								<td><code>None</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>TEMPLATE_STRING_IF_INVALID</td>
								<td><code>''</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>OPENID_DOMAIN_PREFIX</td>
								<td><code>'openid:'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>TRACKING_IGNORE_URL_PATTERNS</td>
								<td><code>['^/event', '^/login', '^/heartbeat']</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>COMMENTS_ALLOW_PROFANITIES</td>
								<td><code>False</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>LOGOUT_URL</td>
								<td><code>'/accounts/logout/'</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>EMAIL_USE_TLS</td>
								<td><code>False</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>ADVANCED_COMPONENT_TYPES</td>
								<td><code>['annotatable', 'textannotation',
										'videoannotation', 'imageannotation', 'word_cloud',
										'graphical_slider_tool', 'lti', 'concept', 'done', 'audio',
										'recommender', 'split_test', 'combinedopenended',
										'peergrading', 'notes']</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>CELERY_BROKER_TRANSPORT</td>
								<td><code>u'amqp'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>CELERY_BROKER_PASSWORD</td>
								<td><code>u'********************'</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>ASSET_KEY_PATTERN</td>
								<td><code>u'********************'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>EMAIL_HOST</td>
								<td><code>'localhost'</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>DATE_FORMAT</td>
								<td><code>'N j, Y'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>OPTIONAL_APPS</td>
								<td><code>('edx_jsdraw', 'mentoring', 'submissions',
										'openassessment', 'openassessment.assessment',
										'openassessment.fileupload', 'openassessment.workflow',
										'openassessment.xblock')</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>MODULESTORE</td>
								<td><code>{'default': {'ENGINE':
										'xmodule.modulestore.mixed.MixedModuleStore', 'OPTIONS':
										{'mappings': {}, 'stores': [{u'DOC_STORE_CONFIG':
										{u'collection': u'modulestore', u'db': u'edxapp', u'host':
										[u'localhost'], u'password': u'password', u'port': 27017,
										u'user': u'edxapp'}, u'ENGINE':
										u'xmodule.modulestore.mongo.DraftMongoModuleStore', 'NAME':
										u'default', u'OPTIONS': {u'collection': u'modulestore', u'db':
										u'edxapp', u'default_class':
										u'xmodule.hidden_module.HiddenDescriptor', u'fs_root':
										u'/edx/var/edxapp/data', u'host': [u'localhost'], u'password':
										u'password', u'port': 27017, u'render_template':
										u'edxmako.shortcuts.render_to_string', u'user': u'edxapp'}},
										{u'DOC_STORE_CONFIG': {u'collection': u'modulestore', u'db':
										u'edxapp', u'host': [u'localhost'], u'password': u'password',
										u'port': 27017, u'user': u'edxapp'}, u'ENGINE':
										'xmodule.modulestore.mongo.draft.DraftModuleStore', 'NAME':
										u'direct', u'OPTIONS': {u'collection': u'modulestore', u'db':
										u'edxapp', u'default_class':
										u'xmodule.hidden_module.HiddenDescriptor', u'fs_root':
										u'/edx/var/edxapp/data', u'host': [u'localhost'], u'password':
										u'password', u'port': 27017, u'render_template':
										u'edxmako.shortcuts.render_to_string', u'user': u'edxapp'}},
										{u'DOC_STORE_CONFIG': {u'collection': u'modulestore', u'db':
										u'edxapp', u'host': [u'localhost'], u'password': u'password',
										u'port': 27017, u'user': u'edxapp'}, u'ENGINE':
										'xmodule.modulestore.split_mongo.split_draft.DraftVersioningModuleStore',
										'NAME': 'split', u'OPTIONS': {u'collection': u'modulestore',
										u'db': u'edxapp', u'default_class':
										u'xmodule.hidden_module.HiddenDescriptor', u'fs_root':
										u'/edx/var/edxapp/data', u'host': [u'localhost'], u'password':
										u'password', u'port': 27017, u'render_template':
										u'edxmako.shortcuts.render_to_string', u'user':
										u'edxapp'}}]}}}</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>MEDIA_ROOT</td>
								<td><code>'/edx/var/edxapp/uploads'</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>DEFAULT_EXCEPTION_REPORTER_FILTER</td>
								<td><code>'django.views.debug.SafeExceptionReporterFilter'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>ADMINS</td>
								<td><code>()</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>FORMAT_MODULE_PATH</td>
								<td><code>None</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>DEFAULT_FROM_EMAIL</td>
								<td><code>u'registration@example.com'</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>VIRTUAL_UNIVERSITIES</td>
								<td><code>[]</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>BROKER_HEARTBEAT_CHECKRATE</td>
								<td><code>2</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>DATETIME_FORMAT</td>
								<td><code>'N j, Y, P'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>TEMPLATE_DIRS</td>
								<td><code>[path(u'/edx/app/edxapp/edx-platform/cms/templates'),
										path(u'/edx/app/edxapp/edx-platform/common/templates'),
										path(u'/edx/app/edxapp/edx-platform/common/djangoapps/pipeline_mako/templates'),
										path(u'/edx/app/edxapp/edx-platform/common/djangoapps/pipeline_js/templates')]</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>STATIC_ROOT_BASE</td>
								<td><code>u'/edx/var/edxapp/staticfiles'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>PIPELINE_CSS</td>
								<td><code>{'style-app': {'output_filename':
										'css/cms-style-app.css', 'source_filenames':
										['sass/style-app.css']}, 'style-app-extend1':
										{'output_filename': 'css/cms-style-app-extend1.css',
										'source_filenames': ['sass/style-app-extend1.css']},
										'style-vendor': {'output_filename':
										'css/cms-style-vendor.css', 'source_filenames':
										['css/vendor/normalize.css', 'css/vendor/font-awesome.css',
										'css/vendor/html5-input-polyfills/number-polyfill.css',
										'js/vendor/CodeMirror/codemirror.css',
										'css/vendor/ui-lightness/jquery-ui-1.8.22.custom.css',
										'css/vendor/jquery.qtip.min.css',
										'js/vendor/markitup/skins/simple/style.css',
										'js/vendor/markitup/sets/wiki/style.css']},
										'style-vendor-tinymce-content': {'output_filename':
										'css/cms-style-vendor-tinymce-content.css',
										'source_filenames': ['css/tinymce-studio-content-fonts.css',
										'js/vendor/tinymce/js/tinymce/skins/studio-tmce4/content.min.css',
										'css/tinymce-studio-content.css']},
										'style-vendor-tinymce-skin': {'output_filename':
										'css/cms-style-vendor-tinymce-skin.css', 'source_filenames':
										['js/vendor/tinymce/js/tinymce/skins/studio-tmce4/skin.min.css']},
										'style-xmodule': {'output_filename':
										'css/cms-style-xmodule.css', 'source_filenames':
										['sass/style-xmodule.css']}}</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>MAKO_MODULE_DIR</td>
								<td><code>'/tmp/mako_cms'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>SITE_ID</td>
								<td><code>1</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>DISALLOWED_USER_AGENTS</td>
								<td><code>()</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>ALLOWED_INCLUDE_ROOTS</td>
								<td><code>()</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>PASSWORD_MAX_LENGTH</td>
								<td><code>u'********************'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>XBLOCK_SELECT_FUNCTION</td>
								<td><code>''</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>LANGUAGES_BIDI</td>
								<td><code>('he', 'ar', 'fa')</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>LOGGING</td>
								<td><code>{'disable_existing_loggers': False,
										'filters': {'require_debug_false': {'()':
										'django.utils.log.RequireDebugFalse'}}, 'formatters': {'raw':
										{'format': '%(message)s'}, 'standard': {'format': '%(asctime)s
										%(levelname)s %(process)d [%(name)s] %(filename)s:%(lineno)d -
										%(message)s'}, 'syslog_format': {'format':
										'[service_variant=cms][%(name)s][env:sandbox] %(levelname)s
										[precise64 %(process)d] [%(filename)s:%(lineno)d] -
										%(message)s'}}, 'handlers': {'console': {'class':
										'logging.StreamHandler', 'formatter': 'standard', 'level':
										'INFO', 'stream': &lt;open file '&lt;stderr&gt;', mode 'w' at
										0x7f3d758f4270&gt;}, 'local': {'address': '/dev/log', 'class':
										'logging.handlers.SysLogHandler', 'facility': 16, 'formatter':
										'syslog_format', 'level': 'INFO'}, 'mail_admins': {'class':
										'django.utils.log.AdminEmailHandler', 'filters':
										['require_debug_false'], 'level': 'ERROR'}, 'newrelic':
										{'class': 'lms.lib.newrelic_logging.NewRelicHandler',
										'formatter': 'raw', 'level': 'ERROR'}, 'tracking': {'address':
										'/dev/log', 'class': 'logging.handlers.SysLogHandler',
										'facility': 17, 'formatter': 'raw', 'level': 'DEBUG'}},
										'loggers': {'': {'handlers': ['console', 'local'], 'level':
										'INFO', 'propagate': False}, 'django.request': {'handlers':
										['mail_admins'], 'level': 'ERROR', 'propagate': True},
										'tracking': {'handlers': ['tracking'], 'level': 'DEBUG',
										'propagate': False}}, 'version': 1}</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>SHORT_DATE_FORMAT</td>
								<td><code>'m/d/Y'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>ADVANCED_SECURITY_CONFIG</td>
								<td><code>{}</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>TEST_RUNNER</td>
								<td><code>'django.test.simple.DjangoTestSuiteRunner'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>CACHE_MIDDLEWARE_KEY_PREFIX</td>
								<td><code>u'********************'</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>STATICFILES_ROOT</td>
								<td><code>path(u'/edx/var/edxapp/staticfiles/acf03d7')</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>SOUTH_MIGRATION_MODULES</td>
								<td><code>{'djcelery': 'ignore'}</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>DEFAULT_FEEDBACK_EMAIL</td>
								<td><code>u'feedback@example.com'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>CELERY_MESSAGE_COMPRESSION</td>
								<td><code>'gzip'</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>MANAGERS</td>
								<td><code>()</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>EMAIL_BACKEND</td>
								<td><code>'django.core.mail.backends.console.EmailBackend'</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>DEFAULT_TABLESPACE</td>
								<td><code>''</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>TEMPLATE_CONTEXT_PROCESSORS</td>
								<td><code>('django.core.context_processors.request',
										'django.core.context_processors.static',
										'django.contrib.messages.context_processors.messages',
										'django.core.context_processors.i18n',
										'django.contrib.auth.context_processors.auth',
										'django.core.context_processors.csrf',
										'dealer.contrib.django.staff.context_processor',
										'contentstore.context_processors.doc_url')</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>CELERY_QUEUES</td>
								<td><code>{'edx.cms.core.default': {},
										'edx.cms.core.high': {}, 'edx.cms.core.low': {}}</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>DATADOG</td>
								<td><code>{}</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>SITE_NAME</td>
								<td><code>u'localhost'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>PASSWORD_DICTIONARY_EDIT_DISTANCE_THRESHOLD</td>
								<td><code>u'********************'</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>STATICFILES_EXCLUDED_APPS</td>
								<td><code>()</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>SESSION_COOKIE_AGE</td>
								<td><code>1209600</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>SETTINGS_MODULE</td>
								<td><code>'cms.envs.devstack'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>USE_ETAGS</td>
								<td><code>False</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>ADVANCED_PROBLEM_TYPES</td>
								<td><code>[{'boilerplate_name': None, 'component':
										'openassessment'}]</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>LANGUAGES</td>
								<td><code>(('en', u'English'), ('eo', u'Dummy
										Language (Esperanto)'), ('fake2', u'Fake translations'),
										('am', u'\u12a0\u121b\u122d\u129b'), ('ar',
										u'\u0627\u0644\u0639\u0631\u0628\u064a\u0629'), ('az',
										u'az\u0259rbaycanca'), ('bg-bg',
										u'\u0431\u044a\u043b\u0433\u0430\u0440\u0441\u043a\u0438
										(\u0411\u044a\u043b\u0433\u0430\u0440\u0438\u044f)'),
										('bn-bd', u'\u09ac\u09be\u0982\u09b2\u09be
										(\u09ac\u09be\u0982\u09b2\u09be\u09a6\u09c7\u09b6)'),
										('bn-in', u'\u09ac\u09be\u0982\u09b2\u09be
										(\u09ad\u09be\u09b0\u09a4)'), ('bs', u'bosanski'), ('ca',
										u'Catal\xe0'), ('ca@valencia', u'Catal\xe0 (Val\xe8ncia)'),
										('cs', u'\u010ce\u0161tina'), ('cy', u'Cymraeg'), ('da',
										u'dansk'), ('de-de', u'Deutsch (Deutschland)'), ('el',
										u'\u0395\u03bb\u03bb\u03b7\u03bd\u03b9\u03ba\u03ac'),
										('en-uk', u'English (United Kingdom)'), ('en@lolcat', u'LOLCAT
										English'), ('en@pirate', u'Pirate English'), ('es-419',
										u'Espa\xf1ol (Latinoam\xe9rica)'), ('es-ar', u'Espa\xf1ol
										(Argentina)'), ('es-ec', u'Espa\xf1ol (Ecuador)'), ('es-es',
										u'Espa\xf1ol (Espa\xf1a)'), ('es-mx', u'Espa\xf1ol
										(M\xe9xico)'), ('es-pe', u'Espa\xf1ol (Per\xfa)'), ('et-ee',
										u'Eesti (Eesti)'), ('eu-es', u'euskara (Espainia)'), ('fa',
										u'\u0641\u0627\u0631\u0633\u06cc'), ('fa-ir',
										u'\u0641\u0627\u0631\u0633\u06cc
										(\u0627\u06cc\u0631\u0627\u0646)'), ('fi-fi', u'Suomi
										(Suomi)'), ('fil', u'Filipino'), ('fr', u'Fran\xe7ais'),
										('gl', u'Galego'), ('gu',
										u'\u0a97\u0ac1\u0a9c\u0ab0\u0abe\u0aa4\u0ac0'), ('he',
										u'\u05e2\u05d1\u05e8\u05d9\u05ea'), ('hi',
										u'\u0939\u093f\u0928\u094d\u0926\u0940'), ('hr', u'hrvatski'),
										('hu', u'magyar'), ('hy-am',
										u'\u0540\u0561\u0575\u0565\u0580\u0565\u0576
										(\u0540\u0561\u0575\u0561\u057d\u057f\u0561\u0576)'), ('id',
										u'Bahasa Indonesia'), ('it-it', u'Italiano (Italia)'),
										('ja-jp', u'\u65e5\u672c\u8a9e (\u65e5\u672c)'), ('kk-kz',
										u'\u049b\u0430\u0437\u0430\u049b \u0442\u0456\u043b\u0456
										(\u049a\u0430\u0437\u0430\u049b\u0441\u0442\u0430\u043d)'),
										('km-kh',
										u'\u1797\u17b6\u179f\u17b6\u1781\u17d2\u1798\u17c2\u179a
										(\u1780\u1798\u17d2\u1796\u17bb\u1787\u17b6)'), ('kn',
										u'\u0c95\u0ca8\u0ccd\u0ca8\u0ca1'), ('ko-kr',
										u'\ud55c\uad6d\uc5b4 (\ub300\ud55c\ubbfc\uad6d)'), ('lt-lt',
										u'Lietuvi\u0173 (Lietuva)'), ('ml',
										u'\u0d2e\u0d32\u0d2f\u0d3e\u0d33\u0d02'), ('mn',
										u'\u041c\u043e\u043d\u0433\u043e\u043b \u0445\u044d\u043b'),
										('mr', u'\u092e\u0930\u093e\u0920\u0940'), ('ms', u'Bahasa
										Melayu'), ('nb', u'Norsk bokm\xe5l'), ('ne',
										u'\u0928\u0947\u092a\u093e\u0932\u0940'), ('nl-nl',
										u'Nederlands (Nederland)'), ('or',
										u'\u0b13\u0b21\u0b3c\u0b3f\u0b06'), ('pl', u'Polski'),
										('pt-br', u'Portugu\xeas (Brasil)'), ('pt-pt', u'Portugu\xeas
										(Portugal)'), ('ro', u'rom\xe2n\u0103'), ('ru',
										u'\u0420\u0443\u0441\u0441\u043a\u0438\u0439'), ('si',
										u'\u0dc3\u0dd2\u0d82\u0dc4\u0dbd'), ('sk',
										u'Sloven\u010dina'), ('sl', u'Sloven\u0161\u010dina'), ('sq',
										u'shqip'), ('sr', u'\u0421\u0440\u043f\u0441\u043a\u0438'),
										('ta', u'\u0ba4\u0bae\u0bbf\u0bb4\u0bcd'), ('te',
										u'\u0c24\u0c46\u0c32\u0c41\u0c17\u0c41'), ('th',
										u'\u0e44\u0e17\u0e22'), ('tr-tr', u'T\xfcrk\xe7e
										(T\xfcrkiye)'), ('uk',
										u'\u0423\u043a\u0440\u0430\u0457\u043d\u0441\u044c\u043a\u0430'),
										('ur', u'\u0627\u0631\u062f\u0648'), ('vi', u'Ti\u1ebfng
										Vi\u1ec7t'), ('uz', u'\u040e\u0437\u0431\u0435\u043a'),
										('zh-cn', u'\u4e2d\u6587 (\u7b80\u4f53)'), ('zh-hk',
										u'\u4e2d\u6587 (\u9999\u6e2f)'), ('zh-tw', u'\u4e2d\u6587
										(\u53f0\u7063)'))</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>CELERY_CACHE_BACKEND</td>
								<td><code>'celery'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>COURSE_ID_PATTERN</td>
								<td><code>'(?P&lt;course_id&gt;(?:[^/]+/[^/]+/[^/]+)|(?:[^/]+))'</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>INTERNAL_IPS</td>
								<td><code>('127.0.0.1',)</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>STATIC_URL</td>
								<td><code>'/static/acf03d7/'</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>HTTPS</td>
								<td><code>'on'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>USAGE_KEY_PATTERN</td>
								<td><code>u'********************'</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>EMAIL_PORT</td>
								<td><code>25</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>USE_TZ</td>
								<td><code>True</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>SHORT_DATETIME_FORMAT</td>
								<td><code>'m/d/Y P'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>CELERY_RESULT_BACKEND</td>
								<td><code>'cache'</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>PASSWORD_HASHERS</td>
								<td><code>u'********************'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>FILE_UPLOAD_MAX_MEMORY_SIZE</td>
								<td><code>2621440</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>ABSOLUTE_URL_OVERRIDES</td>
								<td><code>{}</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>BUGS_EMAIL</td>
								<td><code>'bugs@example.com'</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>SHIBBOLETH_DOMAIN_PREFIX</td>
								<td><code>'shib:'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>CACHE_MIDDLEWARE_SECONDS</td>
								<td><code>600</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>EMBARGO_SITE_REDIRECT_URL</td>
								<td><code>None</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>DEBUG_TOOLBAR_CONFIG</td>
								<td><code>{'INTERCEPT_REDIRECTS': False,
										'SHOW_TOOLBAR_CALLBACK': &lt;function &lt;lambda&gt; at
										0x2927a28&gt;}</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>DATETIME_INPUT_FORMATS</td>
								<td><code>('%Y-%m-%d %H:%M:%S', '%Y-%m-%d
										%H:%M:%S.%f', '%Y-%m-%d %H:%M', '%Y-%m-%d', '%m/%d/%Y
										%H:%M:%S', '%m/%d/%Y %H:%M:%S.%f', '%m/%d/%Y %H:%M',
										'%m/%d/%Y', '%m/%d/%y %H:%M:%S', '%m/%d/%y %H:%M:%S.%f',
										'%m/%d/%y %H:%M', '%m/%d/%y')</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>COURSES_WITH_UNSAFE_CODE</td>
								<td><code>[]</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>TECH_SUPPORT_EMAIL</td>
								<td><code>u'technical@example.com'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>AUTH_TOKENS</td>
								<td><code>u'********************'</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>TIME_ZONE</td>
								<td><code>u'America/New_York'</code></td>
							</tr>

							<tr class="djDebugOdd">
								<td>EMAIL_HOST_USER</td>
								<td><code>''</code></td>
							</tr>

							<tr class="djDebugEven">
								<td>PROFANITIES_LIST</td>
								<td><code>u'********************'</code></td>
							</tr>

						</tbody>
					</table>

				</div>
			</div>
		</div>



		<div id="djDebugHeaderPanel" class="panelContent"
			style="display: none;">
			<div class="djDebugPanelTitle">
				<a href="" class="djDebugClose">Close</a>
				<h3>HTTP Headers</h3>
			</div>
			<div class="djDebugPanelContent">
				<div class="scroll">


				</div>
			</div>
		</div>



		<div id="djDebugRequestVarsPanel" class="panelContent"
			style="display: none;">
			<div class="djDebugPanelTitle">
				<a href="" class="djDebugClose">Close</a>
				<h3>Request Vars</h3>
			</div>
		</div>



		<div id="djDebugSQLPanel" class="panelContent" style="display: none;">
			<div class="djDebugPanelTitle">
				<a href="" class="djDebugClose">Close</a>
				<h3>SQL Queries from 1 connection</h3>
			</div>
			<div class="djDebugPanelContent">
				<div class="scroll">


					<div class="clearfix">
						<ul class="stats">

							<li><strong class="label"><span
									style="background-color: rgb(256, 0, 0)" class="color">&nbsp;</span>
									default</strong> <span class="info">4.25 ms (6 queries)</span></li>

						</ul>
					</div>

				</div>
			</div>
		</div>



		<div id="djDebugSignalsPanel" class="panelContent"
			style="display: none;">
			<div class="djDebugPanelTitle">
				<a href="" class="djDebugClose">Close</a>
				<h3>Signals</h3>
			</div>
			<div class="djDebugPanelContent">
				<div class="scroll">


				</div>
			</div>
		</div>



		<div id="djDebugLoggingPanel" class="panelContent"
			style="display: none;">
			<div class="djDebugPanelTitle">
				<a href="" class="djDebugClose">Close</a>
				<h3>Log Messages</h3>
			</div>
			<div class="djDebugPanelContent">
				<div class="scroll">



				</div>
			</div>
		</div>


		<div id="djDebugWindow" class="panelContent" style="display: none;"></div>
	</div>


	<div>
		<div id="tender_toggler" style="display: none;">
			<a href="#" id="tender_toggler_link">Help &amp; Support</a>
		</div>
	</div>
	<div id="MathJax_Font_Test"
		style="position: absolute; visibility: hidden; top: 0px; left: 0px; width: auto; padding: 0px; border: 0px; margin: 0px; white-space: nowrap; text-align: left; text-indent: 0px; text-transform: none; line-height: normal; letter-spacing: normal; word-spacing: normal; font-size: 40px; font-weight: normal; font-style: normal; font-family: MathJax_Main, sans-serif;"></div>
	<div id="lean_overlay"></div>
	<div id="lean_overlay"></div>
	<div id="reader-feedback" class="sr" style="display:none"
		aria-hidden="false" aria-atomic="true" aria-live="assertive"></div>
	<div class="tooltip" style="display: none; opacity: 0;"></div>
</body>
</html>
