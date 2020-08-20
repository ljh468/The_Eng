<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="/resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->

<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="/resources/css/util.css">
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<!--===============================================================================================-->
<meta charset="UTF-8">
<title>Account withdrawal</title>
<style>
input {
	outline: 2px solid #698b94;
	border: 2px;
}

img {
display: block; margin: 0px auto;  
}
form{
display: block; margin: 0px auto; 
}
.limiter2{
text-align: center;
}
</style>
</head>
<body>
	<div class="limiter">
		<div class="container-login100" style="background-color:#f4f3ef;">

			<div class="wrap-login100 p-l-55 p-r-55 p-t-20 p-b-50">
				<form class="login100-form validate-form"
					action="/Mypage/TheUserDeleteProc.do" onsubmit="return check()">
					<span class="login100-form-title p-b-10 p-t-20" style="font-size:30px;"> Account withdrawal </span>
					<hr style="margin-bottom: 40px; background-color:orange;">
						
						
					<span id="msg" class="txt1" style="font-size:18px; color:#706c6e;">
					<b>회원탈퇴를 하면</b> <br>
					<b>다시 되돌릴 수 없으며,</b> <br>
					<b>모든 정보가 삭제됩니다.</b> <br>
					<b>탈퇴를 계속 진행하시려면</b> <br>
					<b style="color:#ed4c8d;">' Account_withdrawal '</b> <br>
					<b>를 입력해주세요.</b>
					</span> 
					<br><br><br>
					
					<input class="input100" type="text" id="deleteCheck" placeholder="Account_withdrawal" required>
					<br><br>

					<button type="submit" class="alert-success login100-form-btn" style="height: 40px; ">확인</button> <br>
		<button type="button" onclick="location.href='/Setting/TheMypage.do'" class="alert-success login100-form-btn" style="height: 40px; ">취소</button> <br>
			</form>	
			</div>
		</div>
		</div>
</body>
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	var userDeleteCheck = 'N'

	$("#deleteCheck").keyup(function() {
		var query = {
			DeleteCheck : $("#deleteCheck").val()
		};

		$.ajax({
			url : "TheUserDeleteCheck.do",
			type : "post",
			data : query,
			success : function(data) {

				if (data == 1) {
					userDeleteCheck = 'Y'
				} else if (data == 0) {
					userDeleteCheck = 'N'
				}
			}
		}); // ajax 끝
	});

	function check() {
		if (userDeleteCheck == 'Y') {
			return true;
		} else if (userDeleteCheck == 'N') {
			alert("탈퇴 확인 문장이 틀렸습니다. 다시 입력해주세요.");
			$("#deleteCheck").val('');
			return false;
		}

	}
</script>
</html>