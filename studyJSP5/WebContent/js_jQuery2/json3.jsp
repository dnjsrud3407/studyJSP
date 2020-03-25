<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 드라이버 로더
Class.forName("com.mysql.jdbc.Driver");
// 디비연결
String url = "jdbc:mysql://localhost:3306/jspdb5";
String user = "root";
String password = "1234";
Connection con = DriverManager.getConnection(url, user, password);
// sql 구문
String sql = "select * from board";
// rs = 실행
PreparedStatement pstmt = con.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
// 조회 데이터가 있으면 자바빈 객체 생성
// rs 내용 배열에 담기
// List<BoardBean> boardList = new ArrayList<BoardBean>();
JSONArray jboardList = new JSONArray();
while(rs.next()){
	// BoardBean 대신 JSONObject 사용
	JSONObject jbb = new JSONObject();
	jbb.put("num", rs.getInt("num"));
	jbb.put("name", rs.getString("name"));
	jbb.put("pass", rs.getString("pass"));
	jbb.put("subject", rs.getString("subject"));
	jboardList.add(jbb);
	
// 	BoardBean bb = new BoardBean();
// 	bb.setNum(rs.getInt("num"));
// 	bb.setName(rs.getString("name"));
// 	bb.setPass(rs.getString("pass"));
// 	bb.setSubject(rs.getString("subject"));
// 	boardList.add(bb);
}
%>
<%=jboardList%>