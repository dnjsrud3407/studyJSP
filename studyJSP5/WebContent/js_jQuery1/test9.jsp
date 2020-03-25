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
		$('#my_form').submit(function () {
			// 이름 val()
			var name = $('#name').val();
			// 비밀번호 val()
			var pass = $('#pass').val();
			// alert("이름 : " + name);
			// alert("패스워드 : " + pass);
			
			// submit 기능을 못하게 막아줌
			if(name == ''){
				alert('이름을 입력하세요');
				$('#name').focus();
				return false;
			}
			if(pass == ''){
				alert('비밀번호를 입력하세요');
				$('#pass').focus();
				return false;
			}
			// 라디오 박스 제어(체크가 되어 있는지)
			if(!$('#gen1').is(":checked") && !$('#gen2').is(":checked")){
				alert('성별을 선택하세요');
				$('#gen1').focus();
				return false;
			}
			// 목록 상자
			if($('#hak').val() == ''){
				alert('학년을 선택하세요');
				$('#hak').focus();
				return false;
			}
		});
	});
</script>
</head>
<body>
<form action="test9.jsp" method="post" id="my_form">
	이름 : <input type="text" name="name" id="name"><br>
	비밀번호 : <input type="password" name="pass" id="pass"><br>
	성별 : <input type="radio" name="gen" value="man" id="gen1">남자
		  <input type="radio" name="gen" value="woman" id="gen2">여자<br>
	학년 : <select name="hak" id="hak">
		<option value="">선택하세요</option>
		<option value="1">1학년</option>
		<option value="2">2학년</option>
		<option value="3">3학년</option>
	</select>
	<input type="submit" value="전송">
</form>
</body>
</html>