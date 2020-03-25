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
<h1>jsp3/insertPro.jsp</h1>
<%
//post방식일 때 request 한글처리
request.setCharacterEncoding("utf-8");
int num = Integer.parseInt(request.getParameter("num"));
String name = request.getParameter("name");

%>
학생번호  : <%=num %><br>
학생이름  : <%=name %><br>
<%
Class.forName("com.mysql.jdbc.Driver");
String dbUrl = "jdbc:mysql://localhost:3306/jspdb5";
String dbUser = "root";
String dbPass = "1234";
Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
//3단계 - 연결정보를 이용해서 sql구문을 만들고 실행할 객체 생성
//String sql = "insert into student(num, name) values(" + num + ", '" + name + "')"; --- 보안상 취약
String sql = "insert into student(num, name) values(?,?)";
//sql 구문으로 만들어준다.
PreparedStatement pstmt = con.prepareStatement(sql);
//1번째 물음표
pstmt.setInt(1, num);
//2번째 물음표 ('' 자동 생성해줌)
pstmt.setString(2, name);
//4단계 - 객체를 실행 insert, update, delete
pstmt.executeUpdate();


%>
학생입력성공
<%=pstmt %>

</body>
</html>