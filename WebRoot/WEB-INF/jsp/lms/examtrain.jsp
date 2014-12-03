<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<html lang="zh-cn"><!--<![endif]-->
  <head>
  	<base href="<%=basePath%>">
    <title>实验</title>
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
	<link href="tcss/inputtext/font-awesome.css" rel="stylesheet"/>
	<link href="tcss/inputtext/index.css" rel="stylesheet"/>
    <!-- / END - page related stylesheets [optional] -->
    <!-- / bootstrap [required] -->
    <link href="assets/stylesheets/bootstrap/bootstrap.css" media="all" rel="stylesheet" type="text/css" />
    <!-- / theme file [required] -->
    <link href="assets/stylesheets/light-theme.css" media="all" id="color-settings-body-color" rel="stylesheet" type="text/css" />
    <!-- / coloring file [optional] (if you are going to use custom contrast color) -->
    <link href="assets/stylesheets/theme-colors.css" media="all" rel="stylesheet" type="text/css" />
    <!-- / demo file [not required!] -->
    <link href="assets/stylesheets/demo.css" media="all" rel="stylesheet" type="text/css" />
    <link href="css/train.css" rel="stylesheet">
    <!--[if lt IE 9]>
      <script src="assets/javascripts/ie/html5shiv.js" type="text/javascript"></script>
      <script src="assets/javascripts/ie/respond.min.js" type="text/javascript"></script>
    <![endif]-->
	
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
	<script src="js/inputtext/bootstrap-wysiwyg.js" type="text/javascript"></script>
	<script src="js/inputtext/jquery.hotkeys.js" type="text/javascript"></script>
    <!-- / END - page related files and scripts [optional] -->
    <script src="js/common.js" type="text/javascript"></script>
    <script src="js/holder.js"></script>
	<script src="js/jqPaginator.js"></script>
	
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	
	<link rel="stylesheet" type="text/css" href="easyui/themes/bootstrap/easyui.css">

    <style>
		#editor {overflow:auto;height: 150px;}
		#leftpanel{margin-right: 5px;border:0;}
		#editor img{
			  padding: 4px;
			  line-height: 1.42857;
			  background-color: white;
			  border: 0px solid #dddddd;
			  border-radius: 4px;
			  -webkit-transition: all 0.2s ease-in-out;
			  transition: all 0.2s ease-in-out;
			  display: inline-block;
			  max-width: 100%;
			  height: auto;
		}
	</style>
  </head>
<body class='easyui-layout'>
  
<div data-options="region:'north',border:false" style="height:60px;padding:0px">
	<div class="tt"><jsp:include page="theader.jsp"></jsp:include></div>
</div>

<div data-options="region:'west',split:true" style="width:450px;">
	<div id="leftpanel">
			<div id="pagination" class="center"></div>
			<div class='box box-bordered searchback box-nomargin cmargin5'>
		                    <div class='box-header box-header-small searchback'>
		                      <div class='title'>实验定义</div>
		                      <div class='actions'>
		                        <a class="btn box-remove btn-xs btn-link" href="#"><i class='icon-remove'></i>
		                        </a>
		                        
		                        <a class="btn box-collapse btn-xs btn-link" href="#"><i></i>
		                        </a>
		                      </div>
		                    </div>
		                    <div class='box-content'>
					          <form class="form-horizontal" role="form">
							  <div class="form-group">
							    <label for="trainname" class="col-sm-2 control-label"><div class="h2font">名称</div></label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control" id="trainname" disabled="disabled">
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="traincode" class="col-sm-2 control-label"><div class="h2font">编号</div></label>
							    <div class="col-sm-10">
							      <input type="text" class="form-control" id="traincode" disabled="disabled">
							    </div>
							  </div>
							</form>
		                    </div>
		    </div>
			
			<div class='box box-bordered searchback box-nomargin cmargin5'>
                   <div class='box-header box-header-small searchback'>
                     <div class='title'>环境</div>
                     <div class='actions'>
                       <a class="btn box-remove btn-xs btn-link" href="#"><i class='icon-remove'></i>
                       </a>
                       
                       <a class="btn box-collapse btn-xs btn-link" href="#"><i></i>
                       </a>
                     </div>
                   </div>
                   <div class='box-content'>
                    <form class="form-horizontal" role="form">
					  <div class="form-group">
					    <label for="trainprename" class="col-sm-2 control-label"><div class="h2font">模板</div></label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" id="trainprename" disabled="disabled">
					    </div>
					  </div>
					  <h6 id="hasenv" class="none">
							<table class="table table-bordered">
								<tbody>
									<tr>
										<td>ip</td>
										<td id="ip"></td>
									</tr>
									<tr>
										<td>username</td>
										<td id="username"></td>
									</tr>
									<tr>
										<td>password</td>
										<td id="password"></td>
									</tr>
									<tr>
										<td>serverId</td>
										<td id="ssh"></td>
									</tr>
								</tbody>
							</table>
						</h6>
						<a href="javascript:void(0);" id="trainjoin" class="none">
							<button type="button" class="btn btn-primary">创建环境</button>
						</a>
						<img src="images/Loading.gif" class="none" id="imgenv"/>
					</form>
                   </div>
		    </div>
			
			<div class='box box-bordered searchback box-nomargin cmargin5'>
                    <div class='box-header box-header-small searchback'>
                      <div class='title'>题目</div>
                      <div class='actions'>
                        <a class="btn box-remove btn-xs btn-link" href="#"><i class='icon-remove'></i>
                        </a>
                        
                        <a class="btn box-collapse btn-xs btn-link" href="#"><i></i>
                        </a>
                      </div>
                    </div>
                    <div class='box-content'>
                    <!-- <label for="trainname" class="control-label"><div class="h2font">内容</div></label> -->
		    		<h6 id="traincon" class="trainimg"></h6>
                    </div>
		    </div>
              
			<div class='box box-bordered searchback box-nomargin cmargin5'>
                    <div class='box-header box-header-small searchback'>
                      <div class='title'>结果</div>
                      <div class='actions'>
                        <a class="btn box-remove btn-xs btn-link" href="#"><i class='icon-remove'></i>
                        </a>
                        
                        <a class="btn box-collapse btn-xs btn-link" href="#"><i></i>
                        </a>
                      </div>
                    </div>
                    <div class='box-content'>
                    <form role="form">
						  <div class="form-group">
						<p><div class="h2font">完成实训后点击下面的按钮,否则机器将无法自动评分</div></p>
						<a href="javascript:void(0);" id="trainsubmit">
							<button type="button" class="btn btn-primary" id="trainbutton">提交</button>
						</a>
						<img src="images/Loading.gif" class="none" id="imgsubmit"/>
						</div>
						</form>
						<form role="form">
						  <div class="form-group">
					<!-- 	    <label for="trainresult"><div class="h2font">内容</div></label>
						    <textarea class="form-control" rows="6" id="trainresult"></textarea> -->
						    <label for="useranswer"><div class="h2font">你也可以手工输入你的答案</div></label>
						    <!-- <textarea class="form-control" rows="3" id="useranswer"></textarea> -->
							<div>
								<div id="alerts"></div>
							    <div class="btn-toolbar" data-role="editor-toolbar" data-target="#editor">
							      <div class="btn-group">
							        <a class="btn" data-edit="bold" title="Bold (Ctrl/Cmd+B)"><i class="icon-bold"></i></a>
							        <a class="btn" data-edit="italic" title="Italic (Ctrl/Cmd+I)"><i class="icon-italic"></i></a>
							       <a class="btn" data-edit="justifyleft" title="Align Left (Ctrl/Cmd+L)"><i class="icon-align-left"></i></a>
							        <a class="btn" data-edit="justifycenter" title="Center (Ctrl/Cmd+E)"><i class="icon-align-center"></i></a>
							        <a class="btn" data-edit="justifyright" title="Align Right (Ctrl/Cmd+R)"><i class="icon-align-right"></i></a>
							        <a class="btn" data-edit="justifyfull" title="Justify (Ctrl/Cmd+J)"><i class="icon-align-justify"></i></a>
							         <a class="btn" title="Insert picture (or just drag & drop)" id="pictureBtn"><i class="icon-picture"></i></a>
							        <input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage" />
							      </div>
							      <input type="text" data-edit="inserttext" id="voiceBtn" x-webkit-speech="">
							    </div>
							    <div id="editor">
							    </div>
							 </div>
						    <div class="h10"></div>
						    <a href="javascript:void(0);" id="usertrainsubmit">
								<button type="button" class="btn btn-primary" id="usertrainbutton">手工提交</button>
							</a>
						  </div>
						</form>
                    </div>
		    </div>
			
			<!-- <div class='box box-bordered purple-border box-nomargin cmargin5'>
                    <div class='box-header box-header-small purple-background'>
                      <div class='title'>成绩</div>
                      <div class='actions'>
                        <a class="btn box-remove btn-xs btn-link" href="#"><i class='icon-remove'></i>
                        </a>
                        
                        <a class="btn box-collapse btn-xs btn-link" href="#"><i></i>
                        </a>
                      </div>
                    </div>
                    <div class='box-content'>
                    </div>
		    </div>
			
			<div class='box box-bordered muted-border box-nomargin cmargin5'>
                    <div class='box-header box-header-small muted-background'>
                      <div class='title'>答案</div>
                      <div class='actions'>
                        <a class="btn box-remove btn-xs btn-link" href="#"><i class='icon-remove'></i>
                        </a>
                        
                        <a class="btn box-collapse btn-xs btn-link" href="#"><i></i>
                        </a>
                      </div>
                    </div>
                    <div class='box-content'>
                    <h6 id="trainanswer"></h6>
                    </div>
		    </div> -->
	</div>
</div>

<div data-options="region:'south',border:false" style="height:50px;background:#EEEEEE;padding:0px;">
	<jsp:include page="../common/footer.jsp"></jsp:include>
</div>

<div data-options="region:'center'" style="padding:0px;overflow:hidden;">
	<iframe id="iframe" src="http://${gateone}:8090/" frameBorder="0"
						width="100%" scrolling="no" height="100%"></iframe>
</div>

   <div class="modal fade" id="myModal" data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- 				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">Modal title</h4>
				</div> -->
				<div class="modal-body">
					<h4>不要离开太久哦</h4>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						onclick="gototrain();">继续实验</button>
					<!-- <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button> -->
				</div>
			</div>
		</div>
	</div>
    <script>
    var currentPage;
	$(function() {
		$("#trainjoin").click(function() {
			createServer();
			//timeservice(0);
		});
		$("#trainsubmit").click(function() {
			myshell();
			//timeservice(0);
		});
		$("#usertrainsubmit").click(function() {
			submituseranswer();
			//timeservice(0);
		});
		//initClock();
		//var mainheight = $("#leftpanel").height();
		//$("#iframe").height(mainheight);
		initlist();
		//edit----------
	    initToolbarBootstrapBindings(); 
		$('#editor').wysiwyg({ fileUploadError: showErrorAlert} );
	});
	function initToolbarBootstrapBindings() {
      var fonts = ['Serif', 'Sans', 'Arial', 'Arial Black', 'Courier', 
            'Courier New', 'Comic Sans MS', 'Helvetica', 'Impact', 'Lucida Grande', 'Lucida Sans', 'Tahoma', 'Times',
            'Times New Roman', 'Verdana'],
            fontTarget = $('[title=Font]').siblings('.dropdown-menu');
      $.each(fonts, function (idx, fontName) {
          fontTarget.append($('<li><a data-edit="fontName ' + fontName +'" style="font-family:\''+ fontName +'\'">'+fontName + '</a></li>'));
      });
      $('a[title]').tooltip({container:'body'});
    	$('.dropdown-menu input').click(function() {return false;})
		    .change(function () {$(this).parent('.dropdown-menu').siblings('.dropdown-toggle').dropdown('toggle');})
        .keydown('esc', function () {this.value='';$(this).change();});

      $('[data-role=magic-overlay]').each(function () { 
        var overlay = $(this), target = $(overlay.data('target')); 
        overlay.css('opacity', 0).css('position', 'absolute').offset(target.offset()).width(target.outerWidth()).height(target.outerHeight());
      });
      if ("onwebkitspeechchange"  in document.createElement("input")) {
        var editorOffset = $('#editor').offset();
        $('#voiceBtn').css('position','absolute').offset({top: editorOffset.top, left: editorOffset.left+$('#editor').innerWidth()-35});
      } else {
        $('#voiceBtn').hide();
      }
	};
	function showErrorAlert (reason, detail) {
		var msg='';
		if (reason==='unsupported-file-type') { msg = "Unsupported format " +detail; }
		else {
			console.log("error uploading file", reason, detail);
		}
		$('<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>'+ 
		 '<strong>File upload error</strong> '+msg+' </div>').prependTo('#alerts');
	};
	
	function initlist()
	{
		var totalPages = "${fn:length(tlist)}";
		currentPage = "${currentPage}";
		resetTrain(currentPage);
		totalPages = parseInt(totalPages);
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
								//timeservice(0);
							}
						});
	}
	var tt;
	var onet;
	function timetos(s) {
		var t = 0;
		var strs = s.split("天");
		var other;
		if (strs.length > 1) {
			var day = strs[0];
			t += 24 * day * 3600;
			other = strs[1];
		} else {
			other = strs[0];
		}
		var strss = other.split(":");
		t += parseInt(strss[0]) * 3600 + parseInt(strss[1]) * 60
				+ parseInt(strss[2]);
		return t;
	}
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
	function timedCount() {
		tt = parseInt(tt) + 1;

		$("#clock").html(stotime(tt));

		onet = setTimeout("timedCount();", 1000);
	}
	function stopCount() {
		clearTimeout(onet);
	}
	function initClock() {
		var courseId = parseInt("${exam.id}");
		var data = {
			courseId : courseId
		};
		$.ajax({
			url : "lms/dotime.action",
			type : "post",
			data : data,
			success : function(s) {
				var a = eval("(" + s + ")");
				if (a.sucess == "sucess") {
					tt = a.dotime;
					$("#clock").html(stotime(tt));
					timedCount();
					initlist();
				}
			}
		});
	}
	function timeservice(index)
	{
		var str = $("#clock").html();
		var usetime = timetos(str);
		var courseId = parseInt("${course.id}");
		var usetime;
		var data = {
			courseId : courseId,
			usetime : usetime
		};
		$.ajax({
			url : "lms/setdotime.action",
			type : "post",
			data : data,
			success : function(s) {
				if (index == 1)
				{
					location.href = "lms/getCourse.action?courseId=" + courseId;
				}
			}
		});
	}
	function pasueClock() {
		stopCount();
		$('#myModal').modal({
			keyboard : false
		});
		timeservice(0);
	}
	function gotouppage() {
		//timeservice(1);
		location.href = "lms/toexamingtostartexam.action?competionId=${competionId}&examId=${exam.id}";
	}
	function gototrain() {
		$('#myModal').modal('hide');
		timedCount();
	}
	function myshell() {
		$("#imgsubmit").show();
		<c:forEach items="${tlist}" var="train" varStatus="status">
		if ("${status.count}" == currentPage) {
			var name = "${train.envname}";
			var examId = parseInt("${exam.id}");
			var trainId = parseInt("${train.id}");
			//var useranswer = replaceTextarea1($("#useranswer").val());
			var data = {
				examId : examId,
				trainId : trainId,
				name : name
			};
			$.ajax({
				url : "lms/myExamShell.action",
				type : "post",
				data : data,
				success : function(s) {
					var a = eval("(" + s + ")");
					$("#imgsubmit").hide();
					if (a.sucess == "sucess") {
						//var reg = new RegExp("</br>", "g"); //创建正则RegExp对象 
						//var newstr = a.result.replace(reg, "\r\n");
						//var newstr2 = a.revalue.replace(reg, "\r\n");
						//$("#trainresult").html(newstr);
						//$("#trainanswer").html(newstr2);
						$("#trainbutton").html("再次提交");
					}
					else
					{
						alert(a.msg);
					}
				}
			});
		}
		</c:forEach>
	}
	function submituseranswer() {
		<c:forEach items="${tlist}" var="train" varStatus="status">
		if ("${status.count}" == currentPage) {
			var examId = parseInt("${exam.id}");
			var trainId = parseInt("${train.id}");
			var useranswer = $("#editor").html();
			var data = {
				examId : examId,
				trainId : trainId,
				useranswer : useranswer
			};
			$.ajax({
				url : "lms/submituseranswer.action",
				type : "post",
				data : data,
				success : function(s) {
					var a = eval("(" + s + ")");
					if (a.sucess == "sucess") {
						alert("提交成功");
					}
				}
			});
		}
		</c:forEach>
	}
	function createServer() {
		$("#imgenv").show();
		<c:forEach items="${tlist}" var="train" varStatus="status">
		if ("${status.count}" == currentPage) {
			var name = "${train.envname}";
			var examId = parseInt("${exam.id}");
			var trainId = "${train.id}";
			var data = {
				examId : examId,
				trainId : trainId,
				name : name
			};
			$.ajax({
				url : "lms/createExamServer.action",
				type : "post",
				data : data,
				success : function(s) {
					var a = eval("(" + s + ")");
					$("#imgenv").hide();
					if (a.sucess == "sucess") {
						$("#hasenv").show();
						$("#trainjoin").hide();
						$("#ip").html(a.ip);
						$("#username").html(a.username);
						$("#password").html(a.password);
						$("#ssh").html(a.ssh);
					} else {
						$("#hasenv").hide();
						$("#trainjoin").show();
						alert("创建环境失败");
					}
				}
			});
		}
		</c:forEach>
	}
	function resetTrain(currentPage) {
		<c:forEach items="${tlist}" var="train" varStatus="status">
		if ("${status.count}" == currentPage) {
			var name = "${train.envname}";
			var examId = parseInt("${exam.id}");
			var trainId = parseInt("${train.id}");
			var data = {
				examId : examId,
				trainId : trainId,
				name : name
			};
			$.ajax({
				url : "lms/hasexamenv.action",
				type : "post",
				data : data,
				success : function(s) {
					var a = eval("(" + s + ")");
					if (a.sucess == "sucess") {
						$("#hasenv").show();
						$("#trainjoin").hide();
						$("#ip").html(a.ip);
						$("#username").html(a.username);
						$("#password").html(a.password);
						$("#ssh").html(a.ssh);
					} else {
						$("#hasenv").hide();
						if ("无" == "${train.envname}")
						{
							$("#trainjoin").hide();
						}
						else
						{
							$("#trainjoin").show();
						}
					}
					$("#editor").html(a.useranswer);
					$("#traincon").html(a.conContent);
					if (a.revalue && a.revalue.length > 0)
					{
						//var reg = new RegExp("</br>", "g"); //创建正则RegExp对象 
						//var newstr = a.result.replace(reg, "\r\n");
						//var newstr2 = a.revalue.replace(reg, "\r\n");
						//$("#trainresult").html(newstr);
						//$("#trainanswer").html(newstr2);
						$("#trainbutton").html("再次提交");
					}
					else
					{
						//$("#trainresult").html("");
						//$("#trainanswer").html("");
						$("#trainbutton").html("提交");
					}
				}
			});
			$("#trainname").attr("value","${train.name}");//html("实验名称：${train.name}");
			$("#traincode").attr("value","${train.codenum}");//html("实验名称：${train.name}");
			$("#trainprename").attr("value","${train.envname}");
			//$("#trainjoin").attr("href", "");
			//$("#traincon").html('${train.conContent}');
			//$("#trainanswer").html("${train.conAnswer}");
		}
		</c:forEach>
	}
    </script>
  </body>
</html>
