<%@page import="bean.MemberDAO2"%>
<%@page import="bean.MemberBean2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>beanPro2.jsp</h1>
<%
request.setCharacterEncoding("utf-8");
String name = request.getParameter("name");
String id = request.getParameter("id");
int age = Integer.parseInt(request.getParameter("age"));

MemberBean2 mb = new MemberBean2();
//code22 :액션태그 사용하기 - code19와 동일
%>
<%-- <jsp:useBean id="mb2" class="bean.MemberBean2"> --%>
<%-- </jsp:useBean> --%>
<%
mb.setName(name);
mb.setId(id);
mb.setAge(age);
//code30 : 액션태그 사용하기 : code25와 동일
//code30 전체 값 저장
%>
<%-- <jsp:setProperty property="name" name="mb" param="name"/> --%>
<%-- <jsp:setProperty property="*" name="mb"/> --%>
<%
// MemberDAO2 mdao = new MemberDAO2();
// mdao.insertMember2(mb);


%>
</body>
</html>