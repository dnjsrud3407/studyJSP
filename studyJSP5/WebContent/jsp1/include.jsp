<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="color.jspf" %> <!-- 페이지 설정값을 주로 넣는다.. 색 등... -->
<%
	//전역변수이므로 <%! ... 부터 먼저 컴파일함.
	out.println(b);
	prn();
%>
<%!
	//전역번수 선언
	int b = 20;
	//메서드 선언(거의 안씀)
	public void prn(){
		System.out.println("메서드 사용");
	}
%>
<%
// out.println(a); - 선언되지 않은 채 실행해서 에러
int a = 10;
out.println(a);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="<%=col3%>">
<h1>jsp1/include.jsp</h1>
<table border="1" width="600">
	<tr height="100">
		<td colspan="2">
			<jsp:include page="top.jsp">
				<jsp:param value="kim" name="id"/>
			</jsp:include>
		</td>
	</tr>
	<tr>
		<td width="100" height="500"><jsp:include page="left.jsp"/></td>
		<td>본문</td>
	</tr>
	<tr height="100">
		<td colspan="2"><jsp:include page="bottom.jsp"/></td>
	</tr>
</table>
</body>
</html>