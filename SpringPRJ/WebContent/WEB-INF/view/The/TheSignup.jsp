<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>SingUp</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--===============================================================================================-->
<link rel="icon" type="image/png"
	href="../resources2/images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../resources2/vendor/bootstrap/css/bootstrap.min.css" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../resources2/fonts/font-awesome-4.7.0/css/font-awesome.min.css" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../resources2/fonts/iconic/css/material-design-iconic-font.min.css" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../resources2/vendor/animate/animate.css" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../resources2/vendor/css-hamburgers/hamburgers.min.css" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../resources2/vendor/animsition/css/animsition.min.css" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../resources2/vendor/select2/select2.min.css" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../resources2/vendor/daterangepicker/daterangepicker.css" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="../resources2/css/util.css" />
<link rel="stylesheet" type="text/css" href="../resources2/css/main.css" />
<!--===============================================================================================-->
<style>
.bline {
	border-bottom: 2px solid #d9d9d9;
	padding-bottom: 15px;
	margin-bottom: 10px;
}

.m-b-15{
	font-size:13px;
}

</style>
</head>
<body>
	<div class="limiter">
		<div class="container-login100" style="background-color: #f4f3ef">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54 shadowbox">
				<form class="login100-form validate-form"
					action="/The/TheSignUpProc.do" method="post">
					<span class="login100-form-title p-b-49">Sign up </span>

					<div class="wrap-input100 validate-input "
						data-validate="ID is reauired">
						<span class="label-input100">ID</span> <input class="input100"
							type="text" name="id" id="userId" placeholder="Type your ID" />
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>
					<div class="msg m-b-15"></div>

					<div class="wrap-input100 validate-input "
						data-validate="Passwrod is reauired">
						<span class="label-input100">PASSWORD</span> <input
							class="input100" type="password" name="pwd" id="newPassWord"
							placeholder="Type your Password" /> <span class="focus-input100"
							data-symbol="&#xf190;"></span>
					</div>
					<div class="new m-b-15"></div> 
					<div class="wrap-input100 validate-input "
						data-validate="PasswrodCheck is reauired">
						<span class="label-input100">PASSWROD CHECK</span> <input
							class="input100" type="password" name="pwd2" id="passWordCheck"
							placeholder="Type your Password Check" /> <span
							class="focus-input100" data-symbol="&#xf190;"></span>
					</div>
					<div class="renew m-b-15"></div> 

					<div class="wrap-input100 validate-input "
						data-validate="Email is reauired">
						<span class="label-input100">EMAIL</span> <input class="input100"
							type="email" name="email" id="userEmail"
							placeholder="Type your email" /> <span class="focus-input100"
							data-symbol="&#9993;"></span>
					</div>
					<div class="msg2 m-b-15"></div>
					
					
					<div class="bline flexbox" style="padding-bottom: 18px">
						<div class="label-input100" style="padding-bottom: 15px">Age</div>
						<div>
						<select class="label-input100"style="width:100%" name="age"
							style="margin-left: 15px">
							<option value="10">10대</option>
							<option value="20" selected>20대</option>
							<option value="30">30대</option>
							<option value="40">40대</option>
							<option value="50">50대</option>
							<option value="60">60대</option>
						</select></div>
					</div>
					
					
					<div class="bline" style="padding-bottom: 0">
						<div class="label-input100"
							style="padding-bottom: 15px; padding-top: 10px">Gender</div>
						<div class="input100" style="height: 35px; padding-left: 15px">
							<input id="male" type="radio" name="gender" value="m" checked />
							<label for="male" class="label-input100">male</label>&nbsp;&nbsp;&nbsp;
							<input id="female" type="radio" name="gender" value="w" /> <label
								for="female" class="label-input100">female</label><br />
						</div>
					</div>

					<div class="label-input100"
						style="padding-top: 10px; padding-bottom: 10px">Interest</div>
					<div class="wrap-input100 p-b-90"
						style="padding-bottom: 15px; padding-left: 15px">
						<input type="checkbox" name="interest" id="interest1"
							value="toeic" /> <label for="interest1" class="label-input100">토익</label><br />
						<input type="checkbox" name="interest" id="interest2"
							value="academic" /> <label for="interest2"
							class="label-input100">학술/논문</label><br /> <input
							type="checkbox" name="interest" id="interest3" value="business" />
						<label for="interest3" class="label-input100">비즈니스</label>
					</div>

					<div class="text-right p-t-8 p-b-31"></div>

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn btn" type="submit">
								SIGN UP</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div id="dropDownSelect1"></div>

	<!--===============================================================================================-->
	<script src="../resources2/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="../resources2/vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="../resources2/vendor/bootstrap/js/popper.js"></script>
	<script src="../resources2/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="../resources2/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="../resources2/vendor/daterangepicker/moment.min.js"></script>
	<script src="../resources2/vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="../resources2/vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src="../resources2/js/main.js"></script>

</body>
<script>
	$('#newPassWord').keyup(
			function() {

				var pw = document.getElementById("newPassWord").value; //비밀번호

				var pattern1 = /[0-9]/;

				var pattern2 = /[a-zA-Z]/;

				var pattern3 = /[~!@\#$%<>^&*]/; // 원하는 특수문자 추가 제거

				var SamePass_0 = 0; //동일문자 카운트

				if (!pattern1.test(pw) || !pattern2.test(pw)
						|| !pattern3.test(pw) || pw.length<8||pw.length>50) {

					$(".new").text("영문+숫자+특수기호 8자리 이상으로 구성하세요.");
					$(".new").css("color", "#f00");
				} else {

					$(".new").text("비밀번호 조건에 일치합니다");
					$(".new").css("color", "#00f");

				}

				if (pw.indexOf(id) > -1) {

					$(".new").text("비밀번호는 ID를 포함할 수 없습니다.");
					$(".new").css("color", "#f00");

				}

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

					}

				}
			})
	$('#passWordCheck').keyup(function() {

		var pw = document.getElementById("newPassWord").value; //비밀번호

		var pw2 = document.getElementById("passWordCheck").value; // 확인 비밀번호

		if (pw != '' && pw2 == '') {
			null;
		} else if (pw != "" || pw2 != "") {
			if (pw == pw2) {
				$(".renew").text("비밀번호가 일치합니다.");
				$(".renew").css("color", "#00f");
				newPwd = 'Y';
			} else {
				$(".renew").text("비밀번호가 일치하지 않습니다.");
				$(".renew").css("color", "#f00");
				newPwd = 'N';
			}
		}

	})
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
</html>
