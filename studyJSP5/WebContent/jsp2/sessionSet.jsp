<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jsp2/sessionSet.jsp</h1>
<%
//세션값 만들기
session.setAttribute("ses1", "session value");
session.setAttribute("ses2", "session value2");

// sessionTest.jsp 이동

%>
<script type="text/javascript">
alert("세션 값 생성 ---> sessionTest.jsp이동");
location.href="sessionTest.jsp";
</script>
</body>
</html>