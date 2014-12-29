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
	<title>试卷预览</title>
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
	<link href="assets/stylesheets/plugins/jgrowl/jquery.jgrowl.min.css" media="all" rel="stylesheet" type="text/css" />
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
    
    <script type="text/javascript" charset="utf-8" src="ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="ueditor.all.js"> </script>
    
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
   	 	line-height: 129px;  	 	
	}
 	.advance {
    	left: 0;
    	text-align: center;
    	top: 0;
    	/* width: 235px; */
    	color:#FF7F24;
	}
	.juzhong{
		height:40px;
		line-height:40px;
	}
	/* .fixtop 
	{ 
		position:fixed;
		top:180px; 
	}  */
</style>

  </head>
  <body data-spy="scroll" class='contrast-red fixed-header'>
    <jsp:include page="../common/header.jsp"></jsp:include>
	<div id='wrapper'>
		<div class='container'>
			<div class='row'>
						<div class='col-xs-12'>
							<div class='row'>
								<div class="col-xs-12">
									<div class="box ">
										<div class="box-content">
											<div class='row'>
												<div class="col-xs-12">
													<h2>${exam.name}</h2>
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
                          <div class='dd-handle noborder'>
                            <i class='icon-backward text-purple'></i>
                            ${chapter.name}
                          </div>
                          <c:forEach var="sequential" items="${chapter.esequentials}" varStatus="j">
                          <ol class='dd-list'>
                            <li class='dd-item' data-id='3'>
                              <div class='dd-handle noborder'>
                                <i class='icon-backward text-orange'></i>
                                ${sequential.name}
                              </div>
                              <c:forEach var="vertical" items="${sequential.examVerticals}" varStatus="k">
                              <ol class='dd-list'>
                                <li class='dd-item' data-id='4'>
                                  <div class='dd-handle noborder'><%-- ${vertical.name} --%></div>
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
														<div class='form-group'>
															<div class='col-sm-12'>
																<a id="hrefnumber${index}" href="javascript:void(0);" target="_blank" class='btn btn-danger'>
																<i class='icon-circle-arrow-right'></i>进入实训</a>
															</div>
														</div>
													</form>
												</div>
											</div>
							   			</c:if>
			                 			<%-- html问题描述 --%>
							   			<c:if test="${qd.type == 1}">
							   				<div class='row'>
												<div class='col-xs-12'>
													<form class="form form-horizontal" method="post" action="#">
														<div class='form-group col-sm-12'>
															<%-- <c:set value="${index + 1}" var="index" /> --%>
															<span class='trainimg' id="number${index}"><%-- <label class="numberfont">${index}&nbsp;</label> --%>${qd.title}</span>
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
														<div id="numberquestion${index}">
														<c:forEach var="qdcontent" items="${qd.content}">
															<div class='form-group col-sm-12'>
																<label class='radio'>
																	<input type="radio" name="${qd.id}" value="${qdcontent}"/>${qdcontent}
																</label> 
															</div>
														</c:forEach>
														</div>
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
														<div id="numberquestion${index}">
														<c:forEach var="qdcontent" items="${qd.content}">
															<div class='form-group col-sm-12'>
																<label class='checkbox'>
																	<input type="checkbox" name="${qd.id}" value="${qdcontent}"/>${qdcontent}
																</label> 
															</div>
														</c:forEach>
														</div>
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
														<div class='form-group'>
															<div class='col-sm-12'>
																<textarea class='form-control' rows='5' id="numberquestion${index}"></textarea>
															</div>
														</div>
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
														<div class='form-group'>
															<div class='col-sm-12'>
																<script id="numberquestion${index}" type="text/plain" style="width:100%;margin-bottom:5px;min-height: 100px;"></script>
															</div>
															<div class='col-sm-12'>
																<a id="hrefnumber${index}" href="javascript:void(0);" class='btn btn-danger'>
																<i class='icon-circle-arrow-right'></i>提交答案</a>
															</div>
														</div>
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
				<div id="scroll2">
					<div class='box bordered-box blue-border'>
						<div class='box-content'>
							<div class='row'>
								<div class='col-xs-12'>
									<div data-offset-top="125" class="nav nav-tabs nav-stacked section">
										<c:set value="0" var="sum" />
										<c:forEach var="chapter" items="${exam.examchapters}" varStatus="i">
					                          <c:forEach var="sequential" items="${chapter.esequentials}" varStatus="j">
					                              <c:forEach var="vertical" items="${sequential.examVerticals}" varStatus="k">
					                                  <c:forEach var="examq" items="${vertical.examQuestion}" varStatus="l">
								                 		<c:forEach var="qd" items="${examq.qdlist}">
								                 		<c:if test="${qd.type != 1}">
									                 		<c:set value="${sum + 1}" var="sum" /> 
									                 		<a href="javascript:void(0)" onclick="document.getElementById('number${sum}').scrollIntoView();" class="j-item item  f-fl" id="index${sum}">
									                 		${sum}
									                 		</a>
								                 		</c:if>
								                 		</c:forEach>
								                 	</c:forEach>
					                              </c:forEach>
					                          </c:forEach>
					                      </c:forEach>
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
	<jsp:include page="../common/footer.jsp"></jsp:include>
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
    <!-- / theme file [required] -->
    <script src="assets/javascripts/theme.js" type="text/javascript"></script>
    <!-- / demo file [not required!] -->
    <script src="assets/javascripts/demo.js" type="text/javascript"></script>
    <!-- / START - page related files and scripts [optional] -->
    <script src="assets/javascripts/plugins/nestable/jquery.nestable.js" type="text/javascript"></script>
    <script src="assets/javascripts/plugins/jgrowl/jquery.jgrowl.min.js" type="text/javascript"></script>
    <!-- / END - page related files and scripts [optional] -->
	<script src="js/common.js" type="text/javascript"></script>
	<script src="js/holder.js" type="text/javascript"></script>
	<script src="js/stickUp.min.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(function() {
		});
		jQuery(function($) {
	        $(document).ready( function() {
	        	$('#scroll2').stickUp({
	                parts: {
	                    0:'home',
	                    1:'features',
	                    2: 'news',
	                    3: 'installation',
	                    4: 'one-pager',
	                    5: 'extras',
	                    6: 'wordpress',
	                    7: 'contact'
	                  },
	                  itemClass: 'menuItem',
	                  itemHover: 'active',
	                  topMargin: 'auto'
	             });
	        });
	      	//填充试卷内容，判断对错，或者是否已经做过  
			initquestion();
	      });
		//这个方法多次提交，如果性能有问题再优化
		function initquestion()
		{
			var index = 0;
			<c:forEach var="chapter" items="${exam.examchapters}" varStatus="i">
            <c:forEach var="sequential" items="${chapter.esequentials}" varStatus="j">
                <c:forEach var="vertical" items="${sequential.examVerticals}" varStatus="k">
                    <c:forEach var="examq" items="${vertical.examQuestion}" varStatus="l">
                    	<c:forEach var="qd" items="${examq.qdlist}" varStatus="nn">
                    		<c:if test="${qd.type != 1}">
	                    		index ++;
	                    		var useranswer = "${qd.useranswer}";
	                    		if (useranswer)
	                   			{
	                    			$("#index"+index).css("background","#999999");
	                    			
	                    			<c:if test="${qd.type == 2}">
	    							$("#numberquestion"+index+" :radio").each(function(){
	    						         if ($(this).val() == decodeURIComponent(useranswer))
	    					        	 {
	    						        	 $(this).attr("checked","checked");
	    					        	 }
	    						     });
	    							</c:if>
	    							<c:if test="${qd.type == 3}">
	    							var strs = decodeURIComponent(useranswer).split('#');
	    							$("#numberquestion"+index+" :checkbox").each(function(i){
	    								 if ($.inArray($(this).val(), strs) != -1)
	    					        	 {
	    						        	 $(this).attr("checked","checked");
	    					        	 }
	    						     });
	    							</c:if>
	    							<c:if test="${qd.type == 4}">
	    								$("#numberquestion"+index).attr("value",decodeURIComponent(useranswer));
	    							</c:if>
	                   			}
								<c:if test="${qd.type == 5}">
									if (useranswer)
									{
										$("#numberquestion"+index).html(decodeURIComponent(useranswer));
									}
									UE.getEditor("numberquestion"+index);
								</c:if>
								<c:if test="${qd.type == 6}">
									var osanswer = "${qd.osanswer}";
									if (osanswer)
									{
										$("#index"+index).css("background","#999999");
									}
								</c:if>
							</c:if>
	               		</c:forEach>
               	</c:forEach>
                </c:forEach>
            </c:forEach>
          </c:forEach>
		}
	</script>
</body>
</html>
