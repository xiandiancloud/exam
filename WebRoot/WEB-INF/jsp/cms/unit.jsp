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
                "",
                // if tender fails to load, fallback on a local file
                // so that require doesn't fall over
                "tender_fallback"
            ],
            "mathjax": "",
            "youtube": [
                // youtube URL does not end in ".js". We add "?noext" to the path so
                // that require.js adds the ".js" to the query component of the URL,
                // and leaves the path component intact.
                "",
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

	<div class="wrapper-sock wrapper">
		<ul class="list-actions list-cta">
			<li class="action-item"><a href="#sock"
				class="cta cta-show-sock"><i class="icon-question-sign"></i> <span
					class="copy">向云考试平台求助?</span></a></li>
		</ul>
	</div>

	<jsp:include page="tfooter.jsp"></jsp:include>


	<div id="page-notification"></div>
	</div>

	<div id="page-prompt"></div>


	<div class="modal-cover"></div>

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
                <h2 class="title modal-window-title">编辑：</h2>
                <!-- <ul class="editor-modes action-list action-modes">
					<li class="action-item" data-mode="editor">
					<a href="#" class="editor-button is-set">编辑器</a>
					</li>
					<li class="action-item" data-mode="settings">
					<a href="#" class="settings-button">设置</a>
					</li>
				</ul> -->
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
