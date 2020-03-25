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
<title>회원가입페이지</title>
<script type="text/javascript">
function enter(){
	if(document.getElementById('id').value == "") {
		alert('아이디를 입력하세요');
		document.getElementById('id').focus();
		return false;
	}
	if(document.getElementById('pass').value == "") {
		alert('비밀번호를 입력하세요');
		document.getElementById('pass').focus();
		return false;
	}
	if(document.getElementById('name').value == "") {
		alert('이름을 입력하세요');
		document.getElementById('name').focus();
		return false;
	}
	if(document.getElementById('age').value == "") {
		alert('나이를 입력하세요');
		document.getElementById('age').focus();
		return false;
	}
	if(document.getElementById('gender_man').checked == false && 
		document.getElementById('gender_woman').checked == false) {
		alert('성별을 선택하세요');
		document.getElementById('gender_man').focus();
		return false;
	}
	if(document.getElementById('email').value == "") {
		alert('이메일을 입력하세요');
		document.getElementById('email').focus();
		return false;
	}
}
</script>
</head>
<body>

<h1>jsp4_test/insertForm.jsp</h1>
<form action="insertPro.jsp" method="post" onsubmit="return enter()">
	아이디<input type="text" name="id" id="id"><br>
	비밀번호<input type="password" name="pass" id="pass"><br>
	이름<input type="text" name="name" id="name"><br>
	나이<input type="text" name="age" id="age"><br>
	성별<input type="radio" name="gender" value="man" id="gender_man">남자
	<input type="radio" name="gender" value="woman" id="gender_woman">여자<br>
	
	이메일주소<input type="text" name="email" id="email"><br>
	<input type="submit" value="회원가입">
</form>
</body>
</html>