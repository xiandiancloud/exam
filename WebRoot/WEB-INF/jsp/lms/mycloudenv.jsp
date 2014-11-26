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
<title>设置</title>
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
<%-- 			<div class="col-sm-3">
				<div class="list-group">
					<a href="lms/setting.action?index=1"
						class="list-group-item list-group-item-success <c:if test='${setindex == 1}'>active</c:if>">
						个人 设置 </a> <a href="lms/setting.action?index=2"
						class="list-group-item list-group-item-success <c:if test='${setindex == 2}'>active</c:if>">我的云平台</a>
					<a href="lms/setting.action?index=3"
						class="list-group-item list-group-item-success <c:if test='${setindex == 3}'>active</c:if>">我的实验</a>
				</div>
			</div> --%>
			<div class='col-xs-3'>
					<div class='row'>
						<div class='col-sm-12 box'>
							<div class='box-content'>
								<div style="text-align:center">
									<img src="images/user.jpg">
								</div>
								<div style="text-align:center">
									<a class="btn btn-link">${USER_CONTEXT.username} </a>
								</div>
								<div style="text-align:center">
									<a class="btn btn-link">你的角色 </a> <a class="btn btn-link">
										${USER_CONTEXT.role.roleName}</a>
								</div>
							</div>
						</div>
					</div>
					<div class='row'>
						<div class='col-sm-12 box'>
							<div class="box bordered-box blue-border box-nomargin">
								<div class="box-header green-background">
									<i class="icon-book"></i> 我的信息
								</div>
								<div class="box-content">
									<a href="lms/mysetting.action" class="list-group-item"> <i class='icon-plus'></i> 个人设置
									</a>
									<a href="lms/mycloudenv.action" class="list-group-item active"> <i class='icon-plus'></i> 我的云平台
									</a>
									<a href="lms/myexamenv.action" class="list-group-item"> <i class='icon-plus'></i> 我的云虚机
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-9 panel panel-default">
					<div class="cmargin">
						<div class="h10"></div>
						<form role="form">
							<div class="form-group">
								<a>云平台IP</a>
								<div class="h5"></div>
								<input type="text" class="form-control" id="ip" value="${uc.ip}">
								<div class="clear"></div>
								<a>登录用户名</a>
								<div class="h5"></div>
								<input type="text" class="form-control" id="name" value="${uc.name}">
								<div class="clear"></div>
								<a>登录密码</a>
								<div class="h5"></div>
								<input type="password" class="form-control" id="password" value="${uc.password}">
								<div class="clear"></div>
								<button type="button" class="btn btn-danger btn-lg btn-block"
									onclick="update();">保存</button>
							</div>
						</form>
					</div>
				</div>
		</div>
	</div>
		</section>
	</div>
	<div class="clear"></div><div class="clear"></div>
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
	<!-- / retina -->
	<script src="assets/javascripts/plugins/retina/retina.js"
		type="text/javascript"></script>
	<!-- / theme file [required] -->
	<script src="assets/javascripts/theme.js" type="text/javascript"></script>
	<!-- / demo file [not required!] -->
	<script src="assets/javascripts/demo.js" type="text/javascript"></script>
	<!-- / START - page related files and scripts [optional] -->

	<!-- / END - page related files and scripts [optional] -->
	<script src="js/common.js" type="text/javascript"></script>
	<script src="js/holder.js"></script>
	<script>
    $(function() {
    	
	});
    
    function update() {
		var ip = $("#ip").val();
		var name = $("#name").val();
		var password = $("#password").val();
		var data = {
			ip : ip,
			name : name,
			password : password
		};
		$.ajax({
			url : "lms/updatemycloudenv.action",
			type : "post",
			data : data,
			success : function(s) {
				var a = eval("(" + s + ")");
				
				if (a.sucess == "sucess") {
					alert("保存成功");
				}
				else
				{
					alert("云平台已经存在");
				}
			}
		});
	}
	</script>
</body>
</html>