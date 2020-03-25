<%@page import="member.MemberBean"%>
<%@page import="java.util.List"%>
<%@page import="member.MemberDAO"%>
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
<h1>jsp4/list.jsp</h1>
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
//MemberDAO 객체생성
MemberDAO mdao = new MemberDAO(); 
//배열 list = mdao.getMemberList(); 메서드 호출
// list를 쓰는 이유 : 크기를 처음에 지정해 주지 않아도 되기 때문!
List memberList = mdao.getMemberList();
%>
<table border="1">
	<tr>
		<td>아이디</td>
		<td>비밀번호</td>
		<td>이름</td>
		<td>가입날짜</td>
	</tr>
<% 
for(int i = 0; i < memberList.size(); i++){
	// 자바빈 mb 에 배열 한 칸의 정보를 가져온다
	MemberBean mb  = (MemberBean)memberList.get(i);
%>
	<tr>
		<td><%=mb.getId() %></td>
		<td><%=mb.getPass() %></td>
		<td><%=mb.getName() %></td>
		<td><%=mb.getReg_date() %></td>
	</tr>
<% 
}
%>
</table>

</body>
</html>