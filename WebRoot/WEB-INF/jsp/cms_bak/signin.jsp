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
				<section class="content">
					<header>
						<h1 class="title title-1">登录edX Studio</h1>
						<a href="cms/totregeister.action" class="action action-signin">如果您没有Studio账号，请现在注册。</a>
					</header>

					<article class="content-primary" role="main">
						<form id="login_form">

							<fieldset>
								<legend class="sr">登录edX Studio所需的信息</legend>

								<ol class="list-input">
									<li class="field text required" id="field-email"><label
										for="email">电子邮件地址</label> <input id="email" type="email"
										name="email" placeholder="e.g. jane.doe@gmail.com" /></li>

									<li class="field text required" id="field-password"><a
										href="//localhost:8000/login#forgot-password-modal"
										class="action action-forgotpassword" tabindex="-1">忘记密码？</a> <label
										for="password">密码</label> <input id="password" type="password"
										name="password" /></li>
								</ol>
							</fieldset>

							<div class="form-actions">
								<button type="button" class="action action-primary" onclick="tlogin();">登录edX Studio</button>
							</div>

							<!-- no honor code for CMS, but need it because we're using the lms student object -->
							<input name="honor_code" type="checkbox" value="true"
								checked="true" hidden="true">
						</form>
					</article>

					<aside class="content-supplementary" role="complimentary">
						<h2 class="sr">Studio支持</h2>

						<div class="bit">
							<h3 class="title-3">需要帮助？</h3>
							<p>
								如果您在使用账户时遇到问题，请访问<a href="http://help.edge.edx.org"
									rel="external">技术支持中心</a>寻找自助的步骤，或者其他类似问题的解决方案，或者让我们了解您的问题。
							</p>
						</div>
					</aside>
				</section>
			</div>

		</div>
		<jsp:include page="tfooter.jsp"></jsp:include>
	</div>
	<script>
		$(function() {
			$('input').keypress(function (e) {
			    var key = e.which;
			    if (key == 13) {
			        tlogin();
			    }
			});
		});
		
		function tlogin()
		{
			var email = $("#email").val();
			var password = $("#password").val();
			var data = {email:email,password:password};
			$.ajax({
				url:"cms/tlogin.action",
				type:"post",
				data:data,
				success:function(s){
					var a=eval("("+s+")");	
					if (a.sucess=="sucess")
					{
						location.href=a.tocUrl;
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

