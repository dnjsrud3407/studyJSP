<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>scopeProPro.jsp</h1>
<%
//get 방식이라면 주소창에서 ? 다음 id 파라미터 가져와서 변수에 저장
String id = request.getParameter("id");
String pass = request.getParameter("pass");
%>
아이디 : <%=id %><br>
비밀번호 : <%=pass %><br>
pageContext 값 : <%=pageContext.getAttribute("page") %><br>  <!-- null 출력 -->
request 값 : <%=request.getAttribute("req") %><br>			<!-- null 출력 -->
session 값 : <%=session.getAttribute("ses") %><br>			<!-- 유지 - 창을 전부 닫았을 때, 로그 아웃 했을 때 null -->
application 값 : <%=application.getAttribute("app") %><br>	<!-- 유지 - 서버 연결을 끊었을 때 null-->
</body>
</html>