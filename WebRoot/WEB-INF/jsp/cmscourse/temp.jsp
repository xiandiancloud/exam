<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<!--[if IE 7]><html class="ie7 lte9 lte8 lte7" lang="zh-cn"><![endif]-->
<!--[if IE 8]><html class="ie8 lte9 lte8" lang="zh-cn"><![endif]-->
<!--[if IE 9]><html class="ie9 lte9" lang="zh-cn"><![endif]-->
<!--[if gt IE 9]><!-->
<html lang="zh-cn">
<!--<![endif]-->
<head>
<base href="<%=basePath%>">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>课程大纲 |edX Demonstration Course|edX Studio</title>

<meta name="viewport" content="width=device-width,initial-scale=1">
<meta name="path_prefix" content="">
<link type="text/css" rel="stylesheet" href="tcss/normalize.css">
<link type="text/css" rel="stylesheet" href="tcss/font-awesome.css">
<link type="text/css" rel="stylesheet" href="tcss/number-polyfill.css">
<link type="text/css" rel="stylesheet" href="tcss/codemirror.css">
<link type="text/css" rel="stylesheet"
	href="tcss/jquery-ui-1.8.22.custom.css">
<link type="text/css" rel="stylesheet" href="tcss/jquery.qtip.min.css">
<link type="text/css" rel="stylesheet" href="tcss/style.css">
<link type="text/css" rel="stylesheet" href="tcss/content.min.css">
<link type="text/css" rel="stylesheet"
	href="tcss/tinymce-studio-content.css">
<link type="text/css" rel="stylesheet" href="tcss/skin.min.css">
<link type="text/css" rel="stylesheet" href="tcss/style-app.css">
<link type="text/css" rel="stylesheet" href="tcss/style-app-extend1.css">
<link type="text/css" rel="stylesheet" href="tcss/style-xmodule.css">
<link rel="stylesheet" type="text/css" href="tcss/jquery.timepicker.css" />
<!-- <link href="tcss/cms-style-app-extend1.4cdfc7f218d9.css" rel="stylesheet" type="text/css" /> -->
<style type="text/css">  
    .mask {    
            position: absolute; top: 0px; filter: alpha(opacity=60); background-color: #777;  
            z-index: 1001; left: 0px;  
            opacity:0.5; -moz-opacity:0.5;  
        }  
</style>   


<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script type="text/javascript" src="js/outline.js"></script>
<script type="text/javascript" src="js/drag_drop.js"></script>


<script type="text/javascript">
        function cancel() {
            $("#dialog").hide();
            $("#contain").hide();            
        }        	
</script>
<!-- <script type="text/javascript">
        function edit() {
            var input = $('.xblock-field-input');
            input.$('.wrapper-xblock-field').addClass('is-editing');
            input.focus().select();            
        }
        function completeEdit(){
          	var currentValue=this.$('.xblock-field-input').val();
        	if (currentValue === "单元") {
                    this.$('.wrapper-xblock-field').removeClass('is-editing');
                }
            else{
            		this.$('.wrapper-xblock-field').removeClass('is-editing');
            		var oldvalue=document.getElementById("t11").innerHTML=currentValue;
            }        	
        } 
    </script> -->

</head>

<body class="view-signin is-signedin course view-outline hide-wip lang_zh-cn">
	<!-- view -->
	<div id="contain" class="mask"></div>
	<div class="wrapper wrapper-view">

		<jsp:include page="ttheader.jsp"></jsp:include>

		<div id="page-alert"></div>

		<div id="content">

			<div class="wrapper-mast wrapper">
				<header class="mast has-actions has-subtitle">
					<h1 class="page-header">
						<small class="subtitle">内容</small> <span class="sr">&gt; </span>课程大纲
					</h1>

					<nav class="nav-actions">
						<h3 class="sr">页面操作</h3>
						<ul>
							<li class="nav-item">
								<a class="button button-new button-new-section" data-category="chapter" data-default-name="Section" title="Click to add a new section">
									<i class="icon-plus"></i>添加新章节
								</a>
							</li>
							<li class="nav-item">
								<a class="button button-toggle button-toggle-expand-collapse collapse-all">
									<span class="collapse-all">
										<i class="icon-arrow-up"></i>
										<span class="label">折叠所有章节</span>
									</span> 
<!-- 									<span class="expand-all">
										<i class="icon-arrow-down"></i> 
										<span class="label">展开所有章节</span>
									</span> -->
								</a>
							</li>
							<!-- <li class="nav-item">
                    <a href="#" rel="external" class="button view-button view-live-button"
                       title="Click to open the courseware in the LMS in a new tab">在线查看</a>
                </li> -->
							<c:choose>
								<c:when test="${course.publish == 0}">
									<li class="nav-item"><a href="javascript:void(0);"
										onclick="publish(${courseId},1,'发布成功');" rel="external"
										class="button view-button view-live-button"
										title="Click to open the courseware in the LMS in a new tab">发布课程</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="nav-item"><a href="javascript:void(0);"
										onclick="publish(${courseId},0,'取消成功');" rel="external"
										class="button view-button view-live-button"
										title="Click to open the courseware in the LMS in a new tab">取消发布</a>
									</li>
								</c:otherwise>
							</c:choose>
						</ul>
					</nav>
				</header>
			</div>

			<div class="wrapper-content wrapper">
				<section class="content">
					<article role="main" class="content-primary">
						<div class="wrapper-dnd">
							<article class="outline outline-course">
								<div class="outline-content course-content" id="sections">
									<ol class="list-sections is-sortable is-hidden new-section" >
										<li class="outline-item outline-section has-warnings is-draggable is-collapsible is-collapsed">
          										<h3 class="section-name is_editable">
            										<form class="section-name-form">
              											<input type="text" class="new-section-name" value="新章节的名字" id="coursename">
              											<input type="button" value="保存" class="new-section-name-save" onclick="savechapter(${courseId});">
              											<input type="button" value="取消" class="new-section-name-cancel">
            										</form>
          										</h3>
        								</li>
    								</ol>									
									<!-- 章节 -->
									<c:forEach var="chapter" items="${course.chapters}">
										<ol class="list-sections is-sortable">
											<li class="outline-item outline-section has-warnings is-draggable is-collapsible ">
												<div class="section-header">
													<h3 title="Collapse/Expand this section"
														class="section-header-details expand-collapse collapse ui-toggle-expansion">
														<i class="icon-caret-down icon"></i> <span
															data-field-display-name="Display Name"
															data-field="display_name"
															class="wrapper-section-title wrapper-xblock-field incontext-editor is-editable">
															<span
															class="section-title item-title xblock-field-value incontext-editor-value">${chapter.name}</span>
														</span>
													</h3>
													<div class="section-header-actions">
														<ul class="actions-list">
															<li class="action-item action-configure">
																<a href="javascript:void(0)" class="configure-button action-button" data-tooltip="Configure" onclick="update(1,'${chapter.id}','${chapter.name}');"> 
																	<i class="icon-gear"></i> 
																	<span class="sr action-button-text">Configure</span>
																</a>
															</li>
															<li class="action-item action-delete">
																<a class="delete-button action-button" data-tooltip="Delete" href="javascript:void(0)" onclick="realdelete(1,'${chapter.id}');"> 
																	<i class="icon icon-trash"></i> 
																	<span class="sr action-button-text">Delete</span>
																</a>
															</li>																		
															<li class="action-item action-drag">
                    											<span class="drag-handle section-drag-handle action" data-tooltip="Drag to reorder">
                        											<span class="sr">Drag to reorder</span>
                    											</span>
                											</li>
														</ul>
													</div>
												</div>

												<div class="outline-content section-content">
													<!-- 小节 -->
													<c:forEach var="sequential" items="${chapter.sequentials}">
														<ol class="list-subsections is-sortable">
															<li class="outline-item outline-subsection has-warnings is-draggable is-collapsible is-collapsed">
																<div class="subsection-header">
																	<h3 title="Collapse/Expand this subsection"
																		class="subsection-header-details expand-collapse expand ui-toggle-expansion"
																		onclick="subsection_drag_or_drop()">
																		<i class="icon-caret-down icon"></i> <span
																			data-field-display-name="Display Name"
																			data-field="display_name"
																			class="wrapper-subsection-title wrapper-xblock-field incontext-editor is-editable">
																			<span
																			class="subsection-title item-title xblock-field-value incontext-editor-value">${sequential.name}</span>
																		</span>
																	</h3>

																	<div class="subsection-header-actions">
																		<ul class="actions-list">
																			<li class="action-item action-configure">
																				<a href="javascript:void(0)" class="configure-button action-button" data-tooltip="Configure"  onclick="update(2,'${sequential.id}','${sequential.name}');"> 
																					<i class="icon-gear"></i> 
																					<span class="sr action-button-text">Configure</span>
																				</a>
																			</li>
																			<li class="action-item action-delete">
																				<a class="delete-button action-button" data-tooltip="Delete" href="javascript:void(0)"  onclick="realdelete(2,'${sequential.id}');"> 
																					<i class="icon icon-trash"></i> 
																					<span class="sr action-button-text">Delete</span>
																				</a>
																			</li>																		
																			<li class="action-item action-drag">
                    															<span class="drag-handle subsection-drag-handle action" data-tooltip="Drag to reorder">
                        															<span class="sr">Drag to reorder</span>
                    															</span>
                															</li>
																		</ul>
																	</div>
																</div>

																<div class="outline-content subsection-content">
																	<!-- 单元  -->
																	<c:forEach var="vertical" items="${sequential.verticals}">
																		<ol class="list-units is-sortable">
																			<li class="outline-item outline-unit  is-draggable  ">
																				<div class="unit-header">
																					<h3 class="unit-header-details">
																						<span class="unit-title item-title"> <a
																							href="cms/tottrain.action?courseId=${courseId}&sequentialId=${sequential.id}&verticalId=${vertical.id}">${vertical.name}</a>
																						</span>
																					</h3>

																					<div class="unit-header-actions">
																						<ul class="actions-list">
																							<li class="action-item action-configure">
																								<a href="javascript:void(0)" class="configure-button action-button" data-tooltip="Configure"   onclick="update(3,'${vertical.id}','${vertical.name}');"> 
																									<i class="icon-gear"></i> 
																									<span class="sr action-button-text">Configure</span>
																								</a>
																							</li>
																							<li class="action-item action-delete">
																								<a class="delete-button action-button" data-tooltip="Delete" href="javascript:void(0)"  onclick="realdelete(3,'${vertical.id}');"> 
																									<i class="icon icon-trash"></i> 
																									<span class="sr action-button-text">Delete</span>
																								</a>
																							</li>																		
																							<li class="action-item action-drag">
                    																			<span class="drag-handle unit-drag-handle action" data-tooltip="Drag to reorder">
                        																			<span class="sr">Drag to reorder</span>
                    																			</span>
                																			</li>
																						</ul>
																					</div>
																				</div>
																			</li>
																		</ol>
																	</c:forEach>
																	<!-- 单元结束  -->

																	<div class="add-unit add-item">
																		<a title="Click to add a new 单元"
																			data-default-name="单元" data-parent=""
																			data-category="vertical" class="button button-new"
																			href="cms/tottrain.action?courseId=${courseId}&sequentialId=${sequential.id}&verticalId=-1"> <i class="icon icon-plus"></i>新建单元
																		</a>
																	</div>
																</div>
															</li>
														</ol>
													</c:forEach>

													<ol class="list-subsections is-sortable is-hidden new-subsection" >
														<li class="outline-item outline-subsection has-warnings is-draggable is-collapsible is-collapsed">
															<div class="section-item editing">
      															<form class="new-subsection-form">
        															<span class="subsection-name">
          																<input type="text" value="添加新的小节" class="new-subsection-name-input" id="chapter${chapter.id}seqname"/>
        															</span>
        															<input type="button" value="保存" class="new-subsection-name-save" onclick="saveseq(${chapter.id});"/>
        															<input type="button" value="取消" class="new-subsection-name-cancel" />
      															</form>
    														</div>
															<div class="outline-content subsection-content">
																<div class="add-unit add-item">
																	<a href="#" class="button button-new" data-category="vertical" data-parent="" data-default-name="单元" title="Click to add a new 单元"> 
																		<i class="icon icon-plus"></i>新建单元
																	</a>
																</div>
															</div>
														</li>
													</ol>
													<!-- 小节结束 -->
												</div>
												<div class="outline-content section-content">
													<div class="add-subsection add-item">
														<a title="Click to add a new Subsection" data-default-name="Subsection" data-parent="" data-category="sequential" class="button button-new button-new-subsection"> 
															<i class="icon icon-plus"></i>添加新的小节
														</a>
													</div>
												</div> 
												<span class="draggable-drop-indicator draggable-drop-indicator-after">
													<i class="icon-caret-right"></i> 
												</span>
											</li>
										</ol>
									</c:forEach>
									<!-- 章节结束 -->
								</div>
							</article>
						</div>
					</article>
					<aside role="complimentary" class="content-supplementary">
						<div class="bit">
							<h3 class="title-3">我在这个页面能做什么？</h3>
							<p>您可以创建新章节和小节，设置章节发布日期，在小节中创建新单元。您可以设置小节中的作业类型以供计分，也可以打开小节作进一步编辑。</p>
							<p>此外，您可以拖动章节，小节和单元来重新组织您的课程。</p>
						</div>
					</aside>
				</section>
			</div>
		</div>

		<div class="wrapper-sock wrapper">
			<ul class="list-actions list-cta">
				<li class="action-item"><a href="#sock"
					class="cta cta-show-sock"><i class="icon-question-sign"></i> <span
						class="copy">Looking for help with Studio?</span></a></li>
			</ul>

			<div class="wrapper-inner wrapper">
				<section class="sock" id="sock">
					<header>
						<h2 class="title sr">edX Studio Documentation</h2>
					</header>

					<div class="support">
						<h3 class="title">edX Studio Documentation</h3>

						<div class="copy">
							<p>You can click Help in the upper right corner of any page
								to get more information about the page you're on. You can also
								use the links below to download the Building and Running an edX
								Course PDF file, to go to the edX Author Support site, or to
								enroll in edX101.</p>
						</div>

						<ul class="list-actions">
							<li class="action-item js-help-pdf"><a
								href="https://media.readthedocs.org/pdf/edx-partner-course-staff/latest/edx-partner-course-staff.pdf"
								target="_blank" rel="external" class="action action-primary">Building
									and Running an edX Course PDF</a></li>

							<li class="action-item"><a href="http://help.edge.edx.org/"
								rel="external" class="action action-primary">edX Studio
									Author Support</a> <span class="tip">edX Studio Author
									Support</span></li>
							<li class="action-item"><a
								href="https://edge.edx.org/courses/edX/edX101/How_to_Create_an_edX_Course/about"
								rel="external" class="action action-primary">注册edX101</a> <span
								class="tip">How to use edX Studio to build your course</span></li>
						</ul>
					</div>

					<div class="feedback">
						<h3 class="title">Request help with edX Studio</h3>

						<div class="copy">
							<p>Have problems, questions, or suggestions about edX Studio?</p>
						</div>

						<ul class="list-actions">
							<li class="action-item"><a
								href="http://help.edge.edx.org/discussion/new"
								class="action action-primary show-tender"
								title="请使用工具Tender来分享您的反馈"><i class="icon-comments"></i>联系我们</a>
							</li>
						</ul>
					</div>
				</section>
			</div>
		</div>

		<jsp:include page="tfooter.jsp"></jsp:include>
	</div>
	
	
	<div id="dialog" class="modal-window modal-med confirm is-hidden" style="z-index:1003;position: absolute;">
      	<form action="#" class="edit-sectionrelease-dialog">
        	<div class="modal-content">
         		<ul class="list-input picker datepair">
            		<li class="field field-start-date">
              			<label for="start_date">名称</label>
              			<input type="text" autocomplete="off" size="15" value="" name="start_date" class="start-date date hasDatepicker" id="dialogtext">
            		</li>
          		</ul>
        	</div>
        	<div class="actions modal-actions">
          		<h3 class="sr">表格操作</h3>
          		<input type="hidden" id="dialogid"/>
          		<input type="hidden" id="dialogindex"/>
          		<ul>
            		<li class="action-item">
              			<a href="javascript:void(0)" class="button action-primary action-save" onclick="realupdate();">保存</a>
            		</li>
            		<li class="action-item">
              			<a href="javascript:void(0)" class="button action-primary action-cancel" onclick="cancel()">取消</a>
            		</li>
          		</ul>
        	</div>
      	</form>
    </div>
	
		<script>
		$(function() {
		});
		
		function publish(courseId,type,msg)
		{
			$.ajax({
				url:"cms/publicCourse.action?courseId="+courseId+"&type="+type,
				type:"post",
				success:function(s){
					var a=eval("("+s+")");	
					if (a.sucess=="sucess")
					{
						location.reload();
						alert(msg);
					}
				}
			});
		}
		function savechapter(courseId)
		{
			var name = $("#coursename").val();
			var data = {courseId:courseId,name:name};
			$.ajax({
				url:"cms/createchapter.action",
				type:"post",
				data:data,
				success:function(s){
					var a=eval("("+s+")");	
					if (a.sucess=="sucess")
					{
						location.reload();
					}
				}
			});
		}
		function showDialog()
		{
			$("#contain").css("height",$(document).height());  
	        $("#contain").css("width",$(document).width());  
	        $("#contain").show();
			var win = $("#dialog");
			var left=($(window).width() - win.width())/2 + $(document).scrollLeft();
			var top=($(window).height() - win.height())/2 + $(document).scrollTop();
			win.css("left",left).css("top",top);
			win.show();
		}
		function update(index,chapterId,name)
		{
			$("#dialogindex").attr("value",index);
			$("#dialogid").attr("value",chapterId);
			$("#dialogtext").attr("value",name);
			showDialog();
		}
		function realupdate()
		{
			var index = $("#dialogindex").val();
			var name = $("#dialogtext").val();
			if (index == 1)
			{
				var chapterId = $("#dialogid").val();
				var data = {chapterId:chapterId,name:name};
				$.ajax({
					url:"cms/updatechapter.action",
					type:"post",
					data:data,
					success:function(s){
						var a=eval("("+s+")");	
						if (a.sucess=="sucess")
						{
							location.reload();
						}
					}
				});
			}
			else if (index == 2)
			{
				var sequentialId = $("#dialogid").val();
				var data = {sequentialId:sequentialId,name:name};
				$.ajax({
					url:"cms/updateSequential.action",
					type:"post",
					data:data,
					success:function(s){
						var a=eval("("+s+")");	
						if (a.sucess=="sucess")
						{
							location.reload();
						}
					}
				});
			}
			else if (index == 3)
			{
				var sequenticalId = parseInt("-1");
				var verticalId = $("#dialogid").val();
				var data = {sequenticalId:sequenticalId,verticalId:verticalId,name:name};
				$.ajax({
					url:"cms/createVertical.action",
					type:"post",
					data:data,
					success:function(s){
						var a=eval("("+s+")");	
						if (a.sucess=="sucess")
						{
							location.reload();
						}
					}
				});
			}
		}
		function realdelete(index,id)
		{
			if (index == 1)
			{
				var data = {chapterId:id};
				$.ajax({
					url:"cms/delchapter.action",
					type:"post",
					data:data,
					success:function(s){
						var a=eval("("+s+")");	
						if (a.sucess=="sucess")
						{
							location.reload();
						}
					}
				});
			}
			else if (index == 2)
			{
				var data = {sequentialId:id};
				$.ajax({
					url:"cms/delSequential.action",
					type:"post",
					data:data,
					success:function(s){
						var a=eval("("+s+")");	
						if (a.sucess=="sucess")
						{
							location.reload();
						}
					}
				});
			}
			else if (index == 3)
			{
				var data = {verticalId:id};
				$.ajax({
					url:"cms/delVertical.action",
					type:"post",
					data:data,
					success:function(s){
						var a=eval("("+s+")");	
						if (a.sucess=="sucess")
						{
							location.reload();
						}
					}
				});
			}
		}
		function saveseq(chapterId)
		{
			var id = "#chapter"+chapterId+"seqname";
			var name = $(id).val();
			var data = {chapterId:chapterId,name:name};
			$.ajax({
				url:"cms/createSequential.action",
				type:"post",
				data:data,
				success:function(s){
					var a=eval("("+s+")");	
					if (a.sucess=="sucess")
					{
						location.reload();
					}
				}
			});
		}
	</script>
</body>
</html>
