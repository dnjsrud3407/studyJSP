<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// id값 가져오기
String id = request.getParameter("id");

// DB 연결하기
String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/jspdb5";
String user = "root";
String password = "1234";

Class.forName(driver);
Connection con = DriverManager.getConnection(url, user, password);

// member 테이블에 id가 존재하는지 확인
String sql = "select id from member where id=?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, id);
ResultSet rs = pstmt.executeQuery();

// 결과로 전달할 값
String result = "";
// 일치하는 값이 있으면
if(rs.next()){
	result = "아이디 중복입니다";
} else {
	result = "사용할 수 있는 아이디 입니다";
}
%>
<h5><%=result %></h5>

























