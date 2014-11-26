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
	<link href="css/fineuploader.css" rel="stylesheet" type="text/css" />
	<script src="js/fineuploader.js"></script>
	<script src="js/common.js"></script>
	
	<style>
	.right{float:right;}
	.btn{height:30px;float:left;}
	.qq-upload-button {
    	height:30px;
    	/* margin-right: 230px; */
	}
	.qq-upload-button-hover {
	    background: none;
	}
	.qq-upload-list {
    margin: 0px;
    padding:0px;
    list-style: none;
    width: 300px;
	}
	.qq-upload-list li {
	    margin: 0;
	     margin-bottom:5px;
	    padding: 9px;
	    line-height: 15px;
	    font-size: 16px;
	    background-color: #FFF0BD;
	}
	.dhltext2{width: 100px;}
	.dhlselect2
 {
height: 100%;
width: 100px;
min-width: 100px;
padding: 10px;
border-radius: 3px;
border: 1px solid #b2b2b2;
text-overflow: ellipsis;
-webkit-appearance: menulist;
box-sizing: border-box;
align-items: center;
border: 1px solid;
border-image-source: initial;
border-image-slice: initial;
border-image-width: initial;
border-image-outset: initial;
border-image-repeat: initial;
white-space: pre;
-webkit-rtl-ordering: logical;
cursor: default;

-webkit-box-sizing: border-box;
-moz-box-sizing: border-box;
box-sizing: border-box;
background-color: #f2f2f2;
background-image: -webkit-linear-gradient(#f2f2f2,#fff);
background-image: linear-gradient(#f2f2f2,#fff);
border: 1px solid #b2b2b2;
border-radius: 2px;
background-color: #f2f2f2;
box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
color: #4c4c4c;
outline: 0;
}
.dhlselect2:focus
{background-color:#fffcf1;
background-image:-webkit-linear-gradient(#fffcf1,#fffefd);
background-image:linear-gradient(#fffcf1,#fffefd);
outline:0}
	.dhlalert {
	width:600px;
  padding: 15px;
  margin-bottom: 20px;
  border: 1px solid transparent;
  border-radius: 4px; }
  .dhlalert h4 {
    margin-top: 0;
    color: inherit; }
  .dhlalert .dhlalert-link {
    font-weight: bold; }
  .dhlalert > p,
  .dhlalert > ul {
    margin-bottom: 0; }
  .dhlalert > p + p {
    margin-top: 5px; }

.dhlalert-success {
width:600px;
  background-color: #dff0d8;
  border-color: #d6e9c6;
  color: #468847; }
  .dhlalert-success hr {
    border-top-color: #c9e2b3; }
  .dhlalert-success .alert-link {
    color: #356635; }
    
	.dhltd{text-align: center;width:180px;}
	.dhltd3{vertical-align:middle;}
	.dhltd2{height:60px;;width:600px;}
	</style>
  </head>
  <body>
   <input type="hidden" id="vtrainid">
   <div class="h10"></div>
   <table>
		<tr>
		<td class="dhltd">实验名称<font color="red">*</font></td>
		<td class="dhltd2"><input id="trainname" class="input setting-input dhltext" type="text"/></td>
		</tr>
		<tr>
		<td class="dhltd">实验编号<font color="red">*</font></td>
		<td class="dhltd2"><input id="codenum" class="input setting-input dhltext" type="text"/></td>
		</tr>
		<tr>
		<td class="dhltd">环境模板</td>
		<td class="dhltd2">
			<select id="envname" class="dhlselect">
				<option value="无">无</option>
               	<option value="创建虚拟机">创建虚拟机</option>
           	</select>
         &nbsp;&nbsp;&nbsp;&nbsp;
         <input type="radio" name="vm" id="nocreate" checked="checked" value="0">无
         &nbsp;&nbsp;&nbsp;&nbsp;
         <input type="radio" name="vm" id="yescreate" value="1">创建 	
  		</td>
		</tr>
		<tr>
		<td class="dhltd dhltd3">实验题目</td>
		<td><iframe width="600" scrolling="no" height="372" frameborder="0" id="conContent" src="input.html" ></iframe></td>
		</tr>
		<tr>
		<td class="dhltd">验证脚本</td>
		<td class="dhltd2"><!-- <input type="text" id="conShell" disabled="disabled" class="input setting-input dhltext"/> -->
	                  		<!-- <table><tr><td><div id="result-uploader"></div>	       </td></tr></table> -->
	                  	<div id="result-uploader"></div>	     
		</td>
		</tr>
		<tr><td></td>
		<td>
		<ul class="qq-upload-list" style="margin-top: -20px; text-align: left;" id="shelltext">
<!-- 			<li class=" dhlalert dhlalert-success">
				<span class="qq-upload-file">3.png</span>
				<a class="qq-upload-delete" href="#">删除</a>
				<input type="text" class="input setting-input dhltext"/>
			</li> -->
		</ul>
		
		</td>
		</tr>
		<tr>
		<td class="dhltd">分值<font color="red">*</font></td>
		<td class="dhltd2"><input id="score" type="text" class="input setting-input dhltext"/></td>
		</tr>
		<!-- <tr>
		<td class="dhltd">判分标准</td>
		<td class="dhltd2"><input id="scoretag" type="text" class="input setting-input dhltext"/><span>以，号分割字符</span></td>
		</tr> -->
		<tr>
		<td class="dhltd dhltd3">答案</td>
		<td><iframe width="600" height="372" scrolling="no"  frameborder="0" id="conAnswer" src="input.html" ></iframe>  </td>
		</tr>
   </table>
   <!-- <div class="tabs-wrapper">
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
							<div class="qq-upload-button right">
			                  	<button class="btn btn-success">
			                         <i class="icon-plus"></i>
			                    </button>
			                </div>
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
    </div> -->
      
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
    	    	/* validation:{
        			allowedExtensions: ['sh']
        		}, */
    	    	template: 
    	    		 '<div class="qq-uploader">' +
    	    		  '<pre class="qq-upload-drop-area"><span>{dragZoneText}</span></pre>' +
    	    		  '<div class="qq-upload-button btn btn-success" style="width: auto;">{uploadButtonText}</div>' +
    	    		  '<span class="qq-drop-processing" style="display:none"><span>{dropProcessingText}</span>'+
    	    		  '<span class="qq-drop-processing-spinner"></span></span>' +
    	    		  '<ul class="qq-upload-list" style="margin-top: 10px; text-align: center;display:none;"></ul>' +
    	    		  '</div>', 
    	    	classes: { 
    	    	success: 'dhlalert dhlalert-success', 
    	    	fail: 'dhlalert alert-error' 
    	    	}, 
    	    	callbacks:{
    	    		onComplete: function(id,  fileName,  responseJSON){		
    	    			if (responseJSON.success == "true")
    	    			{
    	    				insertshelltext(responseJSON.shell,fileName);
    	    			}
    	    		}
    	    	}
    	    	}); 
    	}
    	function insertshelltext(path,fileName)
    	{
    		$.ajax({
				url:"cms/getEnvironment.action",
				type:"post",
				success:function(s){
					var a=eval("("+s+")");	
					
					var row = a.rows;
					var opttmp = '';
					for ( var i = 0; i < row.length; i++) {
						var category = row[i];
						var name = category.name;
						opttmp += '<option value="'+name+'">'+name+'</option>';
					}
					
					//插入脚本元素
					var tmp = '<li class=" dhlalert dhlalert-success">'+
						'<input type="hidden" class="one" value="'+path+'"/>'+
						'<span class="qq-upload-file four">'+fileName+'</span>'+
		    			'<a>环境：</a>&nbsp;<select class="dhlselect2 two">'+opttmp+
		               	'</select>'+
						'&nbsp;<a>参数：</a>&nbsp;<input type="text" class="input setting-input dhltext2 three"/>'+
						'&nbsp;<a>判分：</a>&nbsp;<input type="text" class="input setting-input dhltext2 five"/>'+
						'&nbsp;&nbsp;&nbsp;&nbsp;<a class="qq-upload-delete" href="javascript:void(0);" onclick="removeshelltext(this);">删除</a>'+
					'</li>';
					$("#shelltext").append(tmp);
					
				}
			});
    	}
    	
    	function resetshelltext(extlist)
    	{
    		$.ajax({
				url:"cms/getEnvironment.action",
				type:"post",
				success:function(s){
					var a=eval("("+s+")");	
					
					//插入脚本元素
					var html="";
					for (var i = 0; i < extlist.length; i++) {  
						
						var row = a.rows;
						var opttmp = '';
						for ( var j = 0; j < row.length; j++) {
							var category = row[j];
							var name = category.name;
							if (extlist[i]['devinfo'] == name)
							{
								opttmp += '<option value="'+name+'" selected="selected">'+name+'</option>';
							}
							else
							{
								opttmp += '<option value="'+name+'">'+name+'</option>';
							}
						}
						
						var select = '<select class="dhlselect2 two">'+opttmp+'</select>';
						
						html+='<li class=" dhlalert dhlalert-success">'+
    					'<input type="hidden" class="one" value="'+extlist[i]['shellname']+'"/>'+
	    				'<span class="qq-upload-file four">'+extlist[i]['shellname']+'</span>'+
    	    			'<a>环境：</a>&nbsp;'+select+
	    				'&nbsp;<a>参数：</a>&nbsp;<input type="text" class="input setting-input dhltext2 three" value="'+extlist[i]['shellparameter']+'"/>'+
	    				'&nbsp;<a>判分：</a>&nbsp;<input type="text" class="input setting-input dhltext2 five" value="'+extlist[i]['scoretag']+'"/>'+
	    				'&nbsp;&nbsp;&nbsp;&nbsp;<a class="qq-upload-delete" href="javascript:void(0);" onclick="removeshelltext(this);">删除</a>'+
    					'</li>';
						
					}
					$("#shelltext").html(html);
					
				}
			});
    	}
    	
    	function removeshelltext(ele)
    	{
    		$(ele).parent().remove();
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
					//if (a.sucess=="sucess")
					{
						$("#vtrainid").attr("value",id);
			    		$("#trainname").attr("value",a.basiclist.name);
			    		$("#codenum").attr("value",a.basiclist.codenum);
			    		
			    		$("#envname").attr("value",a.basiclist.envname);
			    		conContent = replaceTextarea2(a.basiclist.conContent);
						$("#conContent").contents().find("#editor").html(conContent);
						//conContent = replaceTextarea1(conContent);
						conAnswer = replaceTextarea2(a.basiclist.conAnswer);
						$("#conAnswer").contents().find("#editor").html(conAnswer);
						//conAnswer = replaceTextarea1(conAnswer);
						$("#score").attr("value",a.basiclist.score);
						//$("#scoretag").attr("value",a.basiclist.scoretag);
						
						if (a.extlist)
						{	
							resetshelltext(a.extlist);
							/* var html="";
							for (var i = 0; i < a.extlist.length; i++) {   
								html+='<li class=" dhlalert dhlalert-success">'+
    	    					'<input type="hidden" class="one" value="'+a.extlist[i]['shellname']+'"/>'+
	    	    				'<span class="qq-upload-file four">'+a.extlist[i]['shellname']+'</span>'+
		    	    			'<a>环境：</a>&nbsp;<select class="dhlselect2 two">'+
		    	               	'</select>'+
	    	    				'&nbsp;<a>参数：</a>&nbsp;<input type="text" class="input setting-input dhltext2 three" value="'+a.extlist[i]['shellparameter']+'"/>'+
	    	    				'&nbsp;&nbsp;&nbsp;&nbsp;<a class="qq-upload-delete" href="javascript:void(0);" onclick="removeshelltext(this);">删除</a>'+
    	    					'</li>';
							}
							$("#shelltext").html(html); */
						}
					}
				}
			});
    		
    	}
    	/* function inittrain(id,name,codenum,envname,conContent,conAnswer,score,scoretag)
    	{
    		$("#vtrainid").attr("value",id);
    		$("#trainname").attr("value",name);
    		$("#codenum").attr("value",codenum);
    		
    		$("#envname").attr("value",envname);
    		conContent = replaceTextarea2(conContent);
			$("#conContent").contents().find("#editor").html(conContent);
			conAnswer = replaceTextarea2(conAnswer);
			$("#conAnswer").contents().find("#editor").html(conAnswer);
			$("#score").attr("value",score);
			$("#scoretag").attr("value",scoretag);
			$("#savebutton").hide();
			$("#editbutton").show();
    	} */
    	function resettrain()
    	{
    		$("#vtrainid").attr("value","");
    		$("#trainname").attr("value","");
    		$("#codenum").attr("value","");
    		
    		$("#envname").attr("value","");
			$("#conContent").contents().find("#editor").html("");
			/* $("#conShell").attr("value",""); */
			$("#conAnswer").contents().find("#editor").html("");
			$("#score").attr("value","");
			//$("#scoretag").attr("value","");
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
			/* var conShell = $("#conShell").val(); */
			var conAnswer = $("#conAnswer").contents().find("#editor").html();
			conAnswer = replaceTextarea1(conAnswer);
			var temp = $("#score").val();
			if (!isInteger(temp))
			{
				alert("分值必须是数字");
				return ;
			}
			var score = parseInt(temp);
			//var scoretag = $("#scoretag").val();
			//$('#editor').wysiwyg();
			var prodata = {name:name,codenum:codenum,envname:envname,conContent:conContent,conAnswer:conAnswer,score:score,examId:examId,everticalId:verticalId};
			
			var mo ="[";
			$("#shelltext > li").each(function(i){  
	  		    mo += "{";					
				mo += "shellpath:'"+$(this).children(".one").val()+"',";		
				mo += "devinfo:'"+$(this).children(".two").val()+"',";		
				mo += "shellparameter:'"+$(this).children(".three").val()+"',";
				mo += "shellname:'"+$(this).children(".four").html()+"',";
				mo += "scoretag:'"+$(this).children(".five").val()+"',";
				mo += "},";	
  			});  
			if (mo.length > 1)
			{
				mo = mo.substring(0,mo.length-1);
			}
			mo += "]";
			var shelllist=eval('('+mo+')'); 	
			
			var data =  [{
				"basiclist":prodata
				,"shelllist":shelllist
				}];
			
			$.ajax({
				url:"cms/createExamTrain.action",
				type:"post",
				datatype:"json",
                contentType: "application/json; charset=utf-8",
				data : JSON.stringify(data),
				success:function(s){
					var a=eval("("+s+")");	
					if (a.sucess=="sucess")
					{
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
			/* var conShell = $("#conShell").val(); */
			var conAnswer = $("#conAnswer").contents().find("#editor").html();
			conAnswer = replaceTextarea1(conAnswer);
			var temp = $("#score").val();
			if (!isInteger(temp))
			{
				alert("分值必须是数字");
				return ;
			}
			var score = parseInt(temp);
			//var scoretag = $("#scoretag").val();
			//$('#editor').wysiwyg();
			var prodata = {trainId:trainId,name:name,codenum:codenum,envname:envname,conContent:conContent,conAnswer:conAnswer,score:score};
			
			var mo ="[";
			$("#shelltext > li").each(function(i){  
	  		    mo += "{";					
				mo += "shellpath:'"+$(this).children(".one").val()+"',";		
				mo += "devinfo:'"+$(this).children(".two").val()+"',";		
				mo += "shellparameter:'"+$(this).children(".three").val()+"',";
				mo += "shellname:'"+$(this).children(".four").html()+"',";
				mo += "scoretag:'"+$(this).children(".five").val()+"'";
				mo += "},";	
  			});  
			if (mo.length > 1)
			{
				mo = mo.substring(0,mo.length-1);
			}
			mo += "]";
			var shelllist=eval('('+mo+')'); 	
			
			var data =  [{
				"basiclist":prodata
				,"shelllist":shelllist
				}];
			
			$.ajax({
				url:"cms/updateTrain.action",
				type:"post",
				datatype:"json",
                contentType: "application/json; charset=utf-8",
				data : JSON.stringify(data),
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
