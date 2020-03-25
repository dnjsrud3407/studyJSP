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
		// 대상.html() - 기존내용 사라지고 사용
		// 대상.append() - 아래부분 추가
// 		var h = $('h1').html();
// 		alert(h);
// 		$('h1').html('html method');
// 		$('h1').html(function (index) {
// 			return 'head-' + index;
// 		});
// 		// 기존값을 유지하면서 사용
// 		$('h1').html(function (index,ht) {
// 			// 기존값 = ht
// 			return '*' + ht + '*';
// 		});
		// div 태그
		$('div').html(function (index) {
			return 'html-' + index;
		});
		// 기존값에 ++ 붙이기
		$('div').html(function (index, ht) {
			return ht + '++';
		});
	});
</script>
</head>
<body>
<div></div>
<div></div>
<div></div>
<h1>head01</h1>
<h1>head02</h1>
<h1>head03</h1>
</body>
</html>