<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty sessionScope.id}">
	<script type="text/javascript">
		location.href = "./LoginPage"
	</script>
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
<link rel="stylesheet" type="text/css" href="./css/bootstrap.min_4.5.0.css">
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min_4.5.0.js" type="text/javascript"></script>
<script src="./js/popper.min.js" type="text/javascript"></script>
<script src="./js/jquery.validate.min.js" type="text/javascript"></script>
<script src="./js/validity.js" type="text/javascript"></script>
<script src="./js/bootstrap-datepicker.js"></script>
<script src="./js/bootstrap-datepicker.ko.js"></script>

</head>
<body>
	<nav class="navbar navbar-expand-md bg-dark navbar-dark text-white">
		<div class="container">
			<div class="col-md-6">
				<h1>
					<img src="./img/petmark.png" height="45" /> 회원 정보
				</h1>
			</div>
			<div id="toggle" class="navbar-collapse collapse">
				<ul class="navbar-nav">
				</ul>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item dropdown mr-3">
					
					<c:if test="${!empty sessionScope.id}">
							<p class="nav-link dropdown-toggle" data-toggle="dropdown">${sessionScope.id} 님</p>
					</c:if>
					<div class="dropdown-menu">
						<c:choose>
							<c:when test="${!empty sessionScope.id}">
								<a class="dropdown-item" href="./BoardSelect?id=${sessionScope.id}"> 게시판 </a>
							</c:when>
						</c:choose>
					</div> 

								<li class="nav-item"><a href="./Logout" class="nav-link">로그아웃 </a>

				</ul>
				<ul class="navbar-nav py-3 mb-3 pl-3 pr-3">
					<li><a href="./index.jsp" class="navbar-brand"> Home </a></li>
				</ul>
			</div>
		</div>
	</nav>
	<header id="main-header" class="py-2 bg-secondary"></header>
	<section class="py-3 mb-3 bg-light">
		<div class="container">
			<div class="row col-md-12"></div>
		</div>
	</section>
	<section id="member">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<h3 class="text-muted">회원 상세 정보</h3>
						</div>
						<div class="card-body">
							<div class="row">
								<div class="col-11">
									<ul class="list-group list-group-horizontal">
										<li class="list-group-item col-md-2">회원번호</li>
										<li class="list-group-item col-md-5">${memberDTO.num}</li>
									</ul>
								</div>
							</div>
							<div class="row">
								<div class="col-11">
									<ul class="list-group list-group-horizontal">
										<li class="list-group-item col-md-2">아이디</li>
										<li class="list-group-item col-md-5">${memberDTO.id}</li>
									</ul>
								</div>
							</div>
							<div class="row">
								<div class="col-11">
									<ul class="list-group list-group-horizontal">
										<li class="list-group-item col-md-2">비밀번호</li>
										<li class="list-group-item col-md-5">${memberDTO.password}</li>
									</ul>
								</div>
							</div>
							<div class="row">
								<div class="col-11">
									<ul class="list-group list-group-horizontal">
										<li class="list-group-item col-md-2">이름</li>
										<li class="list-group-item col-md-5">${memberDTO.name}</li>
									</ul>
								</div>
							</div>
							<div class="row">
								<div class="col-11">
									<ul class="list-group list-group-horizontal">
										<li class="list-group-item col-md-2">닉네임</li>
										<li class="list-group-item col-md-5">${memberDTO.nickname}</li>
									</ul>
								</div>
							</div>

							<div class="row">
								<div class="col-11">
									<ul class="list-group list-group-horizontal">
										<li class="list-group-item col-md-2">생일</li>
										<li class="list-group-item col-md-5">${memberDTO.birthday}</li>
									</ul>
								</div>
							</div>

							<div class="row">
								<div class="col-11">
									<ul class="list-group list-group-horizontal">
										<li class="list-group-item col-md-2">연락처</li>
										<li class="list-group-item col-md-5">${memberDTO.cellnum}</li>
									</ul>
								</div>
							</div>

							<div class="row">
								<div class="col-11">
									<ul class="list-group list-group-horizontal">
										<li class="list-group-item col-md-2">이메일</li>
										<li class="list-group-item col-md-5">${memberDTO.email}</li>
									</ul>
								</div>
							</div>



							<div class="row">
								<div class="col-11">
									<ul class="list-group list-group-horizontal">
										<li class="list-group-item col-md-2">가입일</li>
										<li class="list-group-item col-md-5">${memberDTO.joinday}</li>
									</ul>
								</div>
							</div>
							
							<nav class="navbar justify-content-end">
								<c:if test="${sessionScope.id == 'admin'}">
									<button type="button" class="btn btn-outline-success mr-sm-1"
										onclick="location.href='./MemberSelect'">회원 목록</button>
								</c:if>
								<button type="button" class="btn btn-outline-secondary mr-sm-1"
									onclick="location.href='./MemberUpdate?id=${memberDTO.id}'">
									회원 수정</button>
								<button type="button" class="btn btn-outline-danger mr-sm-1"
									onclick="location.href='./MemberDelete?id=${memberDTO.id}'">
									회원 탈퇴</button>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
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