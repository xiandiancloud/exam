<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<html lang="zh-cn">
<!--<![endif]-->
<head>
<base href="<%=basePath%>">
<title>登陆进入</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<meta content='text/html;charset=utf-8' http-equiv='content-type'>
<meta
	content='Flat administration template for Twitter Bootstrap. Twitter Bootstrap 3 template with Ruby on Rails support.'
	name='description'>
<link href='assets/images/meta_icons/favicon.ico' rel='shortcut icon'
	type='image/x-icon'>
<link href='assets/images/meta_icons/apple-touch-icon.png'
	rel='apple-touch-icon-precomposed'>
<link href='assets/images/meta_icons/apple-touch-icon-57x57.png'
	rel='apple-touch-icon-precomposed' sizes='57x57'>
<link href='assets/images/meta_icons/apple-touch-icon-72x72.png'
	rel='apple-touch-icon-precomposed' sizes='72x72'>
<link href='assets/images/meta_icons/apple-touch-icon-114x114.png'
	rel='apple-touch-icon-precomposed' sizes='114x114'>
<link href='assets/images/meta_icons/apple-touch-icon-144x144.png'
	rel='apple-touch-icon-precomposed' sizes='144x144'>
<!-- / START - page related stylesheets [optional] -->

<!-- / END - page related stylesheets [optional] -->
<!-- / bootstrap [required] -->
<link href="assets/stylesheets/bootstrap/bootstrap.css" media="all"
	rel="stylesheet" type="text/css" />
<!-- / theme file [required] -->
<link href="assets/stylesheets/light-theme.css" media="all"
	id="color-settings-body-color" rel="stylesheet" type="text/css" />
<!-- / coloring file [optional] (if you are going to use custom contrast color) -->
<link href="assets/stylesheets/theme-colors.css" media="all"
	rel="stylesheet" type="text/css" />
<!-- / demo file [not required!] -->
<link href="assets/stylesheets/demo.css" media="all" rel="stylesheet"
	type="text/css" />
<link href="css/train.css" rel="stylesheet">
<!--[if lt IE 9]>
      <script src="assets/javascripts/ie/html5shiv.js" type="text/javascript"></script>
      <script src="assets/javascripts/ie/respond.min.js" type="text/javascript"></script>
    <![endif]-->
</head>
<body class='contrast-red fixed-header'>
	<jsp:include page="../common/header.jsp"></jsp:include>
	<div id='wrapper'>
		<section id=''>
			<div class="container">
				<div class="row">
					<div class="col-sm-12 hptop">
						</br>
						<h3>
							<p>
								<a>请登录</a>
							</p>
							<p class="left40">来访问你的云试卷</p>
						</h3>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12">
					<hr>
					</div>
					<div class="clear"></div>
					<div class="col-sm-7">
						<form role="form">
							<div class="form-group">
								<a>电子邮件&nbsp;*</a>
								<div class="h5"></div>
								<input type="text" class="form-control" id="email" placeholder="dhl@163.com">
								<div class="clear"></div>
								<a>密码&nbsp;*</a>
								<div class="h5"></div>
								<input type="password" class="form-control" id="password" placeholder="文本输入">
								<div class="clear"></div>
								<div class="clear"></div>
								<button type="button" class="btn btn-danger btn-lg btn-block" onclick="login();">
									登录+进入我的试卷</button>
							</div>
						</form>
					</div>
					<div class="col-sm-5">
					<a>尚未注册？</a></br>
					<div class="clear"></div>
					<p>
					现在就注册加入<a href="lms/toregeister.action" class="hrefcolor">在这儿注册您的云平台账号！</a> 
					</p>
					<div class="clear"></div>
					<a>需要帮助？</a></br>
					<div class="clear"></div>
					<p>
					寻找关于登录您的您的云平台账户的帮助？<a>查看帮助部分来获得常见问题的解答。</a> 
					</p>
					</div>
				</div>
			</div>
		</section>
	</div>
	<div class="h40"></div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<!-- / jquery [required] -->
	<script src="assets/javascripts/jquery/jquery.min.js"
		type="text/javascript"></script>
	<!-- / jquery mobile (for touch events) -->
	<script src="assets/javascripts/jquery/jquery.mobile.custom.min.js"
		type="text/javascript"></script>
	<!-- / jquery migrate (for compatibility with new jquery) [required] -->
	<script src="assets/javascripts/jquery/jquery-migrate.min.js"
		type="text/javascript"></script>
	<!-- / jquery ui -->
	<script src="assets/javascripts/jquery/jquery-ui.min.js"
		type="text/javascript"></script>
	<!-- / jQuery UI Touch Punch -->
	<script
		src="assets/javascripts/plugins/jquery_ui_touch_punch/jquery.ui.touch-punch.min.js"
		type="text/javascript"></script>
	<!-- / bootstrap [required] -->
	<script src="assets/javascripts/bootstrap/bootstrap.js"
		type="text/javascript"></script>
	<!-- / modernizr -->
	<script src="assets/javascripts/plugins/modernizr/modernizr.min.js"
		type="text/javascript"></script>
	<script src="assets/javascripts/theme.js" type="text/javascript"></script>
	<!-- / demo file [not required!] -->
	<script src="assets/javascripts/demo.js" type="text/javascript"></script>
	<!-- / START - page related files and scripts [optional] -->

	<!-- / END - page related files and scripts [optional] -->
	<script src="js/common.js" type="text/javascript"></script>
	<script src="js/holder.js"></script>
	<script>
	$(function() {
		$('input').keypress(function (e) {
		    var key = e.which;
		    if (key == 13) {
		        login();
		    }
		});
	});
	
	function login()
	{
		var email = $("#email").val();
		var password = $("#password").val();
		//var url = "${url}";
		var data = {email:email,password:password};
		$.ajax({
			url:"lms/login.action",
			type:"post",
			data:data,
			success:function(s){
				var a=eval("("+s+")");	
				if (a.sucess=="sucess")
				{
					location.href=a.toUrl;
					/*if (url)
					{
						location.href=url;
					}
					else
					location.href="mycourse.action";*/
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