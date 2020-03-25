<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jsp2/sessionDel.jsp</h1>
<%
//세션값 하나만 삭제
session.removeAttribute("ses1");
//세션값 하나 삭제 sessionTest.jsp로 이동
%>
<script type="text/javascript">
alert("세션1값 삭제 ---> sessionTest.jsp이동");
location.href="sessionTest.jsp";
</script>
</body>
</html>