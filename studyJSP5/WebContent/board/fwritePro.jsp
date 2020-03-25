<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Timestamp"%>
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
<h1>board/fwritePro.jsp</h1>
<%
//한글처리
// 	request.setCharacterEncoding("utf-8");
	
	// 파일을 업로드	cos.jar		MultipartRequest 자바파일
	// MultipartRequest 객체생성 : 폴더 파일 업로드, 파라미터, 업로드 정보 저장
	// MultipartRequest multi = 
	// new MultipartRequest(request, 업로드할 폴더 위치, 파일크기, 한글처리, 이름 동일시 이름 변경);
	// 업로드할 폴더 만들기 WebContent에 upload폴더 만들기
	// upload폴더의 물리적인 경로
	String uploadPath = request.getRealPath("/upload");
	System.out.println(uploadPath);
	int maxSize = 5*1024*1024;	// 5M
	MultipartRequest multi = 
			new MultipartRequest(request, uploadPath, maxSize, "utf-8", new DefaultFileRenamePolicy());
	
	String name = multi.getParameter("name");
	String pass = multi.getParameter("pass");
	String subject = multi.getParameter("subject");
	String content = multi.getParameter("content");
	// 첨부파일 이름 가져오기 - 폴더에 업로드된 파일이름을 가져오기
	String file = multi.getFilesystemName("file");
	// num구하기, readcount = 0, date는 현시스템 날짜
	BoardBean bb = new BoardBean();
	BoardDAO bdao = new BoardDAO(); 
	
	bb.setName(name);
	bb.setPass(pass);
	bb.setSubject(subject);
	bb.setContent(content);
	int readcount = 0;
	bb.setReadcount(readcount);
	bb.setFile(file);

	bdao.insertBoard(bb);
%>
<script type="text/javascript">
	alert('글쓰기성공');
	location.href="list.jsp";
</script>
</body>
</html>















