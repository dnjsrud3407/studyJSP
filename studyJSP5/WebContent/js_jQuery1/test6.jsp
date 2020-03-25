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
	// body 뒷부분에 추가 .append()
	$('body').append('head1');
	$('div').append('<div>추가</div>');
	// table 태그에 <tr><td>번호</td><td>제목</td></tr> 추가
	$('table').append('<tr><td>1</td><td>제목-1</td></tr>');
});
</script>
</head>
<body>
<table border="1">
	<tr><td>번호</td><td>제목</td></tr>
</table>
<div>h</div>
<div>h</div>
<div>h</div>
</body>
</html>