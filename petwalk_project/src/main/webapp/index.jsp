<!-- 기본 페이지 설정 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="pc full" lang="ko">
<head>
<meta charset="utf-8">
<title>함께 걸어요! 펫워크</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="shortcut icon" href="./img/petmark.png" type="image/x-icon">
<link rel="stylesheet" href="./bootstrap/css/slick.css">
<link rel="stylesheet" href="./bootstrap/css/slick-theme.css">
<link rel="stylesheet" href="./bootstrap/css/animate.css">
<link rel="stylesheet" href="./bootstrap/css/iconfont.css">
<link rel="stylesheet" href="./bootstrap/css/font-awesome.min.css">
<link rel="stylesheet" href="./bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="./bootstrap/css/magnific-popup.css">
<link rel="stylesheet" href="./bootstrap/css/bootsnav.css">
<link rel="stylesheet" href="./bootstrap/css/plugins.css" />
<link rel="stylesheet" href="./bootstrap/css/style.css">
<link rel="stylesheet" href="./bootstrap/css/responsive.css" />

<script src="./bootstrap/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
<script src="./bootstrap/js/vendor/jquery-1.11.2.min.js"></script>
<script src="./bootstrap/js/vendor/bootstrap.min.js"></script>
<script src="./bootstrap/js/jquery.magnific-popup.js"></script>
<script src="./bootstrap/js/jquery.easing.1.3.js"></script>
<script src="./bootstrap/js/slick.min.js"></script>
<script src="./bootstrap/js/js.isotope.js"></script>
<script src="./bootstrap/js/jquery.collapse.js"></script>
<script src="./bootstrap/js/bootsnav.js"></script>
<script src="./bootstrap/js/plugins.js"></script>
<script src="./bootstrap/js/main.js"></script>
<script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
</head>

<body data-spy="scroll" data-target=".navbar-collapse" data-offset="100">


	<div id="loading">
		<div id="loading-center">
			<div id="loading-center-absolute">
				<div class="object" id="object_one"></div>
				<div class="object" id="object_two"></div>
				<div class="object" id="object_three"></div>
				<div class="object" id="object_four"></div>
			</div>
		</div>
	</div>


	<div class="culmn">
		<nav class="navbar navbar-default bootsnav navbar-fixed no-background white">

			<!-- Start Top Search -->
			<div class="top-search">
				<div class="container">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-search"></i></span>
						<input type="text" class="form-control" placeholder="Search">
						<span class="input-group-addon close-search"><i
							class="fa fa-times"></i></span>
					</div>
				</div>
			</div>
			<!-- End Top Search -->

			<div class="container">
				<div class="attr-nav">
					<ul>
						<li class="search"><a href="#"><i class="fa fa-search"></i></a></li>
					</ul>
				</div>

				<!-- Start Header Navigation -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
						<i class="fa fa-bars"></i>
					</button>
					<a class="navbar-brand" href=""> <img src="./img/petwalk.png" height="45" alt="펫워크" />
					</a>
				</div>


				<!-- navbar menu -->
				<div class="collapse navbar-collapse" id="navbar-menu">
					<ul class="nav navbar-nav navbar-right">
					
						<li><a href="./BoardSelect"> 채용정보</a></li>
						
						<!-- 이 달의 인증샷, 정보 나눔 게시판 , 포인트 상점 구현 자리
						<li><a href=""> 인증샷</a></li>
						<li><a href=""> 정보나눔</a></li>
						<li><a href=""> 포인트 상점</a></li>
						 -->
						 
						<c:if test="${empty sessionScope.id}">
							<li class=brown><a href="MemberInsert">회원가입</a></li>
						</c:if>
						
						<li class="nav-item dropdown"><c:if
								test="${!empty sessionScope.id}">
								<li class=brown><a
									href="./MemberSelectDetail?id=${sessionScope.id}">${sessionScope.id}님
								</a></li>
							</c:if>
						<li class="nav-item dropdown"><c:choose>
								<c:when test="${empty sessionScope.id}">
									<li class=brown><a href="./LoginPage" class="nav-link">
											로그인 </a>
								</c:when>
								<c:otherwise>
									<li class=brown><a href="./Logout" class="nav-link">
											로그아웃 </a>
								</c:otherwise>
							</c:choose></li>
					</ul>
				</div>
			</div>
		</nav>


		<section id="home" class="home bg-black fix">
			<div class="overlay">
				<img src="./img/main.jpg" width="1920" height="900" alt="펫워크" />
			</div>
			<div class="container">
				<div class="row">
					<div class="main_home text-center">
						<div class="col-md-12">
							<div class="hello">
								<div class="slid_item">
									<div class="home_text ">
										<h1 class="text-white">Welcome, Let's walk together</h1>
										<h3 class="text-white text-uppercase">작은 친구들과 함께 걸어봐요!</h3>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		
		<!--Featured Section-->
		<section id="features" class="features bg-white">
			<div class="container">
				<div class="row">
					<div class="main_features fix roomy-70">
						<div class="col-md-5">
							<div class="features_item">
								<div class="head_title">
									<h2 class="text-uppercase">
										<strong>파트너 구인 게시판</strong>
									</h2>
									<a href="./BoardSelect" class="btn btn-default m-top-40">글 전체보기</a>
								</div>
								<div class="featured_content">
									<!--  <p>게시글 자리</p> -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>



		<!-- 이 달의 인증샷, 정보 나눔 게시판 구현자리 -->


		<footer id="contact" class="footer action-lage bg-black p-top-80">
			<div class="text-center"
				style="font-size: 80px; text-margin-bottom: 100px; color: white;">
				펫워크에 오신 것을 환영합니다</div>
		</footer>
	</div>
</body>
</html>



