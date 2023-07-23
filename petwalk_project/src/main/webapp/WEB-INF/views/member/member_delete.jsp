<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko" class="pc full">
<head>
<meta charset="utf-8">
<title>펫워크 회원탈퇴</title>
<link rel="shortcut icon" href="./img/petmark.png" type="image/x-icon">
<link rel="stylesheet" href="./css/memberSign.css" />
<style>
@font-face {
	font-family: 'HGSoftGGothicssi60g';
	font-display: swap;
	src: url('https://font.alba.co.kr/HGSoftGGothicssi60g.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'HGSoftGGothicssi80g';
	font-display: swap;
	src: url('https://font.alba.co.kr/HGSoftGGothicssi80g.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'HGSoftGGothicssi99g';
	font-display: swap;
	src: url('https://font.alba.co.kr/HGSoftGGothicssi99g.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}
</style>

<script src="./js/jquery-3.5.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		$("#JoinPerson")
				.submit(
						function() {
							if (!$("input[name='password']").val()) {
								alert("비밀번호를 입력하세요.");
								$("input[name='password']").focus();
								return false;
							}

							var regexp_password = /^(?=.*[!@#$%^&*])(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d!@#$%^&*]{8,}$/;
							var password_check = $("input[name='password']")
									.val();

							if (!regexp_password.test(password_check)) {
								alert("비밀번호는 공백을 제외한 영문이나 숫자, 특수문자 형태의 8~15 자리만 입력할 수 있습니다.");
								$("input[name='password']").focus();
								return false;
							}

							if (!$("input[name='password2']").val()) {
								alert("비밀번호를 확인하세요.");
								$("input[name='password2']").focus();
								return false;
							}

							if ($("input[name='password']").val() != $(
									"input[name='password2']").val()) {
								alert("비밀번호가 일치하지 않습니다.");
								$("input[name='password2']").focus();
								return false;
							}

							var storedPassword = ${"memberDTO.password"};
							// 입력한 비밀번호와 저장된 비밀번호를 비교

							if ($("input[name='password']").val() !== storedPassword) {
								alert("탈퇴할 계정의 비밀번호와 일치하지 않습니다.");
								$("input[name='password']").focus();
								return false;
							}
						});
	});
</script>
</head>

<body id="JoinPerson" class="ALBA join join--new person">

	<header id="Header">
		<div id="HeaderGnb">
			<h1>
				<a href="./index.jsp"> <img src="./img/petwalk.png" height="45"
					alt="펫워크" />
				</a>
			</h1>
			<ul>
				<li class="home"><a href="./index.jsp">HOME</a></li>

			</ul>
		</div>
	</header>

	<section id="Section1" class='oldApp'>
		<form name="frmReg" method="post" action="./MemberDelete">
	
			<article id="Contents" class="joinPerson memberJoin">
				<h1 class="sign__title">회원탈퇴</h1>


				<section class="sign-section">
					<div class="input-box-wrap">
						<div class="input-box">
							<input type="text" id="id" name="id" class="has-label"
								maxlength="15" value="${param.id}"
								style="background-color: #e2e2e2;" readonly /> <label for="id">탈퇴할
								아이디</label>
						</div>
					</div>
				</section>



				<section class="sign-section passwd">
					<ul class="input-box-wrap">



						<li class="input-box"><input type="password" id="password"
							name="password" class="has-label" autocomplete="new-password" />
							<label for="password">탈퇴할 계정의 비밀번호를 입력해주세요</label></li>



						<li class="input-box"><input type="password" id="password2"
							name="password2" class="has-label" maxlength="15" /><label
							for="password2">비밀번호 재입력</label></li>



					</ul>
				</section>

	
				<div class="btnAction">
					<input type="submit" class="btn btnType1 submit" value="탈퇴하기">
				</div>

			</article>
		</form>
	</section>
</body>