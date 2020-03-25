<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
//한글처리
request.setCharacterEncoding("utf-8");
int num = Integer.parseInt(request.getParameter("num"));
String pass = request.getParameter("pass");

BoardBean bb = new BoardBean();
bb.setNum(num);
bb.setPass(pass);

BoardDAO bdao = new BoardDAO();
int check = bdao.deleteBoard(bb);

if(check == 1){
	bdao.deleteBoard(bb);
	%>
	<script type="text/javascript">
	alert("글 삭제 성공");
	location.href('list.jsp');
	</script>
	<%
	} else if(check == 0){
	%>
	<script type="text/javascript">
	alert("비밀번호가 일치하지 않습니다.");
	history.back();
	</script>
	<%
}
%>
</body>
</html>