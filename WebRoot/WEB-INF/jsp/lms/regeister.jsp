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
    <title>注册进入</title>
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
  </head>
  <body class='contrast-red fixed-header'>
    <jsp:include page="../common/header.jsp"></jsp:include>
    <div id='wrapper'>
      <section id=''>
      <div class="container cpading">
		<div class="row  wback nospace">
			<div class="col-sm-12 hptop">
				</br>
				<h3>
					<p>
						<a>欢迎！</a>
					</p>
					<p class="left40">注册以创建你在云考试平台的账户</p>
				</h3>

			</div>
		</div>
		<div class="row  wback nospace">
			<div class="col-sm-12">
			<hr>
			</div>
			<div class="clear"></div>
			<div class="col-sm-8">
				<form role="form">
					<div class="form-group">
						<a>电子邮件&nbsp;*</a>
						<div class="h5"></div>
						<input type="text" class="form-control" id="email"
							placeholder="文本输入">
						<div class="clear"></div>
						<a>密 码&nbsp;*</a>
						<div class="h5"></div>
						<input type="password" class="form-control" id="password"
							placeholder="文本输入">
						<div class="clear"></div>
						<a>全名&nbsp;*</a>
						<div class="h5"></div>
						<input type="text" class="form-control" id="name"
							placeholder="文本输入">
						<div class="clear"></div>
						<a>公开用户名&nbsp;*</a>
						<div class="h5"></div>
						<input type="text" class="form-control" id="username"
							placeholder="文本输入">
						<div class="clear"></div>
						<div class="row">
							<div class="col-sm-4">
							<a>最高教育程度</a>
							<div class="h5"></div>
							<select class="form-control" id="level_of_education">
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
							</select>
							</div>
							<div class="col-sm-4">
							<a>学校名称</a>
							<div class="h5"></div>
							<select class="form-control" id="school_name">
							</select>
							</div>
							<div class="col-sm-4">
							<a>班级</a>
							<div class="h5"></div>
							<input type="text" class="form-control" id="class_name"
							placeholder="文本输入">
							</div>
						</div>
						<div class="clear"></div>
						<div class="row">
							<div class="col-sm-4">
								<a>性别</a>
								<div class="h5"></div>
								<select class="form-control" id="gender">
									<option value="">--</option>
									<option value="m">男</option>
									<option value="f">女</option>
									<option value="o">其他</option>
								</select>
							</div>
							<div class="col-sm-4">
								<a>入学时间</a>
								<div class="h5"></div>
								<select class="form-control" id="admission_time">
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
								</select>
							</div>
							<div class="col-sm-4">
							</div>
						</div>
						
						<div class="clear"></div>
						<div class="row">
							<div class="col-sm-4">
							<a>出生年份</a>
							<div class="h5"></div>
							<select class="form-control" id="year_of_birth">
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
							</select>
							</div>
							<div class="col-sm-4">
								<a>专业名称</a>
								<div class="h5"></div>
								<input type="text" class="form-control" id="major"
								placeholder="文本输入">
							</div>
							<div class="col-sm-4">
							</div>
						</div>
						<div class="clear"></div>
						<a>邮寄地址</a>
						<div class="h5"></div>
						<textarea class="form-control" rows="3" id="mailing_address"></textarea>
						<div class="clear"></div>
						<a>请告诉我们您注册 云考试平台的原因</a>
						<div class="h5"></div>
						<textarea class="form-control" rows="3" id="goals"></textarea>
						<div class="clear"></div>
						<div class="clear"></div>
						<button type="button" class="btn btn-danger btn-lg btn-block"
							onclick="regeister();">注册我的云运考试平台账户</button>
					</div>
				</form>
			</div>
			<div class="col-sm-4">
				<a>已经注册过了？</a></br>
				<div class="clear"></div>
				<p>
					<a href="lms/tologin.action" class="hrefcolor">点击这里登录</a>
				</p>
				<div class="clear"></div>
				<a>需要帮助？</a></br>
				<div class="clear"></div>
				<p>
					寻找关于登录您的云考试平台账户的帮助？<a>查看帮助部分来获得常见问题的解答。</a>
				</p>
			</div>
		</div>
	</div>
      </section>
    </div>
    <div class="clear"></div><div class="clear"></div><div class="clear"></div>
    <jsp:include page="../common/footer.jsp"></jsp:include>
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
    <script src="js/holder.js"></script>
    <script>
    $(function() {
		$.ajax({
			url : "lms/getAllSchool.action",
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
				regeister();
			}
		});
	});

	function regeister() {
		var roleName = "学生";
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
		var major = $("#major").val();
		var class_name = $("#class_name").val();
		var admission_time = $("#admission_time").val();
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
			school_name:school_name,
			major:major,
			class_name:class_name,
			admission_time:admission_time
		};
		$.ajax({
			url : "lms/regeister.action",
			type : "post",
			data : data,
			success : function(s) {
				var a = eval("(" + s + ")");
				
				if (a.sucess == "sucess") {
					location.href="lms/getteamCategory.action";
				}
				else
				{
				 alert(a.msg);
				}
			}
		});
	}
    </script>
  </body>
</html>
