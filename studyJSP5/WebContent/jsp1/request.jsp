<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jsp1/request.jsp</h1>
<%
//request : http가 클라이언트의 요청정보를 들고 오면 request 내장객체에 저장됨.

%>
서버이름 : <%=request.getServerName() %><br>
서버포트번호 : <%=request.getServerPort() %><br>
요청 URL : <%=request.getRequestURL() %><br>
요청 URI : <%=request.getRequestURI() %><br>
프로토콜 : <%=request.getProtocol() %><br>
요청방식 : <%=request.getMethod() %><br>
클라이언트 IP주소 : <%=request.getRemoteAddr() %><br>
컨텍스트(프로젝트) 경로 : <%=request.getContextPath() %><br>
프로젝트 물리적 : <%=request.getRealPath("/") %><br>
http 헤더정보 : <%=request.getHeader("accept") %><br>
http 헤더정보 : <%=request.getHeader("accept-language") %><br>
http 헤더정보 : <%=request.getHeader("user-agent") %><br>
http 헤더정보 : <%=request.getHeader("connection") %><br>
</body>
</html>