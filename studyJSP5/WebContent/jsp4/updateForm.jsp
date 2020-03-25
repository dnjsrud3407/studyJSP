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
<h1>jsp4/updateForm.jsp</h1>
<%
//회원정보 조회
// 세션값 가져오기
String id = (String)session.getAttribute("id");
// 1단계 드라이버로더
Class.forName("com.mysql.jdbc.Driver");
//2단계 디비연결
String dbUrl = "jdbc:mysql://localhost:3306/jspdb5";
String dbUser = "jspid";
String dbPass = "jsppass";
Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
//3단계 sql 조건이 id에 해당하는 내용을 member테이블에서 조회해서 가져오기
String sql = "select * from member where id = ?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, id);
ResultSet rs = pstmt.executeQuery();
String name="";
if(rs.next()){
	name = rs.getString("name");
}
%>
<form action="updatePro.jsp" method="post">
	아이디<input type="text" name="id" value="<%=id %>" readonly><br>
	비밀번호<input type="password" name="pass"><br>
	이름<input type="text" name="name" value="<%=name %>"><br>
	<input type="submit" value="회원정보수정">
</form>

</body>
</html>