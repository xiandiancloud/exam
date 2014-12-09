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

<title>高级设置</title>

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

<style>

.tab{ 

width: 100%; 

margin:0; 

padding:0; 

font-family: "Trebuchet MS", Trebuchet, Arial, sans-serif;	

color: #1c5d79; 

border-top:  1px #c2c2c2; 

border-bottom:  1px #c2c2c2; 
    
    border-left:  1px #c2c2c2; 

border-right:  1px #c2c2c2; 

border-collapse: collapse; 

} 

.tab caption { 

margin:0; 

padding:0; 

background: #f3f3f3; 

height: 40px; 

line-height: 40px; 

text-indent: 28px; 

font-family: "Trebuchet MS", Trebuchet, Arial, sans-serif;	

font-size: 14px; 

font-weight: bold; 

color: #555d6d; 

text-align: left; 

letter-spacing: 3px; 

border-top: dashed 1px #c2c2c2; 

border-bottom: dashed 1px #c2c2c2; 
    

} 



/* HEAD */ 



.tab thead { 

/* background-color: #FFFFFF;  */

/* border: none;  */

} 

.tab thead tr th { 

/* background-image:url("/lottery/img/table/bg.gif");  */

height: 32px; 

line-height: 32px; 

text-align: center; 

color: #f3f3f3; 

/* background-repeat : repeat-x; 

border-left:solid 1px #326E87; 

border-right:solid 1px #326E87;	

border-bottom:solid 1px #326E87; 

border-collapse: collapse;  */

font-size: 18px; 

} 



/* BODY */ 

.tab tbody tr { 

background: #f3f3f3; 

font-size: 13px; 

height: 12px; 

line-height: 12px; 

text-align: center; 

event:expression( 
onmouseover = function(){this.style.backgroundColor = '#E9F5FF';}, 
onmouseout = function(){this.style.backgroundColor = '#f3f3f3';} 
) 

} 

.tab tbody tr.odd { 

background: #F0FFFF; 

} 

.tab tbody tr:hover, .tab tbody tr.odd:hover { 

background: #ffffff; 

} 

.tab tbody tr th,.tab tbody tr td { 

padding: 6px; 

border: solid 1px #326e87; 

} 

.tab tbody tr th { 

font-family: "Trebuchet MS", Trebuchet, Arial, sans-serif;	

font-size: 16px; 

padding: 10px; 

text-align: center; 

font-weight: bold; 

/* color: #FFFFFF;  */

/* border-bottom: solid 1px white;  */

} 

.tab tbody tr th:hover { 

background: #ffffff; 



} 



/* LINKS */ 



.tab a{ 

color: gray; 

text-decoration: none; 

font-size: 13px; 

border-bottom: solid 1px white; 

} 

.tab a:hover { 

color: blue; 

border-bottom: none; 

} 



/* FOOTER */ 



.tab tfoot { 

background: #f3f3f3; 

height: 24px; 

line-height: 24px; 

font-family: "Trebuchet MS", Trebuchet, Arial, sans-serif;	

font-size: 12px; 

/*font-weight: bold;*/ 

color: #555d6d; 

text-align: center; 

letter-spacing: 3px; 

border-top: solid 2px #326e87; 

border-bottom: dashed 1px #c2c2c2; 

} 

.tab tfoot tr th,.tab tfoot tr td { 

/*padding: .1em .6em;*/ 



} 

.tab tfoot tr th { 

border-top: solid 1px #326e87; 

} 

.tab tfoot tr td { 

/**text-align: right;**/ 

}
</style>
<body
	class="is-signedin course advanced view-settings feature-upload hide-wip lang_zh-cn js">
	<!-- view -->
	<div class="wrapper wrapper-view">

		<jsp:include page="ttheader.jsp"></jsp:include>

		<div id="page-alert"></div>

		<div id="content">

			<div class="wrapper-mast wrapper">
				<header class="mast has-subtitle">
					<h1 class="page-header">
						<small class="subtitle">设置</small> <span class="sr">&gt; </span>高级设置
					</h1>
				</header>
			</div>

			<div class="wrapper-content wrapper">
				<section class="content">
					<article class="content-primary" role="main">
						<form id="settings_details" class="settings-details" method="post"
							action="">
							<section class="group-settings schedule">
								<header>
									<h2 class="title-2">手工策略定义</h2>
								</header>
								<p class="instructions"><strong>警告</strong>：不要轻易修改这些策略，除非您已经熟悉了这些策略的目的。</p>
								<ol class="list-input">
									<li class="field text required">
										<div class="field date">
											<label >试卷名称</label> 
											<input
												type="text"
												class="start-date date start datepicker hasDatepicker"
												id="examname" value="${exam.name}">
										
										</div>            
									</li>
									<li class="action">
									<a href="javascript:void(0);" onclick="saveExamName();" class="button view-button view-live-button">保存</a>
									</li>
								</ol>
							</section>

							<hr class="divide">
							<section class="group-settings schedule">
								<header>
									<h2 class="title-2">平台信息&nbsp;<a
						class="button new-button" onclick="showcloud();"><i
							class="icon-plus icon-inline"></i>新建</a></h2>
									<span class="tip">您平台的具体细节</span>
								</header>

								<table class="tab">
									<tr><th>key</th><th>value</th><th>类型</th><th>描述</th><th></th></tr>
									<c:forEach var="env" items="${envlist}">
										<tr><td>${env.name}</td><td>${env.value}</td><td>${env.type}</td><td>${env.describle}</td>
										<td>
										<a href="javascript:void(0);" onclick="updateEnv('${env.id}','${env.name}','${env.value}','${env.type}','${env.describle}');" class="button view-button view-live-button">更新</a>
										<a href="javascript:void(0);" onclick="delEnv(${env.id});" class="button gray-button">删除</a>
										</td></tr>
									</c:forEach>
								</table>

								<div class="h10"></div>
								<ol class="list-input hide" id="cloud">
									<li class="field-group field-group-course-start">
										<input type="hidden" class="start-date date start datepicker hasDatepicker" id="cloudid">
										<div class="field date">
											<label >参数</label> 
											<input type="text" class="start-date date start datepicker hasDatepicker" id="cloudname">
										</div>            
										 <div class="field time">
							                <label>值</label>
							                <input type="text" class="time start timepicker ui-timepicker-input" id="cloudvalue">
							               
							              </div> 
							              <div class="field time">
							                <label>类型</label>
							                <input type="text" class="time start timepicker ui-timepicker-input" id="cloudtype">
							               
							              </div> 
							              <div class="field time">
							                <label>说明</label>
							                <input type="text" class="time start timepicker ui-timepicker-input" id="clouddesc">
							               
							              </div> 
									</li>
									<li class="action">
									<a href="javascript:void(0);" onclick="saveEnv();" class="button view-button view-live-button">保存</a>
									<a href="javascript:void(0);" onclick="hidecloud();" class="button gray-button">取消</a>
									</li>
								</ol>
							</section>

							<hr class="divide">

							<section class="group-settings schedule">
								<header>
									<h2 class="title-2">脚本参数&nbsp;<a
						class="button new-button" onclick="showshell()"><i
							class="icon-plus icon-inline"></i>新建</a></h2>
									
									<span class="tip">调整您的验证脚本参数</span>
								</header>

								<table class="tab">
									<c:forEach var="env" items="${shellenvlist}">
										<tr><td>${env.name}</td><td>${env.value}</td></tr>
									</c:forEach>
								</table>

								<div class="h10"></div>
								<ol class="list-input hide" id="shell">
									<li class="field-group field-group-course-start">
										<div class="field date" id="field-course-start-date">
											<label >脚本变量</label> <input
												type="text"
												class="start-date date start datepicker hasDatepicker"
												id="shellname" autocomplete="off" value="${exam.starttimedetail}">
										
										</div>            
										 <div class="field time" id="field-course-start-time">
							                <label>脚本值</label>
							                <input type="text" class="time start timepicker ui-timepicker-input" id="shellvalue" autocomplete="off">
							               
							              </div> 
							              
									</li>
									<li class="action">
										<a href="javascript:void(0);" onclick="saveShell(${examId});" class="button view-button">保存</a>
										<a href="javascript:void(0);" onclick="hideshell();" class="button gray-button">取消</a>
									</li>
								</ol>
							</section>
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
    	});
        function showshell()
		{
        	$("#shell").show();
		}
        function showcloud()
		{
        	$("#cloudid").val(-1);
        	$("#cloud").show();
		}
        function hideshell()
		{
        	$("#shell").hide();
		}
        function hidecloud()
		{
        	$("#cloud").hide();
		}
        function saveShell(examId)
		{
			var name = $("#shellname").val();
			var value = $("#shellvalue").val();
			var data = {examId:examId,name:name,value:value};
			$.ajax({
				url:"cms/saveshellenv.action",
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
        function saveEnv()
		{
        	var id = parseInt($("#cloudid").val());
			var name = $("#cloudname").val();
			var value = $("#cloudvalue").val();
			var type = $("#cloudtype").val();
			var desc = $("#clouddesc").val();
			var data = {id:id,name:name,value:value,type:type,desc:desc};
			$.ajax({
				url:"cms/saveenv.action",
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
        function delEnv(envId)
		{
			var data = {envId:envId};
			$.ajax({
				url:"cms/delenvironment.action",
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
        function updateEnv(id,key,value,type,desc)
		{
        	$("#cloudid").val(id);
        	$("#cloudname").val(key);
			$("#cloudvalue").val(value);
			$("#cloudtype").val(type);
			$("#clouddesc").val(desc);
			$("#cloud").show();
		}
        function saveExamName()
        {
        	var name = $("#examname").val();
        	var examId = "${exam.id}";
			var data = {examId:examId,name:name};
			$.ajax({
				url:"cms/updateExamname.action",
				type:"post",
				data:data,
				success:function(s){
					var a=eval("("+s+")");	
					if (a.sucess=="sucess")
					{
						location.reload();
						alert("保存成功");
					}
				}
			});
        }
		</script>
</body>
</html>
