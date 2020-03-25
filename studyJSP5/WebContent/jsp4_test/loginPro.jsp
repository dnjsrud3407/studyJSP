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
<h1>jsp4_test/loginPro.jsp</h1>
<%
String id = request.getParameter("id");
String pass = request.getParameter("pass");

Class.forName("com.mysql.jdbc.Driver");
String dbUrl = "jdbc:mysql://localhost:3306/jspdb5";
String dbUser = "jspid";
String dbPass = "jsppass";
Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);

// sql id조건에 만족하는 pass 정보가져오기
String sql="select * from member where id = ?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, id);
ResultSet rs = pstmt.executeQuery();
// id 존재하는지 조회, id비교, 디비 id값과 폼의 id값을 비교
String password = "";
if(rs.next()){
	password = rs.getString("pass");
	//폼과 디비의 id비교
	if(pass.equals(password)){
		session.setAttribute("id", id);
		session.setAttribute("pass", pass);
		response.sendRedirect("main.jsp");
	} else{
		%>
		<script type="text/javascript">
		alert("비밀번호 틀림");
		history.back();
		</script>
		<%
	}	
} else{
	%>
	<script type="text/javascript">
	alert("아이디 없음");
	history.back();
	</script>
	<%
}
%>
</body>
</html>