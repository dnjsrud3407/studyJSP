<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Timestamp"%>
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
<%
request.setCharacterEncoding("utf-8");
//DB접속
Class.forName("com.mysql.jdbc.Driver");
String dbUrl = "jdbc:mysql://localhost:3306/jspdb5";
String dbUser = "jspid";
String dbPass = "jsppass";
Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
//Form에서 회원정보 가져오기
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
//현재시간
Timestamp reg_date = new Timestamp(System.currentTimeMillis());
int age = Integer.parseInt(request.getParameter("age"));
String gender = request.getParameter("gender");
String email = request.getParameter("email");
//sql 구문
String sql = "select * from member where id=?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, id);
ResultSet rs = pstmt.executeQuery();

if(rs.next()){
	%>
	<script type="text/javascript">
	alert("아이디값이 중복입니다");
	history.back();
	</script>
	<%
} else{
	sql=
	"insert into member(id, pass, name, reg_date, age, gender, email) values(?,?,?,?,?,?,?)";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, pass);
	pstmt.setString(3, name);
	pstmt.setTimestamp(4, reg_date);
	pstmt.setInt(5, age);
	pstmt.setString(6, gender);
	pstmt.setString(7, email);
	//sql 구문 실행
	pstmt.executeUpdate();	
	}
%>
<script type="text/javascript">
	alert('회원가입성공');
	location.href="loginForm.jsp";
</script>
</body>
</html>