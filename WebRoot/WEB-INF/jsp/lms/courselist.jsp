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
<title>课程列表</title>
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
			<!-- <div class="tback">
				<div class="container">
					<div class="row nospace">
						<div class="clear"></div>
						<div class="col-xs-12">
							<img src="images/findTop.jpg" alt="添加我的课程">
						</div>
					</div>
				</div>
			</div> -->
			<div class="container">
				<div class="row none" id="myrecentlycourse">
					<div class="col-xs-12 center">
						<h3>欢迎回来</h3>
					</div>
					<div class="col-xs-12 center">
						<img src="" alt="..." class="img-circle w300" id="imgcourse">
					</div>
					<div class="col-xs-12 center">
						<h3 id="namecourse"></h3>
					</div>
					<div class="col-xs-12 center">
						<table class="w500 center">
							<tr>
								<td>
									<div class="progress w500 center">
										<div
											class="progress-bar progress-bar-primary progress-bar-striped"
											role="progressbar" aria-valuenow="40" aria-valuemin="0"
											aria-valuemax="100" style="width: 0%">
											<span class="sr-only"></span>
										</div>
									</div>
								</td>
								<td>
									<h5 id="completecourse"></h5>
								</td>
							</tr>
						</table>
					</div>
					<div class="col-xs-12 clear"></div>
					<div class="col-xs-12 center">
						<a href="#" id="hrefcourse">
							<button type="button" class="btn btn-success btn-lg">继续学习</button>
						</a>
					</div>
					<div class="col-xs-12 center">
						<hr>
					</div>

				</div>
				<c:forEach var="category" items="${category}">
					<div class="row">
						<div class="col-xs-12 left nospace">
							<h1>${category.name}</h1>
						</div>
						<%-- <div class="col-xs-12 center">
							<h4>${category.describle}</h4>
						</div> --%>
						<div class="col-xs-12 clear"></div>
						<div id="category${category.id}"></div>	
						<div class="col-xs-12 clear"></div>
						<div class="col-xs-12 center" id="nav${category.id}"></div>
					</div>
					<div class="clear"></div>
				</c:forEach>

				<div class="clear"></div>
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
	
/* 	var turn = function(target,time,opts){
		target.find('a').hover(function(){
			$(this).find('img').stop().animate(opts[0],time,function(){
				$(this).hide().next().show();
				$(this).next().animate(opts[1],time);
			});
		},function(){
			$(this).find('.info').animate(opts[0],time,function(){
				$(this).hide().prev().show();
				$(this).prev().animate(opts[1],time);
			});
		});
	}
	var verticalOpts = [{'width':0},{'width':'100%'}];
	turn($('#vertical'),100,verticalOpts); */
	
		$(function() {
			<c:forEach items="${category}" var="category">
			loadCourse("${category.id}", 1);
			</c:forEach>
			loadmyCourse();
		});

		function addimgmove() {
			$('.vertical a').hover(function(){
				$(this).find('img').stop().animate({'width':0},100,function(){
					$(this).hide().next().show();
					$(this).next().animate({'width':'100%'},100);
				});
			},function(){
				$(this).find('.info').animate({'width':0},100,function(){
					$(this).hide().prev().show();
					$(this).prev().animate({'width':'100%'},100);
				});
			});
			/* $('.boxgrid a').hover(function() {
				$(this).find('img').stop(true).animate({'height':0,'top':'35px'},80,function(){
					$(this).hide().next().show();
					console.info($(this).hide().next());
					$(this).next().animate({
						'height':'70px',
						'top':'0'
					},80);
				});
				$(".cover", this).hide();
				$(".desc", this).show();
			}, function() {
				$(".cover", this).show();
				$(".desc", this).hide();
				$(".desc", this).animate({'height':0,'top':'35px'},80,function(){
					$(this).hide().prev().show();
					$(this).prev().animate({
						'height':'70px',
						'top':'0'
					},80);
				});
			}); */
		}
		function loadmyCourse() {
			$.ajax({
				url : "lms/recentcourse.action",
				type : "post",
				success : function(s) {
					var a = eval("(" + s + ")");
					if ("sucess" == a.sucess) {
						$("#imgcourse").attr("src", a.img);
						$("#namecourse").html(a.name);
						$('.progress-bar').css({
							'width' : a.complete
						}).find('span').html(a.complete);
						$("#completecourse").html(a.complete);
						$("#hrefcourse").attr("href",
								"lms/tocourse.action?courseId=" + a.courseId);
						$("#myrecentlycourse").show();
					}
				}
			});
		}
		function loadCourse(categoryId, pageNo) {
			categoryId = parseInt(categoryId);
			//var pageNo = 1;
			var data = {
				categoryId : categoryId,
				pageNo : pageNo
			};
			$
					.ajax({
						url : "lms/getCourseByCategoryId.action",
						type : "post",
						data : data,
						success : function(s) {
							//conid,conreid
							var a = eval("(" + s + ")");
							var tmp = '<div class="row">';
							var row = a.rows;
							for ( var i = 0; i < row.length; i++) {
								var course = row[i];
								var id = course.id;
								var name = course.name;
								var desc = course.desc;
								var imgpath = course.imgpath;
								/* tmp += '<div class="col-sm-3 boxgrid">'
										+ '<a href="lms/getCourse.action?courseId='
										+ id
										+ '" class="">'
										+ '<img src="'
										+ imgpath
										+ '" alt="..." width="100%"	height="150px;" class="img-rounded cover">'
										+ '<div class="desc none">' + desc
										+ '</div>' + '<h3>' + name + '</h3>'
										+ '</a>' + '</div>'; */
								
							
								tmp +='<div class="brand vertical col-sm-3">'+
									'<a href="lms/getCourse.action?courseId='+id+'"><img src="'+imgpath+'" /><div class="info">'+desc+'</div><h3>'+name+'</h3></a>'+
								'</div>';
							}
							tmp += '</div>';
							$("#category" + categoryId).html(tmp);

							var tmp2 = '<ul class="pagination lastspan">';
							for ( var i = 1; i < a.total + 1; i++) {
								if (pageNo == i) {
									tmp2 += '<li class="active"><a href="javascript:void(0);" onclick="loadCourse('
											+ categoryId
											+ ','
											+ i
											+ ');">'
											+ i
											+ '</a></li>';
								} else {
									tmp2 += '<li><a href="javascript:void(0);" onclick="loadCourse('
											+ categoryId
											+ ','
											+ i
											+ ');">'
											+ i
											+ '</a></li>';
								}
							}
							tmp2 += '</ul>';
							/* var tmp2 = '<ul class="pagination">'+
							  '<li class="active"><a href="javascript:void(0);" onclick="">1</a></li>'+
							  '<li><a href="#">2</a></li>'+
							  '<li><a href="#">3</a></li>'+
							  '<li><a href="#">4</a></li>'+
							  '<li><a href="#">5</a></li>'+
							'</ul>'; */
							$("#nav" + categoryId).html(tmp2);
							addimgmove();
							/* 							$
							 .jqPaginator(
							 '#nav'+categoryId,
							 {
							 totalPages : a.total,
							 visiblePages : 10,
							 currentPage : 1,
							 wrapper : '<ul class="pagination"></ul>',
							 page : '<li class="page"><a href="javascript:void(0);">{{page}}</a></li>',
							 onPageChange : function(num) {
							 //alert(num+"  ,  "+categoryId);
							 }
							 }); */
						}
					});
		}
	</script>
</body>
</html>