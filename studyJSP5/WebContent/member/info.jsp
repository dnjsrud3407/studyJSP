<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
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
<h1>member/info.jsp</h1>
<%
// 세션값 가져오기
String id = (String)session.getAttribute("id");
//MemberDAO의 mdao 객체 생성
MemberDAO mdao = new MemberDAO(); 
//MemberBean mb = getMember(id) 메서드 호출
MemberBean mb = mdao.getMember(id);


%>
아이디 : <%=mb.getId()%><br>
비밀번호 : <%=mb.getPass()%><br>
이름 : <%=mb.getName()%><br>
가입날짜 : <%=mb.getReg_date()%><br> 

</body>
</html>