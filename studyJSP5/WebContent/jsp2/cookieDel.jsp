<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jsp2/cookieDel.jsp</h1>
<%
// 쿠키값 클라이언트에서 가져오기
Cookie[] cookies = request.getCookies();
// 쿠키값이 있으면
if(cookies != null){
	// for   if    "cook"찾아서
	for(int i = 0; i < cookies.length; i++){
		if(cookies[i].getName().equals("cook")){
			// 쿠키 유지시간 0초
			cookies[i].setMaxAge(0);
			// 쿠키값을 클라이언트에 저장
			response.addCookie(cookies[i]);
		}
	}
}
%>
<script type="text/javascript">
	alert("쿠키값 삭제");
	location.href="cookieTest.jsp";
</script>
</body>
</html>