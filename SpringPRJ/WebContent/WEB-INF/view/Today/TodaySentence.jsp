<%@page import="poly.dto.MongoNewsDTO"%>
<%@page import="poly.util.TranslateUtil"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	int idx = (int) request.getAttribute("idx");
	String news_url = (String) request.getAttribute("news_url");
	String news_name = (String)request.getAttribute("news_name");
	String insertdate = (String)request.getAttribute("insertdate");
	String news_title = (String)request.getAttribute("news_title");
	String title_trans = (String)request.getAttribute("title_trans");
	String original_sent = (String)request.getAttribute("original_sent");
	String translation = (String)request.getAttribute("translation");
	Object quiz_sent = (Object)request.getAttribute("quiz_sent");
	Object answer_sent = (Object)request.getAttribute("answer_sent");
	Object word = request.getAttribute("word");
	
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
			<!-- End Navbar -->

			<!-- 뉴스 기사 삽입. -->
			
			<div class="content">
				<div class="card">
					<div class="card-header">
						<h4 class="mt-0 mb-0 text-center"><b><%=news_name %></b></h4>
					</div>
					<hr>
					<div class="card-body">
						
						<h6 class="m-3" style="color:orange">Today Sentence</h6>
						
						<div class="m-3">
						<h3 class="card-text"><b><%=news_title.replace("& #40;", "(").replace("& #41;", ")").replace("& lt;", "<")
	                              .replace("& gt;", ">").replace("& #39;", "'") %></b></h3>
						<h6 style="color:grey"><%=insertdate %></h6>
						</div>
						
						<p class="m-4" style="font-size:1.5em"><%=original_sent %></p>
						
						<hr>
						

						<h6 class="m-3" style="color:orange">Title 번역</h6>
						<p class="m-4" style="font-size:1.5em"><%=title_trans.replace("& #40;", "(").replace("& #41;", ")").replace("& lt;", "<")
	                              .replace("& gt;", ">").replace("& #39;", "'") %></p>
						
						<h6 class="m-3" style="color:orange">Sentence 번역</h6>
						<p class="m-4" style="font-size:1.5em"><%=translation.replace("& #40;", "(").replace("& #41;", ")").replace("& lt;", "<")
	                              .replace("& gt;", ">").replace("& #39;", "'") %></p>
					
					</div>
				</div>

				<!-- 뉴스 기사 끝. -->
				<!-- 다음으로 넘어가는 버튼 만들기  -->

				<div>
					<form action="/Today/TodayExam.do" method="post">
					<input type="hidden" value="<%=news_url %>" name="news_url">
					<input type="hidden" value="<%=news_name %>" name="news_name">
					<input type="hidden" value="<%=insertdate %>" name="insertdate">					
					<input type="hidden" value="<%=news_title %>" name="news_title">
				    <input type="hidden" value="<%=idx%>" name="idx">

						<button style="width: 100%" class="next mb-5" type="submit">Next</button>
					</form>
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
