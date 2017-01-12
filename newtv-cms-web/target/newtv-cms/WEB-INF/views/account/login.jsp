<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ page import="org.apache.shiro.authc.ExcessiveAttemptsException"%>
<%@ page import="org.apache.shiro.authc.IncorrectCredentialsException"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>NewTV2.0-CMS管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%-- 
<link rel="stylesheet" href="${ctx}/static/dwz/themes/css/login.css"
	type="text/css" /> --%>

</head>
<style>
* {
	margin: 0;
	padding: 0;
}

body {
	background: #d1f1fc url(${ctx}/static/images/body_bg.jpg) no-repeat
		right 0;
	font: tahoma, Arial, Helvetica, sans-serif;
	text-align: center;
	overflow: auto;
}

img {
	border: 0
}

h1 {
	font-size: 200%;
	margin: 0
}

h2 {
	font-size: 130%;
	margin: 1em 0 .5em
}

h3 {
	font-size: 100%;
	margin: 1em 0 .5em
}

h4 {
	font-size: 90%;
	margin: 1em 0
}

p {
	margin: 0 0 1em 0
}

#login {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 500px;
	height: 270px;
	margin: -135px 0 0 -250px;
	background: url(${ctx}/static/images/login_area.jpg) no-repeat 0 0;
	text-align: left;
	z-index: 9001;
}

#shadow {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 500px;
	height: 270px;
	margin: -132px 0 0 -247px;
	z-index: 9000;
	filter: progid:DXImageTransform.Microsoft.alpha(opacity=50) progid:DXImageTransform.Microsoft.Blur(pixelradius=2);
	-moz-opacity: 0.5;
	opacity: .50;
	background-color: #777;
}

#about {
	position: absolute;
	bottom: 10px;
	left: 10px;
	cursor: pointer;
	font: 11px "Trebuchet MS";
	color: #5ab3f4;
}

#login h1 {
	margin-bottom: 10px;
	padding: 0px 0 0 10px;
	font: 22px/50px "微软雅黑", tahoma;
	text-indent: 60px;
	text-align: left;
}

#login form {
	height: 200px;
	padding-left: 170px;
	background: url(${ctx}/static/images/users.gif) no-repeat 20px 20px;
}

.error_message {
	color: #d00;
	font: 12px/2 "微软雅黑", tahoma;
}

#login form p {
	clear: both;
	margin: 5px 0;
}

#login form p img {
	vertical-align: middle;
}

#login form p label {
	width: 50px;
	display: inline-block;
	font: 12px/2 "微软雅黑", tahoma;
	color: #246bb3;
}

#login_ctr {
	text-indent: 58px;
}

#login form p .logintxt {
	font: 12px/16px tahoma;
	height: 20px;
	border: 1px solid #ccc;
}

#login form p input.logintxt {
	padding: 0 2px;
}

#login img {
	cursor: hand;
}

.w1 {
	width: 230px;
}

.w2 {
	width: 230px;
}

#copyright {
	width: 100%;
	position: absolute;
	left: 0;
	bottom: 0;
	border-top: 1px solid #87c8f7;
	font: 12px/2 "Trebuchet MS", arial;
	border-collapse: collapse;
}

#copyright td {
	padding-left: 10px;
	text-align: left;
}

#copyright th {
	width: 120px;
}

#copyright th a {
	font: normal 12px "Trebuchet MS", arial;
	padding-left: 20px;
	color: #000;
	text-decoration: none;
}
</style>
<body onKeyPress="EnterSumbit()"
	style="background:#d1f1fc url(${ctx}/static/images/body_bg.jpg) no-repeat right 0;">
	<div id="shadow" style="visibility: hidden;"></div>
	<div id="login">
		<h1 id='appTitle'>NewTv2.0-CMS管理系统 &nbsp;</h1>
		<form name="loginForm" id="loginForm" method="post"
			action="${ctx}/login">
			<%
				String error = (String) request
						.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
				if (error != null) {
			%>
			<div class="alert alert-error input-medium controls">
				<button class="close" data-dismiss="alert">×</button>
				<font style="color: red">登录失败，请重试.</font>
			</div>
			<%
				}
			%>
			<div id='loginbody'>
				<p class="error_message" id="error_message">&nbsp;</p>

				<p>
					<label for='username'>用户</label> <input type="text" name="username"
						id="username" class="logintxt w1" value="${username}" />
				</p>
				<p>
					<label for='password'>密码</label> <input type="password" name="password"
						id="password" class="logintxt w1" />
				</p>
				<!-- <p>
					&nbsp;&nbsp;<label class="checkbox" for="rememberMe"></label><input
						type="checkbox" id="rememberMe" name="rememberMe"> 记住我</input>
				</p> -->
				<p id="login_ctr">
					<input type="image" src="${ctx}/static/images/login_submit.png"  type="button"/>
				</p>
			</div>
			</form>
	</div>
    <script src="${ctx}/static/jquery/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script>
        if (top.location.href.indexOf("login") < 0)
            parent.location.href = "index.jsp";

        window.onload = function() {
            document.getElementById('shadow').style.visibility = 'visible';
            var user = document.getElementById('userId');
            if (user.value.length <= 0)
                user.focus();
            else
                document.getElementById('pass').focus();
        }

		$(document).ready(function() {
			$("#loginForm").validate();
		});
	</script>
</body>
</html>