<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jsp2/cookieSet.jsp</h1>
<%
//쿠키값 만들기
//쿠키생성
//Cookie cookie = new Cookie();
Cookie cookie = new Cookie("cook", "cookie value");
//쿠키유지시간
cookie.setMaxAge(600);
//쿠키 값을 클라이언트에 저장
response.addCookie(cookie);
%>
<script type="text/javascript">
	alert("쿠키값 만들기");
	location.href="cookieTest.jsp";
</script>
</body>
</html>