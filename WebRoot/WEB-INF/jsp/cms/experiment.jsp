<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <base href="<%=basePath%>">
  <meta charset="utf-8">
    
    
    <title>My JSP 'experiment.jsp' starting page</title>
    <!-- Bootstrap core CSS -->
<!-- <link href="css/bootstrap.min.css" rel="stylesheet"> -->


<!-- Custom styles for this template -->
<!-- <link href="tcss/train.css" rel="stylesheet"> -->


    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="tcss/inputtext/font-awesome.css" rel="stylesheet">
    <link href="tcss/experiment-style.css" rel="stylesheet">
    <script src="tjs/prettify.js"></script>
	<script src="tjs/js.js"></script>
	<script src="tjs/jquery/jquery.min.js" type="text/javascript"></script>
    <script src="tjs/jquery/jquery-migrate.min.js" type="text/javascript"></script>
    <script src="tjs/jquery/jquery-ui.min.js" type="text/javascript"></script>
    <script src="tjs/fileupload/tmpl.min.js" type="text/javascript"></script>
    <script src="tjs/fileupload/jquery.fileupload.min.js" type="text/javascript"></script>
    <script src="tjs/fileupload/jquery.fileupload-ui.min.js" type="text/javascript"></script>
    <script src="tjs/fileupload/jquery.fileupload-init.js" type="text/javascript"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
	<div>
    
    		<!-- 定义实验 -->
    		<div class='col-sm-4' >
                  <div class='box bordered-box blue-border box-nomargin'>
                    <div class='box-header blue-background'>
                      <div class='title'>
                       	 实验定义
                      </div>
                    </div>
                    <div class='box-content' style="height:100px;">
                    <div>
	                  <div style="float:left;text-align:right;margin-right:5px;width:20%;border:1px;font-size:14px;font-weight:bold;margin-top:2%;">名称</div>
	                  <div style="float:left;width:70%;margin-left:5px;"><input id="input_1" type="text" value="" style="width:100%;height:40px;margin-top:1.5%;"></div>
	                </div>
	                <div>
	                  <div style="float:left;text-align:right;margin-right:5px;width:20%;border:1px;font-size:14px;font-weight:bold;margin-top:2%;">编号</div>
	                  <div style="margin-bottom:1%;float:left;width:70%;margin-left:5px;"><input id="input_2" type="text" value="" style="width:100%;height:40px;margin-top:1.5%;"/></div>
	                </div>
                    </div>
                  </div>
                  </div>
                  <!-- 环境 -->
    		<div class='col-sm-4'style="clear:left;padding-top:15px;">
                  <div class='box bordered-box blue-border box-nomargin'>
                    <div class='box-header green-background'>
                      <div class='title'>
                       	 环境
                      </div>
                    </div>
                    <div class='box-content' style="height:50px;">
                    <div>
                  <div style="float:left;text-align:right;margin-right:5px;width:20%;border:1px;font-size:14px;font-weight:bold;margin-top:2%;">模板</div>
                  <div style="margin-bottom:1%;float:left;width:70%;margin-left:5px;">
                  	<select id="select" style="width:100%;height:40px;margin-top:1.5%;">
	                  	<option value="1">1</option>
	                  	<option value="2">2</option>
	                  	<option value="3">3</option>
                  	</select>
                  	
                  </div>
                  </div>
                  	</div>
                  </div>
                  
                  
                  </div>
    		<!-- 题目文本输入开头 -->
  				  <div class='col-sm-4'style="clear:left;padding-top:15px;">
                  <div class='box bordered-box blue-border box-nomargin'>
                    <div class='box-header red-background'>
                      <div class='title'>
                       	 题目
                      </div>
                    </div>
                    <div class='box-content' style="height:400px;">
                    <div>
                  <div style="float:left;text-align:right;margin-right:5px;width:20%;border:1px;font-size:14px;font-weight:bold;margin-top:2%;">内容</div>
                  <div style="float:left;width:70%;margin-bottom:2%;margin-top:1.5%;margin-left:5px;"><iframe width="100%" scrolling="no" height="372" frameborder="0"   src="input.html" ></iframe></div>
                  </div> 
                    </div>
                  </div>
                  
                </div>
               <!-- 结果 -->
    		<div class='col-sm-4'style="clear:left;padding-top:15px;">
                  <div class='box bordered-box blue-border box-nomargin'>
                    <div class='box-header orange-background'>
                      <div class='title'>
                       	 结果
                      </div>
                    </div>
                    <div class='box-content' style="height:130px;">
                    <div>
                  <div style="float:left;text-align:right;margin-right:5px;width:20%;border:1px;font-size:14px;font-weight:bold;margin-top:5%;">验证脚本</div>
                  
                  <div style="float:left;width:70%;margin-bottom:2%;margin-left:5px;">
                  <div class="box-content"style="display:inline-talbe;float:left;width:100%;margin-top:2%;">
                  <iframe width="100%" scrolling="yes"  frameborder="0"   src="fileupload.html" onload="this.height=84;var fdh=(this.Document?this.Document.body.scrollHeight:this.contentDocument.body.offsetHeight);this.height=(fdh>84?fdh:84)"></iframe>
                  </div>
                  </div>
                  </div>
                    </div>
                  </div>
                  
                  
                  </div>
                  
                  <!-- 成绩 -->
    			<div class='col-sm-4'style="clear:left;padding-top:15px;">
                  <div class='box bordered-box blue-border box-nomargin'>
                    <div class='box-header purple-background'>
                      <div class='title'>
                       	 成绩
                      </div>
                    </div>
                    <div class='box-content' style="height:285px;">
                    <div>
                  <div style="float:left;text-align:right;margin-right:5px;width:20%;border:1px;font-size:14px;font-weight:bold;margin-top:2%;">分值</div>
                  <div style="float:left;width:70%;margin-left:5px;"><input id="input_1" type="text" value="" style="margin-bottom:1%; width:8%;height:35px;margin-top:1.5%;"/></div>
                  </div>
                  
                  <div>
                  <div style="float:left;text-align:right;margin-right:5px;width:20%;border:1px;font-size:14px;font-weight:bold;margin-top:4%;">判分标准</div>
                  <div style="float:left;width:70%;margin-left:5px;">
                  <div class="box-content"style="display:inline-talbe;float:left;width:100%">
                  	<button class="btn btn-success" type="submit">
                         <i class="icon-plus"></i>
                    </button>
                    <br>
                    <div class="btn" id="notification1" style="margin-top:2%;">Classic</div>
                    <div class="btn" id="notification2" style="margin-top:2%;">Waits for close</div>
                    <div class="btn" id="notification3" style="margin-top:2%;">Classic</div>
                    <div class="btn" id="notification4" style="margin-top:2%;">Waits for close</div>
                  </div>
                  </div>
                  </div>
                 <div>
                  <div style="float:left;text-align:right;margin-right:5px;width:20%;border:1px;font-size:14px;font-weight:bold;margin-top:6%;">判分脚本</div>
                  
                  <div style="float:left;width:70%;margin-bottom:2%;margin-left:5px;margin-top:2%;">
                  <div class="box-content"style="display:inline-talbe;float:left;width:100%">
                  <iframe width="100%" scrolling="yes"  frameborder="0"   src="fileupload.html" onload="this.height=85;var fdh=(this.Document?this.Document.body.scrollHeight:this.contentDocument.body.offsetHeight);this.height=(fdh>85?fdh:85)"></iframe>
                  </div>
                  </div>
                  </div>
                    </div>
                  </div>
                  
                  
                  </div>
                  <!-- 答案 -->
    			 <div class='col-sm-4'style="clear:left;padding-top:15px;">
                  <div class='box bordered-box blue-border box-nomargin'>
                    <div class='box-header black-background'>
                      <div class='title'>
                       	 答案
                      </div>
                    </div>
                    <div class='box-content' style="height:400px;">
                    <div class="l">
                  <div style="float:left;text-align:right;margin-right:5px;width:20%;border:1px;font-size:14px;font-weight:bold;margin-top:2%;">内容</div>
                  <div style="float:left;width:70%;margin-bottom:2%;margin-top:1.5%;margin-left:5px;"><iframe width="100%" height="372" scrolling="no"  frameborder="0"   src="input.html" ></iframe></div>
                  </div>
                    </div>
                  </div>
                  
                </div>
                
                <div class="col-sm-4" style="margin-bottom:40px;clear:left;padding-top:15px;">
                
                <div>
                  <div style="float:left;text-align:right;margin-right:5px;width:50%;border:1px;font-size:14px;font-weight:bold;">
                  	<button class="btn btn-primary" type="submit" style="margin-right:20px;">
                        <i class="icon-save"></i>
                              Save
                    </button>
                  </div>
                  <div style="float:left;text-align:left;margin-right:5px;width:40%;border:1px;font-size:14px;font-weight:bold;">
                  <button class="btn" type="submit" style="">Cancel</button>
                  </div>
                 </div>
                 </div>
                 
         </div>    
    
  </body>
</html>
