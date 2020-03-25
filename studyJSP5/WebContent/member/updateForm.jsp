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
<h1>member/updateForm.jsp</h1>
<%
//회원정보 조회
// 세션값 가져오기
String id = (String)session.getAttribute("id");

MemberDAO mdao = new MemberDAO();
MemberBean mb = mdao.getMember(id);
%>
<form action="updatePro.jsp" method="post">
	아이디<input type="text" name="id" value="<%=id %>" readonly><br>
	비밀번호<input type="password" name="pass"><br>
	이름<input type="text" name="name" value="<%=mb.getName() %>"><br>
	<input type="submit" value="회원정보수정">
</form>

</body>
</html>