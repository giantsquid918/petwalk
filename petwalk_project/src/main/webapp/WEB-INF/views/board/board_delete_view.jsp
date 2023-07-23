<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫워크</title>
<link rel="shortcut icon" href="./img/petmark.png" type="image/x-icon">
</head>
<body>
	<form action="./BoardDelete" method="post" id="SignDelete">
		<script type="text/javascript">
			alert("게시글이 삭제되었습니다.");
			location.href = "./BoardSelect"
		</script>
	</form>
</body>
</html>