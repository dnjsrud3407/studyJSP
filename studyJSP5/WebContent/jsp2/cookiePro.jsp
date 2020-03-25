<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jsp2/cookiePro.jsp</h1>
<%
//language 파라미터 값 가져오기
String language = request.getParameter("language"); 
%>
설정된 언어 : <%=language %><br>
<%
//쿠키값 생성
Cookie cookie = new Cookie("lang" , language);
//시간설정
cookie.setMaxAge(5);
//클라이언트 저장
response.addCookie(cookie);
%>
<script type="text/javascript">
	alert("쿠키값 생성");
	location.href="cookieForm.jsp";
</script>
</body>
</html>