<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:if test="${empty sessionScope.id}">
	<script type="text/javascript"> location.href = "./LoginPage" </script>
</c:if>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>펫워크</title>
<link rel="shortcut icon" href="./img/petmark.png" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="./css/global.css">
<link rel="stylesheet" type="text/css" href="./css/all.min.css">
<link rel="stylesheet" type="text/css"
	href="./css/bootstrap.min_4.5.0.css">
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min_4.5.0.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		$("#limit").change(function() {
			location.href = "./MemberSelect?limit=" + $(this).val();
		});
		if ("${!empty limit}") {
			$("#limit").val("${limit}").prop('selected', true);
		}
		;
	});
</script>
</head>
<body>
	<nav class="navbar navbar-expand-md bg-dark navbar-dark text-white">
		<div class="container">
			<div class="col-md-6">
				<h1>
					<img src="./img/petmark.png" height="45" /> 회원 가입
				</h1>
			</div>
			<div id="toggle" class="navbar-collapse collapse">
				<ul class="navbar-nav">
				</ul>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item dropdown mr-3"><c:if
							test="${!empty sessionScope.id}">
							<p class="nav-link dropdown-toggle" data-toggle="dropdown">
								${sessionScope.id} 님</p>
						</c:if>
						<div class="dropdown-menu">
							<c:choose>
								<c:when test="${!empty sessionScope.id}">
									<a class="dropdown-item"
										href="./BoardSelect?id=${sessionScope.id}"> 게시판 </a>
								</c:when>
							</c:choose>
						</div> 
						<li class="nav-item"><a href="./Logout" class="nav-link">로그아웃 </a>

				</ul>
				<ul class="navbar-nav py-3 mb-3 pl-3 pr-3">
					<li><a href="./index.jsp" class="navbar-brand">Home </a></li>
				</ul>
			</div>
		</div>
	</nav>
	<header id="main-header" class="py-2 bg-secondary"> </header>



	<form action="/MemberSelect" method="post">
		<section id="member">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<h3 class="text-muted">회원 목록</h3>
								<p align="right">전체 회원: ${memberCount}명</p>
					

							</div>
							<table class="table table-bordered">
								<thead class="thead-light">
									<tr class="text-center">

										<th>회원번호</th>
										<th>아이디</th>
										<th>비밀번호</th>
										<th>이름</th>
										<th>닉네임</th>
										<th>생일</th>
										<th>연락처</th>
										<th>이메일</th>
										<th>가입일</th>

									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${memberCount > 0}">
											<c:forEach var="list" items="${list}">
												<tr class="text-center">

													<td><c:set var="now" value="<%=new java.util.Date()%>" />
														<fmt:formatDate var="nowDay" value="${now}" type="date"
															pattern="yyyy-MM-dd" /> <c:if
															test="${list.joinday == nowDay}">
															<span class="badge badge-danger mr-sm-1"> new </span>
														</c:if> ${list.num}</td>

													
													<td><a href="./MemberSelectDetail?id=${list.id}">${list.id}</a></td>

													<td>${list.password}</td>
													<td>${list.name}</td>
													<td>${list.nickname}</td>
													<td>${list.birthday}</td>
													<td>${list.cellnum}</td>
													<td>${list.email}</td>
													<td>${list.joinday}</td>

												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="8" align="center">등록된 회원이 없습니다.</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>


				
							

							<nav class="navbar justify-content-end">
								<div class="btn-group">
									<button type="button" class="btn btn-outline-info mr-sm-1"
										onclick="location.href='./MemberInsert'">회원 등록</button>
								</div>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</section>
	</form>


	<footer id="main-footer" class="bg-secondary text-white mt-3 p-3">
		<div class="container">
			<div class="row">
				<div class="col">
					<p class="lead text-center"></p>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>