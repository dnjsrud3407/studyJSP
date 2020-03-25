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
		// 대상.attr() - 태그의 속성값 바꾸기
// 		var i = $('img').attr('src');
// 		alert(i);
		$('img').attr('src','5.jpg');
		var i = ['2.jpg','3.jpg','5.jpg'];
		$('img').attr('src', function (index) {
			return i[index];
		})
		// width, height, border 값 바꿔보기
		$('img').attr({
			width: '300',
			height: '200',
			border: '3'
		});
		var w = ['100','200','300'];
		var h = ['50','150','250'];
		var b = ['2','4','6'];
		$('img').attr({
			width : function (index) {
				return w[index];
			},
			height : function (index) {
				return h[index];
			},
			border : function (index) {
				return b[index];
			}
		});
	});
</script>
</head>
<body>
<img src="1.jpg" width="184" height="138" border="1">
<img src="2.jpg" width="184" height="138" border="1">
<img src="3.jpg" width="184" height="138" border="1">
</body>
</html>