<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jsp2/sessionLogout.jsp</h1>
<%
// 세션 전체 삭제
session.invalidate();
// sessionMain.jsp 로 이동
%>
<script type="text/javascript">
location.href="sessionMain.jsp";
</script>
</body>
</html>