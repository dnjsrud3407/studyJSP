<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jsp1/response.jsp</h1>
<%
//response : 서버의 처리결과, 설정값, 응답정보를 저장 => 웹서버 => http => 클라이언트에게 넘겨줌.
//헤더 정보 저장
response.setHeader("이름", "값");
//클라이언트에 쿠키값 저장 
// response.addCookie("쿠키");
//자바 클라이언트에 html형태로 출력하고자 할 때
response.setContentType("text/html; charset=UTF-8");
//jsp이동(하이퍼링크)  -  a태그와 같다.
response.sendRedirect("request.jsp");
//pageContext : 현페이지 정보를 저장하는 내장객체

%>

</body>
</html>