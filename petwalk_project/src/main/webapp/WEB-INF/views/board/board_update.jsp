<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>펫워크 게시판</title>
<link rel="shortcut icon" href="./img/petmark.png" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="./css/global.css">
<link rel="stylesheet" type="text/css" href="./css/all.min.css">
<link rel="stylesheet" type="text/css"
	href="./css/bootstrap.min_4.5.0.css">
<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min_4.5.0.js" type="text/javascript"></script>
<script src="./js/popper.min.js" type="text/javascript"></script>
<script src="./js/ckeditor/ckeditor.js" type="text/javascript"></script>
<script src="./js/jquery.validate.min.js" type="text/javascript"></script>
<script src="./js/validity.js" type="text/javascript"></script>
</head>
<body>
	<nav class="navbar navbar-expand-md bg-dark navbar-dark text-white">
		<div class="container">
			<div class="col-md-6">
				<h1>
					<img src="./img/petmark.png" height="45" /> 게시판
				</h1>
			</div>
			<div id="toggle" class="navbar-collapse collapse">
				<ul class="navbar-nav">
				</ul>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item dropdown mr-3"><c:if
							test="${!empty sessionScope.id}">
							<p class="nav-link dropdown-toggle" data-toggle="dropdown">	${sessionScope.id} 님</p>
						</c:if>
						<div class="dropdown-menu">
							<c:choose>
								<c:when test="${!empty sessionScope.id}">
									<a class="dropdown-item"
										href="./MemberSelectDetail?id=${sessionScope.id}"> 
										 회원 정보
									</a>
								</c:when>
							</c:choose>
						</div> <c:choose>
							<c:when test="${empty sessionScope.id}">
								<li class="nav-item"><a href="./LoginPage" class="nav-link"> 로그인</a>
							</c:when>
							<c:otherwise>
								<li class="nav-item"><a href="./Logout" class="nav-link">로그아웃 </a>
							</c:otherwise>
						</c:choose>
				</ul>
				<ul class="navbar-nav py-3 mb-3 pl-3 pr-3">
					<li><a href="./index.jsp" class="navbar-brand text-white">홈 </a></li>
				</ul>
			</div>
		</div>
	</nav>
	<header id="main-header" class="py-2 bg-secondary"> </header>
	<section class="py-3 mb-3 bg-light">
		<div class="container">
			<div class="row col-md-12"></div>
		</div>
	</section>
	<section id="board">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<h3 class="text-muted">글 수정</h3>
						</div>
						<div class="card-body">
							<form action="./BoardUpdate" method="post" id="checkForm">
								<fieldset>
									<div class="row pl-1 pr-1">
										<div class="col col-md-10">
											<input type="hidden" name="id" value="${sessionScope.id}">
											<input type="hidden" name="num" value="${boardDTO.num}">
											<div class="form-group row">
												<label for="subject" class="col-2 col-form-label pr-0">제목 </label>
												<div class="col-7 pl-0">
													<input type="text" name="subject" id="subject" class="form-control" value="${boardDTO.subject}">
												</div>
											</div>

											<div class="form-group row">
												<label for="attachedfile" class="col-2 col-form-label pr-0">파일 수정 </label>
												<div class="ml-sm-2">
													<div class="form-group">
														<input type="file" name="attachedfile" id="attachedfile"
															class="form-control-file">
													</div>
												</div>
											</div>
											
											<div class="form-group row">
												<%-- 파일 첨부를 확인한다.--%>
												<c:if test="${!empty boardDTO.attachedfile}">
													<label for="attachedfile" class="col-2 col-form-label pr-0">저장 파일 </label>
													<div class="ml-sm-1 mx-auto py-2 mb-2">
														<div class="form-group">
															${boardDTO.attachedfile} <a
																href="./boardUpload/${boardDTO.attachedfile}"> 파일 다운</a> 
																<input type="hidden" name="oldfile" value="${boardDTO.attachedfile}">
														</div>
													</div>
												</c:if>
											</div>
										</div>
									</div>

									<div class="form-group row">
										<label for="subject" class="col-2 col-form-label pr-0">시급 </label>
										<div class="col-7 pl-0">
											<input type="text" name="pay" id="pay" class="form-control" value="${boardDTO.pay}">
										</div>
									</div>

									<div class="form-group row">
										<label for="subject" class="col-2 col-form-label pr-0">연락처 </label>
										<div class="col-7 pl-0">
											<input type="text" name="cellnum" id="cellnum" class="form-control" value="${boardDTO.cellnum}">
										</div>
									</div>


									<div class="form-group row">
										<label for="content" class="col-2 col-form-label pr-0"> 내용 </label>
										<div class="col-10 pl-0">
											<textarea name="content" id="content" class="form-control ckeditor">${boardDTO.content}</textarea>
										</div>
									</div>



									<nav class="navbar justify-content-end">
										<button type="submit" class="btn btn-outline-primary mr-sm-1">글 저장</button>
										<button type="reset" id="clear" class="btn btn-outline-warning mr-sm-1">글 취소</button>
										<button type="button" class="btn btn-outline-success mr-sm-1" onclick="location.href='./BoardSelect'">글 목록</button>
									</nav>
									
								</fieldset>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<footer id="main-footer" class="bg-secondary text-white mt-3 p-3">
		<div class="container">
			<div class="row">
				<div class="col"></div>
			</div>
		</div>
	</footer>
</body>
</html>