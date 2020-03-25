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
<h1>jsp5/content.jsp</h1>
<%
//글 번호
int num = Integer.parseInt(request.getParameter("num"));
//BoardDAO dbao 객체 생성
BoardDAO bdao = new BoardDAO();
// 조회수 증가
// updateReadcount(num)
// updateReadcount 메서드 호출
bdao.updateReadCount(num);

//num에 해당하는 게시판 글 가져오기
// BoardBean bb = getBoard(num);
//getBoard 메서드 호출
BoardBean bb = bdao.getBoard(num);
%>
<table border="1">
	<tr><td>글번호</td><td><%=bb.getNum() %></td><td>조회수</td><td><%=bb.getReadcount() %></td></tr>
	<tr><td>작성자</td><td><%=bb.getName() %></td><td>작성일</td><td><%=bb.getDate() %></td></tr>
	<tr><td>글제목</td><td colspan="3"><%=bb.getSubject() %></td></tr>
	<tr><td>파일</td>
	<td colspan="3">
		<a href="../upload/<%=bb.getFile() %>"><%=bb.getFile() %></a>
		<img src="../upload/<%=bb.getFile() %>" width="300" height="200"><br>
		<a href="file_down.jsp?file_name=<%=bb.getFile()%>">첨부파일 다운 : <%=bb.getFile() %></a>
	</td></tr>
	<tr><td>글내용</td><td colspan="3"><%=bb.getContent() %></td></tr>
	<input type="button" value="답글쓰기" onclick="location.href='rewriteForm.jsp?num=<%=bb.getNum()%>&re_ref=<%=bb.getRe_ref()%>&re_lev=<%=bb.getRe_lev()%>&re_seq=<%=bb.getRe_seq()%>'">
	<input type="button" value="글수정" onclick="location.href='updateForm.jsp?num=<%=bb.getNum()%>'">
	<input type="button" value="글삭제" onclick="location.href='deleteForm.jsp?num=<%=bb.getNum()%>'">
	<tr><td colspan="4"><input type="button" value="글목록" onclick="location.href='list.jsp'"></td></tr>
</table>
</body>
</html>

































