<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		// $(대상).함수()
		// 전체 대상
		$('*').css('color','red');
		// 태그 대상
		$('h1').css('color','blue');
		// id 대상
		$('#ta').css('color','pink');
		// class 대상
		$('.ta2').css('color','brown');
		// input type 별 대상 - 태그[속성=값].함수()
		$('input[type=text]').css('color','orange');
		$('input[type=password]').css('color','purple');
		$('input[type=text]').val("kim");
		// 테이블 태그의 안 odd(홀수), even(짝수), last, first 지정 가능
		$('tr:odd').css('background','yellow');
		
	});
</script>
</head>
<body>
<table border="1">
<tr><td>1</td><td>일일일</td></tr>
<tr><td>2</td><td>이이이</td></tr>
<tr><td>3</td><td>삼삼삼</td></tr>
<tr><td>4</td><td>사사사</td></tr>
<tr><td>5</td><td>오오오</td></tr>
</table>
아이디 : <input type="text"><br>
비밀번호 : <input type="password"><br>
<h1>제목</h1>
<h1 id="ta">제목2</h1>
<h1 class="ta2">제목3</h1>

</body>
</html>