<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Timestamp"%>
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
<h1>jsp5/writePro.jsp</h1>
<%
//한글처리
	request.setCharacterEncoding("utf-8");
	
	String name = request.getParameter("name");
	String pass = request.getParameter("pass");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	//num구하기, readcount = 0, date는 현시스템 날짜
	BoardBean bb = new BoardBean();
	BoardDAO bdao = new BoardDAO(); 
	
	bb.setName(name);
	bb.setPass(pass);
	bb.setSubject(subject);
	bb.setContent(content);
	int readcount = 0;
	bb.setReadcount(readcount);

	bdao.insertBoard(bb);
%>
<script type="text/javascript">
	alert('글쓰기성공');
	location.href="list.jsp";
</script>
</body>
</html>















