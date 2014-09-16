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
<title>我的云课堂</title>
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
	<jsp:include page="header.jsp"></jsp:include>
	<div id='wrapper'>
		<section id=''>
		<div class="container">
			<div class="row  wback nospace">
				<div class="col-sm-3 nospace">
					<a href="lms/getAllCategory.action" class="thumbnail"> <img
						src="images/addcourse.png" alt="添加我的课程">
					</a>
				</div>
				<div class="col-sm-9">
					<img src="images/addct.png" alt="添加我的课程">
				</div>
			</div>
			<div class="clear"></div>
			<div class="row center nospace"><h3>进行中的课程</h3></div>
			<c:forEach var="ucourse" items="${having}">
				<div class="row wback nospace">
					<div class="col-sm-3 courseh">
						<a> <img src="${ucourse.course.imgpath}" alt="..." width="100%"
							height="150px;" class="img-rounded">
						</a>
					</div>
					<div class="col-sm-7">
						<p>
							<a>
								<h1>${ucourse.course.name}</h1>
							</a>
						</p>
						<p>
							<a> ${ucourse.course.describle}</a>
						</p>
					</div>
					<div class="col-sm-2">
						<div class="clear"></div>
						<div class="wrap">
							<div class="subwrap">
								<div class="content">
									<p>
										<a href="lms/getCourse.action?courseId=${ucourse.course.id}"><button
												type="button" class="btn btn-success">进入学习</button> </a>
	
									</p>
								</div>
							</div>
						</div>
	
					</div>
				</div>
				<div class="clear"></div>
			</c:forEach>
			<div class="row center nospace"><h3>完成的课程</h3></div>
			<c:forEach var="ucourse" items="${finish}">
				<div class="row wback nospace">
					<hr>
					<div class="clear"></div>
					<div class="col-sm-3 courseh">
						<a> <img src="${ucourse.course.imgpath}" alt="..." width="100%"
							height="150px;" class="img-rounded">
						</a>
					</div>
					<div class="col-sm-7">
						<p>
							<a>
								<h1>${ucourse.course.name}</h1>
							</a>
						</p>
						<p>
							<a> ${ucourse.course.describle}</a>
						</p>
					</div>
					<div class="col-sm-2">
	
						<div class="wrap">
							<div class="subwrap">
								<div class="content">
									<p>
										<a href="lms/getCourse.action?courseId=${ucourse.course.id}"><button
												type="button" class="btn btn-success">继续学习</button> </a>
	
									</p>
								</div>
							</div>
						</div>
	
					</div>
				</div>
			</c:forEach>
		</div>
		</section>
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
	<script src="js/holder.js"></script>
	<script>
		
	</script>
</body>
</html>