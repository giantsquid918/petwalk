<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	session.removeAttribute("id");
%>
<!DOCTYPE html>
<html lang="ko" class=" js ">
<head>
<meta charset="utf-8">
<title>로그인</title>
<link rel="shortcut icon" href="./img/petmark.png" type="image/x-icon">
<meta name="referrer" content="always">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Sign.css">


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

	<script src="/rsc/js/MemberCommonCLS.js?202304241200"></script>
</head>

<body class="ALBA">

	<input type="hidden" id="device" name="device" value="">
	<input type="hidden" id="version" name="version" value="">
	<input type="hidden" id="siteui" name="siteui" value="ALBA">
	<input type="hidden" id="sitecd" name="sitecd" value="WWW">
	<input type="hidden" id="oldappyn" name="oldappyn" value="">
	<input type="hidden" id="nativelogin" name="nativelogin" value="">


 <script>
function doLogin() {
	var id = document.getElementById("id").value;
	var frm = document.getElementById("f");
	
	if (id == "") {
		alert("아이디를 입력하세요.");
		return false;
	}
	if (document.getElementById("password").value == "") {
		alert("비밀번호를 입력하세요.");
		return false;
	}	
	if (document.getElementById("usertype").value != "") {
		$.ajax({
			type: "post",
			url: "/login/UserTypeCheckAjax.asp",
			data: { "id" : id },
			dataType: "jsonp",
			jsonp: "UserTypeCheck",
			success: function(data) {
			}
		});
	} else {
		frm.action = "https://" + location.host + "/login/Login.asp";
		frm.submit();
	}
}
</script> 


	<fieldset id="LoginSection">

		<header id="Header">
			<div id="HeaderGnb">
				<h1>
					<a href="메인홈링크 작성공간"></a>
				</h1>
				<ul>
					<li class="home"><a href="./index.jsp">Home</a></li>



				</ul>
			</div>
		</header>

		<section id="Section">
			<div class="loginCombine">
				<div class="login-head">
					<p class="login-head__title">
						<img src="./img/petwalk.png" height="180" width="380" alt="펫워크">
					</p>
				</div>

				<div class="login-wrap">
					<form id="signupForm" name="f" method="post" action="./Login"
						enctype="application/x-www-form-urlencoded">

						<input type="hidden" id="site" name="site" value="WWW"> <input
							type="hidden" id="gourl" name="gourl"
							value="https://sign.alba.co.kr/user/find/IdSearch.asp?site=WWW&amp;usertype=C">
						<input type="hidden" id="usertype" name="usertype" value="P">
						<input type="hidden" id="two_fa" name="two_fa" value="Y">



						<fieldset class="login-field">
							<legend>로그인</legend>
							<div class="login-field__action">
								<input type="text" id="id" name="id" value="" title="아이디"
									placeholder="아이디" style="ime-mode: disabled" tabindex="1">
								<input type="password" id="password" name="password"
									title="비밀번호" placeholder="비밀번호" tabindex="2">
								<button type="submit" id="btnLogin" tabindex="3"
									onclick="doLogin();return false;">로그인</button>
							</div>
						</fieldset>

						<div class="login-link">
						
							<a href="./MemberInsert"><strong>회원가입</strong></a> 
							<a href="./SearchId">아이디 찾기</a> 
							<a href="./SearchPassword">비밀번호 찾기</a>



							<div class="login-sns">
								<button type="button" class="naver"
									onclick="OauthLoginCLS.doLogin('N');snsBtnClick('NAVER');return false;">네이버</button>
								<button type="button" class="kakao"
									onclick="OauthLoginCLS.doLogin('K');snsBtnClick('KAKAO');return false;">카카오톡</button>
								<button type="button" class="facebook"
									onclick="OauthLoginCLS.doLogin('F');snsBtnClick('FACEBOOK');return false;">페이스북</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</section>
	</fieldset>
</body>
</html>