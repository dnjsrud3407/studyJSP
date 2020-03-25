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
		// $('h1').css('color','yellow');
		// var c = $('h1').css('color');	// 속성값을 변수에 저장 가능
		// alert(c);
		
// h1의 순서값(전체 h1중 몇번째인지)
// function은 for문과 같이 반복시켜줌
		var col = ['green', 'blue', 'purple'];
		$('h1').css('color', function (index) {
			return col[index];
		});
		// css 여러개도 지정 가능하다
		$('h1').css('background','gray').css('color','white');
		
		var col2 = ['pink', 'white', 'orange'];
		$('h1').css({
			background : function (index) {
				return col[index];
			}, 
			color : function (index) {
				return col2[index];
			}
		});
	})
</script>
</head>
<body>
<h1>head01</h1>
<h1>head02</h1>
<h1>head03</h1>
</body>
</html>