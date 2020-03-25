<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jsp1/for.jsp</h1>
<%
int a = 10;
int b[] = {10, 20, 30};
out.println(a + "<br>");
out.println(b + "<br>");
for(int bb : b){
	out.println(bb + "<br>");
}

String[] s = {"java","jsp","oracle","web"};
for(int i=0;i<s.length;i++){
%>
	s[<%=i %>] = <%=s[i] %><br>
<%
}
%>
<table border="1">
<%
	for(int i = 0; i < s.length; i++){
%>
	<tr>
		<td><%=i %></td>
		<td><%=s[i] %></td>
	</tr>
<%
	}
%>
</table>
</body>
</html>