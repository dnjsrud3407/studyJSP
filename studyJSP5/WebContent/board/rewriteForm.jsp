<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String num = request.getParameter("num");
String re_ref = request.getParameter("re_ref");
String re_lev = request.getParameter("re_lev");
String re_seq = request.getParameter("re_seq");
%>
<h1>board/rewriteForm.jsp</h1>
<form action="rewritePro.jsp">
<input type="hidden" name="num" value="<%=num%>">
<input type="hidden" name="re_ref" value="<%=re_ref%>">
<input type="hidden" name="re_lev" value="<%=re_lev%>">
<input type="hidden" name="re_seq" value="<%=re_seq%>">
<table border="1">
	<tr>
		<td>글쓴이</td><td><input type="text" name="name"></td>
	</tr>
	<tr>
		<td>비밀번호</td><td><input type="password" name="pass"></td>
	</tr>
	<tr>
		<td>제목</td><td><input type="text" name="subject" value="[답글]"></td>
	</tr>
	<tr>
		<td>내용</td><td><textarea name="content" rows="10" cols="30"></textarea></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="글쓰기"></td>
	</tr>
</table>
</form>
</body>
</html>