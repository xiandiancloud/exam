<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html lang="zh-cn">
  <!--<![endif]-->
  <head>
	<base href="<%=basePath%>">
	<title>竞赛</title>
	<meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <meta content='text/html;charset=utf-8' http-equiv='content-type'>
    <meta content='Flat administration template for Twitter Bootstrap. Twitter Bootstrap 3 template with Ruby on Rails support.' name='description'>
    <link href='assets/images/meta_icons/favicon.ico' rel='shortcut icon' type='image/x-icon'>
    <link href='assets/images/meta_icons/apple-touch-icon.png' rel='apple-touch-icon-precomposed'>
    <link href='assets/images/meta_icons/apple-touch-icon-57x57.png' rel='apple-touch-icon-precomposed' sizes='57x57'>
    <link href='assets/images/meta_icons/apple-touch-icon-72x72.png' rel='apple-touch-icon-precomposed' sizes='72x72'>
    <link href='assets/images/meta_icons/apple-touch-icon-114x114.png' rel='apple-touch-icon-precomposed' sizes='114x114'>
    <link href='assets/images/meta_icons/apple-touch-icon-144x144.png' rel='apple-touch-icon-precomposed' sizes='144x144'>
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
  </head>


<body class='contrast-red fixed-header'>
	<jsp:include page="header.jsp"></jsp:include>


		<div class='container'>
			<div class='col-xs-12'>

				<div class='row'>
					<div class='col-sm-12'>
						<div class='page-header'>
							<h1 class='pull-left'>
								<i class='icon-edit'></i> <span>Forms components</span>
							</h1>
							<div class='pull-right'>
								<ul class='breadcrumb'>
									<li><a href='index.html'> <i class='icon-bar-chart'></i>
									</a></li>
									<li class='separator'><i class='icon-angle-right'></i></li>
								</ul>
							</div>
						</div>
					</div>
				</div>

				<div class='row'>
					<div class='col-sm-12'>
						<div class='box bordered-box'>
							<div class='box-header red-background'>
								<div class='title'>定义赛事</div>
								<div class='actions'>
									<a class="btn box-remove btn-xs btn-link" href="#">
										<i class='icon-remove'></i> 
									</a> 
									<a class="btn box-collapse btn-xs btn-link" href="#"><i></i>
									</a>
								</div>
							</div>
							<div class='box-content'>
								<div class='row'>
									<div class='col-sm-12'>
										<p>
											<strong>赛项名称</strong>
										</p>
										<input type="hidden" class='form-control' id='competionId' value="${competion.id}">
										<input class='form-control' id='name' type='text' value="${competion.name}">
									</div>
								</div>
								<hr class='hr-normal'>
								<div class='row'>
									<div class='col-sm-12'>
										<p>
											<strong>举办方</strong>
										</p>
										<select class='select2 form-control' id="school">
										</select>
									</div>
								</div>
								<hr class='hr-normal'>
								<div class='row'>
									<div class='col-sm-6'>
										<p>
											<strong>赛项开始时间</strong>
										</p>
										<div>
											<div class='datepicker input-group'>
												<input class='form-control' data-format='yyyy-MM-dd' placeholder='Select datepicker' type='text' id="starttime"> 
												<span class='input-group-addon'> 
													<span data-date-icon='icon-calendar' data-time-icon='icon-time'></span>
												</span>
											</div>
										</div>
									</div>
									<div class='col-sm-6'>
										<p>
											<strong>赛项结束时间</strong>
										</p>
										<div>
											<div class='datepicker input-group'>
												<input class='form-control' data-format='yyyy-MM-dd' placeholder='Select datepicker' type='text' id="endtime"> 
												<span class='input-group-addon'> 
													<span data-date-icon='icon-calendar' data-time-icon='icon-time'></span>
												</span>
											</div>
										</div>
									</div>
								</div>
								<hr class='hr-normal'>
								<div class='row'>
									<div class='col-sm-6'>
										<p>
											<strong>命题开始时间</strong>
										</p>
										<div>
											<div class='datepicker input-group' >
												<input class='form-control' data-format='yyyy-MM-dd' placeholder='Select datepicker' type='text' id="wstarttime"> 
												<span class='input-group-addon'> 
													<span data-date-icon='icon-calendar' data-time-icon='icon-time'></span>
												</span>
											</div>
										</div>
									</div>
									<div class='col-sm-6'>
										<p>
											<strong>命题结束时间</strong>
										</p>
										<div>
											<div class='datepicker input-group' >
												<input class='form-control' data-format='yyyy-MM-dd' placeholder='Select datepicker' type='text' id="wendtime"> 
												<span class='input-group-addon'> 
													<span data-date-icon='icon-calendar' data-time-icon='icon-time'></span>
												</span>
											</div>
										</div>
									</div>
								</div>
								<hr class='hr-normal'>
								<div class='row'>
									<div class='col-sm-6'>
										<p>
											<strong>考试开始时间</strong>
										</p>
										<div>
											<div class='datetimepicker input-group' id='datetimepicker'>
												<input class='form-control' data-format='yyyy-MM-dd HH:mm:ss' placeholder='Select timepicker' type='text' id="examstarttime"> 
												<span class='input-group-addon'> 
													<span data-date-icon='icon-calendar' data-time-icon='icon-time'></span>
												</span>
											</div>
										</div>
									</div>
									<div class='col-sm-6'>
										<p>
											<strong>考试结束时间</strong>
										</p>
										<div>
											<div class='datetimepicker input-group' id='datetimepicker'>
												<input class='form-control' data-format='yyyy-MM-dd HH:mm:ss' placeholder='Select timepicker' type='text' id="examendtime"> 
												<span class='input-group-addon'> 
													<span data-date-icon='icon-calendar' data-time-icon='icon-time'></span>
												</span>
											</div>
										</div>
									</div>
								</div>
								<hr class='hr-normal'>
								<div class='row'>
									<div class='col-sm-12'>
										<p>
											<strong>是否公开</strong>
										</p>
										<select class='select2 form-control' id="type">
											<option value='DV'>开发竞赛</option>
											<option value='SP'>指定竞赛</option>
										</select>
									</div>
								</div>
								<hr class='hr-normal'>
								<div class='row'>
									<div class='col-sm-6'>
										<p>
											<strong>考卷总分</strong>
										</p>
										<input class='form-control' id='score' type='text'>
									</div>
									<div class='col-sm-6'>
										<p>
											<strong>考卷及格分</strong>
										</p>
										<input class='form-control' id='passscore' type='text'>
									</div>									
								</div>
								<hr class='hr-normal'>
								<div class='row'>
									<div class='col-sm-12'>
										<p>
											<strong>描述</strong>
										</p>
										<textarea class='form-control' id='describle' placeholder='Textarea' rows='3'>${competion.describle}</textarea>
									</div>
								</div>
								<hr class='hr-normal'>
                          		<div class='row'>
                            		<div class='col-sm-10 col-sm-offset-5'>
                              			<a href="javascript:void(0);" class='btn btn-success' onclick="createcompetion();" id="savebutton">
                                		<i class='icon-save'></i>
                                		保存赛事
                              			</a>
                              			<a href="javascript:void(0);" class='btn btn-success none' onclick="updatecompetion();" id="updatebutton">
                                		<i class='icon-edit'></i>
                                		编辑赛事
                              			</a>
                            		</div>
                          		</div>
							</div>
						</div>
					</div>
				</div>
				<div class='row'>
					<div class='col-sm-12'>
						<div class='box bordered-box red-background'>
							<div class='box-header red-background'>
								<div class='title'>定义裁判</div>
								<div class='actions'>
									<a class="btn box-remove btn-xs btn-link" href="#"><i
										class='icon-remove'></i> </a> <a
										class="btn box-collapse btn-xs btn-link" href="#"><i></i>
									</a>
								</div>
							</div>
							<div class='box-content'>
								<div class="row">
									<div class="col-sm-12">
										<div class="box">
										 <table class='table table-hover table-striped' style='margin-bottom:0;'>
				                            <thead>
				                              <tr>
				                                <th>姓名</th>
				                                <th>邮箱</th>
				                                <th>职务</th>
				                                <th></th>
				                              </tr>
				                            </thead>
				                            <tbody>
				                            <c:forEach var="judgment" items="${judgmentlist}">
				                              <tr>
				                                <td>${judgment.user.username}</td>
				                                <td>${judgment.user.email}</td>
				                                <td>
				                                  <span class='label label-important'>${judgment.job}</span>
				                                </td>
				                                <td>
				                                  <div class='text-right'>
				                                    <a class='btn btn-success btn-xs' href='#'>
				                                      <i class='icon-ok'></i>
				                                    </a>
				                                    <a class='btn btn-danger btn-xs' href='#'>
				                                      <i class='icon-remove'></i>
				                                    </a>
				                                  </div>
				                                </td>
				                              </tr>
				                              </c:forEach>
				                            </tbody>
				                          </table>
											<hr class="hr-normal">
											<div class='row'>
                          						<div class='col-md-10 col-md-offset-5'>
                            						<a href="#modal-example" data-toggle='modal' class='btn btn-success'>
                              							<i class="icon-plus"></i>
                              							增加裁判
                            						</a>
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
					<div class='col-sm-12'>
						<div class='box bordered-box red-background'>
							<div class='box-header red-background'>
								<div class='title'>定义试卷</div>
								<div class='actions'>
									<a class="btn box-remove btn-xs btn-link" href="#"><i
										class='icon-remove'></i> </a> <a
										class="btn box-collapse btn-xs btn-link" href="#"><i></i>
									</a>
								</div>
							</div>
							<div class='box-content'>
								<div class="row">
									<div class="col-sm-12">
										<div class="box">
											<table class="table table-hover" >
												<tbody>
													<tr>
														<td >
															<input class='form-control' type='text'>
														</td>
														<td >
															<label>张一卷</label>
														</td>
														<td >
															<label>2小时30分</label>
														</td>
														<td>
															<div class="text-center">已完成</div>
														</td>
														<td>
															<div class="text-right">
                                    							<a href="#" class="btn btn-success btn-xs">
                                      								<i class="icon-ok"></i>
                                    							</a>
                                    							<a href="#" class="btn btn-danger btn-xs">
                                      								<i class="icon-remove"></i>
                                    							</a>
                                  							</div>
														</td>
													</tr>
													<tr>
														<td>Coca cola 0.5l</td>
														<td>
															<div class="text-center">10</div>
														</td>
														<td>
															<div class="text-right">
                                    							<a href="#" class="btn btn-success btn-xs">
                                      								<i class="icon-ok"></i>
                                    							</a>
                                    							<a href="#" class="btn btn-danger btn-xs">
                                      								<i class="icon-remove"></i>
                                    							</a>
                                  							</div>														
                                  						</td>
													</tr>
													<tr>
														<td>Lorem ipsum</td>
														<td>
															<div class="text-center">1</div>
														</td>
														<td>
															<div class="text-right">
                                    							<a href="#" class="btn btn-success btn-xs">
                                      								<i class="icon-ok"></i>
                                    							</a>
                                    							<a href="#" class="btn btn-danger btn-xs">
                                      								<i class="icon-remove"></i>
                                    							</a>
                                  							</div>
														</td>
													</tr>
												</tbody>
											</table>
											<hr class="hr-normal">
											<div class='row'>
                          						<div class='col-md-10 col-md-offset-5'>
                            						<button class='btn green-background' style="color: #eeeeee;" type='submit'>
                              							<i class="icon-plus"></i>
                              							增加试卷
                            						</button>
                            						<button class='btn red-background' style="color: #eeeeee;" type='submit'>
                            							<i class='icon-lock'></i>
                            							锁定
                            						</button>
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
					<div class='col-sm-12'>
						<div class='box bordered-box red-background'>
							<div class='box-header red-background'>
								<div class='title'>分发试卷</div>
								<div class='actions'>
									<a class="btn box-remove btn-xs btn-link" href="#"><i
										class='icon-remove'></i> </a> <a
										class="btn box-collapse btn-xs btn-link" href="#"><i></i>
									</a>
								</div>
							</div>
							<div class='box-content'>
								<div class="row">
									<div class="col-sm-12">
										<div class="box">
											<table class="table table-hover" >
												<tbody>
													<tr>
														<td >
															<input class='form-control' type='text'>
														</td>
														<td >
															<label>张一卷</label>
														</td>
														<td >
															<label>2小时30分</label>
														</td>
														<td>
															<div class="text-center">已完成</div>
														</td>
														<td>
															<div class="text-right">
                                    							<a href="#" class="btn btn-success btn-xs">
                                      								<i class="icon-ok"></i>
                                    							</a>
                                    							<a href="#" class="btn btn-danger btn-xs">
                                      								<i class="icon-remove"></i>
                                    							</a>
                                  							</div>
														</td>
													</tr>
													<tr>
														<td>Coca cola 0.5l</td>
														<td>
															<div class="text-center">10</div>
														</td>
														<td>
															<div class="text-right">
                                    							<a href="#" class="btn btn-success btn-xs">
                                      								<i class="icon-ok"></i>
                                    							</a>
                                    							<a href="#" class="btn btn-danger btn-xs">
                                      								<i class="icon-remove"></i>
                                    							</a>
                                  							</div>														
                                  						</td>
													</tr>
													<tr>
														<td>Lorem ipsum</td>
														<td>
															<div class="text-center">1</div>
														</td>
														<td>
															<div class="text-right">
                                    							<a href="#" class="btn btn-success btn-xs">
                                      								<i class="icon-ok"></i>
                                    							</a>
                                    							<a href="#" class="btn btn-danger btn-xs">
                                      								<i class="icon-remove"></i>
                                    							</a>
                                  							</div>
														</td>
													</tr>
												</tbody>
											</table>
											<hr class="hr-normal">
											<div class='row'>
                          						<div class='col-md-10 col-md-offset-4'>
                            						<button class='btn green-background' style="color: #eeeeee;" type='submit'>
                              							<i class="icon-plus"></i>
                              							增加考生
                            						</button>
                            						<button class='btn red-background' style="color: #eeeeee;" type='submit'>
                            							<i class='icon-time'></i>
                            							考试开始
                            						</button>
                            						<button class='btn red-background' style="color: #eeeeee;" type='submit'>
                            							<i class='icon-lock'></i>
                            							考试结束
                            						</button>
                            						<button class='btn green-background' style="color: #eeeeee;" type='submit'>
                            							<i class='icon-plus'></i>
                            							数据导出
                            						</button>
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
					<div class='col-sm-12'>
						<div class='box bordered-box red-background'>
							<div class='box-header red-background'>
								<div class='title'>分析报告</div>
								<div class='actions'>
									<a class="btn box-remove btn-xs btn-link" href="#"><i
										class='icon-remove'></i> </a> <a
										class="btn box-collapse btn-xs btn-link" href="#"><i></i>
									</a>
								</div>
							</div>
							<div class='box-content'>
								<div class='box-content'>
                    				<div id='stats-chart1'></div>
                  				</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<jsp:include page="footer.jsp"></jsp:include>
	
<div class='modal fade' id='modal-example' tabindex='-1'>
                      <div class='modal-dialog'>
                        <div class='modal-content'>
                          <div class='modal-header'>
                            <button aria-hidden='true' class='close' data-dismiss='modal' type='button'>×</button>
                            <h4 class='modal-title' id='myModalLabel'>选择裁判</h4>
                          </div>
                          <div class='modal-body'>
                            	<div class='row'>
									<div class='col-sm-12'>
										<p>
											<strong>职务</strong>
										</p>
										<select class='select2 form-control' id="selectjob">
											<option value='主裁判'>主裁判</option>
											<option value='命题裁判'>命题裁判</option>
											<option value='判分裁判'>判分裁判</option>
										</select>
									</div>
								</div>
								<div class='row'>
									<div class='col-sm-12'>
										<p>
											<strong>裁判</strong>
										</p>
										<select class='select2 form-control' id="selectuser">
										</select>
									</div>
								</div>
                          </div>
                          <div class='modal-footer'>
                            <button class='btn btn-default' data-dismiss='modal' type='button'>Close</button>
                            <button class='btn btn-primary' type='button' onclick="addcompetionjudgment();">确定</button>
                          </div>
                        </div>
                      </div>
                    </div>
        
    <script src="assets/javascripts/jquery/jquery.min.js" type="text/javascript"></script>

    <script src="assets/javascripts/jquery/jquery.mobile.custom.min.js" type="text/javascript"></script>
 
    <script src="assets/javascripts/jquery/jquery-migrate.min.js" type="text/javascript"></script>

    <script src="assets/javascripts/jquery/jquery-ui.min.js" type="text/javascript"></script>

    <script src="assets/javascripts/plugins/jquery_ui_touch_punch/jquery.ui.touch-punch.min.js" type="text/javascript"></script>

    <script src="assets/javascripts/bootstrap/bootstrap.js" type="text/javascript"></script>

    <script src="assets/javascripts/plugins/modernizr/modernizr.min.js" type="text/javascript"></script>
   
    <script src="assets/javascripts/plugins/retina/retina.js" type="text/javascript"></script>
    
    <script src="assets/javascripts/theme.js" type="text/javascript"></script>

    <script src="assets/javascripts/demo.js" type="text/javascript"></script>
        
  	<script src="assets/javascripts/plugins/flot/excanvas.js" type="text/javascript"></script>
    <script src="assets/javascripts/plugins/flot/flot.min.js" type="text/javascript"></script>
    <script src="assets/javascripts/plugins/flot/flot.resize.js" type="text/javascript"></script>
    <script src="assets/javascripts/plugins/sparklines/jquery.sparkline.min.js" type="text/javascript"></script>
    <script src="assets/javascripts/plugins/flot/flot.pie.js" type="text/javascript"></script>
    <script src="js/common.js"></script>
    <script type="text/javascript">
      /* var data, dataset, gd, options, previousLabel, previousPoint, showTooltip, ticks;
      var blue, data, datareal, getRandomData, green, i, newOrders, options, orange, orders, placeholder, plot, purple, randNumber, randSmallerNumber, red, series, totalPoints, update, updateInterval;
      var red = "#f34541";
      var orange = "#f8a326";
      var blue = "#00acec";
      var purple = "#9564e2";
      var green = "#49bf67"; */
      randNumber = function() {
        return ((Math.floor(Math.random() * (1 + 50 - 20))) + 20) * 800;
      };
      randSmallerNumber = function() {
        return ((Math.floor(Math.random() * (1 + 40 - 20))) + 10) * 200;
      };
      if ($("#stats-chart1")) {
        orders = [[1, randNumber() - 10], [2, randNumber() - 10], [3, randNumber() - 10], [4, randNumber()], [5, randNumber()], [6, 4 + randNumber()], [7, 5 + randNumber()], [8, 6 + randNumber()], [9, 6 + randNumber()], [10, 8 + randNumber()], [11, 9 + randNumber()], [12, 10 + randNumber()], [13, 11 + randNumber()], [14, 12 + randNumber()], [15, 13 + randNumber()], [16, 14 + randNumber()], [17, 15 + randNumber()], [18, 15 + randNumber()], [19, 16 + randNumber()], [20, 17 + randNumber()], [21, 18 + randNumber()], [22, 19 + randNumber()], [23, 20 + randNumber()], [24, 21 + randNumber()], [25, 14 + randNumber()], [26, 24 + randNumber()], [27, 25 + randNumber()], [28, 26 + randNumber()], [29, 27 + randNumber()], [30, 31 + randNumber()]];
        newOrders = [[1, randSmallerNumber() - 10], [2, randSmallerNumber() - 10], [3, randSmallerNumber() - 10], [4, randSmallerNumber()], [5, randSmallerNumber()], [6, 4 + randSmallerNumber()], [7, 5 + randSmallerNumber()], [8, 6 + randSmallerNumber()], [9, 6 + randSmallerNumber()], [10, 8 + randSmallerNumber()], [11, 9 + randSmallerNumber()], [12, 10 + randSmallerNumber()], [13, 11 + randSmallerNumber()], [14, 12 + randSmallerNumber()], [15, 13 + randSmallerNumber()], [16, 14 + randSmallerNumber()], [17, 15 + randSmallerNumber()], [18, 15 + randSmallerNumber()], [19, 16 + randSmallerNumber()], [20, 17 + randSmallerNumber()], [21, 18 + randSmallerNumber()], [22, 19 + randSmallerNumber()], [23, 20 + randSmallerNumber()], [24, 21 + randSmallerNumber()], [25, 14 + randSmallerNumber()], [26, 24 + randSmallerNumber()], [27, 25 + randSmallerNumber()], [28, 26 + randSmallerNumber()], [29, 27 + randSmallerNumber()], [30, 31 + randSmallerNumber()]];
        plot = $.plot($("#stats-chart1"), [
          {
            data: orders,
            label: "Orders"
          }, {
            data: newOrders,
            label: "New rders"
          }
        ], {
          series: {
            lines: {
              show: true,
              lineWidth: 2
            },
            shadowSize: 0
          },
          legend: {
            show: false
          },
          grid: {
            clickable: true,
            hoverable: true,
            borderWidth: 0,
            tickColor: "#f4f7f9"
          },
          /* colors: ["red", "black","green"] *///可以不设置会有默认颜色
        });
      }
    </script>
    
    <script src="assets/javascripts/plugins/fileinput/bootstrap-fileinput.js" type="text/javascript"></script>
    <script src="assets/javascripts/plugins/select2/select2.js" type="text/javascript"></script>
    <script src="assets/javascripts/plugins/bootstrap_colorpicker/bootstrap-colorpicker.min.js" type="text/javascript"></script>
    <script src="assets/javascripts/plugins/bootstrap_daterangepicker/bootstrap-daterangepicker.js" type="text/javascript"></script>
    <script src="assets/javascripts/plugins/common/moment.min.js" type="text/javascript"></script>
    <script src="assets/javascripts/plugins/bootstrap_datetimepicker/bootstrap-datetimepicker.js" type="text/javascript"></script>
    <script src="assets/javascripts/plugins/input_mask/bootstrap-inputmask.min.js" type="text/javascript"></script>
    <script src="assets/javascripts/plugins/bootstrap_maxlength/bootstrap-maxlength.min.js" type="text/javascript"></script>
    <script src="assets/javascripts/plugins/charCount/charCount.js" type="text/javascript"></script>
    <script src="assets/javascripts/plugins/autosize/jquery.autosize-min.js" type="text/javascript"></script>
    <script src="assets/javascripts/plugins/bootstrap_switch/bootstrapSwitch.min.js" type="text/javascript"></script>
    <script src="assets/javascripts/plugins/naked_password/naked_password-0.2.4.min.js" type="text/javascript"></script>
    <script src="assets/javascripts/plugins/mention/mention.min.js" type="text/javascript"></script>
    <script src="assets/javascripts/plugins/typeahead/typeahead.js" type="text/javascript"></script>
    <script src="assets/javascripts/plugins/common/wysihtml5.min.js" type="text/javascript"></script>
    <script src="assets/javascripts/plugins/common/bootstrap-wysihtml5.js" type="text/javascript"></script>
    <script src="assets/javascripts/plugins/pwstrength/pwstrength.js" type="text/javascript"></script>
    <script type="text/javascript">
	$(function() {
		//$('.progress-bar').css({'width':'80%'}).find('span').html('80%');
		initschool();
	});
	
	function initschool()
	{
		$.ajax({
			url : "cms/getAllSchool.action",
			type : "post",
			success : function(s) {
				var a = eval("(" + s + ")");
				var tmp = '';
				var row = a.rows;
				for ( var i = 0; i < row.length; i++) {
					var school = row[i];
					var name = school.name;
					tmp += '<option value='+school.id+'>'+name+'</option>';
				}
				$("#school").html(tmp);
			}
		});
		$.ajax({
			url : "cms/getAllTeacher.action",
			type : "post",
			success : function(s) {
				var a = eval("(" + s + ")");
				var tmp = '';
				var row = a.rows;
				for ( var i = 0; i < row.length; i++) {
					var school = row[i];
					var name = school.name;
					tmp += '<option value='+school.id+'>'+name+'</option>';
				}
				$("#selectuser").html(tmp);
			}
		});
	}
	function createcompetion()
	{
		var name = $("#name").attr("value");
		var starttime = $("#starttime").attr("value");
		var endtime = $("#endtime").attr("value");
		var wstarttime = $("#wstarttime").attr("value");
		var wendtime = $("#wendtime").attr("value");
		var examstarttime = $("#examstarttime").attr("value");
		var examendtime = $("#examendtime").attr("value");
		var type = $("#type").attr("value");
		var score = $("#score").attr("value");
		var passscore = $("#passscore").attr("value");
		var describle = $("#describle").attr("value");
		var schoolId = $("#school").val();
		if (isNull(name))	
		{
			alert("名称不能为空");
			return ;
		}
		if (isNull(schoolId))	
		{
			alert("举办方不能为空");
			return ;
		}
		if (isNull(type))	
		{
			alert("是否公开不能为空");
			return ;
		}
		var data={name:name,starttime:starttime,endtime:endtime,wstarttime:wstarttime,wendtime:wendtime,examstarttime:examstarttime,examendtime:examendtime,type:type,score:score,passscore:passscore,describle:describle,schoolId:schoolId};
		$.ajax({
			url : "cms/createcompetion.action",
			type : "post",
			data :data,
			success : function(s) {
				var a = eval("(" + s + ")");
				if ("sucess" == a.sucess)
				{
					$("#savebutton").hide();
					$("#updatebutton").show();
					$("#competionId").attr("value",a.competionId);
				}
			}
		});
	}
	function updatecompetion()
	{
		
	}
	
	function addcompetionjudgment()
	{
		var userId = parseInt($("#selectuser").attr("value"));;
		var competionId = parseInt($("#competionId").attr("value"));
		var job = $("#selectjob").attr("value");;
		var data={userId:userId,competionId:competionId,job:job};
		$.ajax({
			url : "cms/addcompetionjudgment.action",
			type : "post",
			data :data,
			success : function(s) {
				var a = eval("(" + s + ")");
				if ("sucess" == a.sucess)
				{
					$("#modal-example").modal('hide');
					location.reload();
				}
			}
		});
	}
	</script>
</body>
</html>