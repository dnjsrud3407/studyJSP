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
<h1>jsp5/rewritePro.jsp</h1>
<%
//한글처리
	request.setCharacterEncoding("utf-8");
	
	String name = request.getParameter("name");
	String pass = request.getParameter("pass");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	int num = Integer.parseInt(request.getParameter("num"));
	int re_ref = Integer.parseInt(request.getParameter("re_ref"));
	int re_lev = Integer.parseInt(request.getParameter("re_lev"));
	int re_seq = Integer.parseInt(request.getParameter("re_seq"));
	//num구하기, readcount = 0, date는 현시스템 날짜
	BoardBean bb = new BoardBean();
	BoardDAO bdao = new BoardDAO(); 
	
	bb.setNum(num);
	bb.setName(name);
	bb.setPass(pass);
	bb.setSubject(subject);
	bb.setContent(content);
	int readcount = 0;
	bb.setReadcount(readcount);
	bb.setRe_ref(re_ref);
	bb.setRe_lev(re_lev);
	bb.setRe_seq(re_seq);

	bdao.reInsertBoard(bb);
%>
<script type="text/javascript">
	alert('글쓰기성공');
	location.href="list.jsp";
</script>
</body>
</html>















