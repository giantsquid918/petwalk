<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원수정</title>
<link rel="shortcut icon" href="./img/petmark.png" type="image/x-icon">
</head>
<body>
	<script type="text/javascript">
		alert("${memberDTO.id}님의 개인 정보를 수정하였습니다.")
		location.href = "./MemberSelectDetail?id=${memberDTO.id}";
	</script>
</body>
</html>