<%@page import="bean.MemberDAO"%>
<%@page import="bean.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>beanPro1.jsp</h1>
<%
//name 파라미터 가져오기
request.setCharacterEncoding("utf-8");
String name = request.getParameter("name");

//여러개 값을 전달 하기 위해서 하나의 자바 파일에 담아서 전달을 시켜줌 => 자바빈
//패키지.자바파일이름  (=MemberDTO-Data Transfer Object)
//bean.MemberBean
//MemberBean 객체 생성해서 기억장소 할당
MemberBean mb = new MemberBean(); 
%>
<%-- <jsp:useBean id="mb3" class="bean.MemberBean"> --%>
<%-- </jsp:useBean> --%>
<%
//name저장 - > setName()메서드 호출
mb.setName(name);
System.out.println(mb.getName());
%>
<%-- <jsp:setProperty property="*" name="mb3"/> --%>
<%
//db작업하는 곳으로 전달을 하려면 MemberDAO 
//패키지.자바파일이름  (=MemberDAO)
//bean.MemberDAO - MemberDAO 객체 생성
MemberDAO mdao = new MemberDAO();
//MemberDAO에 insertMember(값을 전달받기)함수
mdao.insertMember(mb);

%>
</body>
</html>




























































