<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// name, age 파라미터값 가져오기
String name = request.getParameter("name");
String age = request.getParameter("age");
String s ="";
if(Integer.parseInt(age) >= 20){
	s = "성인입니다";
}else {
	s = "미성년입니다";
}
%>
<h1><%=name %> : <%=age %> -> <%=s %></h1>