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
	<!-- <link href="tcss/inputtext/font-awesome.css" rel="stylesheet">
    <link href="tcss/experiment-style1111.css" rel="stylesheet"> -->
    <!-- <script src="tjs/prettify.js"></script>
	<script src="tjs/js.js"></script>
	<script src="tjs/jquery/jquery.min.js" type="text/javascript"></script>
    <script src="tjs/jquery/jquery-migrate.min.js" type="text/javascript"></script>
    <script src="tjs/jquery/jquery-ui.min.js" type="text/javascript"></script>
    <script src="tjs/fileupload/tmpl.min.js" type="text/javascript"></script>
    <script src="tjs/fileupload/jquery.fileupload.min.js" type="text/javascript"></script>
    <script src="tjs/fileupload/jquery.fileupload-ui.min.js" type="text/javascript"></script>
    <script src="tjs/fileupload/jquery.fileupload-init.js" type="text/javascript"></script> -->
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<!-- <link href="css/fineuploader.css" rel="stylesheet" type="text/css" /> -->
	<script src="js/fineuploader.js"></script>
	<script src="js/common.js"></script>
	
	<style>
	.right{float:right;}
	.btn{height:45px;}
	.qq-upload-button {
    	height:45px;
    	margin-right: 130px;
	}
	.qq-upload-button-hover {
	    background: none;
	}
	</style>
  </head>
  <body>
   <input type="hidden" id="vtrainid">
   <div class="tabs-wrapper">
        <div class="component-tab" id="">
			<div class="wrapper-comp-settings basic_metadata_edit" data-metadata="">
			    <ul class="list-input settings-list">
				    <li class="field comp-setting-entry metadata_entry">
				        <div class="wrapper-comp-setting">
							<label class="label setting-label">实验名称</label>
							<input id="trainname" class="input setting-input" type="text" value=""/>
						</div>
				    </li>
				    <li class="field comp-setting-entry metadata_entry">
				        <div class="wrapper-comp-setting">
							<label class="label setting-label">实验编号</label>
							<input id="codenum" class="input setting-input" type="text" value=""/>
						</div>
				    </li>
				    <li class="field comp-setting-entry metadata_entry">
				        <div class="wrapper-comp-setting">
							<label class="label setting-label">环境模板</label>
							<select id="envname">
								<option value="无">无</option>
			                  	<option value="创建虚拟机">创建虚拟机</option>
		                  	</select>
						</div>
				    </li>
				    <li class="field comp-setting-entry metadata_entry">
				        <div class="wrapper-comp-setting">
							<label class="label setting-label">题目</label>
							<iframe width="600" scrolling="no" height="372" frameborder="0" id="conContent" src="input.html" ></iframe>
						</div>
				    </li>
				    <li class="field comp-setting-entry metadata_entry">
				        <div class="wrapper-comp-setting">
							<label class="label setting-label">验证脚本</label>
							<input type="text" id="conShell" disabled="disabled"/>
	                  		<div id="result-uploader" class="right"></div>	                 
						</div>
				    </li>
				    <li class="field comp-setting-entry metadata_entry">
				        <div class="wrapper-comp-setting">
							<label class="label setting-label">分值</label>
							<input id="score" type="text" value=""/>
						</div>
				    </li>
				    <li class="field comp-setting-entry metadata_entry">
				        <div class="wrapper-comp-setting">
							<label class="label setting-label">判分标准</label>
							<input id="scoretag" type="text" value=""/>
							<!-- <div class="qq-upload-button right">
			                  	<button class="btn btn-success">
			                         <i class="icon-plus"></i>
			                    </button>
			                </div> -->
			                <span>以，号分割字符</span>
						</div>
						
				    </li>
				    <li class="field comp-setting-entry metadata_entry">
				        <div class="wrapper-comp-setting">
							<label class="label setting-label">答案</label>
							<iframe width="600" height="372" scrolling="no"  frameborder="0" id="conAnswer" src="input.html" ></iframe>             
						</div>
				    </li>
			</ul>
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
    	    				//alert(responseJSON.imgpath);
    	    				$("#conShell").attr("value",responseJSON.shell);
    	    			}
    	    		}
    	    	}
    	    	}); 
    	}
    	function inittrainbyid(id)
    	{
    		$("#savebutton").hide();
			$("#editbutton").show();
    		var data={trainId:id};
 			$.ajax({
				url:"cms/getTrain.action",
				type:"post",
				data:data,
				success:function(s){
					var a=eval("("+s+")");	
					if (a.sucess=="sucess")
					{
						$("#vtrainid").attr("value",id);
			    		$("#trainname").attr("value",a.name);
			    		$("#codenum").attr("value",a.codenum);
			    		
			    		$("#envname").attr("value",a.envname);
			    		conContent = replaceTextarea2(a.conContent);
						$("#conContent").contents().find("#editor").html(conContent);
						//conContent = replaceTextarea1(conContent);
						$("#conShell").attr("value",a.conShell);
						conAnswer = replaceTextarea2(a.conAnswer);
						$("#conAnswer").contents().find("#editor").html(conAnswer);
						//conAnswer = replaceTextarea1(conAnswer);
						$("#score").attr("value",a.score);
						$("#scoretag").attr("value",a.scoretag);
					}
				}
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
			$("#scoretag").attr("value",scoretag);
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
			$("#scoretag").attr("value","");
			$("#savebutton").show();
			$("#editbutton").hide();
    	}
    	function savetrain()
    	{
    		//var sequenticalId = parseInt("${sequentialId}");
			var verticalId = parseInt("${verticalId}");
			var examId = parseInt("${examId}");
			
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
			var scoretag = $("#scoretag").val();
			//alert("name --- "+name+" , "+codenum+"  ,  "+envname);
			//$('#editor').wysiwyg();
			var data = {name:name,codenum:codenum,envname:envname,conContent:conContent,conShell:conShell,conAnswer:conAnswer,score:score,scoretag:scoretag,examId:examId,everticalId:verticalId};
			$.ajax({
				url:"lms/createExamTrain.action",
				type:"post",
				data:data,
				success:function(s){
					var a=eval("("+s+")");	
					if (a.sucess=="sucess")
					{
						//location.href = "cms/tottrain.action?courseId="+courseId+"&sequentialId="+sequenticalId+"&verticalId="+verticalId;
						location.reload();
					}
				}
			});
    	}
    	function updatetrain()
    	{
    		/* var sequenticalId = parseInt("${sequentialId}");
			var verticalId = parseInt("${verticalId}");
			var courseId = parseInt("${courseId}");  */
			var tid = $("#vtrainid").val();
			if (tid)
			{
			}
			else
			{
				savetrain();
				return;
			}
    		var trainId = parseInt(tid);
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
			var scoretag = $("#scoretag").val();
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
						//location.href = "cms/tottrain.action?courseId="+courseId+"&sequentialId="+sequenticalId+"&verticalId="+verticalId;
						location.reload();
					}
				}
			});
    	}
	</script>
  </body>
</html>
