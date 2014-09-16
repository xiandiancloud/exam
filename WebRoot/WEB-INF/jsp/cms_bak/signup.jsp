<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>注册 |edX Studio</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Sign In | edX Studio</title>
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

<script src="js/jquery-1.11.1.js"></script>
<script src="js/index.js"></script>
</head>

<body class="not-signedin view-signup hide-wip lang_zh-cn">
	<a class="nav-skip" href="#content">跳过本内容页</a>
	<!-- view -->
	<div class="wrapper wrapper-view">
		<jsp:include page="theader.jsp"></jsp:include>
		<div id="page-alert"></div>

		<div id="content">
			<div class="wrapper-content wrapper">
				<section class="content"> <header>
				<h1 class="title title-1">注册edX Studio</h1>
				<a href="cms/totlogin.action" class="action action-signin">如果您已经有Studio账号，请直接登录</a>
				</header>
				<p class="introduction">如果您已准备好创建在线课程，请在下面注册并创建您的第一个edX课程。</p>
				<article class="content-primary" role="main">
				<form id="register_form" method="post">
					<div id="register_error" name="register_error"
						class="message message-status message-status error"></div>
					<fieldset>
						<legend class="sr">注册edX Studio所需的信息</legend>
						<ol class="list-input">
							<li class="field text required" id="field-email"><label
								for="email">电子邮件地址</label> <input id="email" type="email"
								name="email" placeholder="e.g. jane.doe@gmail.com" /></li>
							<li class="field text required" id="field-name"><label
								for="name">全名</label> <input id="name" type="text" name="name"
								placeholder="e.g. Jane Doe" /></li>
							<li class="field text required" id="field-username"><label
								for="username">公开用户名</label> <input id="username" type="text"
								name="username" placeholder="e.g. janedoe" /> <span
								class="tip tip-stacked">这将会被用于您课程的公开讨论中以及我们edX101课程的支持论坛</span>
							</li>
							<li class="field text required" id="field-password"><label
								for="password">密码</label> <input id="password" type="password"
								name="password" /></li>
							<li class="field text required" id="field-school_name"><label
								for="school_name">学校名称</label><select class="short"
								id="school_name">
							</select></li>
							<li class="field text required" id="field-level_of_education"><label
								for="level_of_education">最高教育程度</label><select class="short"
								id="level_of_education">
									<option value="">--</option>
									<option value="p">博士</option>
									<option value="m">硕士</option>
									<option value="b">学士</option>
									<option value="a">专科</option>
									<option value="hs">高中</option>
									<option value="jhs">初中</option>
									<option value="el">小学</option>
									<option value="none">无</option>
									<option value="other">其他</option>
							</select></li>
							<li class="field text required" id="field-gender"><label
								for="gender">性别</label> <select class="short" id="gender">
									<option value="">--</option>
									<option value="m">男</option>
									<option value="f">女</option>
									<option value="o">其他</option>
							</select></li>
							<li class="field text required" id="field-year_of_birth"><label
								for="year_of_birth">出生年份</label> <select class=""
								id="year_of_birth">
									<option value="">--</option>
									<option value="2014">2014</option>
									<option value="2013">2013</option>
									<option value="2012">2012</option>
									<option value="2011">2011</option>
									<option value="2010">2010</option>
									<option value="2009">2009</option>
									<option value="2008">2008</option>
									<option value="2007">2007</option>
									<option value="2006">2006</option>
									<option value="2005">2005</option>
									<option value="2004">2004</option>
									<option value="2003">2003</option>
									<option value="2002">2002</option>
									<option value="2001">2001</option>
									<option value="2000">2000</option>
									<option value="1999">1999</option>
									<option value="1998">1998</option>
									<option value="1997">1997</option>
									<option value="1996">1996</option>
									<option value="1995">1995</option>
									<option value="1994">1994</option>
									<option value="1993">1993</option>
									<option value="1992">1992</option>
									<option value="1991">1991</option>
									<option value="1990">1990</option>
									<option value="1989">1989</option>
									<option value="1988">1988</option>
									<option value="1987">1987</option>
									<option value="1986">1986</option>
									<option value="1985">1985</option>
									<option value="1984">1984</option>
									<option value="1983">1983</option>
									<option value="1982">1982</option>
									<option value="1981">1981</option>
									<option value="1980">1980</option>
									<option value="1979">1979</option>
									<option value="1978">1978</option>
									<option value="1977">1977</option>
									<option value="1976">1976</option>
									<option value="1975">1975</option>
									<option value="1974">1974</option>
									<option value="1973">1973</option>
									<option value="1972">1972</option>
									<option value="1971">1971</option>
									<option value="1970">1970</option>
									<option value="1969">1969</option>
									<option value="1968">1968</option>
									<option value="1967">1967</option>
									<option value="1966">1966</option>
									<option value="1965">1965</option>
									<option value="1964">1964</option>
									<option value="1963">1963</option>
									<option value="1962">1962</option>
									<option value="1961">1961</option>
									<option value="1960">1960</option>
									<option value="1959">1959</option>
									<option value="1958">1958</option>
									<option value="1957">1957</option>
									<option value="1956">1956</option>
									<option value="1955">1955</option>
									<option value="1954">1954</option>
									<option value="1953">1953</option>
									<option value="1952">1952</option>
									<option value="1951">1951</option>
									<option value="1950">1950</option>
									<option value="1949">1949</option>
									<option value="1948">1948</option>
									<option value="1947">1947</option>
									<option value="1946">1946</option>
									<option value="1945">1945</option>
									<option value="1944">1944</option>
									<option value="1943">1943</option>
									<option value="1942">1942</option>
									<option value="1941">1941</option>
									<option value="1940">1940</option>
									<option value="1939">1939</option>
									<option value="1938">1938</option>
									<option value="1937">1937</option>
									<option value="1936">1936</option>
									<option value="1935">1935</option>
									<option value="1934">1934</option>
									<option value="1933">1933</option>
									<option value="1932">1932</option>
									<option value="1931">1931</option>
									<option value="1930">1930</option>
									<option value="1929">1929</option>
									<option value="1928">1928</option>
									<option value="1927">1927</option>
									<option value="1926">1926</option>
									<option value="1925">1925</option>
									<option value="1924">1924</option>
									<option value="1923">1923</option>
									<option value="1922">1922</option>
									<option value="1921">1921</option>
									<option value="1920">1920</option>
									<option value="1919">1919</option>
									<option value="1918">1918</option>
									<option value="1917">1917</option>
									<option value="1916">1916</option>
									<option value="1915">1915</option>
									<option value="1914">1914</option>
									<option value="1913">1913</option>
									<option value="1912">1912</option>
									<option value="1911">1911</option>
									<option value="1910">1910</option>
									<option value="1909">1909</option>
									<option value="1908">1908</option>
									<option value="1907">1907</option>
									<option value="1906">1906</option>
									<option value="1905">1905</option>
									<option value="1904">1904</option>
									<option value="1903">1903</option>
									<option value="1902">1902</option>
									<option value="1901">1901</option>
									<option value="1900">1900</option>
									<option value="1899">1899</option>
									<option value="1898">1898</option>
									<option value="1897">1897</option>
									<option value="1896">1896</option>
									<option value="1895">1895</option>
							</select></li>
							<li class="field text required" id="field-mailing_address"><label
								for="mailing_address">邮寄地址</label> <textarea class="" rows="3"
									id="mailing_address"></textarea></li>
							<li class="field text required" id="field-goals"><label
								for="goals">请告诉我们您注册 Your Platform Name Here的原因</label> <textarea
									class="" rows="3" id="goals"></textarea></li>
							<!-- 							<li class="field-group">
								<div class="field text" id="field-location">
									<label for="location">您的位置</label> <input class="short"
										id="location" type="text" name="location" />
								</div>
								<div class="field text" id="field-language">
									<label for="language">常用语言</label> <input class="short"
										id="language" type="text" name="language" />
								</div>
							</li>
							<li class="field checkbox required" id="field-tos"><input
								id="tos" name="terms_of_service" type="checkbox" value="true" />
								<label for="tos"> 我同意<a data-rel="edx.org" href="#">服务条约</a>
							</label>
							</li> -->
						</ol>
					</fieldset>

					<div class="form-actions">
						<button type="button" class="action action-primary"
							onclick="tregeister();">创建我的账号 &amp;开始创建课程</button>
					</div>

					<!-- no honor code for CMS, but need it because we're using the lms student object -->
					<input name="honor_code" type="checkbox" value="true"
						checked="true" hidden="true">
				</form>
				</article> <aside class="content-supplementary" role="complimentary">
				<h2 class="sr">关于Studio的常见问题</h2>

				<div class="bit">
					<h3 class="title-3">Studio是为谁服务的？</h3>
					<p>Studio面向任何希望使用全球化edX平台创建在线课程的用户，这些用户通常是院系教师、助教及教学技术小组。</p>
				</div>

				<div class="bit">
					<h3 class="title-3">在Studio创建课程需要掌握哪些技术？</h3>
					<p>对几乎所有熟悉网上编辑环境(例如WordPress，Moodle)的人而言，Studio都是很容易使用的。它无需任何编程知识，不过拥有技术背景会对使用一些高级特性有所帮助。我们会一如既往地为您提供帮助，不要犹豫赶快加入吧。</p>
				</div>

				<div class="bit">
					<h3 class="title-3">我以前从来没创建过在线课程，可以帮帮我吗？</h3>
					<p>当然。我们创建了一个在线课程：edX101，它介绍了一些创建在线课程的最佳实践：从拍摄视频，创建练习到开展在线教学的基础。另外，我们会尽力提供所需帮助，需要时请随时给我们留言。</p>
				</div>
				</aside> </section>
			</div>

		</div>

		<jsp:include page="tfooter.jsp"></jsp:include>

	</div>

	<script>
		$(function() {
			$.ajax({
				url : "cms/getAllSchool.action",
				type : "post",
				success : function(s) {
					var a = eval("(" + s + ")");
					var tmp = '<option value="">--</option>';
					var row = a.rows;
					for ( var i = 0; i < row.length; i++) {
						var school = row[i];
						var name = school.name;
						tmp += '<option value='+name+'>'+name+'</option>';
					}
					$("#school_name").html(tmp);
				}
			});
			$('input').keypress(function(e) {
				var key = e.which;
				if (key == 13) {
					tregeister();
				}
			});
		});

		function tregeister() {
			var roleName = "老师";
			var email = $("#email").val();
			var password = $("#password").val();
			var username = $("#username").val();
			var name = $("#name").val();
			var gender = $("#gender").val();
			var mailing_address = $("#mailing_address").val();
			var year_of_birth = $("#year_of_birth").val();
			var level_of_education = $("#level_of_education").val();
			var goals = $("#goals").val();
			var school_name = $("#school_name").val();
			var data = {
				roleName : roleName,
				email : email,
				password : password,
				username : username,
				name : name,
				gender : gender,
				mailing_address : mailing_address,
				year_of_birth : year_of_birth,
				level_of_education : level_of_education,
				goals : goals,
				school_name:school_name
			};
			$.ajax({
				url : "cms/tregeister.action",
				type : "post",
				data : data,
				success : function(s) {
					var a = eval("(" + s + ")");

					if (a.sucess == "sucess") {
						location.href = "cms/totcourselist.action";
					} else {
						alert(a.msg);
					}
				}
			});
		}
	</script>
</body>
</html>
