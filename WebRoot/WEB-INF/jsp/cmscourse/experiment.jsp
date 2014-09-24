<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <base href="<%=basePath%>">
  <meta charset="utf-8">
    <title>定义实验</title>
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
	<link href="css/bootfineuploader.css" rel="stylesheet" type="text/css" />
	<script src="js/fineuploader.js"></script>
	<script src="js/common.js"></script>
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
                    <input type="hidden" id="vtrainid">
	                  <div style="float:left;text-align:right;margin-right:5px;width:20%;border:1px;font-size:14px;font-weight:bold;margin-top:2%;">名称</div>
	                  <div style="float:left;width:70%;margin-left:5px;"><input id="trainname" type="text" value="" style="width:100%;height:40px;margin-top:1.5%;"></div>
	                </div>
	                <div>
	                  <div style="float:left;text-align:right;margin-right:5px;width:20%;border:1px;font-size:14px;font-weight:bold;margin-top:2%;">编号</div>
	                  <div style="margin-bottom:1%;float:left;width:70%;margin-left:5px;"><input id="codenum" type="text" value="" style="width:100%;height:40px;margin-top:1.5%;"/></div>
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
                  	<select id="envname" style="width:100%;height:40px;margin-top:1.5%;">
	                  	<option value="创建虚拟机">创建虚拟机</option>
	                  	<option value="创建虚拟机2">创建虚拟机2</option>
	                  	<option value="创建虚拟机3">创建虚拟机3</option>
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
                  <div style="float:left;width:70%;margin-bottom:2%;margin-top:1.5%;margin-left:5px;"><iframe width="100%" scrolling="no" height="372" frameborder="0" id="conContent" src="input.html" ></iframe></div>
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
	                  <!-- <iframe width="100%" scrolling="yes"  frameborder="0"   src="fileupload.html" onload="this.height=84;var fdh=(this.Document?this.Document.body.scrollHeight:this.contentDocument.body.offsetHeight);this.height=(fdh>84?fdh:84)"></iframe> -->
	                  <div id="result-uploader"></div>
	                  <input type="hidden" id="conShell"/>
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
                  <div style="float:left;width:70%;margin-left:5px;"><input id="score" type="text" value="" style="margin-bottom:1%; width:8%;height:35px;margin-top:1.5%;"/></div>
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
                  <div style="float:left;width:70%;margin-bottom:2%;margin-top:1.5%;margin-left:5px;"><iframe width="100%" height="372" scrolling="no"  frameborder="0" id="conAnswer" src="input.html" ></iframe></div>
                  </div>
                    </div>
                  </div>
                </div>
                <div class="col-sm-4" style="margin-bottom:40px;clear:left;padding-top:15px;">
                <div>
                  <div style="float:left;text-align:right;margin-right:5px;width:50%;border:1px;font-size:14px;font-weight:bold;">
                  	<button id="savebutton" class="btn btn-primary" type="button" style="margin-right:20px;" onclick="savetrain();">
                        <i class="icon-save"></i>保存
                    </button>
                  </div>
                  <div style="float:left;text-align:right;margin-right:5px;width:50%;border:1px;font-size:14px;font-weight:bold;">
                  	<button id="editbutton" class="btn btn-primary" type="button" style="margin-right:20px;" onclick="updatetrain();">
                        <i class="icon-edit"></i>编辑
                    </button>
                  </div>
                  <div style="float:left;text-align:left;margin-right:5px;width:40%;border:1px;font-size:14px;font-weight:bold;">
                  <button class="btn" type="submit" style="" onclick="hidetrain();">取消</button>
                  </div>
                 </div>
                 </div>
         </div>    
         <script>
    	$(function() {
    		createUploader();
    		
		});
    	function createUploader() { 
    		var uploader = new qq.FineUploader({ 
    	    	element: document.getElementById('result-uploader'), 
    	    	request: { 
    	    	endpoint: 'cms/uploadtrain.action' 
    	    	}, 
    	    	text: { 
    	    	uploadButton: '<button class="btn btn-warning"><i class="icon-upload"></i>上传</button>' 
    	    	},   
    	    	validation:{
        			allowedExtensions: ['sh']
        		},
    	    	template: 
    	    		 '<div class="qq-uploader">' +
    	    		  '<pre class="qq-upload-drop-area"><span>{dragZoneText}</span></pre>' +
    	    		  '<div class="qq-upload-button btn btn-success" style="width: auto;">{uploadButtonText}</div>' +
    	    		  '<span class="qq-drop-processing" style="display:none"><span>{dropProcessingText}</span>'+
    	    		  '<span class="qq-drop-processing-spinner"></span></span>' +
    	    		  '<ul class="qq-upload-list" style="margin-top: 10px; text-align: center;"></ul>' +
    	    		  '</div>', 
    	    	classes: { 
    	    	success: 'alert alert-success', 
    	    	fail: 'alert alert-error' 
    	    	}, 
    	    	callbacks:{
    	    		onComplete: function(id,  fileName,  responseJSON){		
    	    			if (responseJSON.success == "true")
    	    			{
    	    				//alert(responseJSON.imgpath);
    	    				$("#conShell").attr("value",responseJSON.shell);
    	    			}
    	    		}
    	    	},
    	    	debug: true 
    	    	}); 
    	}
    	function inittrain(id,name,codenum,envname,conContent,conShell,conAnswer,score,scoretag)
    	{
    		$("#vtrainid").attr("value",id);
    		$("#trainname").attr("value",name);
    		$("#codenum").attr("value",codenum);
    		
    		$("#envname").attr("value",envname);
    		conContent = replaceTextarea2(conContent);
			$("#conContent").contents().find("#editor").html(conContent);
			//conContent = replaceTextarea1(conContent);
			$("#conShell").attr("value",conShell);
			conAnswer = replaceTextarea2(conAnswer);
			$("#conAnswer").contents().find("#editor").html(conAnswer);
			//conAnswer = replaceTextarea1(conAnswer);
			$("#score").attr("value",score);
			//var scoretag = "";
			$("#savebutton").hide();
			$("#editbutton").show();
    	}
    	function resettrain()
    	{
    		$("#vtrainid").attr("value","");
    		$("#trainname").attr("value","");
    		$("#codenum").attr("value","");
    		
    		$("#envname").attr("value","");
			$("#conContent").contents().find("#editor").html("");
			$("#conShell").attr("value","");
			$("#conAnswer").contents().find("#editor").html("");
			$("#score").attr("value","");
			$("#savebutton").show();
			$("#editbutton").hide();
    	}
    	function savetrain()
    	{
    		var sequenticalId = parseInt("${sequentialId}");
			var verticalId = parseInt("${verticalId}");
			var courseId = parseInt("${courseId}");
			
			var name = $("#trainname").val();
			var codenum = $("#codenum").val();
			if (isNull(name))	
			{
				alert("名称不能为空");
				return ;
			}
			if (isNull(codenum))	
			{
				alert("编号不能为空");
				return ;
			}
			var envname = $("#envname").val();
			var conContent = $("#conContent").contents().find("#editor").html();
			conContent = replaceTextarea1(conContent);
			var conShell = $("#conShell").val();
			var conAnswer = $("#conAnswer").contents().find("#editor").html();
			conAnswer = replaceTextarea1(conAnswer);
			var temp = $("#score").val();
			if (!isInteger(temp))
			{
				alert("分值必须是数字");
				return ;
			}
			var score = parseInt(temp);
			var scoretag = "";
			//alert("name --- "+name+" , "+codenum+"  ,  "+envname);
			//$('#editor').wysiwyg();
			var data = {name:name,codenum:codenum,envname:envname,conContent:conContent,conShell:conShell,conAnswer:conAnswer,score:score,scoretag:scoretag,courseId:courseId,verticalId:verticalId};
			$.ajax({
				url:"cms/createTrain.action",
				type:"post",
				data:data,
				success:function(s){
					var a=eval("("+s+")");	
					if (a.sucess=="sucess")
					{
						location.href = "cms/tottrain.action?courseId="+courseId+"&sequentialId="+sequenticalId+"&verticalId="+verticalId;
					}
					else
					{
						alert(a.msg);
					}
				}
			});
    	}
    	function updatetrain()
    	{
    		var sequenticalId = parseInt("${sequentialId}");
			var verticalId = parseInt("${verticalId}");
			var courseId = parseInt("${courseId}"); 
			
    		var trainId = parseInt($("#vtrainid").val());
			var name = $("#trainname").val();
			var codenum = $("#codenum").val();
			if (isNull(name))	
			{
				alert("名称不能为空");
				return ;
			}
			if (isNull(codenum))	
			{
				alert("编号不能为空");
				return ;
			}
			var envname = $("#envname").val();
			var conContent = $("#conContent").contents().find("#editor").html();
			conContent = replaceTextarea1(conContent);
			var conShell = $("#conShell").val();
			var conAnswer = $("#conAnswer").contents().find("#editor").html();
			conAnswer = replaceTextarea1(conAnswer);
			var temp = $("#score").val();
			if (!isInteger(temp))
			{
				alert("分值必须是数字");
				return ;
			}
			var score = parseInt(temp);
			var scoretag = "";
			//alert("name --- "+name+" , "+codenum+"  ,  "+envname);
			//$('#editor').wysiwyg();
			var data = {trainId:trainId,name:name,codenum:codenum,envname:envname,conContent:conContent,conShell:conShell,conAnswer:conAnswer,score:score,scoretag:scoretag};
			$.ajax({
				url:"cms/updateTrain.action",
				type:"post",
				data:data,
				success:function(s){
					var a=eval("("+s+")");	
					if (a.sucess=="sucess")
					{
						location.href = "cms/tottrain.action?courseId="+courseId+"&sequentialId="+sequenticalId+"&verticalId="+verticalId;
					}
				}
			});
    	}
	</script>
  </body>
</html>
