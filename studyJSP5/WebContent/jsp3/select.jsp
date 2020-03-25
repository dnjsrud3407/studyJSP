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
<h1>jsp3/select.jsp</h1>
<%
Class.forName("com.mysql.jdbc.Driver");
String dbUrl = "jdbc:mysql://localhost:3306/jspdb5";
String dbUser = "root";
String dbPass = "1234";
//2단계 : JDBC프로그램을 이용해서 디비연결 (디비주소, 디비아이디, 디비접속 비밀번호)
//   => 연결정보를 저장하는 객체생성
Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
//3단계 : 연결정보를 이용해서 sql구문을 만들고 실행할 객체생성
String sql="select * from student;";
PreparedStatement pstmt = con.prepareStatement(sql);

//4단계 : 객체를 실행 insert, update, delete 구문은 객체 생성 불필요
//   select => 실행한 결과를 저장하는 객체를 생성해서 저장함
ResultSet rs = pstmt.executeQuery();
//5단계 : 실행결과를 저장한 객체 내용을 출력, 변수에 저장하거나… 작업 수행
// while(rs.next()){
// 	out.println(rs.getInt(1)+rs.getString(2)+"<br>");  //rs.getInt("num") + rs.getString("name") 과 동일
// }
%>
<table border="1">
<tr><td>번호</td><td>이름</td></tr>
<%
while(rs.next()){
	%><tr><td><%=rs.getInt("num") %></td><td><%=rs.getString("name") %></td></tr><%
}
%>

</table>
</body>
</html>