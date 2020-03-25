<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	*{margin: 0px; padding: 0px;}
	ul{list-style: none;}
	img{width: 500px; height: 350px;}
</style>
<script src="../js/jquery-3.4.1.js"></script>
<script src="../js/jquery.innerfade.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		// innerfade = 사진이 다른 사진으로 서서히 바뀜 
		$('#inner_fade').innerfade({
			animationtype: 'fade',
			speed: 750,
			timeout: 2000,
			type: 'random',
			containerheight: 350px
		});
	});
</script>
</head>
<body>
<ul id="inner_fade">
	<li><img src="1.jpg"></li>
	<li><img src="2.jpg"></li>
	<li><img src="3.jpg"></li>
	<li><img src="4.jpg"></li>
	<li><img src="5.jpg"></li>
</ul>
</body>
</html>