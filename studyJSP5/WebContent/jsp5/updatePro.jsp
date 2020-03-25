<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
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
<h1>board/updatePro.jsp</h1>
<%
	//한글처리
	request.setCharacterEncoding("utf-8");
	
	int num = Integer.parseInt(request.getParameter("num"));
	String name = request.getParameter("name");
	String pass = request.getParameter("pass");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	
	//BoardBean bb 객체생성
	//bb 멤버변수에 파라미터 값 저장
	BoardBean bb = new BoardBean();
	bb.setNum(num);
	bb.setName(name);
	bb.setPass(pass);
	bb.setSubject(subject);
	bb.setContent(content);
	
	//BoardDAO bdao 객체생성
	//int check = updateBoard(bb)
	BoardDAO bdao = new BoardDAO();
	int check = bdao.updateBoard(bb);

	if(check == 1){
		%>
		<script type="text/javascript">
		alert("글 수정 성공");
		location.href('list.jsp');
		</script>
		<%
	} else if(check == 0){
		%>
		<script type="text/javascript">
		alert("비밀번호 틀림");
		history.back();
		</script>
		<%
	} 
	%>

</body>
</html>