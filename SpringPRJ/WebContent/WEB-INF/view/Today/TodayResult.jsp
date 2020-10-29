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
								href="javascript:;"> <i class="nc-icon nc-layout-11"></i> <span
									class="d-lg-none d-md-block">Stats</span>

							</a></li>
							<li class="nav-item btn-rotate dropdown"><a
								class="nav-link dropdown-toggle" href="http://example.com"
								id="navbarDropdownMenuLink" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> <i
									class="nc-icon nc-bell-55"></i> <span
									class="d-lg-none d-md-block">Some Actions</span>

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
			<!-- 뉴스 기사 삽입. -->
			<div class="content">
				<div class="card">
					<div class="card-header">
						<h4 class="mt-0 mb-0 text-center">
							<b>TODAY RESULT</b>
						</h4>
					</div>
					<hr>
					<!-- result창은 가운데 정렬 -->
					<div class="card-body">
						<div style="text-align: center;">

							<h6 style="color: orange">Accent analysis</h6>

							<img src="/resources/images/graph.png"> <br>
							<hr>

							<!-- 점수창. -->
							<h6 class="ml-5 mr-5" style="color: orange;">My Grade</h6>
							<hr>
							<div class="row">
								<div class="col-4">
									<h6 style="color: orange; font-size: 15px">발음의 명확성</h6>
									<div style="font-size: 18px; color: gray; font-weight: bold"> 80 </div>
									<div style="font-size: 18px; color: darkturquoise; font-weight: bold">So so</div>
								</div>

								<div class="col-4">
									<h6 style="color: orange; font-size: 15px">강세의 유사성</h6>
									<div style="font-size: 18px; color: gray; font-weight: bold"> 90 </div>
									<div style="font-size: 18px; color: darkviolet; font-weight: bold"> Great</div>
									<br>
								</div>

								<div class="col-4">
									<h6 style="color: orange; font-size: 15px">강세의 명확성</h6>
									<div style="font-size: 18px; color: gray; font-weight: bold"> 60 </div>
									<div style="font-size: 18px; color: red; font-weight: bold">bad</div>
								</div>

							</div>
							<img src="/resources/images/grade.png"> <br>



							<!-- 뉴스 기사 끝. -->

						</div>


					</div>
					<!-- 제출하여 답이 맞거나 틀림을 잠깐 보여준 후 다음 페이지로 이동.(구현예정) -->
					<!-- 다음으로 넘어가는 버튼 -->
					<input style="float: right;"
						class="btn btn-warning btn-block btn-lg" type="button"
						value="Main" onclick="location='/Today/TodayMain.do'">


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
	<script>
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
