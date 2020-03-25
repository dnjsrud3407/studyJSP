<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jsp4_test/main.jsp</h1>
<%
String id = (String)session.getAttribute("id");
if(id == null){
	response.sendRedirect("loginForm.jsp");
}
%>
<%=id %>님 로그인 하셨습니다.<br>
<input type="button" value="로그아웃" onclick="location.href='logout.jsp'">
<a href="info.jsp">회원정보조회</a>
<a href="updateForm.jsp">회원정보수정</a>
<a href="deleteForm.jsp">회원정보삭제</a>
<%
//session값이 있으면서
//(%구문은 동시에 컴파일을 하기 때문에 null값을 가질 수 도 있으므로 
//	null인지 아닌지 구분해야함.) 
//session값이 admin이랑 같으면 회원목록이 보임
if(id != null){
	if(id.equals("admin")){
		%><a href="list.jsp">회원목록</a><%
	}
}
%>
</body>
</html>