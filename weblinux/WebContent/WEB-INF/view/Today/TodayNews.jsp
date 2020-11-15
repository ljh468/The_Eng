<%@page import="java.util.Date"%>
<%@page import="javax.xml.crypto.Data"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%	
	int idx = (int) request.getAttribute("idx");
	String news_url = (String) request.getAttribute("news_url");
	String news_name = (String)request.getAttribute("news_name");
	String title = (String)request.getAttribute("news_title");
	Date date = (Date)request.getAttribute("insertdate");
	List<String> sentences = (List<String>)request.getAttribute("original_sentences");
	
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

<body>
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
						<h4 class="mt-0 mb-0 text-center">
							<b><%=news_name%></b>
						</h4>
					</div>
					<hr>
					<div class="card-body">
						<h6 class="m-3" style="color: orange">Today news</h6>

						<div class="m-3">
							<h4 class="card-text">
								<b><%=title.replace("& #40;", "(").replace("& #41;", ")").replace("& lt;", "<")
	                              .replace("& gt;", ">").replace("& #39;", "'")%></b>
								</h4>
								<div class="write-date">
									<h6 style="color: grey"><%=date%></h6>
								</div>
						</div>
						<%	
							for (String sent : sentences) {
						%>
						<p class="m-4" style="font-size: 15px">
							<%=sent%>
						</p>
						<%
							}
						%>
					</div>
				</div>
				<!-- 뉴스 기사 끝. -->
				<!-- 다음으로 넘어가는 버튼 만들기  -->

				<form action="/Today/TodaySentence.do" method="post">
					<button type="submit" style="width: 100%" class="next mb-5">Next</button>
					<input type="hidden" value="<%=idx%>" name="idx">
					<input type="hidden" value="<%=news_name%>" name="news_name">
					<input type="hidden" value="<%=news_url%>" name="news_url">
					<input type="hidden" value="<%=title%>" name="news_title">
					<input type="hidden" value="<%=date%>" name="insertdate">
				</form>
				<div id="go-bottom" style="position:fixed; bottom:80%; right:3px;"><button type="button" style="opacity: 0.8;" class="btn btn-info btn-warning" >skip</button></div>
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
		$("#go-bottom").click(function(){
			$('html, body').scrollTop( $(document).height() );
		});
	</script>
</body>

</html>
