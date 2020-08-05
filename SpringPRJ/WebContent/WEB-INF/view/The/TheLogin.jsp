<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TheLogin</title>
</head>
<body>
	<div>
	THE 로그인창
	<form action="/The/TheLoginProc.do" method="post">
			아이디 : <input type="text" name="id">
			
			비밀번호 : <input type="password" name="pwd">
			
			<button type="submit">로그인</button>
		</form>
		<hr>
		<form action="/The/TheSignUp.do">
			Don't have an account?<button type="submit"> Signup </button>
		</form>
	</div>
	

</body>
</html>