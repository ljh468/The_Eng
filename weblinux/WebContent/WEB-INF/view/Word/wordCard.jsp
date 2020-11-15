<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String heraldurl = (String) request.getAttribute("heraldurl");
String reutersurl = (String) request.getAttribute("reutersurl");
String timesurl = (String) request.getAttribute("timesurl");
String yonhapurl = (String) request.getAttribute("yonhapurl");
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
<link rel="stylesheet" type="text/css"
	href="/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<link rel="stylesheet" href="/resources/scss/Button.css">
<style>
html, body {
	height: 100%;
	margin: 0;
}

.grid2x2 {
	min-height: 100%;
	display: flex;
	flex-wrap: wrap;
	flex-direction: row;
}

.grid2x2>div {
	display: flex;
	flex-basis: calc(50% - 40px);
	justify-content: center;
	flex-direction: column;
}

.grid2x2>div>div {
	display: flex;
	justify-content: center;
	flex-direction: row;
}

.box {
	margin: 20px;
	background-color: white;
	max-width: 100%;
	height: 400px; "
	cursor: pointer;
}

@media ( max-width : 450px) {
	.box {
		margin: 20px;
		background-color: white;
		max-width: 100%;
		height: 200px;
		"
	}
}

@media ( max-width :750px) {
	.box {
		margin: 20px;
		background-color: white;
		max-width: 100%;
		height: 300px;
	}
}
</style>

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
				<div class="grid2x2">
					<div class="box rounded shadow p-3 mb-3 bg-white" id="herald">
						<div>
							<img src="/resources/images/NewsLogo/HeraldLogo.png"
								class="rounded" alt="KOREA HERALD">
						</div>
					</div>

					<div class="box rounded shadow p-3 mb-3 bg-white" id="reuters">
						<div>
							<img src="/resources/images/NewsLogo/ReutersLogo.png"
								class="rounded" alt="REUTERS">
						</div>
					</div>

					<div class="box rounded shadow p-3 mb-2 bg-white" id="times">
						<div>
							<img src="/resources/images/NewsLogo/TheKoreaTimesLogo.png"
								class="rounded" alt="THE KOREA TIMES">
						</div>
					</div>


					<div class="box rounded shadow p-3 mb-2 bg-white" id="yonhap">
						<div>
							<img src="/resources/images/NewsLogo/yonhapLogo.png"
								class="rounded" alt="YONHAP">
						</div>
					</div>
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
	<!-- Chart JS -->
	<script src="/resources/assets/js/plugins/chartjs.min.js"></script>
	<!--  Notifications Plugin    -->
	<script src="/resources/assets/js/plugins/bootstrap-notify.js"></script>
	<!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
	<script src="/resources/assets/js/paper-dashboard.min.js?v=2.0.1"
		type="text/javascript"></script>
	<script>
	
	(function showNotification() {
	    color = 'warning';
	
	    $.notify({
	      icon: "nc-icon nc-bell-55",
	      message: "학습할 뉴스사를 선택해주세요"
	
	    }, {
	      type: color,
	      delay: 1000,
	      timer: 1000,
	      placement: {
	        from: 'top',
	        align: 'center'
	      }
	    });
	 })();	
	
		$("#navbar-toggler").on('click', function() {
			if ($(this).hasClass("toggled")) {
				$(this).removeClass("toggled");
				$("html").first().removeClass("nav-open");
			} else {
				$(this).addClass("toggled");
				$("html").first().addClass("nav-open");

			}

		});

		$("#herald").on('click', function() {
			var forms = document.createElement("form");
			forms.setAttribute("method", "post");
			forms.setAttribute("action", "/Word/wordStudy.do");

			var hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "news_name");
			hiddenField.setAttribute("value", "herald");
			forms.appendChild(hiddenField);

			document.body.appendChild(forms);
			forms.submit();
		});

		$("#reuters").on('click', function() {
			var forms = document.createElement("form");
			forms.setAttribute("method", "post");
			forms.setAttribute("action", "/Word/wordStudy.do");

			var hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "news_name");
			hiddenField.setAttribute("value", "reuters");
			forms.appendChild(hiddenField);

			document.body.appendChild(forms);
			forms.submit();
		});

		$("#times").on('click', function() {
			var forms = document.createElement("form");
			forms.setAttribute("method", "post");
			forms.setAttribute("action", "/Word/wordStudy.do");

			var hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "news_name");
			hiddenField.setAttribute("value", "times");
			forms.appendChild(hiddenField);

			document.body.appendChild(forms);
			forms.submit();
		});

		$("#yonhap").on('click', function() {
			var forms = document.createElement("form");
			forms.setAttribute("method", "post");
			forms.setAttribute("action", "/Word/wordStudy.do");

			var hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "news_name");
			hiddenField.setAttribute("value", "yonhap");
			forms.appendChild(hiddenField);

			document.body.appendChild(forms);
			forms.submit();
		});
	</script>

</body>

</html>