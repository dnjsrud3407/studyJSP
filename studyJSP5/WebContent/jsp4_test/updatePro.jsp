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
<h1>jsp4_test/updatePro.jsp</h1>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String gender = request.getParameter("gender");
	String email = request.getParameter("email");
	
	Class.forName("com.mysql.jdbc.Driver");
	String dbUrl = "jdbc:mysql://localhost:3306/jspdb5";
	String dbUser = "jspid";
	String dbPass = "jsppass";
	Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
	
	String sql = "select * from member where id = ?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	ResultSet rs = pstmt.executeQuery();
	
	if(rs.next()){
		if(pass.equals(rs.getString("pass"))){
			sql = "update member set name=?, age=?, gender=?, email=? where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, age);
			pstmt.setString(3, gender);
			pstmt.setString(4, email);
			pstmt.setString(5, id);
			pstmt.executeUpdate();
			response.sendRedirect("main.jsp");
		} else{
			%>
			<script type="text/javascript">
			alert("비밀번호 틀림");
			history.back();
			</script>
			<%
		}	
	} else{	//아이디 값이 없을 때
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