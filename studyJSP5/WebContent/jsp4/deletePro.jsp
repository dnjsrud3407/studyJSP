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
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
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
		if(id.equals(rs.getString("id"))){
			if(pass.equals(rs.getString("pass"))){
				sql = "delete from member where id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.executeUpdate();
				session.invalidate();
				response.sendRedirect("main.jsp");	
			} else{
				%>
				<script type="text/javascript">
				alert("비밀번호 틀림");
				history.back();
				</script>
				<%
			}
		} else{	//아이디 값이 일치하지 않을 때
			%>
			<script type="text/javascript">
			alert("아이디 틀림");
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