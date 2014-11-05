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
<title>问题</title>

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
<link rel="stylesheet" type="text/css" href="tcss/jquery.timepicker.css" />
<link href="tcss/style-xmodule.css" rel="stylesheet" type="text/css" />
<link href="tcss/custom.css" rel="stylesheet" type="text/css" />

<style type="text/css"> 
.exam_button { 
width:100%;
display: inline-block; 
zoom: 1; /* zoom and *display = ie7 hack for display:inline-block */ 
*display: inline; 
vertical-align: baseline; 
outline: none; 
cursor: pointer; 
text-align: center; 
text-decoration: none; 
font: 14px/100% Arial, Helvetica, sans-serif; 
padding: .5em 2em .55em; 
text-shadow: 0 1px 1px rgba(0,0,0,.3); 
-webkit-border-radius: .5em; 
-moz-border-radius: .5em; 
border-radius: .5em; 
-webkit-box-shadow: 0 1px 2px rgba(0,0,0,.2); 
-moz-box-shadow: 0 1px 2px rgba(0,0,0,.2); 
box-shadow: 0 1px 2px rgba(0,0,0,.2); 
} 
.exam_button:hover { 
text-decoration: none; 
} 
.exam_button:active { 
position: relative; 
top: 1px; 
} 
.exam_button_blue { 
color: #d9eef7; 
border: solid 1px #0076a3; 
background: -webkit-gradient(linear, left top, left bottom, from(#00adee), to(#0078a5)); 
background: -moz-linear-gradient(top, #00adee, #0078a5); 
filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#00adee', endColorstr='#0078a5'); 
} 
.exam_button_blue:hover { 
background: #007ead; 
background: -webkit-gradient(linear, left top, left bottom, from(#0095cc), to(#00678e)); 
background: -moz-linear-gradient(top, #0095cc, #00678e); 
filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#0095cc', endColorstr='#00678e'); 
} 
.exam_button_blue:active { 
color: #80bed6; 
background: -webkit-gradient(linear, left top, left bottom, from(#0078a5), to(#00adee)); 
background: -moz-linear-gradient(top, #0078a5, #00adee); 
filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#0078a5', endColorstr='#00adee'); 
} 
</style> 

<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script src="js/jquery/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/convert.js"></script>
<script src="js/common.js"></script>
<!-- <script type="text/javascript" language="javascript" src="js/jquery-1.5.1.min.js"></script> -->
<script type="text/javascript" src="js/insertsome.js"></script>
<script type="text/javascript">
$(function additem(){
	
	$(".header-button").click(function(){
		$(".xml-box").insert({"text":"Header\n=====\n"});
	});
	$(".multiple-choice-button").click(function(){
		$(".xml-box").insert({"text":"[x]  correct\n[ ]  incorrect\n[x]  correct\n"});
	});
	$(".checks-button").click(function(){
		$(".xml-box").insert({"text":"( )  incorrect\n( )  incorrect\n(x)  correct\n"});
	});
	$(".string-button").click(function(){
		$(".xml-box").insert({"text":"= answer\n"});
	});
/* 	$(".number-button").click(function(){
		$(".xml-box").insert({"text":"= answer +- 0.001%\n"});
	}); */
	$(".number-button").click(function(){
		$(".xml-box").insert({"text":"{分值}"});
	});
/* 	$(".dropdown-button").click(function(){
		$(".xml-box").insert({"text":"dropdown-button"});
	}); */
	$(".dropdown-button").click(function(){
		$(".xml-box").insert({"text":"[[(answer)]]"});
	});
	$(".explanation-button").click(function(){
		$(".xml-box").insert({"text":"[问题解释]\n问题解释内容 \n[问题解释]"});
	});
	inittrainlist();
});

function inittrainlist()
{
	
/* 	<c:forEach var="train" items="${trainlist}">
	<li class="editor-md">
		<a data-boilerplate="checkboxes_response.yaml" data-category="experiment"  onclick="showexam(${train.id})">
			<span class="name">${train.name}</span>
		</a>
	</li>
</c:forEach> */
	$.ajax({
		url : "cms/getTrainList.action",
		type : "post",
		success : function(s) {
			var a = eval("(" + s + ")");
			
			var len = a.length;
			var tmp = '';
			for (var i=0;i<len;i++)
			{
				//alert(+"  ,  "+a[i].name);
				tmp += '<li class="editor-md">'+
				'<a data-boilerplate="checkboxes_response.yaml" data-category="experiment"  onclick="showexam('+a[i].id+')">'+
					'<span class="name">'+a[i].name+'</span>'+
				'</a>'+
				'</li>';
			}
			$("#trainlistli").html(tmp);
		}
	});
}
function problem_html_cancel(){
	$("#problem_html").hide();
	$("#component").show();
	
}
function exam_editor_cancel(){
	$("#exam_editor").hide();
	$("#exam_select").hide();
	$("#component").show();
	
}
//增加实训课程
function showexam(trainId){
	$("#exam_select").hide();
	$("#component").show();
	$("#exam_content").show();
	
	//根据课程ID复制一门实训到考试系统
	var everticalId = parseInt("${verticalId}");
	tainId = parseInt(trainId);
	var examId = parseInt("${examId}");
	var data = {tainId:tainId,examId:examId,everticalId:everticalId};
	$.ajax({
		url : "cms/copytrain.action",
		type : "post",
		data :data,
		success : function(s) {
			var a = eval("(" + s + ")");
			if ("sucess" == a.sucess)
			{
				location.reload();
			}
		}
	});
}
function examshowconcel(){
	$("#exam_select").hide();
	$("#component").show();
	
}
function showexamlist(){
	$("#component").hide();
	$("#exam_select").show();
}
function showeditor_cancel(){
	$("#editor").hide();
	$("#component").show();
}
function showeditor(){
	$("#editinput").attr("value",-1);
	$("#editor").show();
}
function showadvanceeditor(){
	$("#editinput").attr("value",-1);
	$("#advanced_editor").show();
}
function advanced_cancel(){
	$("#advanced_editor").hide();
	$("#component").show();
}
/**
 * 选择5种问题类型
 */
 function showcheckbox(type){
		if(type==5){
			$("#problem_select").hide();
			$("#problem_html").show();
		}
		else{
		$("#problem_select").hide();
		$("#problem_checkbox").show();
		//$("#component").show();
		var tmp='';
		if (type == 1)//多选
		{
			tmp  = '>>问题题目请在这儿修改<<\r{分值}\r'+
			'[x] 选项内容\r'+
			'[ ] 选项内容\r'+
			'[x] 选项内容\r'+
			'[问题解释]\r'+
			'问题解释内容\r'+
			'[问题解释]';
		}
		else if (type ==2)//单选
		{
			tmp  = '>>问题题目请在这儿修改<<\r{分值}\r'+
			'( ) 选项内容\r'+
			'( ) 选项内容\r'+
			'(x) 选项内容\r'+
			'[问题解释]\r'+
			'问题解释内容\r'+
			'[问题解释]';
		}
		else if (type == 3)
		{
			tmp  = '>>问题题目请在这儿修改<<\r{分值}\r'+
			'= 答案在这儿修改\r'+
			'[问题解释]\r'+
			'问题解释内容\r'+
			'[问题解释]';
		}
		else if (type == 4)
		{
			tmp  = '>>问题题目请在这儿修改<<\r{分值}\r'+
			'[[(答案在这儿修改)]]\r'+
			'[问题解释]\r'+
			'问题解释内容\r'+
			'[问题解释]';
		}
		
		$("#lowedittextarea").html(tmp);//("value",tmp);
		showeditor();
		}
		/*A checkboxes problem presents checkbox buttons for student input. Students can select more than one option presented.
		>>Select the answer that matches<<

		[x] correct
		[ ] incorrect
		[x] correct*/
	}
	
function isinter(xml)
{
	  xml = xml.replace(/\{(.+?)\}/g, function(match, p) {
          var selectString = '\n<scoredefinition>\n',
              correct;
			  correct=p;
			  if (!isInteger(p))
			  {
				  return true;
			  }

          return false;
      });
}
function savequestion()
{
	resetadvice();
	var everticalId = parseInt("${verticalId}");
	var examId = parseInt("${examId}");
	var content = $("#advanceedittextarea").val();
	var id = $("#editinput").attr("value");
	content = replaceTextarea1(content);
	var lowcontent = $("#lowedittextarea").val();
	lowcontent = replaceTextarea1(lowcontent);
	var data={id:id,content:content,lowcontent:lowcontent,examId:examId,everticalId:everticalId};
	$.ajax({
		url : "cms/createExamQuestion.action",
		type : "post",
		data :data,
		success : function(s) {
			var a = eval("(" + s + ")");
			if ("sucess" == a.sucess)
			{
				location.reload();
			}
		}
	});
}
function saveadvicequestion()
{
	var everticalId = parseInt("${verticalId}");
	var examId = parseInt("${examId}");
	var content = $("#advanceedittextarea").val();
	var id = $("#editinput").attr("value");
	content = replaceTextarea1(content);
	var data={id:id,content:content,examId:examId,everticalId:everticalId};
	$.ajax({
		url : "cms/createadviceExamQuestion.action",
		type : "post",
		data :data,
		success : function(s) {
			var a = eval("(" + s + ")");
			if ("sucess" == a.sucess)
			{
				location.reload();
			}
		}
	});
}
function savehtmlquestion()
{
	var everticalId = parseInt("${verticalId}");
	var examId = parseInt("${examId}");
	var content = $("#htmledit").contents().find("#editor").html();
	content = replaceTextarea1(content);
	var id = $("#editinput").attr("value");
	var data={id:id,content:content,examId:examId,everticalId:everticalId};
	$.ajax({
		url : "cms/createhtmlExamQuestion.action",
		type : "post",
		data :data,
		success : function(s) {
			var a = eval("(" + s + ")");
			if ("sucess" == a.sucess)
			{
				location.reload();
			}
		}
	});
}
function showselect(){
	$("#component").hide();
	$("#problem_select").show();
}
function problemshowconcel(){
	$("#problem_select").hide();
	$("#component").show();
}

$(function() {
	//新建verticalId
	if ("${verticalId}" == -1)
	{
	   edit();
	}
	
});

function hidetrain()
{
	$("#exam_editor").hide();
	$("#exam_select").hide();
	$("#componet").show();
	
	//<!--$("#traindiv").hide();-->
}
function showtrain(){
    //document.getElementById('traindiv').style.display='block'; 
	//$("#traindiv").show();
	document.getElementById("exam_editor").style.display="block";
	document.getElementById("exam_select").style.display="none";
	document.getElementById("component").style.display="block";
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
function showquestiondialog(id)
{
	var data = {id:id};
	$.ajax({
		url:"cms/getExamQuestion.action",
		type:"post",
		data:data,
		success:function(s){
			var a=eval("("+s+")");	
			if (a.sucess=="sucess")
			{
				if (a.lowcontent)
				{
					var con = a.advicecontent;
					con = replaceTextarea2(con);
					$("#advanceedittextarea").html(con);
					var lowcon = a.lowcontent;					
					lowcon = replaceTextarea2(lowcon);
					$("#lowedittextarea").html(lowcon);
					showeditor();
				}
				else
				{
					var con = a.advicecontent;
					con = replaceTextarea2(con);
					$("#advanceedittextarea").html(con);
					showadvanceeditor();
				}
				$("#editinput").attr("value",id);
				//location.reload();
				
			}
		}
	});
}
function showhtmlquestiondialog(id)
{
	var data = {id:id};
	$.ajax({
		url:"cms/getExamQuestion.action",
		type:"post",
		data:data,
		success:function(s){
			var a=eval("("+s+")");	
			if (a.sucess=="sucess")
			{
				var con = a.advicecontent;
				con = replaceTextarea2(con);
				$("#htmledit").contents().find("#editor").html(con);
				
				$("#editinput").attr("value",id);
				//location.reload();
				$("#problem_html").show();
			}
		}
	});
}
function delexamquestion(id)
{
	var data = {id:id};
	$.ajax({
		url:"cms/delExamQuestion.action",
		type:"post",
		data:data,
		success:function(s){
			var a=eval("("+s+")");	
			if (a.sucess=="sucess")
			{
				location.reload();
			}
		}
	});
}
function savever(name)
{
	var sequenticalId = parseInt("${sequentialId}");
	var verticalId = parseInt("${verticalId}");
	var examId = parseInt("${examId}");
	var data = {sequenticalId:sequenticalId,verticalId:verticalId,name:name};
	$.ajax({
		url:"cms/createExamVertical.action",
		type:"post",
		data:data,
		success:function(s){
			var a=eval("("+s+")");	
			if (a.sucess=="sucess")
			{
				location.href = "cms/totexamtrain.action?examId="+examId+"&sequentialId="+sequenticalId+"&verticalId="+a.verticalId;
			}
		}
	});
} 
</script>
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
		url(images/overlay_back.png);
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
	background: url(images/loader.gif)
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
		url(images/overlay_back.png);
}

</style>
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
						<!-- <ul>
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
						</ul> -->
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
										            <span class="xblock-display-name">
										            <c:if test="${!empty vt.question}">问题</c:if>
										            <c:if test="${empty vt.question}">实训</c:if>
										            </span>
										        </div>
										        <div class="header-actions">
										            <ul class="actions-list">
									                        <li class="action-item action-edit">
									                        	<c:if test="${!empty vt.question}">
									                        	<c:if test="${vt.question.type==1}">
									                        	<a href="javascript:void(0);" onclick="showhtmlquestiondialog(${vt.id});" class="edit-button action-button">
									                                <i class="icon-pencil"></i>
									                                <span class="action-button-text">编辑</span>
									                            </a>
									                        	</c:if>
									                        	<c:if test="${vt.question.type==0}">
									                        	<a href="javascript:void(0);" onclick="showquestiondialog(${vt.id});" class="edit-button action-button">
									                                <i class="icon-pencil"></i>
									                                <span class="action-button-text">编辑</span>
									                            </a>
									                            </c:if>
									                        	</c:if>
									                            <c:if test="${empty vt.question}">
									                            <%-- inittrain('${vt.train.id}','${vt.train.name}','${vt.train.codenum}','${vt.train.envname}','${vt.train.conContent}','${vt.train.conShell}','${vt.train.conAnswer}','${vt.train.score}','${vt.train.scoretag}'); --%>
									                        	<a href="javascript:void(0);" onclick="showtrain();inittrainbyid(${vt.train.id});" class="edit-button action-button">
									                                <i class="icon-pencil"></i>
									                                <span class="action-button-text">编辑</span>
									                            </a>
									                        	</c:if>
									                        </li>
										                    <li class="action-item action-delete">
										                        <a href="javascript:void(0);" data-tooltip="删除" onclick="delexamquestion(${vt.id});" class="delete-button action-button">
										                        <i class="icon-trash"></i>
										                        <span class="sr">删除</span>
										                        </a>
										                    </li>
										            </ul>
										        </div>
										    </div>
										 </header>
										    <article class="xblock-render">
										   		<c:if test="${!empty vt.question}">
										   			<div class="xblock xblock-student_view xmodule_display xmodule_CapaModule xblock-initialized" data-runtime-class="PreviewRuntime" data-init="XBlockToXModuleShim" data-runtime-version="1" data-usage-id="" data-type="Problem" data-block-type="problem">
														<div id="" class="problems-wrapper showed" data-problem-id="" data-url="" data-progress_status="none" data-progress_detail="0/1">
													<c:if test="${vt.question.type == 0}">
										   			<div class="problem-progress">
										   			(本题共有${vt.score}分)
										   			</div></br></br>
										   			<div class="problem" role="application">
										   			</c:if>
											   		<%-- ${vt.htmlcontent} --%>
											   		<c:forEach var="qd" items="${vt.qdlist}">
											   		    <%-- html问题描述 --%>
											   			<c:if test="${qd.type == 1}">
											   				<div id="" class="trainimg" aria-hidden="true">
																	${qd.title}
															</div>
											   				
											   			</c:if>
											   		    <%-- 单选 --%>
											   			<c:if test="${qd.type == 2}">
											   				<div>
																<p>${qd.title}</p>
																
																    <span><form class="choicegroup capa_inputtype" id="">
																    <div class="indicator_container">
																        <span class="unanswered" id="" aria-describedby="" style="display: inline-block;"></span>
																    </div>
																
																    <fieldset role="radiogroup" aria-label="">
																		<c:forEach var="qdcontent" items="${qd.content}">
																        <label for="" correct_answer="true" class=""><!-- choicegroup_correct -->
																            <input type="radio" name="${qd.id}" id="" aria-role="radio" aria-describedby="" value="choice_ipod">${qdcontent}
																
																        </label>
																        </c:forEach>
																        <span id=""></span>
																    </fieldset>
																
																</form>
																 <p id="" class="answer" aria-hidden="true">
																	      <c:forEach var="qdanswer" items="${qd.answer}">
																	        <label>
																	        	${qdanswer }
																	        </label>
																	       </c:forEach>
																      </p>
																</span>
																<c:if test="${!empty qd.explain}">
																    <section class="solution-span">
																 <span id=""><solution id="">
																        <div class="detailed-solution">
																            <p>${qd.explain}</p>
																        </div>
																    </solution>
																</span>
																</section>
																</c:if>
																</div>
											   				
											   			</c:if>
											   			<%-- 多选 --%>
											   			<c:if test="${qd.type == 3}">
														  <div>
														  <p>${qd.title}</p>
														  <span><form class="choicegroup capa_inputtype" id="">
														    <div class="indicator_container">
														        <span class="status unanswered" id="" aria-describedby="">
														            <span class="sr">
														                -
														                未答复
														            </span>
														        </span>
														    </div>
														
														    <fieldset role="checkboxgroup" aria-label="Select the answer that matches">
																<c:forEach var="qdcontent" items="${qd.content}">
														        <label for="" correct_answer="true" class="">
														            <input type="checkbox" name="" id="" aria-role="radio" aria-describedby="" aria-multiselectable="true">${qdcontent}
														        </label>
														        </c:forEach>
														        <span id=""></span>
														    </fieldset>
														
														</form>
														<p id="" class="answer" aria-hidden="true">
																	      <c:forEach var="qdanswer" items="${qd.answer}">
																	        <label>
																	        	${qdanswer }
																	        </label>
																	       </c:forEach>
																      </p>
														</span>
														<c:if test="${!empty qd.explain}">
														<section class="solution-span">
																 <span id=""><solution id="">
																        <div class="detailed-solution">
																            <p>${qd.explain}</p>
																        </div>
																    </solution>
																</span>
																</section>
																</c:if>
														</div>
											   			</c:if>
											   			<%-- 填空 --%>
											   			<c:if test="${qd.type == 4}">
											   				  <div>
																<p>${qd.title}</p>
																
																 <span><div id="" class=" capa_inputtype  textline">
																    <div class="unanswered " id="">
																
																    <input type="text" name="" id="" aria-label="Which US state has Lansing as its capital?" aria-describedby="" value="" size="20">
																      <p class="status" aria-hidden="true" aria-describedby="">
																        Which US state has Lansing as its capital?
																        -
																        未答复
																      </p>
																      <p id="" class="answer" aria-hidden="true">
																	      <c:forEach var="qdanswer" items="${qd.answer}">
																	        <label>
																	        	${qdanswer }
																	        </label>
																	       </c:forEach>
																      </p>
																</div>
																</div></span>
																<c:if test="${!empty qd.explain}">
																    <section class="solution-span">
																 <span id=""><solution id="">
																        <div class="detailed-solution">
																            <p>${qd.explain}</p>
																        </div>
																    </solution>
																</span>
																</section>
																</c:if>
																</div>
											   			</c:if>
											   			<%-- 多文本填空 --%>
											   			<c:if test="${qd.type == 5}">
											   				<div>
																<p>${qd.title}</p>
																
																 <span><div id="" class=" capa_inputtype  textline">
																    <div class="unanswered " id="">
																
																    <textarea name="" id="" aria-label="" aria-describedby="" value="" size="20" rows="5" style="width:95%"></textarea>
																      <p class="status" aria-hidden="true" aria-describedby="">
																        Which US state has Lansing as its capital?
																        -
																        未答复
																      </p>
																      <p id="" class="answer" aria-hidden="true">
																      <c:forEach var="qdanswer" items="${qd.answer}">
																	        <label>
																	        	${qdanswer }
																	        </label>
																	       </c:forEach>
																      </p>
																</div>
																</div></span>
																<c:if test="${!empty qd.explain}">
																    <section class="solution-span">
																 <span id=""><solution id="">
																        <div class="detailed-solution">
																            <p>${qd.explain}</p>
																        </div>
																    </solution>
																</span>
																</section>
																</c:if>
																</div>
											   			</c:if>
											   		</c:forEach>
											   		
														  <!-- <div class="action">
														    <input type="hidden" name="problem_id" value="Checkboxes">
														
														    <input class="check 提交" type="button" data-checking="正在检测..." value="提交">
														    <button class="show"><span class="show-label">揭示答案</span></button>
														  </div> -->
														  <c:if test="${vt.question.type == 0}">
														</div>
														
										   			</div>
														</c:if>
													</div>
										   		</c:if>
										        <c:if test="${empty vt.question}">${vt.train.name}</c:if>
										    </article>
										    </section>
										        </li>
										</ol>
										</c:forEach>
										
										<div class="add-xblock-component new-component-item adding">
											<div class="new-component" id="component">
												<h5>增加新的题目</h5>
												<ul class="new-component-type">
													<li><a onclick="showselect()"
														class="multiple-templates add-xblock-component-button"
														data-type="problem"> <span
															class="large-template-icon large-problem-icon"></span> <span
															class="name">问题</span>
													</a></li>
													<li><a onclick="showexamlist()"
														class="multiple-templates add-xblock-component-button"
														data-type="experiment"> <span
															class="large-template-icon large-experiment-icon"></span>
															<span class="name">实验</span>
													</a></li>
												</ul>
											</div>
											<!--问题列表-->
											<div class="new-component-templates new-component-problem" id="problem_select" style="display: none;">
											<div class="tab-group tabs ui-tabs ui-widget ui-widget-content ui-corner-all">
											<ul class="problem-type-tabs nav-tabs ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all" role="tablist">
												<li class="current ui-state-default ui-corner-top ui-tabs-active ui-state-active" role="tab" tabindex="0" aria-controls="tab1" aria-labelledby="ui-id-1" aria-selected="true">
													<a href="#tab1" class="link-tab ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-1">Problem Types</a>
												</li>
											</ul>
											<div id="tab1" class="tab current ui-tabs-panel ui-widget-content ui-corner-bottom" aria-labelledby="ui-id-1" role="tabpanel" style="display: block;" aria-expanded="true" aria-hidden="false">
												<ul class="new-component-template">
															<li class="editor-md">
																<a data-boilerplate="checkboxes_response.yaml" data-category="problem"  onclick="showcheckbox(5)">
																	<span class="name">描述题</span>
																</a>
															</li>
															<li class="editor-md">
																<a data-boilerplate="checkboxes_response.yaml" data-category="problem"  onclick="showcheckbox(1)">
																	<span class="name">多项选择</span>
																</a>
															</li>
															<li class="editor-md">
																<a data-boilerplate="multiplechoice.yaml" data-category="problem"  onclick="showcheckbox(2)">
																	<span class="name">单项选择</span>
																</a>
															</li>
															<li class="editor-md">
																<a data-boilerplate="string_response.yaml" data-category="problem"  onclick="showcheckbox(3)">
																	<span class="name">填空</span>
																</a>
															</li>
															<li class="editor-md">
																<a data-boilerplate="checkboxes_response.yaml" data-category="problem"  onclick="showcheckbox(4)">
																	<span class="name">论述题</span>
																</a>
															</li>
												</ul>
											</div>
										</div>
										<a class="cancel-button" onclick="problemshowconcel()" >取消</a>
										</div>
										<!--试卷列表-->
										<div class="new-component-templates new-component-problem" id="exam_select" style="display: none;">
											<div class="tab-group tabs ui-tabs ui-widget ui-widget-content ui-corner-all">
											<ul class="problem-type-tabs nav-tabs ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all" role="tablist">
												<li class="current ui-state-default ui-corner-top ui-tabs-active ui-state-active" role="tab" tabindex="0" aria-controls="tab1" aria-labelledby="ui-id-1" aria-selected="true">
													<a href="#tab1" class="link-tab ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-1">实训列表</a>
												</li>
											</ul>
											<div id="tab1" class="tab current ui-tabs-panel ui-widget-content ui-corner-bottom" aria-labelledby="ui-id-1" role="tabpanel" style="display: block;" aria-expanded="true" aria-hidden="false">
												<ul class="new-component-template">
													<li>
														<input class="exam_button exam_button_blue" type="button" value="添加实验" onclick="showtrain();resettrain();"/> 
													</li>
													<div id="trainlistli"></div>
												    <!--注意实训系统的开启  动态载入 -->
													<%-- <c:forEach var="train" items="${trainlist}">
															<li class="editor-md">
																<a data-boilerplate="checkboxes_response.yaml" data-category="experiment"  onclick="showexam(${train.id})">
																	<span class="name">${train.name}</span>
																</a>
															</li>
													</c:forEach>	 --%>	
												</ul>
											</div>
										</div>
										<a class="cancel-button" onclick="examshowconcel()" >取消</a>
										</div>
										</div>

									</div>

								</article>

							</section>
							<div class="ui-loading is-hidden">
								<p>
									<span class="spin"><i class="icon-refresh"></i></span> <span
										class="copy"><!-- Loading... --></span>
								</p>
							</div>
						</article>
						<aside class="content-supplementary" role="complimentary">
							<div id="publish-unit">

								<div class="bit-publishing is-staff-only is-scheduled">
									<h3 class="bar-mod-title pub-status">
										<span class="sr">Publishing Status</span>我在这个页面能做什么？
									</h3>

									<div class="wrapper-last-draft bar-mod-content">
										<p class="copy meta">

											 <span class="date">您可以在单元中添加新的试卷，定义试卷编号、试卷名称,试卷分值、上传判分脚本。</span> <span class="user">您还修改试卷名称、试卷题目、试卷答案.</span>
										</p>
										<p class="copy meta"><span>此外，您可以在一个单元中添加多个试卷，或者删除冗余的试卷。</span></p>
									</div>

									<div class="wrapper-release bar-mod-content">
										<h5 class="title"><!-- Release: --></h5>
										<p class="copy">


											<span class="release-date"></span>
											 <span class="release-with"></span>

										</p>
									</div>



									<div class="wrapper-pub-actions bar-mod-actions">
										<ul class="action-list">
											<li class="action-item"><!-- <a
												class="action-publish action-primary " href="">Publish </a> -->
											</li>
											<li class="action-item"><!-- <a
												class="action-discard action-secondary " href="">Discard
													Changes </a> --></li>
										</ul>
									</div>
								</div>

							</div>
							<div id="publish-history" class="unit-publish-history">


								<div class="wrapper-last-publish">
									<p class="copy">
										<!-- Last published  --><span class="date"><!-- Aug 20, 2014 at 01:21 -->
											<!-- UTC --></span><!--  by --> <span class="user"><!-- staff --></span>
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
					class="copy">向云考试平台求助?</span></a></li>
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
	<input type="hidden" value="-1" id="editinput"/>
	<div class="editor" id="editor" style="display:none;">
    <div class="wrapper wrapper-modal-window wrapper-modal-window-edit-xblock" aria-describedby="modal-window-description" aria-labelledby="modal-window-title" aria-hidden="" role="dialog">
    <div class="modal-window-overlay"></div>
    <div class="modal-window modal-editor confirm modal-lg modal-type-problem" style="top: 31.39999999999999px; left: 202.5px;position:fixed;">
        <div class="edit-xblock-modal">
            <div class="modal-header">
                <h2 class="title modal-window-title">编辑：Multiple Choice</h2>
                <ul class="editor-modes action-list action-modes">
                
    <li class="action-item" data-mode="editor">
    <a href="#" class="editor-button is-set">编辑器</a>
</li>


    <li class="action-item" data-mode="settings">
    <a href="#" class="settings-button">设置</a>
</li>

</ul>
            </div>
            <div class="modal-content">
    <div class="xblock-editor" data-locator="" data-course-key="cet55/cs01/2014"><div class="xblock xblock-studio_view xmodule_edit xmodule_CapaDescriptor xblock-initialized" data-runtime-class="StudioRuntime" data-init="XBlockToXModuleShim" data-runtime-version="1" data-usage-id="" data-type="MarkdownEditingDescriptor" data-block-type="problem">
    




<div class="wrapper-comp-editor is-active" id="editor-tab">
<section class="problem-editor editor">
    <div class="row">
        <div class="editor-bar">
            <ul class="format-buttons">
                <li><a  class="header-button" data-tooltip="标题一"><span class="problem-editor-icon heading1"></span></a></li>
                <li><a  class="multiple-choice-button" data-tooltip="多项选择"><span class="problem-editor-icon multiple-choice"></span></a></li>
                <li><a  class="checks-button" data-tooltip="复选框"><span class="problem-editor-icon checks"></span></a></li>
                <li><a  class="string-button" data-tooltip="文本输入"><span class="problem-editor-icon string"></span></a></li>
                <li><a  class="number-button" data-tooltip="数值输入"><span class="problem-editor-icon number"></span></a></li>
                <li><a  class="dropdown-button" data-tooltip="下拉列表"><span class="problem-editor-icon dropdown"></span></a></li>
                <li><a  class="explanation-button" data-tooltip="解释"><span class="problem-editor-icon explanation"></span></a></li>
            </ul>
            <ul class="editor-tabs">
                <li><a  class="xml-tab advanced-toggle" data-tab="xml" onclick="onShowXMLButton()">高级编辑器</a></li>
                <li><a href="#" class="cheatsheet-toggle" data-tooltip="切换速记">?</a></li>
            </ul>
        </div>
        <textarea class="xml-box" id="lowedittextarea" style="width:99%;height:378px;" ></textarea>
    </div>
</section>

</div>
<div class="wrapper-comp-settings metadata_edit is-inactive" id="settings-tab" data-metadata="{&quot;showanswer&quot;: {&quot;default_value&quot;: &quot;finished&quot;, &quot;explicitly_set&quot;: false, &quot;display_name&quot;: &quot;\u663e\u793a\u7b54\u6848&quot;, &quot;help&quot;: &quot;Defines when to show the answer to the problem. A default value can be set in Advanced Settings.&quot;, &quot;type&quot;: &quot;Select&quot;, &quot;value&quot;: &quot;finished&quot;, &quot;field_name&quot;: &quot;showanswer&quot;, &quot;options&quot;: [{&quot;display_name&quot;: &quot;Always&quot;, &quot;value&quot;: &quot;always&quot;}, {&quot;display_name&quot;: &quot;Answered&quot;, &quot;value&quot;: &quot;answered&quot;}, {&quot;display_name&quot;: &quot;Attempted&quot;, &quot;value&quot;: &quot;attempted&quot;}, {&quot;display_name&quot;: &quot;Closed&quot;, &quot;value&quot;: &quot;closed&quot;}, {&quot;display_name&quot;: &quot;Finished&quot;, &quot;value&quot;: &quot;finished&quot;}, {&quot;display_name&quot;: &quot;Correct or Past Due&quot;, &quot;value&quot;: &quot;correct_or_past_due&quot;}, {&quot;display_name&quot;: &quot;Past Due&quot;, &quot;value&quot;: &quot;past_due&quot;}, {&quot;display_name&quot;: &quot;Never&quot;, &quot;value&quot;: &quot;never&quot;}]}, &quot;display_name&quot;: {&quot;default_value&quot;: &quot;Blank Advanced Problem&quot;, &quot;explicitly_set&quot;: true, &quot;display_name&quot;: &quot;Display Name&quot;, &quot;help&quot;: &quot;This name appears in the horizontal navigation at the top of the page.&quot;, &quot;type&quot;: &quot;Generic&quot;, &quot;value&quot;: &quot;Multiple Choice&quot;, &quot;field_name&quot;: &quot;display_name&quot;, &quot;options&quot;: []}, &quot;submission_wait_seconds&quot;: {&quot;default_value&quot;: 0, &quot;explicitly_set&quot;: false, &quot;display_name&quot;: &quot;Timer Between Attempts&quot;, &quot;help&quot;: &quot;Seconds a student must wait between submissions for a problem with multiple attempts.&quot;, &quot;type&quot;: &quot;Integer&quot;, &quot;value&quot;: 0, &quot;field_name&quot;: &quot;submission_wait_seconds&quot;, &quot;options&quot;: []}, &quot;weight&quot;: {&quot;default_value&quot;: null, &quot;explicitly_set&quot;: false, &quot;display_name&quot;: &quot;Problem Weight&quot;, &quot;help&quot;: &quot;Defines the number of points each problem is worth. If the value is not set, each response field in the problem is worth one point.&quot;, &quot;type&quot;: &quot;Float&quot;, &quot;value&quot;: null, &quot;field_name&quot;: &quot;weight&quot;, &quot;options&quot;: {&quot;step&quot;: 0.1, &quot;min&quot;: 0}}, &quot;matlab_api_key&quot;: {&quot;default_value&quot;: null, &quot;explicitly_set&quot;: false, &quot;display_name&quot;: &quot;Matlab API key&quot;, &quot;help&quot;: &quot;Enter the API key provided by MathWorks for accessing the MATLAB Hosted Service. This key is granted for exclusive use by this course for the specified duration. Please do not share the API key with other courses and notify MathWorks immediately if you believe the key is exposed or compromised. To obtain a key for your course, or to report and issue, please contact moocsupport@mathworks.com&quot;, &quot;type&quot;: &quot;Generic&quot;, &quot;value&quot;: null, &quot;field_name&quot;: &quot;matlab_api_key&quot;, &quot;options&quot;: []}, &quot;rerandomize&quot;: {&quot;default_value&quot;: &quot;never&quot;, &quot;explicitly_set&quot;: false, &quot;display_name&quot;: &quot;Randomization&quot;, &quot;help&quot;: &quot;Defines how often inputs are randomized when a student loads the problem. This setting only applies to problems that can have randomly generated numeric values. A default value can be set in Advanced Settings.&quot;, &quot;type&quot;: &quot;Select&quot;, &quot;value&quot;: &quot;never&quot;, &quot;field_name&quot;: &quot;rerandomize&quot;, &quot;options&quot;: [{&quot;display_name&quot;: &quot;Always&quot;, &quot;value&quot;: &quot;always&quot;}, {&quot;display_name&quot;: &quot;On Reset&quot;, &quot;value&quot;: &quot;onreset&quot;}, {&quot;display_name&quot;: &quot;Never&quot;, &quot;value&quot;: &quot;never&quot;}, {&quot;display_name&quot;: &quot;Per Student&quot;, &quot;value&quot;: &quot;per_student&quot;}]}, &quot;max_attempts&quot;: {&quot;default_value&quot;: null, &quot;explicitly_set&quot;: false, &quot;display_name&quot;: &quot;Maximum Attempts&quot;, &quot;help&quot;: &quot;Defines the number of times a student can try to answer this problem. If the value is not set, infinite attempts are allowed.&quot;, &quot;type&quot;: &quot;Integer&quot;, &quot;value&quot;: null, &quot;field_name&quot;: &quot;max_attempts&quot;, &quot;options&quot;: {&quot;min&quot;: 0}}}">
    <ul class="list-input settings-list">
    
    <li class="field comp-setting-entry metadata_entry is-set">
        <div class="wrapper-comp-setting">
	<label class="label setting-label" for="metadata-string-entry_574">Display Name</label>
	<input class="input setting-input" type="text" id="metadata-string-entry_574" value="Multiple Choice">
	<button class="action setting-clear active" type="button" name="setting-clear" value="Clear" data-tooltip="Clear">
        <i class="icon-undo"></i><span class="sr">"Clear Value"</span>
    </button>
</div>
<span class="tip setting-help">This name appears in the horizontal navigation at the top of the page.</span>

    </li>
    
    <li class="field comp-setting-entry metadata_entry">
        <div class="wrapper-comp-setting">
	<label class="label setting-label" for="metadata-string-entry_577">Matlab API key</label>
	<input class="input setting-input" type="text" id="metadata-string-entry_577" value="">
	<button class="action setting-clear inactive" type="button" name="setting-clear" value="Clear" data-tooltip="Clear">
        <i class="icon-undo"></i><span class="sr">"Clear Value"</span>
    </button>
</div>
<span class="tip setting-help">Enter the API key provided by MathWorks for accessing the MATLAB Hosted Service. This key is granted for exclusive use by this course for the specified duration. Please do not share the API key with other courses and notify MathWorks immediately if you believe the key is exposed or compromised. To obtain a key for your course, or to report and issue, please contact moocsupport@mathworks.com</span>

    </li>
    
    <li class="field comp-setting-entry metadata_entry">
        <div class="wrapper-comp-setting">
	<label class="label setting-label" for="metadata-number-entry_580">Maximum Attempts</label>
	<input class="input setting-input setting-input-number" type="number" id="metadata-number-entry_580" value="" min="0.0000" step="1">
    <button class="action setting-clear inactive" type="button" name="setting-clear" value="Clear" data-tooltip="Clear">
        <i class="icon-undo"></i><span class="sr">"Clear Value"</span>
    </button>
</div>
<span class="tip setting-help">Defines the number of times a student can try to answer this problem. If the value is not set, infinite attempts are allowed.</span>

    </li>
    
    <li class="field comp-setting-entry metadata_entry">
        <div class="wrapper-comp-setting">
	<label class="label setting-label" for="metadata-number-entry_583">Problem Weight</label>
	<input class="input setting-input setting-input-number" type="number" id="metadata-number-entry_583" value="" min="0.0000" step="0.1000">
    <button class="action setting-clear inactive" type="button" name="setting-clear" value="Clear" data-tooltip="Clear">
        <i class="icon-undo"></i><span class="sr">"Clear Value"</span>
    </button>
</div>
<span class="tip setting-help">Defines the number of points each problem is worth. If the value is not set, each response field in the problem is worth one point.</span>

    </li>
    
    <li class="field comp-setting-entry metadata_entry">
        <div class="wrapper-comp-setting">
    <label class="label setting-label" for="metadata-option-entry_586">Randomization</label>
    <select class="input setting-input" id="metadata-option-entry_586" name="Randomization">
        
            
                <option value="Always">Always</option>
            
        
            
                <option value="On Reset">On Reset</option>
            
        
            
                <option value="Never">Never</option>
            
        
            
                <option value="Per Student">Per Student</option>
            
        
    </select>
    <button class="action setting-clear inactive" type="button" name="setting-clear" value="Clear" data-tooltip="Clear">
        <i class="icon-undo"></i><span class="sr">"Clear Value"</span>
    </button>
</div>
<span class="tip setting-help">Defines how often inputs are randomized when a student loads the problem. This setting only applies to problems that can have randomly generated numeric values. A default value can be set in Advanced Settings.</span>

    </li>
    
    <li class="field comp-setting-entry metadata_entry">
        <div class="wrapper-comp-setting">
	<label class="label setting-label" for="metadata-number-entry_589">Timer Between Attempts</label>
	<input class="input setting-input setting-input-number" type="number" id="metadata-number-entry_589" value="0" step="1">
    <button class="action setting-clear inactive" type="button" name="setting-clear" value="Clear" data-tooltip="Clear">
        <i class="icon-undo"></i><span class="sr">"Clear Value"</span>
    </button>
</div>
<span class="tip setting-help">Seconds a student must wait between submissions for a problem with multiple attempts.</span>

    </li>
    
    <li class="field comp-setting-entry metadata_entry">
        <div class="wrapper-comp-setting">
    <label class="label setting-label" for="metadata-option-entry_592">显示答案</label>
    <select class="input setting-input" id="metadata-option-entry_592" name="显示答案">
        
            
                <option value="Always">Always</option>
            
        
            
                <option value="Answered">Answered</option>
            
        
            
                <option value="Attempted">Attempted</option>
            
        
            
                <option value="Closed">Closed</option>
            
        
            
                <option value="Finished">Finished</option>
            
        
            
                <option value="Correct or Past Due">Correct or Past Due</option>
            
        
            
                <option value="Past Due">Past Due</option>
            
        
            
                <option value="Never">Never</option>
            
        
    </select>
    <button class="action setting-clear inactive" type="button" name="setting-clear" value="Clear" data-tooltip="Clear">
        <i class="icon-undo"></i><span class="sr">"Clear Value"</span>
    </button>
</div>
<span class="tip setting-help">Defines when to show the answer to the problem. A default value can be set in Advanced Settings.</span>

    </li>
    
</ul>

</div>


</div>
</div>

</div>
            <div class="modal-actions" style="display: block;">
                <h3 class="sr">Actions</h3>
                <ul>
    <li class="action-item">
    <a href="javascript:void(0);" class="button action-primary action-save" onclick="savequestion();">保存</a>
</li>


    <li class="action-item">
    <a  class="button  action-cancel" onclick="showeditor_cancel()">取消</a>
</li>

</ul>
            </div>
        </div>
    </div>
</div>

</div>

</div>



<!--advanced editor-->

<div  id="advanced_editor" style="display:none">
    <div class="wrapper wrapper-modal-window wrapper-modal-window-edit-xblock" aria-describedby="modal-window-description" aria-labelledby="modal-window-title" aria-hidden="" role="dialog">
    <div class="modal-window-overlay"></div>
    <div class="modal-window modal-editor confirm modal-lg modal-type-problem" style="top: 31.39999999999999px; left: 202.5px;position:fixed;">
        <div class="edit-xblock-modal">
            <div class="modal-header">
                <h2 class="title modal-window-title">编辑：Checkboxes</h2>
                <ul class="editor-modes action-list action-modes">
                
    <li class="action-item" data-mode="editor">
    <a href="#" class="editor-button is-set">编辑器</a>
</li>


    <li class="action-item" data-mode="settings">
    <a href="#" class="settings-button">设置</a>
</li>

</ul>
            </div>
            <div class="modal-content">
    <div class="xblock-editor" data-locator="" data-course-key=""><div class="xblock xblock-studio_view xmodule_edit xmodule_CapaDescriptor xblock-initialized" data-runtime-class="StudioRuntime" data-init="XBlockToXModuleShim" data-runtime-version="1" data-usage-id="i4x://cet55/cs01/problem/e4415677016e414282f3a8c1df1f2a70" data-type="MarkdownEditingDescriptor" data-block-type="problem">
    




<div class="wrapper-comp-editor is-active" id="editor-tab">
<section class="problem-editor editor">
    <div class="row">
        <div class="editor-bar" style="display: none;">
            <ul class="format-buttons">
                <li><a href="#" class="header-button" data-tooltip="标题一"><span class="problem-editor-icon heading1"></span></a></li>
                <li><a href="#" class="multiple-choice-button" data-tooltip="多项选择"><span class="problem-editor-icon multiple-choice"></span></a></li>
                <li><a href="#" class="checks-button" data-tooltip="复选框"><span class="problem-editor-icon checks"></span></a></li>
                <li><a href="#" class="string-button" data-tooltip="文本输入"><span class="problem-editor-icon string"></span></a></li>
                <li><a href="#" class="number-button" data-tooltip="数值输入"><span class="problem-editor-icon number"></span></a></li>
                <li><a href="#" class="dropdown-button" data-tooltip="下拉列表"><span class="problem-editor-icon dropdown"></span></a></li>
                <li><a href="#" class="explanation-button" data-tooltip="解释"><span class="problem-editor-icon explanation"></span></a></li>
            </ul>
            <ul class="editor-tabs">
                <li><a href="#" class="xml-tab advanced-toggle" data-tab="xml">高级编辑器</a></li>
                <li><a href="#" class="cheatsheet-toggle" data-tooltip="切换速记">?</a></li>
            </ul>
        </div>
        <textarea class="change-box" id="advanceedittextarea" style="width:99%;height:428px;resize:none" ></textarea>
    </div>
</section>

</div>
<div class="wrapper-comp-settings metadata_edit is-inactive" id="settings-tab" data-metadata="{&quot;showanswer&quot;: {&quot;default_value&quot;: &quot;finished&quot;, &quot;explicitly_set&quot;: false, &quot;display_name&quot;: &quot;\u663e\u793a\u7b54\u6848&quot;, &quot;help&quot;: &quot;Defines when to show the answer to the problem. A default value can be set in Advanced Settings.&quot;, &quot;type&quot;: &quot;Select&quot;, &quot;value&quot;: &quot;finished&quot;, &quot;field_name&quot;: &quot;showanswer&quot;, &quot;options&quot;: [{&quot;display_name&quot;: &quot;Always&quot;, &quot;value&quot;: &quot;always&quot;}, {&quot;display_name&quot;: &quot;Answered&quot;, &quot;value&quot;: &quot;answered&quot;}, {&quot;display_name&quot;: &quot;Attempted&quot;, &quot;value&quot;: &quot;attempted&quot;}, {&quot;display_name&quot;: &quot;Closed&quot;, &quot;value&quot;: &quot;closed&quot;}, {&quot;display_name&quot;: &quot;Finished&quot;, &quot;value&quot;: &quot;finished&quot;}, {&quot;display_name&quot;: &quot;Correct or Past Due&quot;, &quot;value&quot;: &quot;correct_or_past_due&quot;}, {&quot;display_name&quot;: &quot;Past Due&quot;, &quot;value&quot;: &quot;past_due&quot;}, {&quot;display_name&quot;: &quot;Never&quot;, &quot;value&quot;: &quot;never&quot;}]}, &quot;display_name&quot;: {&quot;default_value&quot;: &quot;Blank Advanced Problem&quot;, &quot;explicitly_set&quot;: true, &quot;display_name&quot;: &quot;Display Name&quot;, &quot;help&quot;: &quot;This name appears in the horizontal navigation at the top of the page.&quot;, &quot;type&quot;: &quot;Generic&quot;, &quot;value&quot;: &quot;Checkboxes&quot;, &quot;field_name&quot;: &quot;display_name&quot;, &quot;options&quot;: []}, &quot;submission_wait_seconds&quot;: {&quot;default_value&quot;: 0, &quot;explicitly_set&quot;: false, &quot;display_name&quot;: &quot;Timer Between Attempts&quot;, &quot;help&quot;: &quot;Seconds a student must wait between submissions for a problem with multiple attempts.&quot;, &quot;type&quot;: &quot;Integer&quot;, &quot;value&quot;: 0, &quot;field_name&quot;: &quot;submission_wait_seconds&quot;, &quot;options&quot;: []}, &quot;weight&quot;: {&quot;default_value&quot;: null, &quot;explicitly_set&quot;: false, &quot;display_name&quot;: &quot;Problem Weight&quot;, &quot;help&quot;: &quot;Defines the number of points each problem is worth. If the value is not set, each response field in the problem is worth one point.&quot;, &quot;type&quot;: &quot;Float&quot;, &quot;value&quot;: null, &quot;field_name&quot;: &quot;weight&quot;, &quot;options&quot;: {&quot;step&quot;: 0.1, &quot;min&quot;: 0}}, &quot;matlab_api_key&quot;: {&quot;default_value&quot;: null, &quot;explicitly_set&quot;: false, &quot;display_name&quot;: &quot;Matlab API key&quot;, &quot;help&quot;: &quot;Enter the API key provided by MathWorks for accessing the MATLAB Hosted Service. This key is granted for exclusive use by this course for the specified duration. Please do not share the API key with other courses and notify MathWorks immediately if you believe the key is exposed or compromised. To obtain a key for your course, or to report and issue, please contact moocsupport@mathworks.com&quot;, &quot;type&quot;: &quot;Generic&quot;, &quot;value&quot;: null, &quot;field_name&quot;: &quot;matlab_api_key&quot;, &quot;options&quot;: []}, &quot;rerandomize&quot;: {&quot;default_value&quot;: &quot;never&quot;, &quot;explicitly_set&quot;: false, &quot;display_name&quot;: &quot;Randomization&quot;, &quot;help&quot;: &quot;Defines how often inputs are randomized when a student loads the problem. This setting only applies to problems that can have randomly generated numeric values. A default value can be set in Advanced Settings.&quot;, &quot;type&quot;: &quot;Select&quot;, &quot;value&quot;: &quot;never&quot;, &quot;field_name&quot;: &quot;rerandomize&quot;, &quot;options&quot;: [{&quot;display_name&quot;: &quot;Always&quot;, &quot;value&quot;: &quot;always&quot;}, {&quot;display_name&quot;: &quot;On Reset&quot;, &quot;value&quot;: &quot;onreset&quot;}, {&quot;display_name&quot;: &quot;Never&quot;, &quot;value&quot;: &quot;never&quot;}, {&quot;display_name&quot;: &quot;Per Student&quot;, &quot;value&quot;: &quot;per_student&quot;}]}, &quot;max_attempts&quot;: {&quot;default_value&quot;: null, &quot;explicitly_set&quot;: false, &quot;display_name&quot;: &quot;Maximum Attempts&quot;, &quot;help&quot;: &quot;Defines the number of times a student can try to answer this problem. If the value is not set, infinite attempts are allowed.&quot;, &quot;type&quot;: &quot;Integer&quot;, &quot;value&quot;: null, &quot;field_name&quot;: &quot;max_attempts&quot;, &quot;options&quot;: {&quot;min&quot;: 0}}}">
    <ul class="list-input settings-list">
    
    <li class="field comp-setting-entry metadata_entry is-set">
        <div class="wrapper-comp-setting">
	<label class="label setting-label" for="metadata-string-entry_54">Display Name</label>
	<input class="input setting-input" type="text" id="metadata-string-entry_54" value="Checkboxes">
	<button class="action setting-clear active" type="button" name="setting-clear" value="Clear" data-tooltip="Clear">
        <i class="icon-undo"></i><span class="sr">"Clear Value"</span>
    </button>
</div>
<span class="tip setting-help">This name appears in the horizontal navigation at the top of the page.</span>

    </li>
    
    <li class="field comp-setting-entry metadata_entry">
        <div class="wrapper-comp-setting">
	<label class="label setting-label" for="metadata-string-entry_57">Matlab API key</label>
	<input class="input setting-input" type="text" id="metadata-string-entry_57" value="">
	<button class="action setting-clear inactive" type="button" name="setting-clear" value="Clear" data-tooltip="Clear">
        <i class="icon-undo"></i><span class="sr">"Clear Value"</span>
    </button>
</div>
<span class="tip setting-help">Enter the API key provided by MathWorks for accessing the MATLAB Hosted Service. This key is granted for exclusive use by this course for the specified duration. Please do not share the API key with other courses and notify MathWorks immediately if you believe the key is exposed or compromised. To obtain a key for your course, or to report and issue, please contact moocsupport@mathworks.com</span>

    </li>
    
    <li class="field comp-setting-entry metadata_entry">
        <div class="wrapper-comp-setting">
	<label class="label setting-label" for="metadata-number-entry_60">Maximum Attempts</label>
	<input class="input setting-input setting-input-number" type="number" id="metadata-number-entry_60" value="" min="0.0000" step="1">
    <button class="action setting-clear inactive" type="button" name="setting-clear" value="Clear" data-tooltip="Clear">
        <i class="icon-undo"></i><span class="sr">"Clear Value"</span>
    </button>
</div>
<span class="tip setting-help">Defines the number of times a student can try to answer this problem. If the value is not set, infinite attempts are allowed.</span>

    </li>
    
    <li class="field comp-setting-entry metadata_entry">
        <div class="wrapper-comp-setting">
	<label class="label setting-label" for="metadata-number-entry_63">Problem Weight</label>
	<input class="input setting-input setting-input-number" type="number" id="metadata-number-entry_63" value="" min="0.0000" step="0.1000">
    <button class="action setting-clear inactive" type="button" name="setting-clear" value="Clear" data-tooltip="Clear">
        <i class="icon-undo"></i><span class="sr">"Clear Value"</span>
    </button>
</div>
<span class="tip setting-help">Defines the number of points each problem is worth. If the value is not set, each response field in the problem is worth one point.</span>

    </li>
    
    <li class="field comp-setting-entry metadata_entry">
        <div class="wrapper-comp-setting">
    <label class="label setting-label" for="metadata-option-entry_66">Randomization</label>
    <select class="input setting-input" id="metadata-option-entry_66" name="Randomization">
        
            
                <option value="Always">Always</option>
            
        
            
                <option value="On Reset">On Reset</option>
            
        
            
                <option value="Never">Never</option>
            
        
            
                <option value="Per Student">Per Student</option>
            
        
    </select>
    <button class="action setting-clear inactive" type="button" name="setting-clear" value="Clear" data-tooltip="Clear">
        <i class="icon-undo"></i><span class="sr">"Clear Value"</span>
    </button>
</div>
<span class="tip setting-help">Defines how often inputs are randomized when a student loads the problem. This setting only applies to problems that can have randomly generated numeric values. A default value can be set in Advanced Settings.</span>

    </li>
    
    <li class="field comp-setting-entry metadata_entry">
        <div class="wrapper-comp-setting">
	<label class="label setting-label" for="metadata-number-entry_69">Timer Between Attempts</label>
	<input class="input setting-input setting-input-number" type="number" id="metadata-number-entry_69" value="0" step="1">
    <button class="action setting-clear inactive" type="button" name="setting-clear" value="Clear" data-tooltip="Clear">
        <i class="icon-undo"></i><span class="sr">"Clear Value"</span>
    </button>
</div>
<span class="tip setting-help">Seconds a student must wait between submissions for a problem with multiple attempts.</span>

    </li>
    
    <li class="field comp-setting-entry metadata_entry">
        <div class="wrapper-comp-setting">
    <label class="label setting-label" for="metadata-option-entry_72">显示答案</label>
    <select class="input setting-input" id="metadata-option-entry_72" name="显示答案">
        
            
                <option value="Always">Always</option>
            
        
            
                <option value="Answered">Answered</option>
            
        
            
                <option value="Attempted">Attempted</option>
            
        
            
                <option value="Closed">Closed</option>
            
        
            
                <option value="Finished">Finished</option>
            
        
            
                <option value="Correct or Past Due">Correct or Past Due</option>
            
        
            
                <option value="Past Due">Past Due</option>
            
        
            
                <option value="Never">Never</option>
            
        
    </select>
    <button class="action setting-clear inactive" type="button" name="setting-clear" value="Clear" data-tooltip="Clear">
        <i class="icon-undo"></i><span class="sr">"Clear Value"</span>
    </button>
</div>
<span class="tip setting-help">Defines when to show the answer to the problem. A default value can be set in Advanced Settings.</span>

    </li>
    
</ul>

</div>


</div>
</div>

</div>
            <div class="modal-actions" style="display: block;">
                <h3 class="sr">Actions</h3>
                <ul>
    <li class="action-item">
    <a href="javascript:void(0);" class="button action-primary action-save" onclick="saveadvicequestion();">保存</a>
</li>


    <li class="action-item">
    <a  class="button  action-cancel" onclick="advanced_cancel()">取消</a>
</li>

</ul>
            </div>
        </div>
    </div>
</div>

</div>
<!--试卷编辑-->
 <div  id="exam_editor" style="display:none;">
    <div class="wrapper wrapper-modal-window wrapper-modal-window-edit-xblock" aria-describedby="modal-window-description" aria-labelledby="modal-window-title" aria-hidden="" role="dialog">
    <div class="modal-window-overlay"></div>
    <div class="modal-window modal-editor confirm modal-lg modal-type-discussion" style="top: 31.39999999999999px; left: 202.5px;position:fixed;">
        <div class="edit-xblock-modal">
            <div class="modal-header">
                <h2 class="title modal-window-title">编辑：试卷</h2>
                <ul class="editor-modes action-list action-modes">
                </ul>
            </div>
				<div class="modal-content">
						<div class="xblock-editor">
							<div class="xblock xblock-studio_view xmodule_edit xmodule_VideoDescriptor xblock-initialized">
								<div class="wrapper-comp-editor">
									 <section class="editor-with-tabs">
									 	<div id="traindiv" style="display:block;">
										<jsp:include page="experiment.jsp"></jsp:include>
										</div>
									 </section>
								</div>
							</div>
						</div>
					</div>
					
		</div>
								
            
            <div class="modal-actions" style="display: block;">
                <h3 class="sr">Actions</h3>
                <ul>
    <li class="action-item">
    <a href="javascript:void(0);" class="button action-primary action-save" onclick="updatetrain();">保存</a>
</li>


    <li class="action-item">
    <a  class="button  action-cancel" onclick="exam_editor_cancel()">取消</a>
</li>

</ul>
            </div>
        </div>
    </div>
</div>

</div>

<!--描述题-->
<div id="problem_html" style="display:none">
    <div class="wrapper wrapper-modal-window wrapper-modal-window-edit-xblock" aria-describedby="modal-window-description" aria-labelledby="modal-window-title" aria-hidden="" role="dialog">
    <div class="modal-window-overlay"></div>
    <div class="modal-window modal-editor confirm modal-lg modal-type-html" style="top: 31.39999999999999px; left: 202.5px;position:fixed;">
        <div class="edit-xblock-modal">
            <div class="modal-header">
                <h2 class="title modal-window-title">编辑：HTML</h2>
                <ul class="editor-modes action-list action-modes">
					<li class="action-item" data-mode="editor">
					<a href="#" class="editor-button is-set">编辑器</a>
					</li>
					<li class="action-item" data-mode="settings">
					<a href="#" class="settings-button">设置</a>
					</li>
				</ul>
            </div>
			<div style="float:left;width:99.1%;margin-top:1.5%;margin-left:5px;"><iframe width="100%" height="340" scrolling="no"  frameborder="0" id="htmledit" src="input.html" ></iframe></div>
            <div class="modal-actions" style="display: block;">
                <h3 class="sr">Actions</h3>
                <ul>
					<li class="action-item">
					<a href="javascript:void(0);" class="button action-primary action-save" onclick="savehtmlquestion();">保存</a>
					</li>
					<li class="action-item">
					<a href="javascript:void(0);" class="button  action-cancel" onclick="problem_html_cancel()">取消</a>
				</li>
				</ul>
            </div>
        </div>
    </div>
</div>

</div>	
</body>
</html>
