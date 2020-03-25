<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jsp1/session.jsp</h1>
<%
//session 내장객체 : 클라이언트와 서버의 접속 정보를 저장하는 내장객체(접속함과 동시에 session이 생김)
//로그아웃이나, 브라우저를 다 닫았을 때, 30분이상 접속을 안했을 때 session 정보가 사라짐
%>

세션 ID : <%=session.getId() %><br>
세션이 만들어진 시간 : <%=session.getCreationTime() %><br>
세션 최근 접근 시간 : <%=session.getLastAccessedTime() %><br>
세션이 유지 되는 시간 : <%=session.getMaxInactiveInterval() %>초 = 30분<br>
세션이 유지 시간 변경 : session.setMaxInactiveInterval(3600);<%session.setMaxInactiveInterval(3600); %><br>
세션이 유지 되는 시간 : <%=session.getMaxInactiveInterval() %>초 = 60분<br>
로그아웃(세션내장객체 전체삭제) : session.invalidate();<% session.invalidate(); %>
</body>
</html>