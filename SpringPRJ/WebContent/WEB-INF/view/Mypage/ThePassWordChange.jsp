<%@page import="static poly.util.CmmUtil.nvl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId = nvl((String)session.getAttribute("user_id"));    
%>
<!DOCTYPE html>
<html>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 	<form action="/Mypage/passWordChangeProc.do" onsubmit="return check()">
 	
 		현재 비밀번호: <input type="password" id="current_Password" required> <br>
 		<span id="past">현재 비밀번호를 입력해주세요.</span> <br>
 		바꿀 비밀번호: <input type="password" id="newPassWord" name="pwd" required> <br>
 		<span class="new">바꾸실 비밀번호를 입력해주세요.</span> <br>
 		비밀번호 확인: <input type="password" id="passWordCheck" required> <br>
 		<span class="renew">비밀번호 확인을 위해 한 번 더 입력해주세요.</span> <br>
 		
 		<button type="submit">수정하기</button>
 		<button type="button" onclick="location.href='/Setting/TheMypage.do'">뒤로</button>
 		
 	</form>

</body>
<script>

var pastPwd = 'N';
var newPwd = 'N';

function check(){
	if(pastPwd == 'Y' && newPwd == 'Y') {
		return true;
	} else if(pastPwd == 'N' && newPwd == 'N') {
		alert("비밀번호를 입력해주세요.");
		return false;
	} else if(pastPwd == 'N') {
		alert("현재 비밀번호가 다릅니다.");
		return false;
	} else if($("#newPassWord").val() != $("#passWordCheck").val()){
		alert("바꾸실 비밀번호가 일치하지 않습니다. 다시 한 번 확인해주세요.");
		return false;
	} else if(newPwd == 'N') {
		alert("바꾸실 비밀번호를 입력해주세요.");
		return false;
	}
}

$("#current_Password").keyup(function() {
	var query = {
		pwd : $("#current_Password").val()
	};

	$.ajax({
		url : "passWordCheck.do",
		type : "post",
		data : query,
		success : function(data) {
		
			if (data == 1) {
				$("#past").text("현재 비밀번호가 일치합니다.");
				$("#past").attr("style", "color:#00f");
				pastPwd = 'Y';
			} else if(data == 0) {
				$("#past").text("현재 비밀번호와 다릅니다. 비밀번호를 확인해주세요.");
				$("#past").attr("style", "color:#f00");
				pastPwd = 'N';
			}
		}
	}); // ajax 끝
});
/* $('#newPassWord').keyup(function() {
	var pwd1 = $("#newPassWord").val();
	var pwd2 = $("#passWordCheck").val();

	if (pwd1 != '' && pwd2 == '') {
		null;
	} else if (pwd1 != "" || pwd2 != "") {
		if (pwd1 == pwd2) {
			$(".new").text("비밀번호가 일치합니다.");
			$(".new").css("color", "#00f");
			newPwd = 'Y';
		} else {
			$(".new").text("비밀번호가 일치하지 않습니다. 비밀번호를 확인해주세요.");
			$(".new").css("color", "#f00");
			newPwd = 'N';
		}
	}
}); */

/* $('#passWordCheck').keyup(function() {
		var pwd1 = $("#newPassWord").val();
		var pwd2 = $("#passWordCheck").val();

		if (pwd1 != '' && pwd2 == '') {
			null;
		} else if (pwd1 != "" || pwd2 != "") {
			if (pwd1 == pwd2) {
				$(".new").text("비밀번호가 일치합니다.");
				$(".new").css("color", "#00f");
				newPwd = 'Y';
			} else {
				$(".new").text("비밀번호가 일치하지 않습니다. 비밀번호를 확인해주세요.");
				$(".new").css("color", "#f00");
				newPwd = 'N';
			}
		}
	}); */
$('#newPassWord').keyup(function() {
	
	var cpw = document.getElementById("current_Password").value;
	
	var pw = document.getElementById("newPassWord").value; //비밀번호
	
	var id = "<%=userId %>";
	
	var pattern1 = /[0-9]/;

	var pattern2 = /[a-zA-Z]/;

	var pattern3 = /[~!@\#$%<>^&*]/; // 원하는 특수문자 추가 제거
	
	var SamePass_0 = 0; //동일문자 카운트

	var SamePass_1 = 0; //연속성(+) 카운드

	var SamePass_2 = 0; //연속성(-) 카운드
	
	
	if (!pattern1.test(pw) || !pattern2.test(pw)
			|| !pattern3.test(pw)
			|| pw.length<8||pw.length>50) {

		$(".new").text("영문+숫자+특수기호 8자리 이상으로 구성하여야 합니다.");
		$(".new").css("color", "#f00");
	}else{
		
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

			$(".new").text("동일문자를 3자 이상 연속 입력할 수 없습니다.");
			$(".new").css("color", "#f00");
		}

		if (SamePass_1 > 0 || SamePass_2 > 0) {

			$(".new").text("영문, 숫자는 3자 이상 연속 입력할 수 없습니다.");
			$(".new").css("color", "#f00");

		}
		
		if(cpw == pw) {
			
			$(".new").text("현재 비밀번호와 일치합니다.");
			$(".new").css("color", "#f00");
			
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
					$(".renew").text("비밀번호가 일치하지 않습니다. 비밀번호를 확인해주세요.");
					$(".renew").css("color", "#f00");
					newPwd = 'N';
				}
			}
			
		})
</script>
</html>