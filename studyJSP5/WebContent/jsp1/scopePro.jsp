<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>scopePro.jsp</h1>
<%
//id 파라미터 가져와서 변수에 저장
String id = request.getParameter("id");
String pass = request.getParameter("pass");

//내장객체
// pageContext		request/response	session			application
// 현페이지 정보 유지	요청정보 있을 때 유지		연결되었으면 유지	서버가 동작하는 한 계속 유지	

//내장객체에 값을 저장할 때 속성 값을 저장   - 내장객체.setAttribute(이름, 값)
//					속성 값을 가져올때   내장객체.getAttribute(이름)

pageContext.setAttribute("page", "pageContext value");
request.setAttribute("req", "request value");
session.setAttribute("ses", "session value");
application.setAttribute("app", "application value");
%>
아이디 : <%=id %><br>
비밀번호 : <%=pass %><br>
pageContext 값 : <%=pageContext.getAttribute("page") %><br>
request 값 : <%=request.getAttribute("req") %><br>
session 값 : <%=session.getAttribute("ses") %><br>
application 값 : <%=application.getAttribute("app") %><br>
<% // a 태그는 id값을 가져가지 못한다. get방식을 하면 주소창에 id가 보이기 때문에 scopeProPro.jsp?id=로 출력하면 된다.%>
<a href="scopeProPro.jsp?id=<%=id%>&pass=<%=pass%>">scopeProPro.jsp 페이지로 이동</a><br>
<script type="text/javascript">
//	alert("scopeProPro.jsp 이동");
//	location.href="scopeProPro.jsp?id=<%=id%>&pass=<%=pass%>";
</script>
<%
//①주소값이 이동하는 방식 - a태그, location.href, response.sendRedirect()
//script 보다 먼저 동작
// %부터 먼저 처리한 후 html코드로 바꾸기 때문에 먼저 동작한다. 
//response.sendRedirect("scopeProPro.jsp?id=" + id + "&pass=" + pass); 

//②이동방식 액션태그처럼 쓸 수 있다. forward() scopePro.jsp -> scopeProPro.jsp
//									 주소줄에 표시		 실행화면에 표시
//									 scopePro.jsp 안에 있는 모든 request값 사용 가능(기존의 주소값을 유지하면서 실행화면만 바뀜!!!!) - mvc, spring에서 많이 사용
//액션태그 : 태그처럼 사용가능하게 만든 jsp 문법
%>
<%-- <jsp:forward page="scopeProPro.jsp" /> --%>
</body>
</html>


















