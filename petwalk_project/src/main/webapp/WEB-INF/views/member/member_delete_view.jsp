<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫워크 회원탈퇴</title>
<link rel="shortcut icon" href="./img/petmark.png" type="image/x-icon">
</head>
<body>
<c:choose>
	<c:when test="${sessionScope.id == 'admin'}">
		<script type="text/javascript">
			alert("회원 (${memberDTO.id}) 아이디의 탈퇴가 완료되었습니다.")
			location.href="./MemberSelect"
		</script>
	</c:when>
	<c:otherwise>
	
		<script type="text/javascript">
			alert("탈퇴가 완료되었습니다.\n그동안 펫워크와 함께 걸어주셔서 감사합니다.")
			location.href="./LoginPage";
		</script>
		
	</c:otherwise>
</c:choose>
</body>
</html>