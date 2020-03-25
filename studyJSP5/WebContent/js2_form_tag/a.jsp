<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>js2/a.jsp</h1>
<%
//서버에서 기억장소 생성 : request, response 내장객체
//request : http가 들고온 요청정보를 저장 내장객체
//request.변수
//request.함수()
//request.getParameter(태그의 name) : request에 저장되어있는 파라미터(태그) 정보 가져오기
request.getParameter("fid");
%>
아이디 : <%=request.getParameter("fid") %><br>
비밀번호 : <%=request.getParameter("fpass") %><br>
자기소개 : <%=request.getParameter("intor") %><br>
성별 : <%=request.getParameter("gender") %><br>
취미 : <%= request.getParameter("hob") %><br>
학년 : <%=request.getParameter("grade") %><br>
</body>
</html>