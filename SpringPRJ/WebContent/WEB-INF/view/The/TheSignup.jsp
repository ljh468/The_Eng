<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<head>
<meta charset="UTF-8">
<title>TheSignup</title>
</head>
<body>
	<div>
		가입하기
		<form action="/The/TheSignUpProc.do" method="get" onsubmit="return check()">

			아이디 :<input type="text" id="userId" name="id" placeholder="id">
		
			<br>
			<span class="msg">사용하실 아이디를 입력하세요</span><br>
			비밀번호 : <input type="password" name="pwd" required
				id="password_1" class="pw" placeholder="8~15자 영문,숫자,특수문자"><br>

			비밀번호 확인 : 
				<input type="password" required id="password_2" class="pw"
				placeholder="비밀번호 확인"> <span class="alert-success"
				style="display: none;">비밀번호가 일치합니다.</span> <span id="alert-danger"
				style="display: none; color: #d92742; font-weight: bold;">비밀번호가
				일치하지 않습니다.</span> <br>
				<br>
			이메일 :
			<input type="email" name="email" required><br>
			나이:
			<select id="age" name="age" >
			<option value="10">10대</option>
			<option value="20" selected>20대</option>
			<option value="30">30대</option>
			<option value="40">40대</option>
			<option value="50">50대</option>
			<option value="60">60대</option>
			</select><br>
			성별 : 
			<input id="male" type="radio" name="gender" value="m">
			<label for="man">male</label>
			<input id="female" type="radio" name="gender" value="w">
			<label for="woman">female</label><br>
			관심사 :
			<input type="checkbox" name="interest" value="1"/>비즈니스
			<input type="checkbox" name="interest" value="2"/>학술/논문
			<input type="checkbox" name="interest" value="3"/>토익
			
			<br>
			<button id="btn" type="submit" class="alert-success">Sign Up</button>
		</form>
	</div>
</body>
<script>
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
				$(".msg").text("이미 사용하고 있는 아이디입니다.");
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

$('.pw').focusout(function() {
	var pwd1 = $("#password_1").val();
	var pwd2 = $("#password_2").val();

	if (pwd1 != '' && pwd2 == '') {
		null;
	} else if (pwd1 != "" || pwd2 != "") {
		if (pwd1 == pwd2) {
			$(".alert-success").css('display', 'inline-block');
			$("#alert-danger").css('display', 'none');
		} else {
			$(".alert-success").css('display', 'none');
			$("#alert-danger").css('display', 'inline-block');
		}
	}
});

function check() {
	if (doCheck == 'N') {
		alert("사용중인 아이디입니다.")
		return false;
	}
}

</script>
</html>