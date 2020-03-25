<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jsp3/select2.jsp</h1>
<%
Class.forName("com.mysql.jdbc.Driver");
String dbUrl = "jdbc:mysql://localhost:3306/jspdb5";
String dbUser = "root";
String dbPass = "1234";
Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);

// String sql = "select * from student where num = ?";
// PreparedStatement pstmt = con.prepareStatement(sql);
int num = 1;
// pstmt.setInt(1, 1);
// ResultSet rs = pstmt.executeQuery();
Statement stmt = con.createStatement();
String sql = "select * from student where num = " + num;
ResultSet rs = stmt.executeQuery(sql);
%>
<table border="1">
<tr><td>학생</td><td>번호</td></tr>
<%
while(rs.next()){
	%><tr><td><%=rs.getInt("num") %></td><td><%=rs.getString("name") %></td></tr><%
}
%>
</table>
</body>
</html>