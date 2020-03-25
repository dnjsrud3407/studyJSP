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
<h1>jsp4_test/list.jsp</h1>
<%
// id가 null이거나 admin이 아니면 loginForm.jsp로 가기
String id = (String)session.getAttribute("id");
if(id == null){
	response.sendRedirect("loginForm.jsp");
} else{
	if(!id.equals("admin")){
		response.sendRedirect("loginForm.jsp");
	}
}

Class.forName("com.mysql.jdbc.Driver");
String dbUrl = "jdbc:mysql://localhost:3306/jspdb5";
String dbUser = "jspid";
String dbPass = "jsppass";
Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);

//연결정보를 이용해서 sql구문을 만들고 실행할 객체생성 member모든 정보 가져오기
String sql = "select * from member";
PreparedStatement pstmt = con.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();

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