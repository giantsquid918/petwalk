<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
</head>
<body>
	<nav class="navbar navbar-expand-md bg-dark navbar-dark text-white">
		<div class="container">
			<div class="col-md-6">
				<h1>
					     <img src="./img/petmark.png" height="45"  /> 구인 게시판
				</h1>
			</div>
			<div id="toggle" class="navbar-collapse collapse">
				<ul class="navbar-nav">
				</ul>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item dropdown mr-3"><c:if
							test="${!empty sessionScope.id}">
							<p class="nav-link dropdown-toggle" data-toggle="dropdown">
							 ${sessionScope.id} 님
							</p>
						</c:if>
						<div class="dropdown-menu">
							<c:choose>
								<c:when test="${!empty sessionScope.id}">
									<a class="dropdown-item"
										href="./MemberSelectDetail?id=${sessionScope.id}"> 회원 정보
									</a>
								</c:when>
							</c:choose>
						</div> <c:choose>
							<c:when test="${empty sessionScope.id}">
								<li class="nav-item"><a href="./LoginPage"
									class="nav-link"> 
										로그인
								</a>
							</c:when>
							<c:otherwise>
								<li class="nav-item"><a href="./Logout"
									class="nav-link"> 
										로그아웃
								</a>
							</c:otherwise>
						</c:choose>
				</ul>
				<ul class="navbar-nav py-3 mb-3 pl-3 pr-3">
					<li><a href="./index.jsp" class="navbar-brand text-white">
							Home
					</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<header id="main-header" class="py-2 bg-secondary"> </header>
	

	
	<section id="board">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<h3 class="text-muted">
								 글 목록
							</h3>
							<p align="right">
								<%--전체 글의 개수를 호출한다.--%>
								전체 글: <strong>${boardCount}</strong> 개
							</p>
						</div>
						<table class="table table-hover">
							<c:choose>
								<c:when test="${boardCount>0}">
									<thead class="thead-light">
										<tr class="text-center">

											<th>번호</th>
											<th>제목</th>
											<th>작성자</th>
											<th>작성일</th>
									
										</tr>
									</thead>
									<c:forEach var="list" items="${list}" varStatus="status">
										<tbody>
											<tr class="text-center">
												<td><c:set var="now" value="<%=new java.util.Date()%>" />
													<fmt:formatDate var="nowDay" value="${now}" type="date"
														pattern="yyyy-MM-dd" /> <c:if
														test="${list.writeday == nowDay}">
														<span class="badge badge-danger mr-sm-1"> new </span>
													</c:if> ${status.index + 1}</td>


												<td><a href="./BoardSelectDetail?num=${list.num}">${list.subject}</td>
												<td>${list.id}</td>
												<td>${list.writeday}</td>
											<%-- 	<td>${list.readcount}</td> --%>
											</tr>
										</tbody>
									</c:forEach>
								</c:when>
							</c:choose>
						</table>
						<table class="table table-hover">
							<tbody>
							</tbody>
							<%-- 등록된 글이 없을 때 출력한다.--%>
							<c:if test="${boardCount==0}">
								<tr>
								
									<td style="text-align: center;">등록된 글이 없습니다.</td>
								</tr>
							</c:if>
							<tr>
						</table>

						<nav class="navbar justify-content-end">
							<div class="btn-group">
								<button type="button" class="btn btn-outline-info"
									onclick="location.href='./BoardInsert'">
								 글 등록
								</button>
							</div>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</section>
	<footer id="main-footer" class="bg-secondary text-white mt-3 p-3">
		<div class="container">
			<div class="row">
				<div class="col">

				</div>
			</div>
		</div>
	</footer>
</body>
</html>