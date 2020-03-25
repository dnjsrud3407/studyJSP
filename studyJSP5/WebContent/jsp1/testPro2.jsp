<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>testPro2.jsp</h1>
<%
request.setCharacterEncoding("utf-8");
String sid = request.getParameter("id");
String sage = request.getParameter("age");
int age = Integer.parseInt(sage);
%>
아이디 : <%=sid %><br>
나이 : <%=age %><br>
<%
//나이가 20세 미만이면 "미성년입니다." 메세지 출력
//20세 이상이면 "성인입니다." 출력
String str;
if(age < 20) {
	str = "미성년입니다.";
	out.print(str);
}else{
	str = "성인입니다.";
	out.print(str);
}

if(age < 20) {
	%>미성년입니다.<%
}else{
	%>"성인입니다."<%
}
%>

</body>
</html>



















