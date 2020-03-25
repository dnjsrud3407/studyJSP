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
		// 효과 
		// h1태그를 클릭했을 때
		// next() 클릭한 대상의 다음 태그
		$('h1').click(function () {
			$(this).next().toggle('slow', function () {
				alert('효과');
			});
		});
		
	});

</script>
</head>
<body>
	<h1>열고 닫기1</h1>
	<div>
		<h1>제목1</h1>
		<p>내용1</p>
	</div>
	
	<h1>열고 닫기2</h1>
	<div>
		<h1>제목2</h1>
		<p>내용2</p>
	</div>
</body>
</html>