<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%

	String heraldurl = (String)request.getAttribute("heraldurl");
	String reutersurl = (String)request.getAttribute("reutersurl");
	String timesurl = (String)request.getAttribute("timesurl");
	String yonhapurl = (String)request.getAttribute("yonhapurl");


%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="/resources/assets/img/apple-icon.png">
<link rel="icon" type="image/png"
	href="/resources/assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Word Book</title>
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
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="/resources/assets/demo/demo.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<link rel="stylesheet" href="/resources/scss/Button.css">
</head>

<body class="">
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
						<a class="navbar-brand" href="javascript:;">Word Book</a>
					</div>
				</div>
			</nav>
			<!-- End Navbar -->

			<div class="content">
				<a href="/Word/wordStudy.do">
					<div class="card">
						<div class="row">
							<div class="col-4 mt-2 mb-2" style="border-right: solid orange;">
								<p class="text-center">
									<i class="nc-icon nc-hat-3 mt-3" style="font-size: 80px;"></i>
								<p>
							</div>
							<div class="col-8">
								<h3 class="mt-4 text-center">
									ALL Word
									</h1>
									<h6 class="mb-4 text-center">
										관심 분야 단어 및 학습 단어
										</h4>
							</div>
						</div>
					</div>
				</a> <br> <a href="/Word/wordStudy.do">
					<div class="card">
						<div class="row">
							<div class="col-4 mt-2 mb-2" style="border-right: solid orange;">
								<p class="text-center">
									<i class="nc-icon nc-simple-remove mt-3"
										style="font-size: 80px;"></i>
								<p>
							</div>
							<div class="col-8">
								<h3 class="mt-4 text-center">
									Wrong Word
									</h1>
									<h6 class="mb-4 text-center">
										틀렸던 단어
										</h4>
							</div>
						</div>
					</div>
				</a>  <br> <a href="/Word/wordStudy.do">
					<div class="card">
						<div class="row">
							<div class="col-4 mt-3 mb-2" style="border-right: solid orange;">
								<p class="text-center">
									<i class="nc-icon nc-bookmark-2 mt-3" style="font-size: 80px;"></i>
								<p>
							</div>
							<div class="col-8">
								<h3 class="mt-4 text-center">
									Favorites
									</h1>
									<h6 class="mb-4 text-center">
										즐겨찾기
										</h4>
							</div>
						</div>
					</div>
				</a>
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
