<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
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
<title>Insert title here</title>
</head>
<body>
<h1>board/deleteForm.jsp</h1>
<%
//num 파라미터 가져오기
int num = Integer.parseInt(request.getParameter("num"));
%>
<form action="deletePro.jsp" method="post">
	<input type="hidden" name="num" value="<%=num %>">
	<table border="1">
	<tr>
		<td>비밀번호</td><td><input type="password" name="pass"></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="삭제하기"></td>
	</tr>
</table>
</form>

</body>
</html>