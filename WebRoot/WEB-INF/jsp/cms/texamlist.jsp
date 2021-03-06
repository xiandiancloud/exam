<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<base href="<%=basePath%>">
<title>我的试卷 </title>
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
<link type="text/css" rel="stylesheet" href="tcss/tinymce-studio-content.css">
<link type="text/css" rel="stylesheet" href="tcss/skin.min.css">
<link type="text/css" rel="stylesheet" href="tcss/style-app.css">
<link type="text/css" rel="stylesheet" href="tcss/style-app-extend1.css">
<link type="text/css" rel="stylesheet" href="tcss/style-xmodule.css">

<script src="js/jquery-1.11.1.js"></script>
<script src="js/index.js"></script>
<script src="js/common.js"></script>
</head>

<body class="is-signedin index view-dashboard hide-wip lang_zh-cn">
	<a class="nav-skip" href="#content">跳过本内容页</a>
	<!-- view -->
	<div class="wrapper wrapper-view">

		<jsp:include page="theader.jsp"></jsp:include>

		<div id="page-alert"></div>

		<div id="content">

			<div class="wrapper-mast wrapper">
				<header class="mast has-actions">
				<h1 class="page-header">我的试卷</h1>

				<nav class="nav-actions">
				<h3 class="sr">页面操作</h3>
				<ul>
					<li class="nav-item"><a
						class="button new-button new-course-button" onclick="btn()"><i
							class="icon-plus icon-inline"></i>新建试卷</a></li>
				</ul>
				</nav> </header>
			</div>

			<div class="wrapper-content wrapper">
				<section class="content"> <article class="content-primary"
					role="main">

				<div class="introduction">
					<h2 class="title">欢迎，${USER_CONTEXT.username}！</h2>

					<div class="copy">
						<p>这里当前您的所有试卷：</p>
					</div>

				</div>

				<div class="wrapper-create-element wrapper-create-course">
					<form class="create-course course-info" id="create-course-form"
						name="create-course-form">
						<div class="wrap-error">
							<div id="course_creation_error" name="course_creation_error"
								class="message message-status message-status error" role="alert">
								<p>请改正下面高亮的字段。</p>
							</div>
						</div>

						<div class="wrapper-form">
							<h3 class="title">创建一个新试卷</h3>
							<fieldset>
								<legend class="sr">创建一个新试卷的必要信息</legend>

								<ol class="list-input">
									<li class="field text required" id="field-course-name"><label
										for="name">试卷名称</label> <input
										class="new-course-name" id="name" type="text"
										name="new-course-name" aria-required="true"
										placeholder="例如，计算机科学导论" /> <span class="tip">The
											public display name for your course. This cannot be changed,
											but you can set a different display name in Advanced Settings
											later.</span> <span class="tip tip-error is-hiding"></span></li>
									<li class="field text required" id="field-course-category"><label
										for="name">试卷专业</label> <!-- <input
										class="new-course-category" id="category" type="text"
										name="new-course-category" aria-required="true"
										placeholder="例如，计算机" /> --> <select class="dhlselect" id="category"></select><span class="tip">The
											public display name for your course. This cannot be changed,
											but you can set a different display name in Advanced Settings
											later.</span> <span class="tip tip-error is-hiding"></span></li>
									<li class="field text required" id="field-course-rank"><label
										for="name">等级</label> 
										<select class="dhlselect" id="rank">
											<option value="高级 ">高级 </option>
											<option value="中级 ">中级 </option>
											<option value="低级 ">低级 </option>
										</select>
										<!-- <input
										class="new-course-rank" id="rank" type="text"
										name="new-course-rank" aria-required="true"
										placeholder="例如，高级 中级  低级" /> --> <span class="tip">The
											public display name for your course. This cannot be changed,
											but you can set a different display name in Advanced Settings
											later.</span> <span class="tip tip-error is-hiding"></span></li>
									<li class="field text required" id="field-organization"><label
										for="org">组织</label> <input class="new-course-org"
										id="org" type="text" name="new-course-org"
										aria-required="true"
										placeholder="例如：UniversityX 或 OrganizationX" /> <span
										class="tip">资助本平台的机构名称。 <strong>注意：这是你课程URL的一部分，请勿使用空格或特殊字符。</strong>
											这将不能被更改，但是您可以稍后在高级设置中设置不同的显示名称。
									</span> <span class="tip tip-error is-hiding"></span></li>

									<li class="field text required" id="field-course-number">
										<label for="coursecode">试卷代码</label> <input
										class="new-course-number" id="coursecode" type="text"
										name="new-course-number" aria-required="true"
										placeholder="例如： CS101" /> <span class="tip">这个编号用来标记该课程在组织内的唯一性。
											<strong>注意：这是课程URL的一部分，请勿使用空格或特殊字符，一旦设定不可更改。</strong>
									</span> <span class="tip tip-error is-hiding"></span>
									</li>

									<li class="field text required" id="field-course-run"><label
										for="starttime">试卷时间</label> <input
										class="new-course-run" id="starttime" type="text"
										name="new-course-run" aria-required="true"
										placeholder="例如：2014-01-01" /> <span class="tip">
											您课程开设的学期。 <strong>注意：这是课程URL的一部分，请勿使用空格或特殊字符，一旦设定不可更改。</strong>
									</span> <span class="tip tip-error is-hiding"></span></li>
								</ol>

							</fieldset>
						</div>

						<div class="actions">
							<input type="hidden" value="False"
								class="allow-unicode-course-id" /> <input type="button"
								value="创建" class="action action-primary new-course-save" onclick="createexam();"/> <input
								type="button" value="取消"
								class="action action-secondary action-cancel new-course-cancel"
								onclick="btn()" />
						</div>
					</form>
				</div>

				<div class="courses">
					<ul class="list-courses">
						<c:forEach var="texam" items="${texamlist}">
							<li class="course-item"><a class="course-link" href="cms/totexam.action?examId=${texam.exam.id}">
									<h3 class="course-title">${texam.exam.name}</h3>

									<div class="course-metadata">
										<span class="course-org metadata-item"> <span
											class="label">组织：</span> <span class="value">${texam.exam.org}</span>
										</span> <span class="course-num metadata-item"> <span
											class="label">试卷代码：</span> <span class="value">${texam.exam.coursecode}</span>
										</span> <span class="course-run metadata-item"> <span
											class="label">开课时间</span> <span class="value">${texam.exam.starttime}</span>
										</span>
									</div>
							</a>

								<ul class="item-actions course-actions">
								<table><tr>
										<c:if test="${texam.exam.isnormal==0}">
										<td><li class="action"><a href="cms/delexam.action?examId=${texam.exam.id}" rel="external"
										class="button view-button view-live-button">删除</a></li></td>
										<td>&nbsp;&nbsp;</td>
										</c:if>
										<td><li class="action"><a href="cms/totexam.action?examId=${texam.exam.id}" rel="external"
										class="button view-button view-live-button">在线查看</a></li></td></tr></table>
								    
									
								</ul></li>
						</c:forEach>
					</ul>
				</div>

				</article> <aside class="content-supplementary" role="complimentary">
				<div class="bit">
					<h3 class="title title-3">对考试平台还不熟悉?</h3>
					<p><!-- Click Help in the upper-right corner to get more information
						about the Studio page you are viewing. You can also use the links
						at the bottom of the page to access our continously updated
						documentation and other Studio resources. -->
						点击右上角的帮助按钮，从而获得更多您访问的平台页面信息.您也可以使用在页面底部的链接，从而进入我们不断更新的文件和其他一些平台资源。</p>

					<ol class="list-actions">
						<li class="action-item"><a
							href="#"
							target="_blank"><!-- Getting Started with edX Studio -->从云考试平台开始</a></li>
						<li class="action-item"><a
							href="#"
							class="show-tender"
							title="Use our feedback tool, Tender, to request help"><!-- Request
								help with edX Studio -->
								向云考试平台求助</a></li>
					</ol>
				</div>


				</aside> </section>


			</div>

		</div>

		<div class="wrapper-sock wrapper">
			<ul class="list-actions list-cta">
				<li class="action-item"><a href="#sock"
					class="cta cta-show-sock"><i class="icon-question-sign"></i> <span
						class="copy">向云平台求助?</span></a></li>
			</ul>
		</div>

		<jsp:include page="tfooter.jsp"></jsp:include>

	</div>
	<script type="text/javascript">
	/* 	var box1 = document.getElementById('box');
		function btn() {
			if (box1.style.display == '') {
				box1.style.display = 'none';
			} else {
				box1.style.display = '';
			}
		} */
		$(function() {
			
			$.ajax({
				url:"cms/tgetAllExamCategory.action",
				type:"post",
				success:function(s){
					var a=eval("("+s+")");	
					var row = a.rows;
					var tmp = '';
					for ( var i = 0; i < row.length; i++) {
						var category = row[i];
						var id = category.id;
						var name = category.name;
						tmp += '<option value='+id+'>'+name+'</option>';
					}
					$("#category").html(tmp);
				}
			});
		});
		function createexam()
		{
			var name = $("#name").val();
			var org = $("#org").val();
			var coursecode = $("#coursecode").val();
			var starttime = $("#starttime").val();
			var category = $("#category").val();
			var rank = $("#rank").val();
			if (isNull(name) || isNull(org) ||isNull(coursecode) ||isNull(starttime) ||isNull(category))
			{
				alert("你还有未填项，请重新填写");
				return;
			}
			if (!isDateYYMMDD(starttime))
			{
				alert("不是标准的日期格式");
				return;
			}
			var data = {name:name,org:org,coursecode:coursecode,starttime:starttime,category:category,rank:rank};
			$.ajax({
				url:"cms/createexam.action",
				type:"post",
				data:data,
				success:function(s){
					var a=eval("("+s+")");	
					if (a.sucess=="sucess")
					{
						location.href="cms/totexamlist.action";
					}
					else
					{
						alert(a.msg);
					}
				}
			});
		}
	</script>
</body>
</html>
