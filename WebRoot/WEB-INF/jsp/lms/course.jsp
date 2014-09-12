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
<title>课程</title>
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
		<div class="cmargin">
			<div class="clear"></div>
			<div class="row panel panel-default">
				<div class="col-sm-8">
					<img src="${course.imgpath}" alt="..." width="100%" height="200px;"
						class="img-rounded">
				</div>
				<div class="col-sm-4">
					<p>
					<h3>${course.name}</h3>
					</p>
					<c:if test="${buttonshow == 1}">
						<p>
						<h5>
							参加时间：<a id="dotime"></a>
						</h5>
						</p>
						<c:if test="${coursehaving == 0}">
						<p class="right ctop" id="">
							<button type="button" class="btn btn-warning" onclick="fcourse();">完成该课程</button>
						</p>
						</c:if>
						<c:if test="${coursehaving == 1}">
						<p class="right ctop" id="">
							<button type="button" class="btn btn-warning" onclick="acourse();">再来一次</button>
						</p>
						</c:if>
					</c:if>
					<c:if test="${buttonshow == 0}">
						<p class="right ctop">
							<a href="lms/tocourse.action?courseId=${course.id}">
								<button type="button" class="btn btn-primary">参加该课程</button>
							</a>
						</p>
					</c:if>
				</div>
			</div>
			<c:if test="${buttonshow == 1}">
				<div class="clear"></div>
				<div class="row panel panel-default cback">
					<div class="col-sm-10">
						<div class="h10"></div>
						<div class="progress">
							<div
								class="progress-bar progress-bar-primary progress-bar-striped"
								role="progressbar" aria-valuenow="40" aria-valuemin="0"
								aria-valuemax="100" style="width: 0%">
								<span class="sr-only"></span>
							</div>
						</div>
						<div>
							<h5>
								总共有<a id="alltext"></a>个实验，目前已完成<a id="protext"></a>个实验，加油啊！
							</h5>
						</div>
					</div>
					<div class="col-sm-2">
						<p class="right top20">
							<c:if test="${coursehaving == 0}">
								<a href="lms/tocourse.action?courseId=${course.id}">
									<button type="button" class="btn btn-primary">继续学习</button>
								</a>
							</c:if>
						</p>
					</div>
				</div>
			</c:if>
			<div class="cmargin">
				<div class="row">
					<div class="col-sm-12">
						<c:forEach var="chapter" items="${course.chapters}">
							<div class="center">
								<h3>${chapter.name}</h3>
							</div>
							<%--<div class="panel nospace">
								 <div class="panel-heading">
									<h5 class="panel-title">
										<a data-toggle="collapse" href="#c${chapter.id}">
											<h5>${chapter.name}</h5>
										</a>
									</h5>
								</div> --%>
							<%-- <div id="c${chapter.id}" class="panel-collapse collapse in">
									<div class="panel-body nospace"> --%>

							<c:forEach var="sequential" items="${chapter.sequentials}">
								<div class="panel nospace wback">
									<div class="panel-heading">
										<h5 class="panel-title">
											<a data-toggle="collapse" href="#s${sequential.id}">
												<h5>${sequential.name}</h5>
											</a>
										</h5>
									</div>
									<div id="s${sequential.id}" class="panel-collapse collapse in">
										<div class="panel-body nospace">

											<c:forEach var="vertical" items="${sequential.verticals}">

												<div class="nospacebody">
													<div class="panel-heading vbody">
														<h5 class="panel-title">
															<a data-toggle="collapse" href="#v${vertical.id}">
																<h5 class="left40">${vertical.name}</h5>
															</a>
														</h5>
													</div>
													<div id="v${vertical.id}"
														class="panel-collapse collapse in">
														<div class="panel-body nospace">
															<c:if test="${!empty vertical.verticalTrains}">
																<c:forEach var="verticalTrains"
																	items="${vertical.verticalTrains}">
																	<div class="nospace wback">
																		<div class="panel-body left80 tbody">
																			<div class="divleft">
																				<h5 class="">${verticalTrains.train.name}</h5>
																			</div>
																			<c:if test="${buttonshow == 1}">
																				<div class="divright">
																					<%-- <a
																									href="tocourseone.action?courseId=${course.id}&verticalId=${vertical.id}&trainId=${verticalTrains.train.id}">
																									<button type="button" class="btn btn-success">进入学习</button>
																								</a> --%>
																					<c:if test="${coursehaving == 0}">
																					<form action="lms/tocourseone.action" method="post">
																						<input type="hidden" value="${course.id}"
																							name="courseId" /> <input type="hidden"
																							value="${vertical.id}" name="verticalId" /> <input
																							type="hidden" value="${verticalTrains.train.id}"
																							name="trainId" />
																						<button type="submit" class="btn btn-primary">进入学习</button>
																					</form>
																					</c:if>
																				</div>
																			</c:if>
																		</div>
																	</div>
																</c:forEach>
															</c:if>

														</div>
													</div>
												</div>
											</c:forEach>
										</div>
									</div>
								</div>
							</c:forEach>
							<!-- </div>
								</div> 
							</div>-->
							<div class="h10"></div>
						</c:forEach>

					</div>
				</div>
			</div>
		</div>
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
	$(function() {
		//$('.progress-bar').css({'width':'80%'}).find('span').html('80%');
		var courseId = parseInt("${course.id}");
		var data = {
			courseId : courseId
		};
		$.ajax({
			url : "lms/condition.action",
			type : "post",
			data : data,
			success : function(s) {
				var a = eval("(" + s + ")");
				if ("sucess" == a.sucess) {
					var complete = a.complete;
					$("#alltext").html(a.allcounts);
					$("#protext").html(a.counts);

					$("#dotime").html(stotime(a.dotime));
					$('.progress-bar').css({
						'width' : complete
					}).find('span').html(complete);
				}
			}
		});
	});
	function stotime(s) {
		var t;
		if (s > -1) {
			hour = Math.floor(s / 3600);
			min = Math.floor(s / 60) % 60;
			sec = s % 60;
			day = parseInt(hour / 24);
			if (day > 0) {
				hour = hour - 24 * day;
				t = day + "天 " + hour + ":";
			} else
				t = hour + ":";
			if (min < 10) {
				t += "0";
			}
			t += min + ":";
			if (sec < 10) {
				t += "0";
			}
			t += sec;
		}
		return t;
	}
	function fcourse()
	{
		var courseId = parseInt("${course.id}");
		var data = {
			courseId : courseId
		};
		$.ajax({
			url : "lms/fcourse.action",
			type : "post",
			data : data,
			success : function(s) {
				var a = eval("(" + s + ")");
				
				if ("sucess" == a.sucess)
				{
					location.href="";
				}
			}
		});
	}
	function acourse()
	{
		var courseId = parseInt("${course.id}");
		var data = {
			courseId : courseId
		};
		$.ajax({
			url : "lms/acourse.action",
			type : "post",
			data : data,
			success : function(s) {
				var a = eval("(" + s + ")");
				if ("sucess" == a.sucess)
				{
					location.href="lms/tocourse.action?courseId="+courseId;
				}
			}
		});
	}
	</script>
</body>
</html>