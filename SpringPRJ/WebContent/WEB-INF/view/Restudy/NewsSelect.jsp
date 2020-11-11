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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
.blockquote {
	height: 80%;
}

.blockquote:hover {
	background-color: #51cbce;
	color: white;
}
</style>
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
			<!-- End Navbar -->


			<div class="content">
				<div class="card">
					<div class="card-header text-center">
						<h3 class="mb-0">News Select</h3>
					</div>
					<hr>
					<div class="card-body">
						<div class="row text-center">
							<div class="col-6">
								<p class="blockquote blockquote-primary" id="times">
									<b>The Korea Tiems</b>
								</p>
							</div>
							<div class="col-6">
								<p class="blockquote blockquote-primary" id="herald">
									<b>The Korea Herald</b>
								</p>
							</div>
							<div class="col-6">
								<p class="blockquote blockquote-primary" id="reuters">
									<b>Reuters</b>
								</p>
							</div>
							<div class="col-6">
								<p class="blockquote blockquote-primary" id="yonhap">
									<b>YonHap News</b>
								</p>

							</div>
						</div>
					</div>
				</div>
				<div id="list">
				</div>

			</div>



			<footer class="footer footer-black  footer-white ">
				<div class="container-fluid"></div>
			</footer>
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

		$("#reuters").on('click', function() {

			var query = {
				newsName : 'reuters'
			};

			$.ajax({
				type : 'POST',
				url : 'findNews.do',
				data : query,
				success : function(data) {
					var resHTML ='';
					for(var i=0; i<data.length; i++){

						console.log(data[i].news_title);
						console.log(data[i].date);
						console.log(data[i].url);
						resHTML += '<div>';
						resHTML += '<form action="/Restudy/ReExam.do" method="post">';						
						resHTML += '<input type="hidden" name="news_url" value="'+data[i].url+'">';
						resHTML += '<input type="hidden" name="news_title" value="'+data[i].news_title+'">';
						resHTML += '<input type="hidden" name="date" value="'+data[i].date+'">';
						resHTML += '<button type="submit" style="width:100%">';
						resHTML += '<div class="card">';
						resHTML += '<div class="card-header">';
						resHTML += data[i].date;
						resHTML += '</div>';
						resHTML += '<div class="card-body">';
						resHTML += data[i].news_title;
						resHTML += '</div>';
						resHTML += '</div>';
						resHTML += '</button>';
						resHTML += '</form>';
						resHTML += '</div>';
					}
					
					$('#list').html(resHTML); //HTML에 결과 추가
				}
			})
		})
		
		$("#herald").on('click', function() {

			var query = {
				newsName : 'herald'
			};

			$.ajax({
				type : 'POST',
				url : 'findNews.do',
				data : query,
				success : function(data) {
					var resHTML ='';
					for(var i=0; i<data.length; i++){

						console.log(data[i].news_title);
						console.log(data[i].date);
						console.log(data[i].url);
						resHTML += '<div>';
						resHTML += '<form action="/Restudy/ReExam.do" method="post">';						
						resHTML += '<input type="hidden" name="news_url" value="'+data[i].url+'">';
						resHTML += '<input type="hidden" name="news_title" value="'+data[i].news_title+'">';
						resHTML += '<input type="hidden" name="date" value="'+data[i].date+'">';
						resHTML += '<button type="submit" style="width:100%">';
						resHTML += '<div class="card">';
						resHTML += '<div class="card-header">';
						resHTML += data[i].date;
						resHTML += '</div>';
						resHTML += '<div class="card-body">';
						resHTML += data[i].news_title;
						resHTML += '</div>';
						resHTML += '</div>';
						resHTML += '</button>';
						resHTML += '</form>';
						resHTML += '</div>';
					}
					
					$('#list').html(resHTML); //HTML에 결과 추가
				}
			})
		})
		
		$("#yonhap").on('click', function() {

			var query = {
				newsName : 'yonhap'
			};

			$.ajax({
				type : 'POST',
				url : 'findNews.do',
				data : query,
				success : function(data) {
					var resHTML ='';
					for(var i=0; i<data.length; i++){

						console.log(data[i].news_title);
						console.log(data[i].date);
						console.log(data[i].url);
						resHTML += '<div>';
						resHTML += '<form action="/Restudy/ReExam.do" method="post">';						
						resHTML += '<input type="hidden" name="news_url" value="'+data[i].url+'">';
						resHTML += '<input type="hidden" name="news_title" value="'+data[i].news_title+'">';
						resHTML += '<input type="hidden" name="date" value="'+data[i].date+'">';
						resHTML += '<button type="submit" style="width:100%">';
						resHTML += '<div class="card">';
						resHTML += '<div class="card-header">';
						resHTML += data[i].date;
						resHTML += '</div>';
						resHTML += '<div class="card-body">';
						resHTML += data[i].news_title;
						resHTML += '</div>';
						resHTML += '</div>';
						resHTML += '</button>';
						resHTML += '</form>';
						resHTML += '</div>';
					}
					
					$('#list').html(resHTML); //HTML에 결과 추가
				}
			})
		})
		
		$("#times").on('click', function() {

			var query = {
				newsName : 'times',
			};

			$.ajax({
				type : 'POST',
				url : 'findNews.do',
				data : query,
				success : function(data) {
					var resHTML ='';
					for(var i=0; i<data.length; i++){

						console.log(data[i].news_title);
						console.log(data[i].date);
						console.log(data[i].url);
						resHTML += '<div>';
						resHTML += '<form action="/Restudy/ReExam.do" method="post">';						
						resHTML += '<input type="hidden" name="news_url" value="'+data[i].url+'">';
						resHTML += '<input type="hidden" name="news_title" value="'+data[i].news_title+'">';
						resHTML += '<input type="hidden" name="date" value="'+data[i].date+'">';
						resHTML += '<button type="submit" style="width:100%">';
						resHTML += '<div class="card">';
						resHTML += '<div class="card-header">';
						resHTML += data[i].date;
						resHTML += '</div>';
						resHTML += '<div class="card-body">';
						resHTML += data[i].news_title;
						resHTML += '</div>';
						resHTML += '</div>';
						resHTML += '</button>';
						resHTML += '</form>';
						resHTML += '</div>';
					}
					
					$('#list').html(resHTML); //HTML에 결과 추가
				}
			})
		})
	</script>
</body>

</html>
