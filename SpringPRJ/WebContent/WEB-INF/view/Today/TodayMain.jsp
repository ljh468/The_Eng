<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="/resources/assets/demo/demo.css" rel="stylesheet" />
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
						<form>
							<div class="input-group no-border">
								<input type="text" value="" class="form-control"
									placeholder="Search...">
								<div class="input-group-append">
									<div class="input-group-text">
										<i class="nc-icon nc-zoom-split"></i>
									</div>
								</div>
							</div>
						</form>
						<ul class="navbar-nav">
							<li class="nav-item"><a class="nav-link btn-magnify"
								href="javascript:;"> <i class="nc-icon nc-layout-11"></i>
									
										<span class="d-lg-none d-md-block">Stats</span>
									
							</a></li>
							<li class="nav-item btn-rotate dropdown"><a
								class="nav-link dropdown-toggle" href="http://example.com"
								id="navbarDropdownMenuLink" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> <i
									class="nc-icon nc-bell-55"></i>
									
										<span class="d-lg-none d-md-block">Some Actions</span>
									
							</a>
								<div class="dropdown-menu dropdown-menu-right"
									aria-labelledby="navbarDropdownMenuLink">
									<a class="dropdown-item" href="#">Action</a> <a
										class="dropdown-item" href="#">Another action</a> <a
										class="dropdown-item" href="#">Something else here</a>
								</div></li>
							<li class="nav-item"><a class="nav-link btn-rotate"
								href="javascript:;"> <i class="nc-icon nc-settings-gear-65"></i>

										<span class="d-lg-none d-md-block">Account</span>
									
							</a></li>
						</ul>
					</div>
				</div>
			</nav>
			<!-- End Navbar -->
			<div class="content">
				<div class="card">
					<div class="card-header">
						<h4 class="mt-0 mb-0 text-center">The New York Times</h4>
					</div>
					<hr>
					<div class="card-body">
						<h5 class="card-text" style="font-size:18px; color:orange;">Pros and Cons of 5G Technology</h5>
						<div class="card-text">Self-driving cars, smart cities, fully connected homes, 
						This is the future and it will 2 be powered by 5G.</div>
					</div>
				</div>
				
				
				<div class="card">
					<div class="card-header">
						<h4 class="mt-0 mb-0 text-center">추천 뉴스</h4>
					</div>
					<hr>
					<div class="card-body">
						<div class="row">
							<div class="col-6 col-lg-6 pr-2 pb-3">
								<div class="row">
									<div class="col-12">
										<button type="button" style="border:0; outline:0;" onclick="location='/Today/TodayNews.do'"><img src="/resources/images/HeraldLogo.jpg"></button>
									</div>
									<div style="color:orange">A new Neymar? PSG forward's <br>impresses with...</div>Are we witnessing the arrival of a "new" Neymar?
									We are used to seeing the Brazil forward do impressice things...

								</div>

							</div>
							<div class="col-6 pl-2 pb-3">
								<div class="row">
									<div class="col-12">
										<button type="button" style="border:0; outline:0;" onclick="location='/Today/TodayNews.do'"><img src="/resources/images/TheKorea.jpg" ></button>
									</div> 
									<div style="color:orange">KAI to supply 2 more Charmsuri<br>impresses with...</div>Are we witnessing the arrival of a "new" Neymar?
									We are used to seeing the Brazil forward do impressice things...
									</div>

								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-6 pr-2">
								<div class="row">
									<div class="col-12">
										<button type="button" style="border:0; outline:0;" onclick="location='/Today/TodayNews.do'"><img src="/resources/images/graph.jpg"></button>
									</div>
									<!-- 미리 보여주는 내용 중 창에 맞춰 글자 중 어디까지 보여줄지 정해야함. -->
									<div class="col-12">
									<div style="color:orange">South Korea tightens <br>Coivid-19</div>Museums, nightclubs and karaoke bars have closed in and around
									South Korea's capital, Seoul...
									</div>

								</div>
							</div>
							<div class="col-6 pl-2">
								<div class="row">
									<div class="col-12">
										<button type="button" style="border:0; outline:0;" onclick="location='/Today/TodayNews.do'"><img src="/resources/images/Neymar.jpg"></button>
									</div>
									<div style="color:orange">A new Neymar? PSG forward's <br>impresses with...</div>Are we witnessing the arrival of a "new" Neymar?
									We are used to seeing the Brazil forward do impressice things...
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
			<footer class="footer footer-black  footer-white ">
				<div class="container-fluid">
					<div class="row">
						<nav class="footer-nav">
							<ul>
								<li><a href="https://www.creative-tim.com" target="_blank">Creative
										Tim</a></li>
								<li><a href="https://www.creative-tim.com/blog"
									target="_blank">Blog</a></li>
								<li><a href="https://www.creative-tim.com/license"
									target="_blank">Licenses</a></li>
							</ul>
						</nav>
						<div class="credits ml-auto">
							<span class="copyright"> © <script>
								document.write(new Date().getFullYear())
							</script>, made with <i class="fa fa-heart heart"></i> by Creative Tim
							</span>
						</div>
					</div>
				</div>
			</footer>
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
