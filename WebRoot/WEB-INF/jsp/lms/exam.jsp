<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
	<title>我的考试</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
	<meta content='text/html;charset=utf-8' http-equiv='content-type'>
	<meta content='Flat administration template for Twitter Bootstrap. Twitter Bootstrap 3 template with Ruby on Rails support.' name='description'>
	<link href='assets/images/meta_icons/favicon.ico' rel='shortcut icon' type='image/x-icon'>
	<link href='assets/images/meta_icons/apple-touch-icon.png' rel='apple-touch-icon-precomposed'>
	<link href='assets/images/meta_icons/apple-touch-icon-57x57.png' rel='apple-touch-icon-precomposed' sizes='57x57'>
	<link href='assets/images/meta_icons/apple-touch-icon-72x72.png' rel='apple-touch-icon-precomposed' sizes='72x72'>
	<link href='assets/images/meta_icons/apple-touch-icon-114x114.png'
	rel='apple-touch-icon-precomposed' sizes='114x114'>
	<link href='assets/images/meta_icons/apple-touch-icon-144x144.png'
	rel='apple-touch-icon-precomposed' sizes='144x144'>
	<!-- / START - page related stylesheets [optional] -->
	<link href="assets/stylesheets/plugins/select2/select2.css" media="all" rel="stylesheet" type="text/css" />
	<link href="assets/stylesheets/plugins/bootstrap_colorpicker/bootstrap-colorpicker.css" media="all" rel="stylesheet" type="text/css" />
	<link href="assets/stylesheets/plugins/bootstrap_daterangepicker/bootstrap-daterangepicker.css" media="all" rel="stylesheet" type="text/css" />
	<link href="assets/stylesheets/plugins/bootstrap_datetimepicker/bootstrap-datetimepicker.min.css" media="all" rel="stylesheet" type="text/css" />
	<link href="assets/stylesheets/plugins/bootstrap_switch/bootstrap-switch.css" media="all" rel="stylesheet" type="text/css" />
	<link href="assets/stylesheets/plugins/common/bootstrap-wysihtml5.css" media="all" rel="stylesheet" type="text/css" />
	<!-- / END - page related stylesheets [optional] -->
	<!-- / bootstrap [required] -->
	<link href="assets/stylesheets/bootstrap/bootstrap.css" media="all" rel="stylesheet" type="text/css" />
	<!-- / theme file [required] -->
	<link href="assets/stylesheets/light-theme.css" media="all" id="color-settings-body-color" rel="stylesheet" type="text/css" />
	<!-- / coloring file [optional] (if you are going to use custom contrast color) -->
	<link href="assets/stylesheets/theme-colors.css" media="all" rel="stylesheet" type="text/css" />
	<!-- / demo file [not required!] -->
	<link href="assets/stylesheets/demo.css" media="all" rel="stylesheet" type="text/css" />
	<link href="css/train.css" media="all" rel="stylesheet" type="text/css">
	<!--[if lt IE 9]>
    <script src="assets/javascripts/ie/html5shiv.js" type="text/javascript"></script>
    <script src="assets/javascripts/ie/respond.min.js" type="text/javascript"></script>
    <![endif]-->
    
    <style type="text/css">
    /* Custom Styles */
	.section .item {
    	background: url("http://s.stu.126.net/res/images/question/ui_question.png?a2a90d6702c600cc5523d3d971309eca") no-repeat scroll 0 -760px rgba(0, 0, 0, 0);
    	color: #666;
   		cursor: pointer;
    	display: block;
    	font-family: "Arial";
    	font-size: 12px;
    	height: 22px;
    	line-height: 22px;
    	margin: 0 2px 5px 0;
    	outline: medium none;
    	text-align: center;
    	width: 22px;
    	float:left;
	}
	.section .item.greater {
    	font-size: 11px;
	}
	.section .item:hover {
    	background-position: 0 -786px;
    	color: #fff;
	}
 	.section .item.mark {
    	background-position: -33px -760px;
	}
 	.section .item.mark:hover {
    	color: #666;
	}
 	.section .item.done {
    	background-position: 0 -813px;
    	color: #fff;
	}
 	.section .item.done.mark {
    	background-position: -33px -813px;
    	color: #fff;
	}
 	.section .item.right {
    	background-position: 0 -868px;
    	color: #fff;
	}
 	.section .item.wrong {
    	background-position: 0 -895px;
    	color: #fff;
	}

</style>

  </head>
  <body data-spy="scroll" data-target="#myScrollspy" class='contrast-red fixed-header'>
    <jsp:include page="header.jsp"></jsp:include>
	<div id='wrapper'>

		<div class='container'>
			<div class='row' id='content-wrapper'>
				<div class='col-xs-9'>
					<div class='page-header'>
                    	<h1 class='pull-left'>
                      		<span>${exam.name}</span>
                    	</h1>
                 	</div>
<!-- 					<div class='row'>
						<div class='col-xs-12'>
							<div class="pull-left">
								<ul class="breadcrumb">
									<li>
										<a href="index.html"> <i class="icon-bar-chart"></i></a>
									</li>
									<li class="separator"><i class="icon-angle-right"></i></li>
									<li>试题</li>
									<li class="separator"><i class="icon-angle-right"></i></li>
									<li class="active">第一部分</li>
								</ul>
							</div>
						</div>
					</div> -->
					
					<%-- <c:forEach var="chapter" items="${exam.examchapters}">
                 	${chapter.name}>>
	                 	<c:forEach var="sequential" items="${chapter.esequentials}">
	                 	${sequential.name}>></br>
		                 	<c:forEach var="vertical" items="${sequential.examVerticals}">
		                 	${vertical.name}</br>
			                 	<c:forEach var="examq" items="${vertical.examQuestion}">
			                 	
			                 	aaaaaaaaaaaaaaaa${examq.question.content}</br>
			                 	</c:forEach>
		                 	</c:forEach>
	                 	</c:forEach>
                 	</c:forEach> --%>
                 	
					<div class='row'>
					<div class='col-sm-12 box box-nomargin'>
					<div class='box-content'>
                    <div class='dd dd-nestable'>
                    <c:forEach var="chapter" items="${exam.examchapters}" varStatus="i">
                      <ol class='dd-list'>
                        <li class='dd-item' data-id='2'>
                          <div class='dd-handle'>
                            <i class='icon-backward text-purple'></i>
                            ${chapter.name}
                          </div>
                          <c:forEach var="sequential" items="${chapter.esequentials}" varStatus="j">
                          <ol class='dd-list'>
                            <li class='dd-item' data-id='3'>
                              <div class='dd-handle'>
                                <i class='icon-camera-retro text-orange'></i>
                                ${sequential.name}
                              </div>
                              <c:forEach var="vertical" items="${sequential.examVerticals}" varStatus="k">
                              <ol class='dd-list'>
                                <li class='dd-item' data-id='4'>
                                  <div class='dd-handle'>${vertical.name}</div>
                                  <c:forEach var="examq" items="${vertical.examQuestion}" varStatus="l">
                                     序号：${l.index+1+k.index*(fn:length(sequential.examVerticals)+1)+j.index*(fn:length(chapter.esequentials)+1)+i.index*(fn:length(exam.examchapters)+1)}  
			                 		<div class="test">
			                 		<c:forEach var="qd" items="${examq.qdlist}">
			                 			<%-- html问题描述 --%>
							   			<c:if test="${qd.type == 1}">
							   				${qd.title}</br>
							   				<c:forEach var="qdcontent" items="${qd.content}">
							   					<label  for=""><input type="radio" name="" id="" aria-role="radio" aria-describedby="" value="${qdcontent}" aria-multiselectable="true"/>${qdcontent}</label>
							   				</c:forEach>
							   				</br>${qd.explain}
							   			</c:if>
							   		    <%-- 单选 --%>
							   			<c:if test="${qd.type == 2}">
							   				${qd.title}</br>
							   				<c:forEach var="qdcontent" items="${qd.content}">
							   					<label  for=""><input type="radio" name="" id="" aria-role="radio" aria-describedby="" value="${qdcontent}" aria-multiselectable="true"/>${qdcontent}</label>
							   				</c:forEach>
							   				</br>${qd.explain}
							   			</c:if>
							   			<%-- 多选 --%>
							   			<c:if test="${qd.type == 3}">
							   				${qd.title}</br>
							   				<c:forEach var="qdcontent" items="${qd.content}">
							   					<label  for=""><input type="radio" name="" id="" aria-role="radio" aria-describedby="" value="${qdcontent}" aria-multiselectable="true"/>${qdcontent}</label>
							   				</c:forEach>
							   				</br>${qd.explain}
							   			</c:if>
							   			<%-- 填空 --%>
							   			<c:if test="${qd.type == 4}">
							   				${qd.title}</br>
							   				<c:forEach var="qdcontent" items="${qd.content}">
							   					<label  for=""><input type="radio" name="" id="" aria-role="radio" aria-describedby="" value="${qdcontent}" aria-multiselectable="true"/>${qdcontent}</label>
							   				</c:forEach>
							   				</br>${qd.explain}
							   			</c:if>
							   			<%-- 多文本填空 --%>
							   			<c:if test="${qd.type == 5}">
							   				${qd.title}</br>
							   				<c:forEach var="qdcontent" items="${qd.content}">
							   					<label  for=""><input type="radio" name="" id="" aria-role="radio" aria-describedby="" value="${qdcontent}" aria-multiselectable="true"/>${qdcontent}</label>
							   				</c:forEach>
							   				</br>${qd.explain}
							   			</c:if>
			                 		</c:forEach>
			                 		</div>
			                 		<div class="clear"></div>
			                 	</c:forEach>
                                </li>
                              </ol>
                              </c:forEach>
                            </li>
                          </ol>
                          </c:forEach>
                        </li>
                      </ol>
                      </c:forEach>
                    </div>
                  </div>
                  </div>
                  </div>
                  
					<hr class='hr-normal'>
					<div class='row'>
						<div class='col-xs-12'>
							<form class="form form-horizontal" method="post" action="#">

								<div class='form-group'>
									<label class='col-sm-1'>1.</label> <span class='col-sm-11'>
										在我国加入世界贸易组织、农业科技迅猛发展的形势下，农业面临的竞争首先是科技竞争。只有尽快提高农民的文化素质和科技意识，才能不断推广大批先进实用的农业科技成果，
										为农业和农村经济的发展提供有力的科技支撑。我国将继续推进农业和农村经济结构调整，大力发展优势农产品和特色产业，将在粮食主产区推广50个优质高产高效品种和10项关键技术。
										这些品种和技术的推广和运用都需要高素质的农民。为此，国家已经决定大力发展农村成人教育，在全国普遍开展农村实用技术培训，每年将培训农民超过1亿人次。这段文字的意思是在强调（&#12288;&#12288;）。
									</span>
								</div>
								<hr class='hr-normal'>
								<div class='form-group'>
									<label class='col-sm-1'> A. </label> <label class='col-sm-10'>
										科普文章对作家的依赖 </label>
								</div>
								<div class='form-group'>
									<label class='col-sm-1'> B. </label> <label class='col-sm-10'>
										科学和文学的互相激励作用 </label>
								</div>
								<div class='form-group'>
									<label class='col-sm-1'> C. </label> <label class='col-sm-10'>
										科学和文学互相依赖的关系 </label>
								</div>
								<div class='form-group'>
									<label class='col-sm-1'> D. </label> <label class='col-sm-10'>
										科学发展为文学提供了丰富的素材 </label>
								</div>

								<hr class='hr-normal'>
								<div class='form-group'>
									<div class='col-sm-12'>
										<label class='radio radio-inline'> <input type='radio'
											name="choice"> A
										</label> <label class='radio radio-inline'> <input
											type='radio' name="choice"> B
										</label> <label class='radio radio-inline'> <input
											type='radio' name="choice"> C
										</label> <label class='radio radio-inline'> <input
											type='radio' name="choice"> D
										</label>
									</div>
								</div>

							</form>
						</div>
					</div>
					<hr class='hr-normal'>
					<div class='row'>
						<div class='col-xs-12'>
							
							<form class="form form-horizontal" method="post" action="#">

								<div class='form-group'>
									<label class='col-sm-1'>2.</label> <span class='col-sm-11'>
										在我国加入世界贸易组织、农业科技迅猛发展的形势下，农业面临的竞争首先是科技竞争。只有尽快提高农民的文化素质和科技意识，才能不断推广大批先进实用的农业科技成果，
										为农业和农村经济的发展提供有力的科技支撑。我国将继续推进农业和农村经济结构调整，大力发展优势农产品和特色产业，将在粮食主产区推广50个优质高产高效品种和10项关键技术。
										这些品种和技术的推广和运用都需要高素质的农民。为此，国家已经决定大力发展农村成人教育，在全国普遍开展农村实用技术培训，每年将培训农民超过1亿人次。这段文字的意思是在强调（&#12288;&#12288;）。
									</span>
								</div>

								<hr class='hr-normal'>
								
								<div class='form-group'>
									<label class='col-sm-1'> A. </label> <label class='col-sm-10'>
										科普文章对作家的依赖 </label>
								</div>
								<div class='form-group'>
									<label class='col-sm-1'> B. </label> <label class='col-sm-10'>
										科学和文学的互相激励作用 </label>
								</div>
								<div class='form-group'>
									<label class='col-sm-1'> C. </label> <label class='col-sm-10'>
										科学和文学互相依赖的关系 </label>
								</div>
								<div class='form-group'>
									<label class='col-sm-1'> D. </label> <label class='col-sm-10'>
										科学发展为文学提供了丰富的素材 </label>
								</div>

								<hr class='hr-normal'>
								<div class='form-group'>
									<div class='col-sm-12'>
										<label class='checkbox-inline'> 
											<input type='checkbox' value=''> A
										</label> 
										<label class='checkbox-inline'> 
											<input type='checkbox' value=''> B
										</label> 
										<label class='checkbox-inline'> 
											<input type='checkbox' value=''> C
										</label>
										<label class='checkbox-inline'> <input
											type='checkbox' value=''> D
										</label>
									</div>
								</div>

							</form>
						</div>
					</div>
					<hr class='hr-normal'>
					<div class='row'>
						<div class='col-xs-12'>
							<form class="form form-horizontal" method="post" action="#">

								<div class='form-group'>
									<label class='col-sm-1'>3.</label> <span class='col-sm-11'>
										在我国加入世界贸易组织、农业科技迅猛发展的形势下，农业面临的竞争首先是科技竞争。只有尽快提高农民的文化素质和科技意识，才能不断推广大批先进实用的农业科技成果，
										为农业和农村经济的发展提供有力的科技支撑。我国将继续推进农业和农村经济结构调整，大力发展优势农产品和特色产业，将在粮食主产区推广50个优质高产高效品种和10项关键技术。
										这些品种和技术的推广和运用都需要高素质的农民。为此，国家已经决定大力发展农村成人教育，在全国普遍开展农村实用技术培训，每年将培训农民超过1亿人次。这段文字的意思是在强调______________________________________________。
									</span>
								</div>
								
								<hr class='hr-normal'>
								<div class='form-group'>
									<div class='col-sm-12'>
										<textarea class='form-control' rows='3'></textarea>
									</div>
								</div>
							</form>
						</div>
					</div>
					<hr class='hr-normal'>
					<div class='row'>
						<div class='col-xs-12'>
							<form class="form form-horizontal" method="post" action="#">

								<div class='form-group'>
									<label class='col-sm-1'>4.</label> <span class='col-sm-11'>
										在我国加入世界贸易组织、农业科技迅猛发展的形势下，农业面临的竞争首先是科技竞争。只有尽快提高农民的文化素质和科技意识，才能不断推广大批先进实用的农业科技成果，
										为农业和农村经济的发展提供有力的科技支撑。我国将继续推进农业和农村经济结构调整，大力发展优势农产品和特色产业，将在粮食主产区推广50个优质高产高效品种和10项关键技术。
										这些品种和技术的推广和运用都需要高素质的农民。为此，国家已经决定大力发展农村成人教育，在全国普遍开展农村实用技术培训，每年将培训农民超过1亿人次。这段文字的意思是在强调.
									</span>
								</div>								
								<hr class='hr-normal'>
								<div class='box-content' style="padding:0">
									<a class="btn btn-success btn-block btn-lg" href="">进入实训</a>
								</div>
							</form>
						</div>
					</div>
				</div>																																			
								
				<div class='col-xs-3'>
					<div class='page-header'></div>
					<div class='row'  >
						<div class='col-sm-12'>
							<div class='box bordered-box blue-border'>
								<div class='box-content'>
									<div class='row'>
										<div class='col-sm-12'>
											<div id="timer" class="pull-left" style="color:green;font-family:courier;font-size:150%"></div>
											<div class="pull-right">
												<a class="btn">暂停</a> 
												<a class="btn">下次再做</a>
											</div>
										</div>
									</div>
									<hr class='hr-normal'>
									<div class='row'>
										<div class='col-sm-12'>
											<ul data-offset-top="125" class="section">
												<li><a href="#section-2" class="j-item item  f-fl">31</a></li>
												<li><a class="j-item item  f-fl">32</a></li>
												<li><a class="j-item item  f-fl">33</a></li>
											</ul>
										</div>
									</div>
									<hr class='hr-normal'>
									<div class='row'>
										<div class='col-sm-12'>
											<div class='box-content' style="padding:0">
												<a class="btn btn-success btn-block btn-lg" href="">提交试卷</a>
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

	</div>

	<jsp:include page="footer.jsp"></jsp:include>
    <!-- / jquery [required] -->
    <script src="assets/javascripts/jquery/jquery.min.js" type="text/javascript"></script>
    <!-- / jquery mobile (for touch events) -->
    <script src="assets/javascripts/jquery/jquery.mobile.custom.min.js" type="text/javascript"></script>
    <!-- / jquery migrate (for compatibility with new jquery) [required] -->
    <script src="assets/javascripts/jquery/jquery-migrate.min.js" type="text/javascript"></script>
    <!-- / jquery ui -->
    <script src="assets/javascripts/jquery/jquery-ui.min.js" type="text/javascript"></script>
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
    <script src="assets/javascripts/plugins/nestable/jquery.nestable.js" type="text/javascript"></script>
    <!-- / END - page related files and scripts [optional] -->
	<script src="js/common.js" type="text/javascript"></script>
	<script src="js/holder.js" type="text/javascript"></script>

	<script type="text/javascript">   
		//一个小时，按秒计算，可以自己调整时间
		var maxtime = 60 * 60;
		function CountDown() {
			if (maxtime >= 0) {
				minutes = Math.floor(maxtime / 60);
				seconds = Math.floor(maxtime % 60);
				msg = minutes + ":" + seconds ;
				$("#timer").html(msg);
				if (maxtime == 5 * 60)
					alert('注意，还有5分钟!');
				--maxtime;
			} else {
				clearInterval(timer);
				alert("时间到，结束!");
			}
		}
		timer = setInterval("CountDown()", 1000);
	</script>
</body>
</html>
