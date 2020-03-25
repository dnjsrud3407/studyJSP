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
// session 내장객체 : 클라이언트와 서버 간의 연결 정보를 서버에 저장
// 					서버와 연결이 되면 페이지와 상관없이 클라이언트의 정보를 유지하고 있다.
%>
세션ID : <%=session.getId() %><br>
세션값 1 : <%=session.getAttribute("ses1") %><br>
세션값 2 : <%=session.getAttribute("ses2") %><br>
<h1>jsp2/sessionTest.jsp</h1>
<input type="button" value="세션값저장" onclick="location.href='sessionSet.jsp'">
<input type="button" value="세션값 하나 삭제" onclick="location.href='sessionDel.jsp'">
<input type="button" value="세션값 전체 삭제(=로그아웃)" onclick="location.href='sessionInval.jsp'">

</body>
</html>