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
<title>介绍</title>
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
<link href="assets/stylesheets/plugins/select2/select2.css" media="all"
	rel="stylesheet" type="text/css" />
<link
	href="assets/stylesheets/plugins/bootstrap_colorpicker/bootstrap-colorpicker.css"
	media="all" rel="stylesheet" type="text/css" />
<link
	href="assets/stylesheets/plugins/bootstrap_daterangepicker/bootstrap-daterangepicker.css"
	media="all" rel="stylesheet" type="text/css" />
<link
	href="assets/stylesheets/plugins/bootstrap_datetimepicker/bootstrap-datetimepicker.min.css"
	media="all" rel="stylesheet" type="text/css" />
<link
	href="assets/stylesheets/plugins/bootstrap_switch/bootstrap-switch.css"
	media="all" rel="stylesheet" type="text/css" />
<link href="assets/stylesheets/plugins/common/bootstrap-wysihtml5.css"
	media="all" rel="stylesheet" type="text/css" />
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
<link href="css/train.css" media="all" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
      <script src="assets/javascripts/ie/html5shiv.js" type="text/javascript"></script>
      <script src="assets/javascripts/ie/respond.min.js" type="text/javascript"></script>
    <![endif]-->
</head>
<body class='contrast-red fixed-header'>
	<jsp:include page="header.jsp"></jsp:include>
	<div id='wrapper'>

		<div class='container'>
			<div class='row' id='content-wrapper'>
				<div class='col-xs-12'>
					<!-- 					<div class='alert alert-info alert-dismissable'>
						<a class='close' data-dismiss='alert' href='#'>&times;</a> Welcome
						to <strong>Flatty (v2.2)</strong> - I hope you'll like it. Don't
						forget - you can change theme color in top right corner <i
							class='icon-cog'></i> if you want.
					</div> -->

					<div class='row'>
						<div class='col-sm-3 box'>
							<div class='box-content'>
								<div style="text-align:center">
									<img src="http://placehold.it/250x150&amp">
									<!-- <img src="http://placehold.it/140x70/dce1e5/143249"> -->
								</div>
								<div style="text-align:center">
									<a class="btn btn-link"> 你的名字 </a>
								</div>
								<div style="text-align:center">
									<a class="btn btn-link"> 关注0 </a> <a class="btn btn-link">
										粉丝0 </a>
								</div>
							</div>
						</div>
						<div class='col-sm-9' style='margin-bottom: 0'>
							<div class='box-content'>
								<div class='tabbable'>
									<ul class='nav nav-tabs nav-tabs-simple'>
										<li class='active'><a class='green-border'
											data-toggle='tab' href='#tabsimple1'> 做题历史记录 </a></li>
										<li><a class='green-border' data-toggle='tab'
											href='#tabsimple2'> 错题本 </a></li>
										<li><a class='green-border' data-toggle='tab'
											href='#tabsimple3'> 收藏的题目 </a></li>
									</ul>
									<div class='tab-content'>
										<div class='tab-pane active' id='tabsimple1'>
											<!-- <p>I'm in Section 1.</p> -->
											<div class="row">
												<div class="col-sm-12">
													<div class="box ">
														<div class="box-content">
															<p>
																<strong>大学英语四六级</strong>
															</p>
															<hr class="hr-normal">
															<div class="pull-left">2012年全国大学生英语六级考试</div>
															<div class="pull-right">
																<a href="#" class="btn">查看分析</a> <a href="#" class="btn">再做一次</a>
															</div>
															<div class="clearfix"></div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class='tab-pane' id='tabsimple2'>
											<div class="row">
												<div class="col-sm-12">
													<div class="box bordered-box blue-border box-nomargin">
														<div class="box-content">
															<p>
																<strong>HEX2</strong>
															</p>

															<hr class="hr-normal">

															<p>I'm in Section 2.</p>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class='tab-pane' id='tabsimple3'>
											<div class="row">
												<div class="col-sm-12">
													<div class="box bordered-box blue-border box-nomargin">
														<div class="box-content">
															<p>
																<strong>HEX</strong>
															</p>

															<hr class="hr-normal">

															<p>I'm in Section 3.</p>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class='row'>
						<div class='col-sm-3 box'>
							<div class="box bordered-box blue-border box-nomargin">
								<div class="box-header green-background">
									<i class="icon-book"></i> 我的题库
								</div>
								<div class="box-content">
									<p>我的考卷</p>

									<hr class="hr-normal">
									<p>我的竞赛</p>
									<hr class="hr-normal">
									<p>增加竞赛</p>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
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
	<script src="js/holder.js" type="text/javascript"></script>
	<script>
		
	</script>
</body>
</html>