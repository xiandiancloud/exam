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
    	background: url("images/ui_question.png") no-repeat scroll 0 -760px rgba(0, 0, 0, 0);
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
    	text-decoration: none;
    	width: 22px;
    	float: left;
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
	.totalScore {
    	font-family: Arial,Helvetica,sans-serif;
    	font-size: 100px;
   	 	line-height: 229px;  	 	
	}
 	.advance {
    	left: 0;
    	text-align: center;
    	top: 0;
    	width: 235px;
    	color:#FF7F24;
	}
	.juzhong{
		height:40px;
		line-height:40px;
	}
	.fixtop 
	{ 
		position:fixed;
		top:216px; 
	} 
</style>

  </head>
  <body data-spy="scroll" class='contrast-red fixed-header'>
    <jsp:include page="header.jsp"></jsp:include>
	<div id='wrapper'>
		<div class='container'>
					<div class='row'>
						<div class='col-xs-12'>
							<div class='row'>
								<div class='col-xs-12'>
									<div class='page-header'>
										<h1 class='pull-left'>
											<span>${exam.name}</span>
										</h1>
									</div>
								</div>
							</div>
							<div class='row none' id="firesult">
							<div class='col-sm-3'>
								<div class="advance ">
									<span class="totalScore">${score}</span>分
								</div>
							</div>
							<div class='col-sm-9'>
								<div class='box bordered-box' style='margin-bottom:0;'>
									<div class='box-content box-no-padding'>
										<div class='responsive-table'>
											<div class='scrollable-area'>
												<table class='table table-bordered' style='margin-bottom:0;background-color:#CCCCCC'>
													<thead>
														<tr>
															<th></th>
															<c:forEach var="ued" items="${uedlist}">
															<th>${ued.name}</th>
															</c:forEach>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>答对</td>
															<c:forEach var="ued" items="${uedlist}">
															<th>${ued.right}</th>
															</c:forEach>
														</tr>
														<tr>
															<td>答错</td>
															<c:forEach var="ued" items="${uedlist}">
															<th>${ued.wrong}</th>
															</c:forEach>
														</tr>
														<tr>
															<td>未答</td>
															<c:forEach var="ued" items="${uedlist}">
															<th>${ued.noanswer}</th>
															</c:forEach>
														</tr>
														<tr>
															<td>得分</td>
															<c:forEach var="ued" items="${uedlist}">
															<th>${ued.cscore}</th>
															</c:forEach>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
				</div>
			</div>
			
			<div class='row' id='content-wrapper'>
				<div class='col-xs-9'>
					<div class='row'>
					<div class='col-sm-12 box box-nomargin'>
					<div class='box-content'>
                    <div class='dd dd-nestable'>
                    <c:set value="0" var="index" />
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
			                 		<c:forEach var="qd" items="${examq.qdlist}" varStatus="nn">
			                 			<%-- 实训 --%>
							   			<c:if test="${qd.type == 6}">
							   				<div class='row'>
												<div class='col-xs-12'>
													<form class="form form-horizontal" method="post" action="#">
														<div class='form-group col-sm-12'>
														    <c:set value="${index + 1}" var="index" />
															<span id="number${index}"><label class="numberfont">${index}&nbsp;</label>${qd.title}</span>
														</div>
														<c:forEach var="qdcontent" items="${qd.content}">
															<div class='form-group col-sm-12'>
																<div class="trainimg">${qdcontent}</div> 
															</div>
														</c:forEach>
													</form>
													<hr class='hr-normal'>
													<div class='form-group col-sm-12'>
														<a id="hrefnumber${index}" href="javascript:void(0);" onclick="entertrain('${competionId}','${exam.id}','${vertical.id}','${qd.id}','hrefnumber${index}');" target="_blank" class='btn btn-danger'>
														<i class='icon-circle-arrow-right'></i>进入实训</a>
													</div>
												</div>
											</div>
							   			</c:if>
			                 			<%-- html问题描述 --%>
							   			<c:if test="${qd.type == 1}">
							   				<div class='row'>
												<div class='col-xs-12'>
													<form class="form form-horizontal" method="post" action="#">
														<div class='form-group col-sm-12'>
															<c:set value="${index + 1}" var="index" />
															<span class='trainimg' id="number${index}"><label class="numberfont">${index}&nbsp;</label>${qd.title}</span>
														</div>
													</form>
												</div>
											</div>
							   			</c:if>
							   		    <%-- 单选 --%>
							   			<c:if test="${qd.type == 2}">																						
											<div class='row'>
												<div class='col-xs-12'>
													<form class="form form-horizontal" method="post" action="#">
														<div class='form-group col-sm-12'>
															<c:set value="${index + 1}" var="index" />
															<span id="number${index}"><label class="numberfont">${index}&nbsp;</label>${qd.title}</span>
														</div>
														<hr class='hr-normal'>
														<div id="numberquestion${index}">
														<c:forEach var="qdcontent" items="${qd.content}">
															<div class='form-group col-sm-12'>
																<label class='radio'>
																	<input type="radio" name="${qd.id}" onclick="submitquesstion('${qd.id}','${nn.index+1}','${qdcontent}');" value="${qdcontent}"/>${qdcontent}
																</label> 
															</div>
														</c:forEach>
														</div>
														<%-- <hr class='hr-normal nospace'>
														<div class='form-group col-xs-12' style="margin:0;padding:0;background-color:#fff4f4;">
															<label >正确答案：${qd.answer}</label>
															<div class='row'>
															<div class='col-xs-12 h30'></div>
															</div>												
															<div class='row'>
																<div class='col-xs-6 juzhong' style="line-height:40px;">
																	<label >正确答案：${qd.answer}</label>
																</div>
																<div class='col-xs-2 juzhong'>
																	本题满分：<span>10</span>
																</div>
																<div class='col-xs-2 juzhong'>
																	您的得分：<span>5</span>
																</div>
																<div class='col-xs-2 juzhong'>
																	<div class='input-group controls-group'>
																		<input class="form-control" type="text" />
																		<span class='input-group-btn'>
																			<button class='btn' type='submit'>改分</button>
																		</span>
																	</div>
																</div>
															</div>
															<div class='row'>
																<div class='col-xs-12 h30'></div>
															</div>
														</div> --%>
													</form>
												</div>
											</div>
										</c:if>
							   			<%-- 多选 --%>
							   			<c:if test="${qd.type == 3}">
							   				<div class='row'>
												<div class='col-xs-12'>
													<form class="form form-horizontal" method="post" action="#" id="${examq.id}${qd.id}">
														<div class='form-group col-sm-12'>
															<c:set value="${index + 1}" var="index" />
															<span id="number${index}"><label class="numberfont">${index}&nbsp;</label>${qd.title}</span>
														</div>
														<hr class='hr-normal'>
														<div id="numberquestion${index}">
														<c:forEach var="qdcontent" items="${qd.content}">
															<div class='form-group col-sm-12'>
																<label class='checkbox'>
																	<input type="checkbox" name="${qd.id}" onclick="submitmultiquesstion('${qd.id}','${nn.index+1}','${examq.id}${qd.id}');" value="${qdcontent}"/>${qdcontent}
																</label> 
															</div>
														</c:forEach>
														</div>
														<%-- <hr class='hr-normal nospace'>
														<div class='form-group col-xs-12' style="margin:0;padding:0;background-color:#fff4f4;">
															<label >正确答案：${qd.answer}</label>
															<div class='row'>
															<div class='col-xs-12 h30'></div>
															</div>												
															<div class='row'>
																<div class='col-xs-6 juzhong' style="line-height:40px;">
																	<label >正确答案：${qd.answer}</label>
																</div>
																<div class='col-xs-2 juzhong'>
																	本题满分：<span>10</span>
																</div>
																<div class='col-xs-2 juzhong'>
																	您的得分：<span>5</span>
																</div>
																<div class='col-xs-2 juzhong'>
																	<div class='input-group controls-group'>
																		<input class="form-control" type="text" />
																		<span class='input-group-btn'>
																			<button class='btn' type='submit'>改分</button>
																		</span>
																	</div>
																</div>
															</div>
															<div class='row'>
																<div class='col-xs-12 h30'></div>
															</div>
														</div> --%>													
													</form>
												</div>
											</div>
							   			</c:if>
							   			<%-- 填空 --%>
							   			<c:if test="${qd.type == 4}">
											<div class='row'>
												<div class='col-xs-12'>
													<form class="form form-horizontal" method="post" action="#">
														<div class='form-group col-sm-12'>
															<c:set value="${index + 1}" var="index" />
															<span id="number${index}"><label class="numberfont">${index}&nbsp;</label>${qd.title}</span>
														</div>
														<c:forEach var="qdcontent" items="${qd.content}">
															<div class='form-group col-sm-12'>
																<label>${qdcontent}</label> 
															</div>
														</c:forEach>
														<hr class='hr-normal'>
														<div class='form-group'>
															<div class='col-sm-12'>
																<input class='form-control' type="text" id="numberquestion${index}" onblur="submittextquesstion('${qd.id}','${nn.index+1}',this);" />
															</div>
														</div>
														<%-- <hr class='hr-normal nospace'>
														<div class='form-group col-xs-12' style="margin:0;padding:0;background-color:#fff4f4;">
															<label >正确答案：${qd.answer}</label>
															<div class='row'>
															<div class='col-xs-12 h30'></div>
															</div>												
															<div class='row'>
																<div class='col-xs-6 juzhong' style="line-height:40px;">
																	<label >正确答案：${qd.answer}</label>
																</div>
																<div class='col-xs-2 juzhong'>
																	本题满分：<span>10</span>
																</div>
																<div class='col-xs-2 juzhong'>
																	您的得分：<span>5</span>
																</div>
																<div class='col-xs-2 juzhong'>
																	<div class='input-group controls-group'>
																		<input class="form-control" type="text" />
																		<span class='input-group-btn'>
																			<button class='btn' type='submit'>改分</button>
																		</span>
																	</div>
																</div>
															</div>
															<div class='row'>
																<div class='col-xs-12 h30'></div>
															</div>
														</div> --%>
													</form>
												</div>
											</div>
										</c:if>
							   			<%-- 多文本填空 --%>
							   			<c:if test="${qd.type == 5}">
							   				<div class='row'>
												<div class='col-xs-12'>
													<form class="form form-horizontal" method="post" action="#">
														<div class='form-group col-sm-12'>
															<c:set value="${index + 1}" var="index" />
															<span id="number${index}"><label class="numberfont">${index}&nbsp;</label>${qd.title}</span>
														</div>
														<c:forEach var="qdcontent" items="${qd.content}">
															<div class='form-group col-sm-12'>
																<label>${qdcontent}</label> 
															</div>
														</c:forEach>
														<hr class='hr-normal'>
														<div class='form-group'>
															<div class='col-sm-12'>
																<textarea class='form-control' rows='5' id="numberquestion${index}" onblur="submittextareaquesstion('${qd.id}','${nn.index+1}',this);"></textarea>
															</div>
														</div>
														<%-- <hr class='hr-normal nospace'>
														<div class='form-group col-xs-12' style="margin:0;padding:0;background-color:#fff4f4;">
															<label >正确答案：${qd.answer}</label>
															<div class='row'>
															<div class='col-xs-12 h30'></div>
															</div>												
															<div class='row'>
																<div class='col-xs-6 juzhong' style="line-height:40px;">
																	<label >正确答案：${qd.answer}</label>
																</div>
																<div class='col-xs-2 juzhong'>
																	本题满分：<span>10</span>
																</div>
																<div class='col-xs-2 juzhong'>
																	您的得分：<span>5</span>
																</div>
																<div class='col-xs-2 juzhong'>
																	<div class='input-group controls-group'>
																		<input class="form-control" type="text" />
																		<span class='input-group-btn'>
																			<button class='btn' type='submit'>改分</button>
																		</span>
																	</div>
																</div>
															</div>
															<div class='row'>
																<div class='col-xs-12 h30'></div>
															</div>
														</div> --%>
													</form>
												</div>
											</div>
							   			</c:if>
			                 		</c:forEach>
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
				</div>																																			
					
				<div class="col-xs-3" id="scroll1">
				<div class="fixtop" id="scroll2">
							<div class='box bordered-box blue-border'>
								<div class='box-content'>
									<div class='row'>
										<!-- <div class='col-xs-3'>
											<div id="timer" style="color:green;font-family:Arial;font-size:170%;"></div>
										</div> -->
										<div class='col-xs-12'>
											<div class="pull-right">
												<!-- <a class="btn">暂停</a>  -->
												<a href="lms/myexam.action" class="btn">下次再做</a>
											</div>
										</div>
									</div>
									<hr class='hr-normal'>
									<div class='row'>
										<div class='col-xs-12'>
											<div data-offset-top="125" class="nav nav-tabs nav-stacked section">
												<!-- <li><a href="javascript:void(0)" onclick="document.getElementById('section-2').scrollIntoView();" class="j-item item  f-fl">31</a></li> -->
												<c:set value="0" var="sum" />
												<c:forEach var="chapter" items="${exam.examchapters}" varStatus="i">
							                          <c:forEach var="sequential" items="${chapter.esequentials}" varStatus="j">
							                              <c:forEach var="vertical" items="${sequential.examVerticals}" varStatus="k">
							                                  <c:forEach var="examq" items="${vertical.examQuestion}" varStatus="l">
							                                  
										                 		<c:forEach var="qd" items="${examq.qdlist}">
										                 		<!-- <li> -->
										                 		<c:set value="${sum + 1}" var="sum" /> 
										                 		<a href="javascript:void(0)" onclick="document.getElementById('number${sum}').scrollIntoView();" class="j-item item  f-fl">
										                 		${sum}
										                 		</a>
										                 		<!-- </li> -->

										                 		</c:forEach>
										                 	</c:forEach>
							                              </c:forEach>
							                          </c:forEach>
							                      </c:forEach>
											</div>
										</div>
									</div>
									<hr class='hr-normal'>
									<div class='row'>
										<div class='col-xs-12'>
											<div class='box-content' style="padding:0">
												<c:if test="${userexam.state == 0}">
													<a class="btn btn-danger btn-block btn-lg" href="javascript:void(0);" onclick="submitallquesstion();">提交试卷</a>
												</c:if>
												<c:if test="${userexam.state == 1}">
													<c:if test="${exam.isnormal == 0}">
														<a class="btn btn-danger btn-block btn-lg" href="lms/toagainexamintroduce.action?competionId=${competionId}&examId=${exam.id}">再做一次</a>
													</c:if>
												</c:if>
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
	<div class="clear"></div>
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
		$(function() {
			$("#scroll2").width($("#scroll1").width());
			//填充试卷内容，判断对错，或者是否已经做过
			initquestion();
			//是否显示考试成绩
			if ("${userexam.state}" == 1)
			{
				if ("${exam.isnormal}" == 0)
				{
					$("#firesult").show();
					$("#scroll2").css("top",445);
				}
			}
			else
			{
				$("#firesult").hide();
			}			
		});
		function loadfiresult()
		{
 			var examId = "${exam.id}";
 			//var competionId = "${competionId}";
			var data = {examId:examId};
			$.ajax({
				url : "lms/usercounts.action",
				type : "post",
				data : data,
				success : function(s) {
					var a = eval("(" + s + ")");
					if ("sucess" == a.sucess) {
					}
				}
			});
		}
		//这个方法多次提交，如果性能有问题再优化
		function initquestion()
		{
			var index = 0;
			<c:forEach var="chapter" items="${exam.examchapters}" varStatus="i">
            <c:forEach var="sequential" items="${chapter.esequentials}" varStatus="j">
                <c:forEach var="vertical" items="${sequential.examVerticals}" varStatus="k">
                    <c:forEach var="examq" items="${vertical.examQuestion}" varStatus="l">
                    	<c:forEach var="qd" items="${examq.qdlist}" varStatus="nn">
                    		index ++;
                    		var examId = "${exam.id}";
                    		var questionId = "${qd.id}";
                    		var number = "${nn.index+1}";
	                    	var data = {examId:examId,questionId:questionId,number:number,index:index};
	            			$.ajax({
	            				url : "lms/getQuestionAnswer.action",
	            				type : "post",
	            				data : data,
	            				success : function(s) {
	            					var a = eval("(" + s + ")");
	            					if ("sucess" == a.sucess) {
	            						var answer = a.answer;
	            						if (answer)
            							{
	            							<c:if test="${qd.type == 2}">
            									$("#numberquestion"+a.index+" :radio").each(function(){
											         if ($(this).val() == a.answer)
										        	 {
											        	 $(this).attr("checked","checked");
										        	 }
											     });
            								</c:if>
            								<c:if test="${qd.type == 3}">
            								var strs = a.answer.split('#');
        									$("#numberquestion"+a.index+" :checkbox").each(function(i){
        										 if ($.inArray($(this).val(), strs) != -1)
									        	 {
										        	 $(this).attr("checked","checked");
									        	 }
										     });
        									</c:if>
            								<c:if test="${qd.type == 4}">
            									$("#numberquestion"+a.index).attr("value",a.answer);
	        								</c:if>
	        								<c:if test="${qd.type == 5}">
	        									$("#numberquestion"+a.index).attr("value",replaceTextarea2(a.answer));
	    									</c:if>
            							}
	            					}
	            				}
	            			});
	               		</c:forEach>
               	</c:forEach>
                </c:forEach>
            </c:forEach>
          </c:forEach>
		}
		
		//一个小时，按秒计算，可以自己调整时间
		/* var maxtime = 60 * 60;
		function CountDown() {
			if (maxtime >= 0) {
				minutes = Math.floor(maxtime / 60);
				seconds = Math.floor(maxtime % 60)>9?Math.floor(maxtime % 60):"0"+Math.floor(maxtime % 60);
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
		timer = setInterval("CountDown()", 1000); */
		
		//提交答案------单选
		function submitquesstion(questionId,number,useranswer)
		{
			var isover = examisover();
			if (!isover)
			{
				alert("答题已经结束");
				return;
			}
			var examId = "${exam.id}";
			var competionId = "${competionId}";
			var data = {competionId:competionId,examId:examId,questionId:questionId,number:number,useranswer:useranswer};
			$.ajax({
				url : "lms/submitquesstion.action",
				type : "post",
				data : data,
				success : function(s) {
					var a = eval("(" + s + ")");
					if ("sucess" == a.sucess) {
						alert("提交了");
					}
					else
					{
						location.href="lms/toexamerror.action";
					}
				}
			});
		}
		//提交答案------多选
		function submitmultiquesstion(questionId,number,id)
		{
			var isover = examisover();
			if (!isover)
			{
				alert("答题已经结束");
				return;
			}
			var s='';
			$("#"+id+" input[type='checkbox']:checked").each(function(){ 
			   s+=$(this).val()+'#'; 
			}); 
			if (s.length > 0) { 
			    s = s.substring(0,s.length - 1); 
			} 
 			var examId = "${exam.id}";
 			var competionId = "${competionId}";
			var data = {competionId:competionId,examId:examId,questionId:questionId,number:number,useranswer:s};
			$.ajax({
				url : "lms/submitquesstion.action",
				type : "post",
				data : data,
				success : function(s) {
					var a = eval("(" + s + ")");
					if ("sucess" == a.sucess) {
						alert("提交了");
					}
					else
					{
						location.href="lms/toexamerror.action";
					}
				}
			});
		}
		//提交答案------文本输入
		function submittextquesstion(questionId,number,element)
		{
			var isover = examisover();
			if (!isover)
			{
				alert("答题已经结束");
				return;
			}
 			var examId = "${exam.id}";
 			var competionId = "${competionId}";
			var data = {competionId:competionId,examId:examId,questionId:questionId,number:number,useranswer:$(element).val()};
			$.ajax({
				url : "lms/submitquesstion.action",
				type : "post",
				data : data,
				success : function(s) {
					var a = eval("(" + s + ")");
					if ("sucess" == a.sucess) {
						alert("提交了");
					}
					else
					{
						location.href="lms/toexamerror.action";
					}
				}
			});
		}
		//提交答案------论述题输入
		function submittextareaquesstion(questionId,number,element)
		{
			var isover = examisover();
			if (!isover)
			{
				alert("答题已经结束");
				return;
			}
			var useranswer = replaceTextarea1($(element).val());
 			var examId = "${exam.id}";
 			var competionId = "${competionId}";
			var data = {competionId:competionId,examId:examId,questionId:questionId,number:number,useranswer:useranswer};
			$.ajax({
				url : "lms/submitquesstion.action",
				type : "post",
				data : data,
				success : function(s) {
					var a = eval("(" + s + ")");
					if ("sucess" == a.sucess) {
						alert("提交了");
					}
					else
					{
						location.href="lms/toexamerror.action";
					}
				}
			});
		}
		function entertrain(competionId,examId,everticalId,trainId,hrefId)
		{
			var isover = examisover();
			if (!isover)
			{
				alert("答题已经结束");
				return;
			}
			$("#"+hrefId).attr("href","lms/toexamtrainone.action?competionId="+competionId+"&examId="+examId+"&everticalId="+everticalId+"&trainId="+trainId);
		}
		function examisover()
		{
			var examstate = "${userexam.state}";
			if (examstate == 1)
			{
				return false;
			}
			return true;
		}
		//提交答案
		function submitallquesstion()
		{
 			var examId = "${exam.id}";
 			var competionId = "${competionId}";
			var data = {competionId:competionId,examId:examId};
			$.ajax({
				url : "lms/submitallquesstion.action",
				type : "post",
				data : data,
				success : function(s) {
					var a = eval("(" + s + ")");
					if ("sucess" == a.sucess) {
						alert("提交成功");
						location.reload();
					}
					else
					{
						location.href="lms/toexamerror.action";
					}
				}
			});
		}
		//再做一次
		/* function againallquesstion()
		{
			var examId = "${exam.id}";
			var data = {examId:examId};
			$.ajax({
				url : "lms/toagainexamintroduce.action",
				type : "post",
				data : data,
				success : function(s) {
					var a = eval("(" + s + ")");
					if ("sucess" == a.sucess) {
						location.reload();
					}
				}
			});
		} */
	</script>
</body>
</html>
