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
	<jsp:include page="../common/header.jsp"></jsp:include>

	<div id='wrapper'>
		<div class="mask"></div>
		<div class='container'>
			<div class='row' id='content-wrapper' style="text-align:center">
				<div class='col-xs-12'>
					<div class='row'>
						<div class='col-sm-12' style="height:100px"></div>
					</div>
					<div class='row'>
						<div class='col-sm-3'></div>
						<div class='col-sm-6'>
							<p>
								<strong style="font-size: 20px;">本试卷共有${size}个部分，${index }道题，总时限为${mm}分钟</strong> <br />
								各个部分不分别记时，但都给了参考时限，供答题时参考
							</p>
						</div>
					</div>
					<div class='row'>
						<div class='col-sm-12' style="height:20px"></div>
					</div>
					<div class='row'>
						<div class='col-sm-3'></div>
						<div class='col-sm-6'>
							<div class='box'>
								<div class="menu_2012509">
									<ul>
										<li class="line"><a href="#"><i class='icon-calendar'></i>${index}题</a></li>
										<li class="line"><a href="#"><i class='icon-smile'></i>${score}分</a></li>
										<li><a href="#"><i class='icon-time'></i>${mm}分钟</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class='row'>
						<div class='col-sm-12' style="height:20px"></div>
					</div>
					<div class='row'>
						<div class='col-sm-3'></div>
						<div class='col-sm-6'>
							<p class="text-left">再开始答题前，请考生关注下列事项：</p>
							<p class="text-left">${exam.describle}</p>
							<!-- <p class="text-left">二、<a>本试题卷使用的现值及终值系数表点此查看。</a></p> -->
						</div>
					</div>
					<div class='row'>
						<div class='col-sm-12' style="height:100px"></div>
					</div>
					<div class='row'>
						<div class='col-sm-4'></div>
						<div class='col-sm-4'>
							<div class='box'>
								<div class='box-content' style="padding:0">
									<a class="btn btn-success btn-block btn-lg" href="lms/toexamingtostartexam.action?competionId=${competionId}&examId=${exam.id}">立即开始</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</div>

	<div class="clear"></div>
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
	<script src="assets/javascripts/plugins/jquery_ui_touch_punch/jquery.ui.touch-punch.min.js" type="text/javascript"></script>
	<!-- / bootstrap [required] -->
	<script src="assets/javascripts/bootstrap/bootstrap.js" type="text/javascript"></script>
	<!-- / modernizr -->
	<script src="assets/javascripts/plugins/modernizr/modernizr.min.js" type="text/javascript"></script>
	<!-- / retina -->
	<script src="assets/javascripts/plugins/retina/retina.js" type="text/javascript"></script>
	<!-- / theme file [required] -->
	<script src="assets/javascripts/theme.js" type="text/javascript"></script>
	<!-- / demo file [not required!] -->
	<script src="assets/javascripts/demo.js" type="text/javascript"></script>
	<!-- / START - page related files and scripts [optional] -->

	<!-- / END - page related files and scripts [optional] -->
	<script src="js/common.js" type="text/javascript"></script>
	<script src="js/holder.js" type="text/javascript"></script>
	
<!-- 	<script type="text/javascript">  
    	//兼容火狐、IE8
    window.onload = showMask();   
    function showMask(){  
        $(".mask").css("height",$(".container").height());  
        $(".mask").css("width",$(".container").width());  
        $(".mask").show();  
    }   
	</script> -->

</body>
</html>