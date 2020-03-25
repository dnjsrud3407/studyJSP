<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jsp2/cookieForm.jsp</h1>

<%
String lang ="korea";
//클라이언트가 서버에게 cookieForm.jsp를 열어달라고 요청을 함
//요청을 하면서 클라이언트 정보를 넘겨줌
// 그 정보를 request로 받아서 getCookies()를 함.
Cookie[] cookies = request.getCookies();

if(cookies != null){
	for(int i = 0; i < cookies.length; i++){
		if(cookies[i].getName().equals("lang")){
			lang = cookies[i].getValue();
// 			System.out.println(lang);
// 			System.out.println(cookies.length);
// 			System.out.println(cookies[0].getName()+cookies[0].getName());
// 			System.out.println(cookies[0].getValue()+ ", "+cookies[1].getValue());
		}
	}
}
if(lang.equals("korea")){
	%>안녕하세요. 이것은 쿠키 예제입니다.<%
}else if(lang.equals("english")){
	%>Hello. This is Cookie example.<%
}
%>
<form action="cookiePro.jsp" method="post">
	<input type="radio" name="language" value="korea" <%if(lang.equals("korea")){%>checked<%} %>>한국어 페이지 보기
	<input type="radio" name="language" value="english" <%if(lang.equals("english")){%>checked<%} %>>영어 페이지 보기
	<input type="submit" value="언어설정">
</form>
</body>
</html>