<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jsp3/jdbcTest.jsp</h1>
<%
//jdbc프로그램 설치
//1단계 : 설치된 JDBC프로그램 불러오기
//Driver d = new Driver(); // => 직접적으로 사용
Class.forName("com.mysql.jdbc.Driver"); // => 간접적으로 사용(불러만 오고 java api가 사용)
//2단계 : JDBC프로그램을 이용해서 디비연결
String dbUrl="jdbc:mysql://localhost:3306/jspdb5";  //db서버 주소
String dbUser="root";
String dbPass="1234";
Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
%>
연결성공<%=con %>
</body>
</html>