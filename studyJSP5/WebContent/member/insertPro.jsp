<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Timestamp"%>
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
<%
request.setCharacterEncoding("utf-8");
//Form에서 회원정보 가져오기
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
//현재시간
Timestamp reg_date = new Timestamp(System.currentTimeMillis());

//파라미터 값을 저장해서 디비 작업하는 곳으로 전달
//패키지member MemberBean자바빈 파일 만들기
//MemberBean객체생성
MemberBean mb = new MemberBean();
//멤버변수에 set메서드호출 파라미터 값 저장
mb.setId(id);
mb.setPass(pass);
mb.setName(name);
mb.setReg_date(reg_date);


//패키지member MemberDAO자바빈 파일 만들기
//리턴값 없음 insertMember()메서드 만들기
//객체생성
MemberDAO mdao = new MemberDAO();
//메서드 호출
mdao.insertMember(mb);


%>
<script type="text/javascript">
	alert('회원가입성공');
	location.href="loginForm.jsp";
</script>
</body>
</html>