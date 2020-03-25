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
<h1>jsp4_test/info.jsp</h1>
<%
// 세션값 가져오기
String id = (String)session.getAttribute("id");
// 1단계 드라이버로더
Class.forName("com.mysql.jdbc.Driver");
// 2단계 디비연결
String dbUrl = "jdbc:mysql://localhost:3306/jspdb5";
String dbUser = "jspid";
String dbPass = "jsppass";
Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
// 3단계 sql 조건이 id에 해당하는 내용을 member테이블에서 조회해서 가져오기

String sql = "select *from member where id = ?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, id);
// 4단계 sql실행해서 결과를 저장
ResultSet rs = pstmt.executeQuery();
// 5단계 다음행으로 이동 => 출력
%>
<table border="1">
	<tr>
		<td>아이디</td>
		<td>비밀번호</td>
		<td>이름</td>
		<td>가입날짜</td>
		<td>나이</td>
		<td>성별</td>
		<td>이메일주소</td>
	</tr>
<% 
while(rs.next()){
%>
	<tr>
		<td><%=rs.getString("id") %></td>
		<td><%=rs.getString("pass") %></td>
		<td><%=rs.getString("name") %></td>
		<td><%=rs.getTimestamp("reg_date") %></td>
		<td><%=rs.getInt("age") %></td>
		<td><%=rs.getString("gender") %></td>
		<td><%=rs.getString("email") %></td>
	</tr>
<% 
}
%>
</table>
</body>
</html>