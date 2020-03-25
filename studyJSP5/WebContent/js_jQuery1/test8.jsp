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
	// 이벤트 연결
	// bind()
	$('#btn2').bind('click', function () {
		alert('클릭2');
	});
	$('#btn3').click(function () {
		alert('클릭3')
	});
	$('#hh1').click(function () {
		$(this).html('클릭');
		alert('alert구문은 한번만 수행됩니다');
		// 한번만 이벤트 수행하고 종료
		$(this).unbind();
	});
	$('h2').click(function () {
		$(this).html(function (index, ht) {
			return ht + '+';
		})
	});
	
	// img1 이미지에 마우스 오버했을 때
	$('.img1').mouseover(function () {
		$(this).attr('src', '2.jpg');
	}).mouseout(function () {
		$(this).attr('src', '1.jpg');
	});
});
</script>
</head>
<body>
<img src="1.jpg" class="img1">
<h2>head-0</h2>
<h2>head-1</h2>
<h2>head-2</h2>
<h1 id="hh1">head-0</h1>
<input type="button" value="버튼" onclick="alert('hi')">
<input type="button" value="버튼2" id="btn2">
<input type="button" value="버튼3" id="btn3">
</body>
</html>