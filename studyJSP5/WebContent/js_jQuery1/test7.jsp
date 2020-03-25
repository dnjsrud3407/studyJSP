<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.high_0{background: yellow}
	.high_1{background: gray}
	.high_2{background: skyblue}
	.high_3{background: purple;}
	.high_4{background: aqua;}
</style>
<script src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript">
$(document).ready(function () {
	// 대상.each() - 반복문(html이나 append 처럼 기능은 없다)
	$('h1').each(function (index) {
// 		alert(index);
// 		alert($(this).html());
		$(this).addClass('high_'+index);	
	});
// 배열변수에 더 많이 사용한다
// <xml> 형태 (사용자 정의 태그 사용)
// <xml>
// 	<name>naver</name><link>http://www.naver.com</link>
// 	<name>daum</name><link>http://www.daum.net</link>
// 	<name>jquery</name><link>http://jquery.com</link>
// </xml>
	// 2차원 배열변수 json 방법
	var arr = [
		{name:'naver',link:'http://www.naver.com'},
		{name:'daum',link:'http://www.daum.net'},
		{name:'jquery',link:'http://jquery.com'}
	];
	// $.each(배열 변수, function(열 번호, 행)
	$.each(arr, function (index, item) {
	// 	alert('index : ' + index + ', item.name : ' + item.name + ', item.link : ' + item.link);	
	//  table 태그에 추가 append()
	// 	$('table').append('111');
		$('table').append('<tr><td>' + item.name + '</td><td>' + item.link + '</td></tr>');
	});
});
</script>
</head>
<body>
<table border="1">
	<tr><td>이름</td><td>주소</td></tr>
</table>
<h1>item-0</h1>
<h1>item-1</h1>
<h1>item-2</h1>
<h1>item-3</h1>
<h1>item-4</h1>
</body>
</html>