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
<h1>member/loginPro.jsp</h1>
<%
 String id = request.getParameter("id");
 String pass = request.getParameter("pass");
 
// ------------------------------------------------------------------------
//MemberDAO mdao 객체생성
 MemberDAO mdao = new MemberDAO(); 
//int check = userCheck(id, pass) 메서드 호출
 int check = mdao.userCheck(id, pass);
 //check = 1이면
 if(check == 1){		 
	 session.setAttribute("id", id);
	 session.setAttribute("pass", pass);
	 response.sendRedirect("main.jsp");
 } else if(check == 0){
 %>
 <script type="text/javascript">
 alert("비밀번호 틀림");
 history.back();
 </script>
 <%
 } else if(check == -1){
 %>
 <script type="text/javascript">
 alert("아이디 없음");
 history.back();
 </script>
 <%
 }
 %>

</body>
</html>