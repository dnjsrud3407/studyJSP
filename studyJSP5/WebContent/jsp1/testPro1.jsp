<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>testPro1.jsp</h1>
<%
//post 방식일 때 request 사용하기 전에 한글처리 필요
request.setCharacterEncoding("utf-8"); //request의 정보를 전부 utf-8로 인식(get방식은 이 과정이 필요없다)
String sname = request.getParameter("name");
String snum = request.getParameter("num");

//문자열을 정수형으로 변환
int n = Integer.parseInt(snum);

//out 내장객체 : 출력정보를 저장하는 내장객체
System.out.println("Console창에서 출력");
out.println("웹페이지에서 출력<br>");
out.println("이름 : " + sname + "<br>");
out.println("좋아하는 숫자 : " + snum + "<br>");
out.println("좋아하는 숫자 + 100 : " + (snum + 100) + "<br>");
out.println("좋아하는 숫자(Integer.parseInt사용) + 100 : " + (Integer.parseInt(snum) + 100) + "<br>");
out.println("-----------<"+"%= %" + ">로 출력-----------<br>");
%>
이름 : <%= sname %> <br>
좋아하는 숫자 : <%= snum %><br> 

</body>
</html>