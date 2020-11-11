<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="/resources/assets/img/apple-icon.png">
<link rel="icon" type="image/png"
	href="/resources/assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Today Highlight English</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
<!--     Fonts and icons     -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200"
	rel="stylesheet" />
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<!-- CSS Files -->
<link href="/resources/assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="/resources/assets/css/paper-dashboard.css?v=2.0.1"
	rel="stylesheet" />
	<link rel="stylesheet" href="/resources/scss/Button.css">
</head>

<body class="">
	<div class="wrapper ">
		<%@ include file="/WEB-INF/view/sidebar.jsp"%>
		<div class="main-panel">
			<!-- Navbar -->
			<nav
				class="navbar navbar-expand-lg navbar-absolute fixed-top navbar-transparent">
				<div class="container-fluid">
					<div class="navbar-wrapper">
						<div class="navbar-toggle">
							<button type="button" class="navbar-toggler" id="navbar-toggler">
								<span class="navbar-toggler-bar bar1"></span> <span
									class="navbar-toggler-bar bar2"></span> <span
									class="navbar-toggler-bar bar3"></span>
							</button>
						</div>
						<a class="navbar-brand" href="javascript:;">Today Highlight
							English</a>
					</div>
					<div class="collapse navbar-collapse justify-content-end"
						id="navigation">
						
						
					</div>
				</div>
			</nav>
			<!-- End Navbar -->
			
		
			
			
			
			<!-- 뉴스 기사 삽입. -->
			<div class="content" style="padding-bottom: 50px;">
				<div class="card">
					<div class="card-header">
						<h4 class="mt-0 mb-0 text-center"><b>Setting</b></h4>
					</div>
					<hr>
					<div class="card-body">
					
						<div style="text-align:center; font-size:10px;">
				
						<h3><button class="btn btn-warning btn-block btn-lg" onclick="location='/Mypage/TheInterestSetting.do'">관심분야 설정</button></h3>
						<br><br>
						<h3><button class="btn btn-warning btn-block btn-lg" onclick="location='/Mypage/TheUserCorrection.do'">회원정보 수정</button></h3>
						<br><br>
						<h3><button class="btn btn-warning btn-block btn-lg" onclick="location='/Mypage/ThePassWordChange.do'">비밀번호 변경</button></h3>
						<br><br>
						<h3><button class="btn btn-warning btn-block btn-lg" onclick="location='/Mypage/TheUserDelete.do'">회원 탈퇴</button></h3>
						<br><br>
						
						</div>
						
					</div>
				</div>
			<!-- 뉴스 기사 끝. -->
			<!-- 다음으로 넘어가는 버튼 만들기  -->
			
			</div>
			</div>
		</div>
	

	<!--   Core JS Files   -->
	<script src="/resources/assets/js/core/jquery.min.js"></script>
	<script src="/resources/assets/js/core/popper.min.js"></script>
	<script src="/resources/assets/js/core/bootstrap.min.js"></script>
	<script
		src="/resources/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
	<!--  Google Maps Plugin    -->
	<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
	<!-- Chart JS -->
	<script src="/resources/assets/js/plugins/chartjs.min.js"></script>
	<!--  Notifications Plugin    -->
	<script src="/resources/assets/js/plugins/bootstrap-notify.js"></script>
	<!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
	<script src="/resources/assets/js/paper-dashboard.min.js?v=2.0.1"
		type="text/javascript"></script>
	<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
	<script src="/resources/assets/demo/demo.js"></script>
	<script>
		$(document).ready(function() {
			// Javascript method's body can be found in assets/assets-for-demo/js/demo.js
			demo.initChartsPages();
		});

		$("#navbar-toggler").on('click', function() {
			if ($(this).hasClass("toggled")) {
				$(this).removeClass("toggled");
				$("html").first().removeClass("nav-open");
			} else {
				$(this).addClass("toggled");
				$("html").first().addClass("nav-open");

			}

		})
	</script>
</body>

</html>
