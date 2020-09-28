<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<title>TheSignup</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png"
	href="/resources/images/icons/favicon.ico">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="/resources/css/util.css">
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<!--===============================================================================================-->
<style>
img {
	display: block;
	margin: 0px auto;
}

form {
	display: block;
	margin: 0px auto;
}

.limiter2 {
	text-align: center;
}
</style>
</head>
<body>

	<div class="limiter">
		<div class="container-login100">

			<div class="wrap-login100 p-l-55 p-r-55 p-t-20 p-b-50">
<<<<<<< HEAD
				<form class="login100-form validate-form" action="/The/TheSignUpProc.do" method="post" onsubmit="return check()">
				<span class="login100-form-title p-b-33 p-t-20"> Account Sign up </span>
				<div class="wrap-input100 validate-input">
				<input class="input100" type="text" id="userId" name="id" placeholder="ID" style="height: 60px;"required>
				<span class="focus-input100-1"></span>
				<span class="focus-input100-2"></span>
				</div>
				<span class="msg">사용하실 아이디를 입력하세요</span><br>
				
				<div class="wrap-input100 validate-input">
				<input type="password" name="pwd" id="password_1" class="pw input100 m-b-5" placeholder="8~15자 영문,숫자,특수문자" style="height: 60px;" required>
				<span class="focus-input100-1"></span>
				<span class="focus-input100-2"></span>
				<br>
				</div>
				<div class="wrap-input100 validate-input">
				<input type="password" id="password_2" class="pw input100 m-b-5" placeholder="비밀번호 확인" style="height: 60px;" required>
				<span class="focus-input100-1"></span>
				<span class="focus-input100-2"></span>
				<br>
				</div>
				<span id="alert-success" style="display: none; color: #00f;">비밀번호가 일치합니다.</span>
				<span id="alert-danger" style="display: none; color:#f00; ">비밀번호가 일치하지 않습니다.</span>
				<br>
				<div class="wrap-input100 validate-input">
				<input class="input100" type="email" id="userEmail" name="email" placeholder="email" style="height: 60px;" required>
				<span class="focus-input100-1"></span>
				<span class="focus-input100-2"></span>
				<span class="msg2">사용하실 이메일을 입력하세요</span>
				</div>
				<br>
				<div style="border:1px">Age</div>
				<select  class="wrap-input100 m-b-5" name="age" style=" height: 27px;">
				<option value="10">10대</option>
				<option value="20" selected>20대</option>
				<option value="30">30대</option>
				<option value="40">40대</option>
				<option value="50">50대</option>
				<option value="60">60대</option>
				</select><br> 
				
				<div>Gender</div>
				<div class="wrap-input100 m-b-5" style="height: 30px;">
				<input id="male" type="radio" name="gender" value="m" checked>
				<label for="male">male</label>&nbsp;&nbsp;&nbsp;
				<input id="female" type="radio" name="gender" value="w">
				<label for="female">female</label><br>
				</div>
				
				<div>Interest</div>
				<div class="wrap-input100 p-b-90">
				<input type="checkbox" name="interest" id="interest1" value="toeic">
				<label for="interest1">토익</label><br> 
				<input type="checkbox" name="interest" id="interest2" value="academic">
				<label for="interest2">학술/논문</label><br>
				<input type="checkbox" name="interest" id="interest3" value="business">
				<label for="interest3">비즈니스</label><br>
				</div>
			<br>
			<button id="btn" type="submit" class="alert-success login100-form-btn" style="height: 40px;">Sign Up</button>
		</form>
=======
				<form class="login100-form validate-form"
					action="/The/TheSignUpProc.do" method="post"
					onsubmit="return check()">
					<span class="login100-form-title p-b-33 p-t-20"> Account
						Sign up </span>
					<div class="wrap-input100 validate-input">
						<input class="input100" type="text" id="userId" name="id"
							placeholder="ID" style="height: 60px;" required> <span
							class="focus-input100-1"></span> <span class="focus-input100-2"></span>
					</div>
					<span class="msg">사용하실 아이디를 입력하세요</span><br>

					<div class="wrap-input100 validate-input">
						<input type="password" name="pwd" id="password_1"
							class="pw input100 m-b-5" placeholder="8~15자 영문,숫자,특수문자"
							style="height: 60px;" required> <span
							class="focus-input100-1"></span> <span class="focus-input100-2"></span>
						<br>
					</div>
					<div class="wrap-input100 validate-input">
						<input type="password" id="password_2" class="pw input100 m-b-5"
							placeholder="비밀번호 확인" style="height: 60px;" required> <span
							class="focus-input100-1"></span> <span class="focus-input100-2"></span>
						<br>
					</div>
					<span id="alert-success" style="display: none; color: #00f;">비밀번호가 일치합니다.</span> 
						<span id="alert-danger-1" style="display: none; color: #f00;">비밀번호가 일치하지 않습니다.</span> 
						<span id="alert-danger-2" style="display: none; color: #f00;">영문+숫자+특수기호 8자리 이상으로 구성하여야 합니다.</span> 
						<span id="alert-danger-3" style="display: none; color: #f00;">비밀번호는 ID를 포함할 수 없습니다.</span> 
						<span id="alert-danger-4" style="display: none; color: #f00;">동일문자를 3자 이상 연속 입력할 수 없습니다.</span> 
						<span id="alert-danger-5" style="display: none; color: #f00;">영문, 숫자는 3자 이상 연속 입력할 수 없습니다.</span> 
						<br>
					<div class="wrap-input100 validate-input">
						<input class="input100" type="email" id="userEmail" name="email"
							placeholder="email" style="height: 60px;" required> <span
							class="focus-input100-1"></span> <span class="focus-input100-2"></span>
						<span class="msg2">사용하실 이메일을 입력하세요</span>
					</div>
					<br>
					<div style="border: 1px">Age</div>
					<select class="wrap-input100 m-b-5" name="age"
						style="height: 27px;">
						<option value="10">10대</option>
						<option value="20" selected>20대</option>
						<option value="30">30대</option>
						<option value="40">40대</option>
						<option value="50">50대</option>
						<option value="60">60대</option>
					</select><br>

					<div>Gender</div>
					<div class="wrap-input100 m-b-5" style="height: 30px;">
						<input id="male" type="radio" name="gender" value="m" checked>
						<label for="male">male</label>&nbsp;&nbsp;&nbsp; <input
							id="female" type="radio" name="gender" value="w"> <label
							for="female">female</label><br>
					</div>

					<div>Interest</div>
					<div class="wrap-input100 p-b-90">
						<input type="checkbox" name="interest" id="interest1"
							value="toeic"> <label for="interest1">토익</label><br>
						<input type="checkbox" name="interest" id="interest2"
							value="academic"> <label for="interest2">학술/논문</label><br>
						<input type="checkbox" name="interest" id="interest3"
							value="business"> <label for="interest3">비즈니스</label><br>
					</div>
					<br>
					<button id="btn" type="submit"
						class="alert-success login100-form-btn" style="height: 40px;">Sign
						Up</button>
				</form>
>>>>>>> 0412320d6ce4091245e2ee8708b77cacfd546164

			</div>
		</div>
	</div>

	<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src="js/main.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<script type="text/javascript">
		$('.pw').keyup(
						function fn_pw_check() {

							var pw = document.getElementById("password_1").value; //비밀번호

							var pw2 = document.getElementById("password_2").value; // 확인 비밀번호

							var id = document.getElementById("userId").value;

							var pattern1 = /[0-9]/;

							var pattern2 = /[a-zA-Z]/;

							var pattern3 = /[~!@\#$%<>^&*]/; // 원하는 특수문자 추가 제거

							if (pw != '' && pw2 == '') {
								null;
							} else if (pw != "" || pw2 != "") {
								if (pw == pw2) {
									$("#alert-success").css('display','inline-block');
									$("#alert-danger-1").css('display', 'none');
									$("#alert-danger-2").css('display', 'none');
									$("#alert-danger-3").css('display', 'none');
									$("#alert-danger-4").css('display', 'none');
									$("#alert-danger-5").css('display', 'none');
								} else {
									$("#alert-success").css('display', 'none');
									$("#alert-danger-1").css('display',
											'inline-block');
									$("#alert-danger-2").css('display', 'none');
									$("#alert-danger-3").css('display', 'none');
									$("#alert-danger-4").css('display', 'none');
									$("#alert-danger-5").css('display', 'none');
								}
							}

							if (!pattern1.test(pw) || !pattern2.test(pw)
									|| !pattern3.test(pw)
									|| pw.length<8||pw.length>50) {

								$("#alert-success").css('display', 'none');
								$("#alert-danger-1").css('display', 'none');
								$("#alert-danger-2").css('display',
										'inline-block');
								$("#alert-danger-3").css('display', 'none');
								$("#alert-danger-4").css('display', 'none');
								$("#alert-danger-5").css('display', 'none');

							} 
							
							if (pw.indexOf(id) > -1) {

								$("#alert-success").css('display', 'none');
								$("#alert-danger-1").css('display', 'none');
								$("#alert-danger-2").css('display', 'none');
								$("#alert-danger-3").css('display',
										'inline-block');
								$("#alert-danger-4").css('display', 'none');
								$("#alert-danger-5").css('display', 'none');

							}

							var SamePass_0 = 0; //동일문자 카운트

							var SamePass_1 = 0; //연속성(+) 카운드

							var SamePass_2 = 0; //연속성(-) 카운드

							for (var i = 0; i < pw.length; i++) {

								var chr_pass_0;

								var chr_pass_1;

								var chr_pass_2;

								if (i >= 2) {

									chr_pass_0 = pw.charCodeAt(i - 2);

									chr_pass_1 = pw.charCodeAt(i - 1);

									chr_pass_2 = pw.charCodeAt(i);

									//동일문자 카운트

									if ((chr_pass_0 == chr_pass_1)
											&& (chr_pass_1 == chr_pass_2)) {

										SamePass_0++;

									}

									else {

										SamePass_0 = 0;

									}

									//연속성(+) 카운드

									if (chr_pass_0 - chr_pass_1 == 1
											&& chr_pass_1 - chr_pass_2 == 1) {

										SamePass_1++;

									}

									else {

										SamePass_1 = 0;

									}

									//연속성(-) 카운드

									if (chr_pass_0 - chr_pass_1 == -1
											&& chr_pass_1 - chr_pass_2 == -1) {

										SamePass_2++;

									}

									else {

										SamePass_2 = 0;

									}

								}

								if (SamePass_0 > 0) {

									$("#alert-success").css('display', 'none');
									$("#alert-danger-1").css('display', 'none');
									$("#alert-danger-2").css('display', 'none');
									$("#alert-danger-3").css('display', 'none');
									$("#alert-danger-4").css('display',
											'inline-block');
									$("#alert-danger-5").css('display', 'none');

								}

								if (SamePass_1 > 0 || SamePass_2 > 0) {

									$("#alert-success").css('display', 'none');
									$("#alert-danger-1").css('display', 'none');
									$("#alert-danger-2").css('display', 'none');
									$("#alert-danger-3").css('display', 'none');
									$("#alert-danger-4").css('display', 'none');
									$("#alert-danger-5").css('display',
											'inline-block');

								}

							}

						})

		//ID 중복확인
		var doCheck = 'N'
		$("#userId").keyup(function() {
			var query = {
				userId : $("#userId").val()
			};

			$.ajax({
				url : "idCheck.do",
				type : "post",
				data : query,
				success : function(data) {
					if (data == 1) {
						$(".msg").text("사용하고 있는 아이디입니다.");
						$(".msg").attr("style", "color:#f00");
						doCheck = 'N'
					} else {
						$(".msg").text("사용 가능한 아이디입니다.");
						$(".msg").attr("style", "color:#00f");
						//$('#userId').attr("disabled", true);
						doCheck = 'Y'
					}
				}
			}); // ajax 끝
		});
		function check() {
			if (doCheck == 'N') {
				alert("사용중인 아이디입니다.")
				return false;
			}
		}

		//이메일 중복확인
		var doCheck = 'N'
		$("#userEmail").keyup(function() {
			var query = {
				userEmail : $("#userEmail").val()
			};

			$.ajax({
				url : "emailCheck.do",
				type : "post",
				data : query,
				success : function(data) {

					if (data == 1) {
						$(".msg2").text("사용하고 있는 이메일입니다.");
						$(".msg2").attr("style", "color:#f00");
						doCheck = 'N'
					} else {
						$(".msg2").text("사용 가능한 이메일입니다.");
						$(".msg2").attr("style", "color:#00f");
						doCheck = 'Y'
					}
				}
			}); // ajax 끝
		});

		function check() {
			if (doCheck == 'N') {
				alert("입력을 다시 확인해주세요.")
				return false;
			}
		}
	</script>
</body>
</html>