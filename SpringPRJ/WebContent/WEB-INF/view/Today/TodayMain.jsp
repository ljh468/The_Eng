<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="poly.dto.News_NameDTO"%>

<%
	String heraldTitle = (String) request.getAttribute("heraldtitle");
String reutersTitle = (String) request.getAttribute("reuterstitle");
String timesTitle = (String) request.getAttribute("timestitle");
String yonhapTitle = (String) request.getAttribute("yonhaptitle");
News_NameDTO nmDTO = new News_NameDTO();
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="/WEB-INF/view/Today/newsSlide2.jsp">
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
				</div>
			</nav>
			<!-- End Navbar------------------------------------------------------------------ -->

			<div class="content">

				<input type='hidden' id='heraldTitle' value="<%=heraldTitle%>" /> <input
					type='hidden' id='reutersTitle' value="<%=reutersTitle%>" /> <input
					type='hidden' id='timesTitle' value="<%=timesTitle%>" /> <input
					type='hidden' id='yonhapTitle' value="<%=yonhapTitle%>" />
				<div class="card">
					<div class="card-header">
						<h4 class="mt-0 mb-0" style="color: orange; font-size: 15px">Trending</h4>
						<span style="font-size: 30px;"><b> Today News </b></span>
					</div>
					<hr>
					<div class="card-body">
						<iframe target="_self" src="/resources2/newsBob.jsp"
							style="width: 100%; height: 600px;" frameborder=0 framespacing=0
							marginheight=0 marginwidth=0 scrolling=no vspace=0> </iframe>
					</div>
				</div>


			</div>
		</div>
	</div>


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