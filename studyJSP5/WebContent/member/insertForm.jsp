<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입페이지</title>
</head>
<body>

<h1>jsp4_test/insertForm.jsp</h1>
<form action="insertPro.jsp" method="post" onsubmit="return enter()">
	아이디<input type="text" name="id" id="id"><br>
	비밀번호<input type="password" name="pass" id="pass"><br>
	이름<input type="text" name="name" id="name"><br>
	<input type="submit" value="회원가입">
</form>
</body>
</html>