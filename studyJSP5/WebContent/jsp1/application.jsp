<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jsp1/application.jsp</h1>
<%
//application : 웹애플리케이션 서버에서 동작하는 애플리케이션 정보를 저장하는 내장객체
//              서버가 start되어지면 정보 유지. 서버가 stop이 되어지면 정보가 사라짐. (제일 오래가는 내장객체.request, response, session 중에서)
%>
서버정보 : <%=application.getServerInfo() %><br>
물리적경로 : <%=application.getRealPath("/") %><br>

<%
//out 내장객체 : 출력정보를 저장하고 있는 내장객체
out.println("출력<br>");
out.println(out.getBufferSize()+"<br>");
out.println(out.getRemaining() + "<br>");
out.close(); //출력이 끝났음을 표시
out.println("닫고 출력 에러발생, 미출력 됨.");

//config, page, exception 내장객체

%>
</body>
</html>