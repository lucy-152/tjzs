<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>你好</title>
</head>
<body>
	
	<h1>你好，SpringMvc</h1>
	<h2>用户名：${USER.loginname}密码：${USER.password}</h2>
	<h1>${WELCOME}${USER.relname}</h1>
</body>
</html>