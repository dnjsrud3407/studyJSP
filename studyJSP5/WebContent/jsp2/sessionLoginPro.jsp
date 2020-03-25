<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jsp2/sessionLoginPro.jsp</h1>
<%
String id = request.getParameter("id");
String pass = request.getParameter("pass");
%>
아이디 : <%=id %><br>
비밀번호 : <%=pass %><br>

<%
String dbId = "kim";
String dbPass = "p123";
%>
DB아이디 : <%=dbId %><br>
DB비밀번호 : <%=dbPass %><br>

<%
//폼의 id와 DB의 id, 폼의 pass와 DB의 pass가 일치하면 => 페이지 상관없이 값을 유지해서 사용할 수 있도록 session값 부여
//참조형일 경우 == 비교연산자를 사용하면 주소값을 비교한다.
//문자열 비교 : equals !!!!!!!   ex> 문자열.equals(문자열)
if(id.equals(dbId)){ // 아이디가 일치할 때
	%>아이디 일치<br><%
	if(pass.equals(dbPass)){ // 비밀번호가 일치할 때 => session값 부여
		%>비밀번호 일치<br><%
		session.setAttribute("id", id);
		%><%=session.getAttribute("id") %>
		<script type="text/javascript">
		alert("로그인 성공");
		location.href="sessionMain.jsp";
		</script>
		<%
	} else { // 비밀번호가 일치하지 않을 때
		%>비밀번호 틀림<br><%
	}
} else { // 아이디가 일치하지 않을 때
	%>아이디 틀림<br><%
}
%>
</body>
</html>