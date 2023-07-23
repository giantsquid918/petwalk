<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko" class="pc full">
<head>
<meta charset="utf-8">
<title>회원가입</title>
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
<script src="./js/validity.js" type="text/javascript"></script>
<script src="./js/idcheck.js" type="text/javascript"></script>

<script type="text/javascript">
function generateRandomNumber() {
  var num = Math.floor(Math.random() * 90000000) + 10000000;
  document.getElementById("num").value = num;
}
</script>

<script type="text/javascript">
	$(function() {
		$("#JoinPerson").submit(function() {

			if (!$("input[name='id']").val()) {
				alert(" 아이디를 입력하세요.");
				$("input[name='id']").focus();
				return false;
			}

			var regexp_id = /^[a-zA-Z0-9]{4,15}$/;
			var id_check = $("input[name='id']").val();

			if (!regexp_id.test(id_check)) {
				alert(" 아이디는 공백을 제외한 알파벳 대소문자와 숫자 4~15 자리만 입력할 수 있습니다.");
				$("input[name='id']").focus();
				return false;
			}
		
			if (!$("input[name='nickname']").val()) {
				alert(" 닉네임을 입력하세요.");
				$("input[name='nickname']").focus();
				return false;
			}
			var regexp_nickname = /^[가-힣0-9]{2,8}$/;
			var nickname_check = $("input[name='nickname']")
					.val();

			if (!regexp_nickname.test(nickname_check)) {
				alert(" 닉네임은 공백을 제외한 한글과 숫자 2~8 자만 입력할 수 있습니다.");
				$("input[name='nickname']").focus();
				return false;
			}

			if (!$("input[name='password']").val()) {
				alert(" 비밀번호를 입력하세요.");
				$("input[name='password']").focus();
				return false;
			}

			var regexp_password = /^(?=.*[!@#$%^&*])(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d!@#$%^&*]{8,}$/;
			var password_check = $("input[name='password']")
					.val();

			if (!regexp_password.test(password_check)) {
				alert(" 비밀번호는 공백을 제외한 영문이나 숫자, 특수문자 형태의 8~15 자리만 입력할 수 있습니다.");
				$("input[name='password']").focus();
				return false;
			}
			if (!$("input[name='password2']").val()) {
				alert(" 비밀번호를 확인하세요.");
				$("input[name='password2']").focus();
				return false;
			}

			if ($("input[name='password']").val() != $(
					"input[name='password2']").val()) {
				alert(" 비밀번호가 일치하지 않습니다.");
				$("input[name='password2']").focus();
				return false;
			}

			if (!$("input[name='name']").val()) {
				alert(" 이름을 입력하세요.");
				$("input[name='name']").focus();
				return false;
			}

			var regexp_name = /^[가-힣]{2,4}$/;
			var name_check = $("input[name='name']").val();

			if (!regexp_name.test(name_check)) {
				alert(" 이름은 공백을 제외한 한글 2~4 자만 입력할 수 있습니다.");
				$("input[name='name']").focus();
				return false;
			}

			var birthday = $("#birthday").val();
			var regexp_birthday = /^(\d{4})\-?(\d{2})\-?(\d{2})$/;

			if (!birthday) {
				alert("생년월일을 입력하세요.");
				$("#birthday").focus();
				return false;
			} else {
				var year = parseInt(birthday.substr(0, 4));
				var month = parseInt(birthday.substr(4, 2));
				var day = parseInt(birthday.substr(6, 2));
				var date = new Date(year, month - 1, day);

				if (date.getFullYear() != year
						|| date.getMonth() != month - 1
						|| date.getDate() != day) {
					alert("올바른 생년월일을 입력하세요.");
					$("#birthday").focus();
					return false;
				}
			}

			if (!$("input[name='email']").val()) {
				alert(" 이메일을 입력하세요.");
				$("input[name='email']").focus();
				return false;
			}
			var regexp_email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
			var email_check = $("input[name='email']").val();
			if (!regexp_email.test(email_check)) {
				alert(" 이메일 형식에 맞춰 입력하세요.");
				$("input[name='email']").focus();
				return false;
			}

			if (!$("input[name='cellnum']").val()) {
				alert(" 휴대폰 번호를 입력하세요.");
				$("input[name='cellnum']").focus();
				return false;
			}
			var regexp_cellnum = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
			var cellnum_check = $("input[name='cellnum']")
					.val();
			if (!regexp_cellnum.test(cellnum_check)) {
				alert(" 휴대폰번호 '-' 제외한 숫자 11자리를 입력하세요");
				$("input[name='cellnum']").focus();
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
				<a href="./index.jsp"> <img src="./img/petwalk.png"
					height="45" alt="펫워크" />
				</a>
			</h1>
			<ul>
				<li class="home"><a href="./index.jsp">HOME</a></li>
				<li class="login"><a href="./LoginPage">로그인</a></li>
			</ul>
		</div>
	</header>

	<section id="Section" class='oldApp'>
		<form name="frmReg" method="post" id="signupForm" action="./MemberInsert">
			
			<article id="Contents" class="joinPerson memberJoin">
				<h1 class="sign__title">회원가입</h1>

				<label><font color="red" size="2">＊아이디는 가입 이후 수정이 불가합니다</font></label>
				<section class="sign-section">
					<div class="input-box-wrap">


						<div class="input-box">
							<input type="text" id="id" name="id" class="has-label" maxlength="15" /> 
							<label for="id">아이디 (4~15자 영문,숫자)</label>
							<button type="button" id="dbidCheck" class="box-in-button">중복체크</button>
							<input type="hidden" name="idCheck" id="idCheck">
						</div>



						<label><font color="red" size="2">＊닉네임은 가입 이후 수정이
								불가합니다</font></label>
						<section class="sign-section">
							<div class="input-box-wrap">
								<div class="input-box">
									<input type="text" id="nickname" name="nickname"
										class="has-label" maxlength="15" /> <label for="nickname">닉네임
										(2~8자 한글, 숫자)</label>
								</div>
							</div>
						</section>

					</div>
				</section>

				<section class="sign-section passwd">
					<ul class="input-box-wrap">
						<li class="input-box"><input type="password" id="password"
							name="password" class="has-label" autocomplete="new-password" />
							<label for="passwd">비밀번호<span>8-15자의 영문/숫자/특수문자 모두
									입력</span></label></li>

						<li class="input-box"><input type="password" id="password2"
							name="password2" class="has-label" maxlength="15" /> <label
							for="passwords2">비밀번호 재입력</label></li>
					</ul>
				</section>

				<section class="sign-section name">
					<div class="input-box-wrap">
						<div class="input-box">
							<input type="text" id="name" class="has-label" name="name"
								maxlength="20" value="" /> <label for="name">이름</label>
						</div>
					</div>
				</section>

				<section class="sign-section">
					<div class="input-box-wrap">
						<div class="input-box">
							<input type="text" id="birthday" class="has-label"
								name="birthday" value="" maxlength="8" /> <label for="">생년월일
								8자리 입력<span>('-' 없이 입력하세요.)</span>
							</label>
						</div>
					</div>
				</section>

				<section class="sign-section">
					<ul class="input-box-wrap">
						<li id="inputboxemail" class="input-box email hide-last-child">
							<input type="text" id="email" class="has-label" name="email"
							value="" maxlength="50" /> <label for="email">이메일</label>
						</li>
					</ul>
				</section>

				<section class="sign-section">
					<ul class="input-box-wrap">
						<li class="input-box"><input type="hidden" id="cellnum1"
							name="cellnum1" value="" /> <input type="tel" id="cellnum"
							class="has-label" name="cellnum" value="" maxlength="11" /> <label
							for="htel">휴대폰 <span>('-' 없이 입력하세요.)</span></label>

							<button type="button"
								onclick="JoinRegFormPCLS.sendCertNum();return false;"
								id="btnCertSend" class="box-in-button">인증번호 요청</button></li>
						<li class="input-box"><input type="hidden" id="certnumcheck"
							name="certnumcheck" value="" /> <input type="hidden" id="certyn"
							name="certyn" value="N" /> <input type="tel" id="certnum"
							name="certnum" class="has-label" maxlength="6" /> <label
							for="certnum">인증번호</label>

							<button type="button"
								onclick="JoinRegFormPCLS.doSubmitCertNum();"
								class="box-in-button">확인</button></li>
					</ul>
				</section>

	
				<div class="btnAction">
				 <input type="hidden" id="num" name="num">
					<input type="submit" class="btn btnType1 submit" value="가입하기 " onclick="generateRandomNumber()">
				</div>


			</article>
		</form>
	</section>
</body>
</html>