<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>testPro3.jsp</h1>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String gen = request.getParameter("gen");

String[] hobby = request.getParameterValues("hobby");
String hak = request.getParameter("hak");
%>
아이디 : <%=id %><br>
비밀번호 : <%=pass %><br>
성별 : <%=gen %><br>
<%-- <%= hobby[0] + hobby[1]%><br> --%>
<%-- 취미선택 개수 : <%=hobby.length %><br> --%>
취미 : 
<%
	if(hobby == null){
%>
		선택된 취미 없음		
<%
	} else{
		for(String s : hobby){
%>
			<%=s %>
<%
		}
	}
%><br>
학년 : <%=hak %><br>
</body>
</html>