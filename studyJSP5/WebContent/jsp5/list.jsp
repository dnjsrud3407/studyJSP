<%@page import="java.util.List"%>
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
<h1>jsp5/list.jsp</h1>
<%
BoardDAO bdao = new BoardDAO();

//게시판 글 개수 가져오기 count(*)
int count = bdao.getBoardCount();
List boardList = null;
//한 페이지에 보여줄 글 개수 설정
int pageSize = 6;
//현제 페이지 번호
String pageNum = request.getParameter("pageNum");
if(pageNum == null){
	pageNum = "1";
}
int currentPage = Integer.parseInt(pageNum);
//페이지 번호가 없으면(초기 페이지)
//1페이지라면 시작하는 행 1행부터 10개
//2페이지라면 시작하는 행 11행부터 10개
//3페이지라면 시작하는 행 21행부터 10개
int startRow = (currentPage - 1) * pageSize + 1;
int endRow = currentPage * pageSize;
if(count != 0){
	//boardList = bdao.getBoardList();
	//1페이지에 10개 글 가져오기 - bdao.getBoardList(1번행 부터, 10개)
	boardList = bdao.getBoardList(startRow, pageSize);
}
%>
<h3><a href="writeForm.jsp">글쓰기</a></h3>
<table border="1">
	<tr>
		<td>번호</td><td>제목</td><td>작성자</td><td>작성일</td><td>조회수</td>
	</tr>
<% 
for(int i = 0; i < boardList.size(); i++){
	BoardBean bb = (BoardBean)boardList.get(i);
%>
	<tr>
		<td><%=bb.getNum() %></td>
		<td>
			<%
			// 답글이면 들여쓰기
			// 레벨값에 따라 들여쓰는 길이 수 정해줌
			int wid = bb.getRe_lev() * 10;
			if(bb.getRe_lev() > 0){
				// 공백이미지 삽입
				%>
				<img src="level.gif" width="<%=wid%>"><img src="re.gif">
				<%
			}
			%>
			<a href="content.jsp?num=<%=bb.getNum() %>"><%=bb.getSubject() %></a></td>
		<td><%=bb.getName() %></td>
		<td><%=bb.getDate() %></td>
		<td><%=bb.getReadcount() %></td>
	</tr>
<% 
}
%>
</table>

<%
//전체 페이지 개수 구하기
// 전체 글 개수 50개, 한 화면에 보여줄 글 개수 10개 -> 총 5페이지
// 전체 글 개수 59개, 한 화면에 보여줄 글 개수 10개 -> 총 6페이지 (10으로 나눠서 나머지가 있느냐)
int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
//한 화면에 보여줄 페이지 개수 설정
int pageBlock = 3;
//한 화면에 보여줄 시작페이지 구하기 - 1~10이라면 1 / 11~20이라면 11
//현제 페이지 번호가 1~10 이고 pageBlock이 10 일 경우 시작페이지 => 1
//현제 페이지 번호가 11~20 이고 pageBlock이 10 일 경우 시작페이지 => 11
int startPage = ((currentPage - 1) / pageBlock * pageBlock) + 1;
//한 화면에 보여줄 끝 페이지 구하기 - 1~10이라면 10 / 11~20이라면 20
int endPage = startPage + pageBlock - 1;
if(endPage > pageCount){
	endPage = pageCount;
}
//이전 버튼
if(startPage > pageBlock){
	%>
	<a href="list.jsp?pageNum=<%=startPage - pageBlock%>">[이전]</a>
	<%	
}
for(int i = startPage; i <= endPage; i++){
	%><a href="list.jsp?pageNum=<%=i %>"><%=i %></a>&nbsp;<%
}
//다음 버튼
if(endPage < pageCount){
	%>
	<a href="list.jsp?pageNum=<%=startPage + pageBlock%>">[다음]</a>
	<%
}
%>


</body>
</html>