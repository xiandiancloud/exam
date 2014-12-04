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
<html lang="zh-cn"><!--<![endif]-->
  <head>
  	<base href="<%=basePath%>">
    <title>用户</title>
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
    
    <!-- / END - page related stylesheets [optional] -->
    <!-- / bootstrap [required] -->
    <link href="assets/stylesheets/bootstrap/bootstrap.css" media="all" rel="stylesheet" type="text/css" />
    <!-- / theme file [required] -->
    <link href="assets/stylesheets/dhllight-theme.css" media="all" id="color-settings-body-color" rel="stylesheet" type="text/css" />
    <!-- / coloring file [optional] (if you are going to use custom contrast color) -->
    <link href="assets/stylesheets/theme-colors.css" media="all" rel="stylesheet" type="text/css" />
    <!-- / demo file [not required!] -->
    <link href="assets/stylesheets/demo.css" media="all" rel="stylesheet" type="text/css" />
    <!--[if lt IE 9]>
      <script src="assets/javascripts/ie/html5shiv.js" type="text/javascript"></script>
      <script src="assets/javascripts/ie/respond.min.js" type="text/javascript"></script>
    <![endif]-->
    
     <link href="css/fineuploader.css" rel="stylesheet">
     
     <style>
      .qq-upload-button{
    	background: none;
    	border:0px;
    	list-style: none;
		}
      .qq-upload-button:hover {
		   background: none;
	  }
      </style>
  </head>
  <body class='contrast-blue fixed-header'>
    <jsp:include page="header.jsp"></jsp:include>
    <div id='wrapper'>
      <div id='main-nav-bg'></div>
      <jsp:include page="left.jsp"></jsp:include>
      <section id='content'>
        <div class='container'>
          <div class='row' id='content-wrapper'>
            <div class='col-xs-12'>
              <div class='row'>
                <div class='col-sm-12'>
                  <div class='page-header'>
                    <h1 class='pull-left'>
                      <i class='icon-cog'></i>
                      <span>用户管理</span>
                    </h1>
                  </div>
                </div>
              </div>
              <div class='row'>
              <div class='col-sm-12'>
                  <div class='box'>
  <!--                   <div class='box-header'>
                      <div class='title'>学校管理</div>
                    </div> -->
                    <div class='box-content'>
                      <div class='row'>
                        <div class='col-sm-2'>
                          <div id="bootstrapped-fine-uploader"></div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              
              <div class='row'>
                <div class='col-sm-12'>
                  <div class='box bordered-box blue-border' style='margin-bottom:0;'>
                    <div class='box-header blue-background'>
                      <div class='title'>所有用户</div>
                      <div class='actions'>
                        <a class="btn box-remove btn-xs btn-link" href="#"><i class='icon-remove'></i>
                        </a>
                        
                        <a class="btn box-collapse btn-xs btn-link" href="#"><i></i>
                        </a>
                      </div>
                    </div>
                    <div class='box-content box-no-padding'>
                      <div class='responsive-table'>
                        <div class='scrollable-area'>
                          <table class='table' style='margin-bottom:0;'>
                            <thead>
                              <tr>
                                <th>
                                  	名称
                                </th>
                                <th>
                                  	所属学校
                                </th>
                                <th></th>
                              </tr>
                            </thead>
                            <tbody>
	                            <c:forEach var="user" items="${userlist}">
		                            <tr>
	                                <td>${user.username}</td>
	                                <td>${user.schoolname}</td>
	                                <td>
	                                  <div class='text-center'>
	                                    <a class='btn btn-danger btn-xs' href='admin/deluser.action?userId=${user.id}'>
	                                      <i class='icon-remove'></i>
	                                    </a>
	                                  </div>
	                                </td>
	                              </tr>
								</c:forEach>
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
		 <jsp:include page="footer.jsp"></jsp:include>
        </div>
      </section>
    </div>
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
    
    <!-- / END - page related files and scripts [optional] -->
    <script src="js/common.js" type="text/javascript"></script>
        <script src="js/fineuploader.js"></script>
    <script>
	$(function() {
		createUploader();
	});
	function createUploader() { 
    	var uploader = new qq.FineUploader({ 
    	element: document.getElementById('bootstrapped-fine-uploader'), 
    	request: { 
    	endpoint: 'admin/uploaduser.action' 
    	}, 
    	text: { 
    	uploadButton: '<button class="btn btn-warning"><i class="icon-upload"></i>导入用户</button>' 
    	}, 
    	validation:{
    		allowedExtensions: ['csv'],
    		sizeLimit: 204800
    	},
    	template: 
    	'<div class="qq-uploader1122">' + 
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
    				alert("导入成功");
    				location.reload();
    			}
    		}
    	},
    	debug: true 
    	}); 
    	}
	function showdialog() {
		$('#myModal').modal({
			keyboard : false
		});
	}
	function addschool() {
		var name = $("#cname").val();
		if (isNull(name))	
		{					
			alert("名称不能为空");
			return ;
		}	
		var data = {				
			name : name
		};
		$.ajax({
			url : "admin/addschool.action",
			type : "post",
			data : data,
			success : function(s) {
				var a = eval("(" + s + ")");
				if (a.sucess == "sucess") {
					location.reload();
				}
				else
				alert(a.msg);
			}
		});
	}
    </script>
  </body>
</html>
