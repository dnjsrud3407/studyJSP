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
//공통점 : 페이지 상관없이 값을 저장.
//차이점 중요!!
//세션 : 서버에 저장됨.		 보안상 중요한 데이터를 저장				로그인인증 사용, 연결정보 저장		접속 해제되면 사라짐.
//쿠키 : 클라이언트에 저장됨.  보안상 상관없고 서버에 부하를 줄이고자 사용		아이디저장, 최근에 본 상품...		접속 해제되어도 계속 유지.(클라이언트에 저장되기 때문)


//쿠키값 가져오기(쿠키값을 여러개 가져오기 때문에 배열을 사용)
String cname = "쿠키 이름";
String cvalue = "쿠키 값";
Cookie[] cookies = request.getCookies();
// 쿠키값이 있는 경우
if(cookies != null){
	for(int i = 0; i < cookies.length; i++){
		if(cookies[i].getName().equals("cook")){
			cname = cookies[i].getName();
			cvalue = cookies[i].getValue();
		}
	}
} else { // 쿠키값이 없는 경우
	
}
%>
쿠키이름 : <%=cname %><br>
쿠키값 : <%=cvalue %><br>
<h1>jsp2/cookieTest.jsp</h1>
<input type="button" value="쿠키값저장" onclick="location.href='cookieSet.jsp'">
<input type="button" value="쿠키값삭제" onclick="location.href='cookieDel.jsp'">
</body>
</html>