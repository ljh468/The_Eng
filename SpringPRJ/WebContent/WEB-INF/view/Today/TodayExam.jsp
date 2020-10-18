<%@page import="java.util.Date"%>
<%@page import="poly.util.TranslateUtil"%>
<%@page import="poly.dto.WordQuizDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	

<%
	
	String news_url = (String) request.getAttribute("news_url");
	String news_name = (String)request.getAttribute("news_name");
	String insertdate = (String)request.getAttribute("insertdate");
	String news_title = (String)request.getAttribute("news_title");
	String original_sent = (String)request.getAttribute("original_sent");
	String translation = (String)request.getAttribute("translation");
	String quiz_sent = (String)request.getAttribute("quiz_sent");
	String answer_sent = (String)request.getAttribute("answer_sent");
	String word = (String)request.getAttribute("word");
	
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
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="/resources/assets/demo/demo.css" rel="stylesheet" />
<link rel="stylesheet" href="/resources/scss/Button.css">
<style>
	#answer{
		width:200px;
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
			<!-- 뉴스 기사 삽입. -->
			<div class="content">
			
				<div class="card">
				
					<div class="card-header">
						<h4 class="mt-0 mb-0 text-center"><b><%=news_name %></b></h4>
					</div>
						<hr>
						<div class="card-body">
							<h6 class="m-3" style="color:orange">Today Exam</h6>
						<div class="m-3">
							<h3 class="card-text"><b><%=news_title %></b></h3>
							<h6 style="color:grey"><%=insertdate %></h6>
						</div>
						
						<p class="m-4" style="font-size:1.5em"><%=quiz_sent%></p>
						<br>
						<p>hint</p>
						<p><%=word %></p>
						<span id="word" style="display:none;"><%=word%></span>

						<!-- textbox의 value값에 문제로 낼 단어의 앞 두글자를 힌트로 준다.  -->
					</div>
				</div>

				<div class="row">
				<div class="col-6">
				<button style="width: 100%" class="submit mb-3" id="submit">submit</button>
				</div>
				<div class="col-6">
				<!-- 다음으로 넘어가는 버튼 -->
					<form action="/Today/TodayRecord.do" method="post">
						<input type="hidden" value="<%=news_url %>" name="news_url">
						<input type="hidden" value="<%=news_name %>" name="news_name">
						<input type="hidden" value="<%=insertdate %>" name=insertdate>
						<input type="hidden" value="<%=news_title %>" name="news_title">
						<button style="width: 100%" class="next mb-5"
						onclick="location='/Today/TodayRecord.do'">Next</button>
					</form>
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
		
		$("#submit").click(function() {
			var answer = {
				answer : $("#answer").val(), word : $("#word").text()
			};
			console.log(word);
			$.ajax({
				url : "answerCheck.do",
				type : "post",
				data : answer,
				success : function(data) {
	
					if (data == 1) {
						$("#answer").css("border-color", "#00AECD");
						$("#answer").css("border-width", "4px");
						
					} else if (data == 0) {
						$("#answer").css("border-color", "#FF1111");
						$("#answer").css("border-width", "4px");
					}
				}
			}); // ajax 끝
		});
	</script>
</body>

</html>
