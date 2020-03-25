<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>testForm3.jsp</h1>
<form action="testPro3.jsp" method="post" name="fr"> <!-- a태그와 다르게 form의 값을 가지고 간다. -->
아이디 : <input type="text" name="id"><br>
비밀번호 : <input type="password" name="pass"><br>

성별 : <input type="radio" name="gen" value="남">남
	 <input type="radio" name="gen" value="여">여<br>
취미 : <input type="checkbox" name="hobby" value="여행">여행
     <input type="checkbox" name="hobby" value="게임">게임
	 <input type="checkbox" name="hobby" value="독서">독서<br>
학년 : <select name="hak">
	<option value="">학년을 선택하세요</option>
	<option value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
</select><br>
<input type="submit" value="회원가입" > 
</form>
</body>
</html>