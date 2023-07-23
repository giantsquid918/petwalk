<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫워크 게시판</title>
<link rel="shortcut icon" href="./img/petmark.png" type="image/x-icon">
</head>
<body>

	<form action="./BoardDelete?num=${param.num}" method="post"
		id="BoardDelete">
		<script type="text/javascript">
			var confirmed = confirm("게시글을 삭제하시겠습니까?");
			if (confirmed === true) {
				document.getElementById("BoardDelete").submit();
			} else {
				location.href = "./BoardSelect";
			}
		</script>
	</form>


</body>
</html>