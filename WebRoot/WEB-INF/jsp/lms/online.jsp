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

<title>学堂在线</title>

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


</head>




<body class='contrast-red fixed-header'>

	<jsp:include page="header.jsp"></jsp:include>

	<div id='wrapper'>
		<section id=''>
			<div class="container">
				<div class="row">
					<div class="col-xs-3">
						<select class='select2 form-control' name="major">

							<option value='NC'>North Carolina</option>
							<option value='OH'>Ohio</option>
							<option value='PA'>Pennsylvania</option>
							<option value='RI'>Rhode Island</option>
							<option value='SC'>South Carolina</option>
							<option value='VT'>Vermont</option>
							<option value='VA'>Virginia</option>
							<option value='WV'>West Virginia</option>
							<option value='NY' selected="selected">-专业-</option>
						</select>
					</div>
					<div class="col-xs-3">
						<select class='select2 form-control' name="level">
							<option value='all' selected="selected">-等级-</option>
							<option value='low'>初级</option>
							<option value='middle'>中级</option>
							<option value='high'>高级</option>
						</select>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
							<div class="input-group controls-group">
								<input type="text" name="q" class="form-control"
									placeholder="Search..." value=""> <span
									class="input-group-btn">
									<button type="button" class="btn">
										<i class="icon-search"></i>
									</button>
								</span>
							</div>
						</div>
					</div>

				</div>
				<div class="clear"></div>
				<div class="row wback nospace">
					<div class="col-sm-3 courseh">
						<a> <img src="" alt="..." width="100%" height="150px;"
							class="img-rounded">
						</a>
					</div>
					<div class="col-sm-7">
						<p>
							<a>
								<h1>1111</h1>
							</a>
						</p>
						<p>
							<a> 2222</a>
						</p>
					</div>
					<div class="col-sm-2">
						<div class="clear"></div>
						<div class="wrap">
							<div class="subwrap">
								<div class="content">
									<p>
										<a href="lms/getCourse.action?courseId=1"><button
												type="button" class="btn btn-success">进入学习</button> </a>

									</p>
								</div>
							</div>
						</div>

					</div>
				</div>
				<div class="clear"></div>
			</div>
		</section>
	</div>

	<div id="pagination" class="center"></div>

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
	<script src="js/jqPaginator.js"></script>

	<script>
		$(function() {
			initlist();
		});
		function initlist() {
			var totalPages = 2;
			currentPage = 1;
			totalPages = 2;
			$
					.jqPaginator(
							'#pagination',
							{
								totalPages : totalPages,
								visiblePages : 4,
								currentPage : currentPage,

								wrapper : '<ul class="pagination lastspan"></ul>',
								/* 		 first : '<li class="first"><a href="javascript:void(0);">首页</a></li>',
								 */prev : '<li class="prev"><a href="javascript:void(0);">&laquo;</a></li>',
								next : '<li class="next"><a href="javascript:void(0);">&raquo;</a></li>',
								/*  last : '<li class="last"><a href="javascript:void(0);">尾页</a></li>', */
								page : '<li class="page"><a href="javascript:void(0);">{{page}}</a></li>',
								onPageChange : function(num) {
									currentPage = num;
									resetTrain(num);
									timeservice(0);
								}
							});
		}
	</script>
</body>
</html>
