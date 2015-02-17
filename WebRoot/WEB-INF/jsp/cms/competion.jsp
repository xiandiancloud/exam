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
    <link href="assets/stylesheets/plugins/dynatree/ui.dynatree.css" media="screen" rel="stylesheet" type="text/css" />
    <!-- / bootstrap [required] -->
    <link href="assets/stylesheets/bootstrap/bootstrap.css" media="all" rel="stylesheet" type="text/css" />
    <!-- / theme file [required] -->
    <link href="assets/stylesheets/light-theme.css" media="all" id="color-settings-body-color" rel="stylesheet" type="text/css" />
    <!-- / coloring file [optional] (if you are going to use custom contrast color) -->
    <link href="assets/stylesheets/theme-colors.css" media="all" rel="stylesheet" type="text/css" />
    <!-- / demo file [not required!] -->
    <link href="assets/stylesheets/demo.css" media="all" rel="stylesheet" type="text/css" />
    <link href="css/train.css" media="all" rel="stylesheet" type="text/css">
    <link href="css/fineuploader.css" rel="stylesheet">
    <!--[if lt IE 9]>
      <script src="assets/javascripts/ie/html5shiv.js" type="text/javascript"></script>
      <script src="assets/javascripts/ie/respond.min.js" type="text/javascript"></script>
    <![endif]-->
  </head>


<body class='contrast-red fixed-header'>
	<jsp:include page="../common/header.jsp"></jsp:include>


		<div class='container'>
			<div class='col-xs-12'>

				<div class='row'>
					<div class='col-sm-12'>
						<div class='page-header'>
							<h1 class='pull-left'>
								<i class='icon-edit'></i> <span>下面是定义的竞赛，请遵守竞赛规则。</span>
							</h1>
<!-- 							<div class='pull-right'>
								<ul class='breadcrumb'>
									<li><a href='index.html'> <i class='icon-bar-chart'></i>
									</a></li>
									<li class='separator'><i class='icon-angle-right'></i></li>
								</ul>
							</div> -->
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
									<div class='col-sm-6'>
										<p>
											<strong>赛项名称</strong>
										</p>
										<input type="hidden" class='form-control' id='competionId' value="${competion.id}">
										<input class='form-control' id='name' type='text' value="${competion.name}">
									</div>
									<div class='col-sm-6'>
										<p>
											<strong>赛项图片(图片宽高：256*256)</strong>
										</p>
										<div class='row'>
										
										<div class='col-sm-10'>
										<input class='form-control' type='text' id="imgpath" disabled="disabled" value="${competion.imgpath}">
										</div>
										<div class='col-sm-2'>
										<div class="upload-button" id="bootstrapped-fine-uploader"></div>
										</div>
										</div>
									</div>
								</div>
								<div class='h10'></div>
								<div class='row'>
									<div class='col-sm-4'>
										<p>
											<strong>举办方</strong>
										</p>
										<select class='form-control' id="school">
										</select>
									</div>
								  <div class='col-sm-4'>
										<p>
											<strong>专业</strong>
										</p>
										<select class='select2 form-control' name="major" id="category">
										</select>
									</div>
									<div class='col-sm-4'>
										<p>
											<strong>等级</strong>
										</p>
										<select class='select2 form-control' name="level" id="rank">
										<option value="0" selected="selected">-等级-</option>
										<option value="1">初级</option>
										<option value="2">中级</option>
										<option value="3">高级</option>
										</select>
									</div>
								</div>
								<div class='h10'></div>
								<div class='row'>
									<div class='col-sm-6'>
										<p>
											<strong>赛项开始时间</strong>
										</p>
										<div>
											<div class='datepicker input-group'>
												<input class='form-control' data-format='yyyy-MM-dd' placeholder='Select datepicker' type='text' id="starttime" value="${competion.starttime}"> 
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
												<input class='form-control' data-format='yyyy-MM-dd' placeholder='Select datepicker' type='text' id="endtime" value="${competion.endtime}"> 
												<span class='input-group-addon'> 
													<span data-date-icon='icon-calendar' data-time-icon='icon-time'></span>
												</span>
											</div>
										</div>
									</div>
								</div>
								<div class='h10'></div>
								<div class='row'>
									<div class='col-sm-6'>
										<p>
											<strong>命题开始时间</strong>
										</p>
										<div>
											<div class='datepicker input-group' >
												<input class='form-control' data-format='yyyy-MM-dd' placeholder='Select datepicker' type='text' id="wstarttime" value="${competion.wstarttime}"> 
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
												<input class='form-control' data-format='yyyy-MM-dd' placeholder='Select datepicker' type='text' id="wendtime" value="${competion.wendtime}"> 
												<span class='input-group-addon'> 
													<span data-date-icon='icon-calendar' data-time-icon='icon-time'></span>
												</span>
											</div>
										</div>
									</div>
								</div>
								<div class='h10'></div>
								<div class='row'>
									<div class='col-sm-6'>
										<p>
											<strong>考试开始时间</strong>
										</p>
										<div>
											<div class='datetimepicker input-group' id='datetimepicker'>
												<input class='form-control' data-format='yyyy-MM-dd hh:mm:ss' placeholder='Select timepicker' type='text' id="examstarttime" value="${competion.examstarttime}"> 
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
												<input class='form-control' data-format='yyyy-MM-dd hh:mm:ss' placeholder='Select timepicker' type='text' id="examendtime" value="${competion.examendtime}"> 
												<span class='input-group-addon'> 
													<span data-date-icon='icon-calendar' data-time-icon='icon-time'></span>
												</span>
											</div>
										</div>
									</div>
								</div>
								<div class='h10'></div>
								<%-- <div class='row'>
									<div class='col-sm-12'>
										<p>
											<strong>是否公开</strong>
										</p>
										<select class='select2 form-control' id="type" value="${competion.type}">
											<option value='0'>是</option>
											<option value='1'>否</option>
										</select>
									</div>
								</div>
								<div class='h10'></div> --%>
								<div class='row'>
									<div class='col-sm-6'>
										<p>
											<strong>考卷总分</strong>
										</p>
										<input class='form-control' id='score' type='text'value="${competion.score}" >
									</div>
									<div class='col-sm-6'>
										<p>
											<strong>考卷及格分</strong>
										</p>
										<input class='form-control' id='passscore' type='text' value="${competion.passscore}">
									</div>									
								</div>
								<div class='h10'></div>
								<div class='row'>
									<div class='col-sm-12'>
										<p>
											<strong>描述</strong>
										</p>
										<textarea class='form-control' id='describle' placeholder='Textarea' rows='3'>${competion.describle}</textarea>
									</div>
								</div>
								<div class='h10'></div>
                          		<div class='row'>
                            		<div class='col-sm-12 center'>
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
				                                    <!-- <a class='btn btn-success btn-xs' href='#'>
				                                      <i class='icon-ok'></i>
				                                    </a> -->
				                                    <a class='btn btn-danger btn-xs' href='javascript:void(0);' onclick="deljudgment(${judgment.competion.id},${judgment.user.id});">
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
                          						<div class='col-sm-12 center'>
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
											<table class='table table-hover table-striped' style='margin-bottom:0;'>
				                            <thead>
				                              <tr>
				                                <th>试卷名</th>
				                                <th>命卷人</th>
				                                <th>时间</th>
				                                <th>状态</th>
				                                <th></th>
				                              </tr>
				                            </thead>
				                            <tbody>
				                            <c:forEach var="ce" items="${celist}">
				                              <tr>
				                                <td><c:if test="${ce.exam.lockexam == 1}"><i class='icon-lock'></i></c:if>${ce.exam.name}</td>
				                                <td>${ce.examuser}</td>
				                                <td></td>
				                                <td>
				                                  <span class='label label-important'>
				                                  <c:if test="${ce.exam.publish == 0}">在出卷中</c:if>
				                                  <c:if test="${ce.exam.publish == 1}">已经发布</c:if>
				                                  </span>
				                                </td>
				                                <td>
				                                  <div class='text-right'>
				                                     <a class='btn btn-danger btn-xs' href='javascript:void(0);' onclick="unlockallexam(${ce.competionId},${ce.exam.id});">
				                                      <i class='icon-unlock'></i>
				                                    </a>
				                                    <a class='btn btn-danger btn-xs' href='javascript:void(0);' onclick="deleteexam(${ce.competionId},${ce.exam.id});">
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
                          						<div class='col-sm-12 center'>
                            						<a href="javascript:void(0);" onclick="showexamdialog();" class='btn btn-success'>
                              							<i class="icon-plus"></i>
                              							增加试卷
                            						</a>
                            						<a href="javascript:void(0);" onclick="lockallexam();" class="btn btn-danger">
                            							<i class='icon-lock'></i>
                            							锁定
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
										 <div class='row'>
                          						<div class='col-sm-12'>
                          						<table><tr>
                          						<td>选用试卷</td>
                          						<td width="400px;">
                          						<select class='select2 form-control' id="selectexam"  onchange="selectexam();">
                          							<option value=''>--</option>
                          							<c:forEach var="ce" items="${celist}">
													<option value='${ce.exam.id}' <c:if test="${sexam.id == ce.id}">selected="selected"</c:if>>${ce.exam.name}</option>
													</c:forEach>
												</select>
                          						</td>
                          						<td id="selectexamtime">
                          						<c:if test="${empty sexam}">
                          						&nbsp;&nbsp;还没有完成选题
                          						</c:if>
                          						<c:if test="${!empty sexam}">
                          						&nbsp;&nbsp;${sexam.selecttime}&nbsp;&nbsp;完成选题
                          						</c:if>
                          						</td>
                          						</tr></table>
                          						
                          						</div>
                        					</div>  
                        					<hr class="hr-normal">
											<table class='table table-hover table-striped' style='margin-bottom:0;'>
				                            <thead>
				                              <tr>
				                                <th>姓名</th>
				                                <th>得分</th>
				                                <th>状态</th>
				                                <th></th>
				                              </tr>
				                            </thead>
				                            <tbody>
				                            <c:forEach var="student" items="${studentlist}">
				                              <tr>
				                                <td>${student.username}</td>
				                                <td>${student.score}</td>
				                                <td>
				                                  <span class='label label-important'>${student.state}</span>
				                                </td>
				                                <td>
				                                  <div class='text-right'>
				                               <%--       <a class='btn btn-danger btn-xs' href='javascript:void(0);' onclick="unlockallexam(${ce.competionId},${ce.exam.id});">
				                                      <i class='icon-unlock'></i>
				                                    </a> --%>
				                                    <a class='btn btn-danger btn-xs' href='javascript:void(0);' onclick="delcompetionuser(${student.userCompetionId});">
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
                          						<div class='col-sm-12 center'>
                          						   <a href="javascript:void(0);" onclick="showuserdialog();" class='btn btn-success'>
                              							<i class="icon-plus"></i>
                              							增加考生
                            						</a>
                            						<a class='btn red-background' onclick="startcompetion();" style="color: #eeeeee;">
                            							<i class='icon-time'></i>
                            							考试开始
                            						</a>
                            						<a class='btn red-background' onclick="endcompetion();" style="color: #eeeeee;">
                            							<i class='icon-lock'></i>
                            							考试结束
                            						</a>
                            						<a class='btn btn-success' href="cms/exportdata.action?competionId=${competion.id}">
                            							<i class='icon-plus'></i>
                            							数据导出
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
<!-- 				<div class='row'>
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
				</div> -->
			</div>
		</div>
		<div class="clear"></div><div class="clear"></div>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
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
                            <button class='btn btn-default' data-dismiss='modal' type='button'>关闭</button>
                            <button class='btn btn-primary' type='button' onclick="addcompetionjudgment();">确定</button>
                          </div>
                        </div>
                      </div>
                    </div>
      <div class='modal fade' id='modal-example2' tabindex='-1'>
                      <div class='modal-dialog'>
                        <div class='modal-content'>
                          <div class='modal-header'>
                            <button aria-hidden='true' class='close' data-dismiss='modal' type='button'>×</button>
                            <h4 class='modal-title' id='myModalLabel'>增加试卷</h4>
                          </div>
                          <div class='modal-body'>
                            	<div class='row'>
									<div class='col-sm-12'>
										<p>
											<strong>试卷名</strong>
										</p>
										<input class='form-control' type='text' id="model2name">
									</div>
								</div>
								<div class='row'>
									<div class='col-sm-12'>
										<p>
											<strong>命题裁判</strong>
										</p>
										<select class='select2 form-control' id="model2user">
										</select>
									</div>
								</div>
                          </div>
                          <div class='modal-footer'>
                            <button class='btn btn-default' data-dismiss='modal' type='button'>关闭</button>
                            <button class='btn btn-primary' type='button' onclick="addexam();">确定</button>
                          </div>
                        </div>
                      </div>
                    </div>  
       <div class='modal fade' id='modal-example3' tabindex='-1'>
               <div class='modal-dialog'>
                 <div class='modal-content'>
                   <div class='modal-header'>
                     <button aria-hidden='true' class='close' data-dismiss='modal' type='button'>×</button>
                     <h4 class='modal-title' id='myModalLabel'>选择考生</h4>
                   </div>
                   <div class='modal-body'>
                     	<div class='row'>
						<div class='col-sm-12'>
							<div id="tree2">
								<ul id='tree2-treeData'>
			                      <!-- <li class='expanded' id='tree2id3'>
			                        Folder with some children
			                        <ul>
			                          <li id='tree2id2.1'>
			                            Sub-item 3.1
			                          </li>
			                          <li id='tree2id3.2'>
			                            Sub-item 3.2
			                          </li>
			                        </ul>
			                      </li> -->
			                    </ul>
			               </div>
						</div>
						</div>
                   </div>
                   <div class='modal-footer'>
                     <button class='btn btn-default' data-dismiss='modal' type='button'>关闭</button>
                     <button class='btn btn-primary' type='button' onclick="adduser();">确定</button>
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
    <script src="assets/javascripts/plugins/dynatree/jquery.dynatree.min.js" type="text/javascript"></script>
    <script src="js/fineuploader.js"></script>
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
		initcategory();
		var trank = 0;
		if ("初级" == "${competion.rank}")
		{
			trank = 1;
		}
		else if ("中级" == "${competion.rank}")
		{
			trank = 2;
		}
		else if ("高级" == "${competion.rank}")
		{
			trank = 3;
		}
		$("#rank").attr("value",trank);
		//初始化上传控件
		createUploader();
	});
	
	function createUploader() { 
    	var uploader = new qq.FineUploader({ 
    	element: document.getElementById('bootstrapped-fine-uploader'), 
    	request: { 
    	endpoint: 'lms/importcompetionimg.action' 
    	}, 
    	text: { 
    	uploadButton: '<button class="btn btn-warning"><i class="icon-upload"></i>上传</button>' 
    	}, 
    	validation:{
    		allowedExtensions: ['jpeg', 'jpg', 'gif', 'png']
    	},
    	template: 
    	'<div class="qq-uploader">' + 
    	'<pre class="qq-upload-drop-area"><span>{dragZoneText}</span></pre>' + 
    	'<div class="qq-upload-button btn" style="width: auto;">{uploadButtonText}</div>' + 
    	'<span class="qq-drop-processing"><span>{dropProcessingText}</span>'+ 
    	'<span class="qq-drop-processing-spinner"></span></span>' + 
    	'<ul class="qq-upload-list" style="margin-top: 10px; text-align: center;display:none"></ul>' + 
    	'</div>', 
    	classes: { 
    	success: 'alert alert-success', 
    	fail: 'alert alert-error' 
    	}, 
    	callbacks:{
    		onComplete: function(id,  fileName,  responseJSON){		
    			if (responseJSON.success == "true")
    			{
    				$("#imgpath").attr("value",responseJSON.imgpath);
    			}
    		}
    	}
    	}); 
    }
	
	function initcategory()
	{
		$.ajax({
			url:"lms/getAllExamCategory.action",
			type:"post",
			success:function(s){
				var a=eval("("+s+")");
				var row = a.rows;
				var tmp ='<option value="0" selected="selected">-专业-</option>';
				for ( var i = 0; i < row.length; i++) {
					var category = row[i];
					var id = category.id;
					var name = category.name;
					tmp += '<option value='+id+'>'+name+'</option>';
				}
				$("#category").html(tmp);
				selectcategory();
			}
		}); 
	}
	function selectcategory()
	{
		var id = $("#competionId").attr("value");
		if (id)
		{
			var competionId = parseInt(id);
			var data={competionId:competionId};
			$.ajax({
				url : "cms/getCompetionCategory.action",
				type : "post",
				data:data,
				success : function(s) {
					var a = eval("(" + s + ")");
					if ("sucess" == a.sucess)
					{
						$("#category").val(a.categoryId);
					}
				}
			});
		}
	}
	function selectschool()
	{
		var id = $("#competionId").attr("value");
		if (id)
		{
			var competionId = parseInt(id);
			var data={competionId:competionId};
			$.ajax({
				url : "cms/getExamSchool.action",
				type : "post",
				data:data,
				success : function(s) {
					var a = eval("(" + s + ")");
					if ("sucess" == a.sucess)
					{
						$("#school").val(a.schoolId);
					}
				}
			});
			$("#savebutton").hide();
			$("#updatebutton").show();
		}
		else
		{
			$("#savebutton").show();
			$("#updatebutton").hide();
		}
		
	}
	function initschool()
	{
		$.ajax({
			url : "cms/getAllSchool.action",
			type : "post",
			success : function(s) {
				var a = eval("(" + s + ")");
				var tmp = '';
				var treetmp = '';
				var row = a.rows;
				for ( var i = 0; i < row.length; i++) {
					var school = row[i];
					var name = school.name;
					tmp += '<option value='+school.id+'>'+name+'</option>';
					var userlist = school.user;
					treetmp += "<li class='expanded folder' id='"+school.id+"'>"+
					name+
			        getuserlist(userlist)+
			      "</li>";
			      
				}
				//alert(tmp);
				$("#school").html(tmp);
				selectschool();
				$("#tree2-treeData").html(treetmp);
				$("#tree2").dynatree({
		            checkbox: true,
		            selectMode: 3,
		            onSelect: function(select, node) {
		              var selKeys, selNodes;
		              selNodes = node.tree.getSelectedNodes();
		              selKeys = $.map(selNodes, function(node) {
		                return "[" + node.data.key + "]: '" + node.data.title + "'";
		              });
		              //console.log('11111',node.data.isFolder); 
		              //alert('11111'+node.data.isFolder);
		              return $("#echoSelection2").text(selKeys.join(", "));
		            },
		            onClick: function(node, event) {
		              if (node.getEventTargetType(event) === "title") {
		                return node.toggleSelect();
		              }
		            },
		            onKeydown: function(node, event) {
		              if (event.which === 32) {
		                node.toggleSelect();
		                return false;
		              }
		            },
		            idPrefix: "dynatree-Cb2-"
		          });
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
	function getuserlist(row)
	{
		var len = row.length;
		if (len < 1)
		{
			return "";
		}
		var tmp = "<ul>";
		for ( var i = 0; i < len; i++) {
			var school = row[i];
			tmp += "<li id='"+school.id+"'>"+
	            school.name+
	          "</li>";
		}
		tmp += "</ul>";
		return tmp;
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
		//var type = $("#type").attr("value");
		var score = $("#score").attr("value");
		var passscore = $("#passscore").attr("value");
		var describle = $("#describle").attr("value");
		var schoolId = $("#school").val();
		var categoryId = $("#category").val();
		var rank = $("#rank").val();
		var imgpath = $("#imgpath").attr("value");
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
		/* if (isNull(type))	
		{
			alert("是否公开不能为空");
			return ;
		} */
		var data={imgpath:imgpath,rank:rank,categoryId:categoryId,name:name,starttime:starttime,endtime:endtime,wstarttime:wstarttime,wendtime:wendtime,examstarttime:examstarttime,examendtime:examendtime,score:score,passscore:passscore,describle:describle,schoolId:schoolId};
		$.ajax({
			url : "cms/createcompetion.action",
			type : "post",
			data :data,
			success : function(s) {
				var a = eval("(" + s + ")");
				if ("sucess" == a.sucess)
				{
					//$("#savebutton").hide();
					//$("#updatebutton").show();
					//$("#competionId").attr("value",a.competionId);
					location.href = "cms/totcompetion.action?competionId="+a.competionId;
				}
			}
		});
	}
	function updatecompetion()
	{
		var competionId = $("#competionId").attr("value");
		var name = $("#name").attr("value");
		var starttime = $("#starttime").attr("value");
		var endtime = $("#endtime").attr("value");
		var wstarttime = $("#wstarttime").attr("value");
		var wendtime = $("#wendtime").attr("value");
		var examstarttime = $("#examstarttime").attr("value");
		var examendtime = $("#examendtime").attr("value");
		//var type = $("#type").attr("value");
		var score = $("#score").attr("value");
		var passscore = $("#passscore").attr("value");
		var describle = $("#describle").attr("value");
		var schoolId = $("#school").val();
		var categoryId = $("#category").val();
		var rank = $("#rank").val();
		var imgpath = $("#imgpath").attr("value");
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
		/* if (isNull(type))	
		{
			alert("是否公开不能为空");
			return ;
		} */
		var data={imgpath:imgpath,rank:rank,categoryId:categoryId,competionId:competionId,name:name,starttime:starttime,endtime:endtime,wstarttime:wstarttime,wendtime:wendtime,examstarttime:examstarttime,examendtime:examendtime,score:score,passscore:passscore,describle:describle,schoolId:schoolId};
		$.ajax({
			url : "cms/updatecompetion.action",
			type : "post",
			data :data,
			success : function(s) {
				var a = eval("(" + s + ")");
				if ("sucess" == a.sucess)
				{
					alert("更新成功");
				}
			}
		});
	}
	function showuserdialog()
	{
		var examv = $("#selectexam").attr("value");
		if (examv=="")
		{
			alert("试卷还没有选择，无法增加考生");
			return;
		}
		$("#modal-example3").modal('show');
	}
	function showexamdialog()
	{
		var competionId = parseInt($("#competionId").attr("value"));
		$.ajax({
			url : "cms/getCompetionMjudgment.action?competionId="+competionId,
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
				$("#model2user").html(tmp);
				$("#modal-example2").modal('show');
			}
		});
	}
	function deljudgment(competionId,userId)
	{
		var data={competionId:competionId,userId:userId};
		$.ajax({
			url : "cms/delcompetionjudgment.action",
			type : "post",
			data :data,
			success : function(s) {
				var a = eval("(" + s + ")");
				if ("sucess" == a.sucess)
				{
					location.reload();
				}
			}
		});
	}
	function delcompetionuser(id)
	{
		var data={id:id};
		$.ajax({
			url : "cms/delcompetionuser.action",
			type : "post",
			data :data,
			success : function(s) {
				var a = eval("(" + s + ")");
				if ("sucess" == a.sucess)
				{
					location.reload();
				}
			}
		});
	}
	function startcompetion()
	{
		var examv = $("#selectexam").attr("value");
		if (examv=="")
		{
			alert("试卷还没有选择，无法开始竞赛");
			return;
		}
		var competionId = parseInt($("#competionId").attr("value"));
		var data={competionId:competionId};
		$.ajax({
			url : "cms/startcompetion.action",
			type : "post",
			data :data,
			success : function(s) {
				var a = eval("(" + s + ")");
				if ("sucess" == a.sucess)
				{
					alert("可以开始竞赛");
				}
			}
		});
	}
	function endcompetion()
	{
		var competionId = parseInt($("#competionId").attr("value"));
		var data={competionId:competionId};
		$.ajax({
			url : "cms/endcompetion.action",
			type : "post",
			data :data,
			success : function(s) {
				var a = eval("(" + s + ")");
				if ("sucess" == a.sucess)
				{
					alert("竞赛结束");
				}
			}
		});
	}
	//增加裁判
	function addcompetionjudgment()
	{
		var tcom = $("#competionId").attr("value")
		if (isNull(tcom))
		{
			alert("竞赛还没有保存");
			return;
		}
		var userId = parseInt($("#selectuser").attr("value"));;
		var competionId = parseInt(tcom);
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
	function adduser()
	{
		var competionId = parseInt($("#competionId").attr("value"));
		//var tree1 = $("#tree2").dynatree("getTree");
		//alert("----"+tree1.serializeArray());
		//console.log('11111',tree1.serializeArray());
		//var selectnodes = $("#tree2").getSelectedNodes();
		var nodes = $("#tree2").dynatree("getSelectedNodes");
		//alert(nodes);
		//console.log('11111',nodes); 
		//var a = eval("(" + $(nodes) + ")");
		//alert(a);
		var userlist = "";
		$.each(nodes,function(index,node){
			if (!node.data.isFolder)
			{
				userlist += node.data.key +",";
			}
		});
		var len = userlist.length;
		if(len > 0)
		{
			userlist = userlist.substr(0, len-1);
		}
		var data={users:userlist,competionId:competionId};
		$.ajax({
			url : "cms/addcompetionuser.action",
			type : "post",
			data :data,
			success : function(s) {
				var a = eval("(" + s + ")");
				if ("sucess" == a.sucess)
				{
					location.reload();
				}
			}
		});
	}
	//增加竞赛试卷------同时将试卷指定给出卷裁判
	function addexam()
	{
		var name = $("#model2name").attr("value");
		if (isNull(name))
		{
			alert("试卷名不能为空");
			return;
		}
		var tuserID = $("#model2user").attr("value");
		if (isNull(tuserID))
		{
			alert("命题裁判不能为空");
			return;
		}
		var userId = parseInt(tuserID);;
		var competionId = parseInt($("#competionId").attr("value"));
		var data={userId:userId,competionId:competionId,name:name};
		$.ajax({
			url : "cms/addexam.action",
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
	function lockallexam()
	{
		var competionId = parseInt($("#competionId").attr("value"));
		var data={competionId:competionId};
		$.ajax({
			url : "cms/lockallexam.action",
			type : "post",
			data :data,
			success : function(s) {
				var a = eval("(" + s + ")");
				if ("sucess" == a.sucess)
				{
					location.reload();
				}
			}
		});
	}
	function unlockallexam(competionId,examId)
	{
		var data={competionId:competionId,examId:examId};
		$.ajax({
			url : "cms/unlockallexam.action",
			type : "post",
			data :data,
			success : function(s) {
				var a = eval("(" + s + ")");
				if ("sucess" == a.sucess)
				{
					location.reload();
				}
			}
		});
	}
	function deleteexam(competionId,examId)
	{
		var data={competionId:competionId,examId:examId};
		$.ajax({
			url : "cms/deleteexam.action",
			type : "post",
			data :data,
			success : function(s) {
				var a = eval("(" + s + ")");
				if ("sucess" == a.sucess)
				{
					location.reload();
				}
			}
		});
	}
	function selectexam()
	{
		var competionId = parseInt($("#competionId").attr("value"));
		var examv = $("#selectexam").attr("value");
		if (examv=="")
		{
			alert("选卷不能为空");
			location.reload();
			return;
		}
		var examId = parseInt(examv);
		var data={competionId:competionId,examId:examId};
		$.ajax({
			url : "cms/selectexam.action",
			type : "post",
			data :data,
			success : function(s) {
				var a = eval("(" + s + ")");
				if ("sucess" == a.sucess)
				{
					location.reload();
				}
			}
		});
	}
	//导出数据
	function exportdata()
	{
		
	}
	</script>
</body>
</html>