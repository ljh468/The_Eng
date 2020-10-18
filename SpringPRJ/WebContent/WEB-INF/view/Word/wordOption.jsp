<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>		
<% 

	List<String> rList = (List<String>)request.getAttribute("rList");

%>
<!--
=========================================================
* Paper Dashboard 2 - v2.0.1
=========================================================

* Product Page: https://www.creative-tim.com/product/paper-dashboard-2
* Copyright 2020 Creative Tim (https://www.creative-tim.com)

Coded by www.creative-tim.com

 =========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
-->
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
<style>
.container {
	height: 400px;
	perspective: 1000px;
}

.card {
	transition: transform 0.3s;
	transform-style: preserve-3d;
	cursor: pointer;
	width: 100%;
	height: 100%
}

.front, .back {
	position: absolute;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	backface-visibility: hidden;
	width: 100%;
	height: 100%
}

.front {
	background-color: transparent;
}

.back {
	transform: rotateY(180deg);
	background-color: transparent;
}
</style>

</head>

<body class="" style="background-color: #F3F4EF">
	<div class="wrapper">
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
				</div>
			</nav>
			<!-- End Navbar -->


			<!-- 카드 내용 변경 -->
			<script>
				function flip(event) {
					var element = event.currentTarget;
					if (element.className === "card") {
						if (element.style.transform == "rotateY(180deg)") {
							element.style.transform = "rotateY(0deg)";
							element.style.background = "white";
						} else {
							element.style.transform = "rotateY(180deg)";
							element.style.background = "skyblue";
						}
					}
				};
			</script>



			<div class="content">

				<div class="container mb-3">
					<div class="card" onclick="flip(event)">
						<div class="front">
							<h3 class="text-center" style="margin-top: 180px;">뜻</h3>fhf
							<p class="text-center" style="margin-top: 100px">단어로 바꾸시려면
								클릭해주세요</p>
						</div>
						<div class="back">
							<h3 class="text-center" style="margin-top: 180px;">단어</h3>
							<p class="text-center" style="margin-top: 100px">뜻으로 바꾸시려면
								클릭해주세요</p>
						</div>
					</div>
				</div>
				<div class="container" style="height: 130px;">
					<div class="card">
						<div class="card-header">
							<h4 class="mt-0 mb-0 text-center">단어 개수 설정</h4>
						</div>
						<div class="card-body mt-4 pb-0">
							<div class="row">
								<div class="col-4">
									<label for="ten">10개</label> <input type=radio value="ten"
										name="wordset" id="ten" checked>
								</div>
								<div class="col-4">
									<label for="twenty">20개</label> <input type=radio
										value="twnety" name="wordset" id="twenty">
								</div>
								<div class="col-4">
									<label for="all">ALL</label> <input type=radio value="all"
										name="wordset" id="all">
								</div>
							</div>
						</div>
					</div>
				</div>
				<br><br>
				<div class="row">
					<div class="col-3"></div>
					<div class="col-6">
						<button style="width: 100%" class="next "
							onclick="location='/Word/wordStudy.do'">학습 시작</button>
					</div>	
					<div class="col-3"></div>
				</div>
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