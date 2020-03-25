<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
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
<h1>member/updatePro.jsp</h1>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	//MemberBean 객체 생성 - 파라미터로 id, pass, name 값 저장
	MemberBean mb = new MemberBean();
	mb.setId(id);
	mb.setPass(pass);
	mb.setName(name);
	//MemberDAO mdao 객체 생성
	MemberDAO mdao = new MemberDAO(); 
	//int check = userCheck(id, pass) 호출
	int check = mdao.userCheck(id, pass);
	//check == 1인 경우    
	if(check == 1){
		mdao.updateMember(mb);
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