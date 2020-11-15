<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="poly.dto.WordQuizDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String pageTitle = "Translate Practice";
String news_url = (String) request.getAttribute("news_url");
String news_title = (String) request.getAttribute("news_title");
String original_sent = (String) request.getAttribute("original_sent");
String news_name = (String) request.getAttribute("news_name");
String sentidx = (String) request.getAttribute("sentidx");
String insertdate = (String) request.getAttribute("insertdate");
List<String> pList = (List<String>) request.getAttribute("pList");
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
						<h4 class="mt-0 mb-0 text-center">
							<b><%=pageTitle%></b>
						</h4>
					</div>
					<hr>
					<!-- result창은 가운데 정렬 -->
					<div class="card-body">
						<div style="text-align: center;">

							<div class="card-text">
								<h6 style="color: orange">Today Sentence</h6>
								<h3 style="font-weight: 700"><%=news_title.replace("& #40;", "(").replace("& #41;", ")").replace("& lt;", "<").replace("& gt;", ">").replace("& #39;", "'")%></h3>
							</div>
							<div class="card-text">

								<hr>
								<p>
									<%=original_sent.replace("& #40;", "(").replace("& #41;", ")").replace("& lt;", "<").replace("& gt;", ">").replace("& #39;", "'")%>
								</p>

								<fieldset class="form-group" data-idx="<%=sentidx%>">
									<div class="answer mb-1"></div>
									<textarea class="form-control pr-1 pl-1" rows="3"
										placeholder="위 문장의 번역을 입력해주세요"></textarea>
									<div class="progress mb-0 hidden">
										<div
											class="progress-bar progress-bar-striped progress-bar-animated bg-info"
											role="progressbar" aria-valuenow="100" aria-valuemin="100"
											aria-valuemax="100" style="width: 100%"></div>
									</div>
									<div class="score text-right" style="color: red">유사도 : 0%</div>
									<button type="button" data-idx="<%=sentidx%>"
										class="float-right submit-btn mt-1 btn btn-sm btn-info">정답
										보기</button>

								</fieldset>
								<br>

							</div>
						</div>
						<div class="card-footer">
                     <div class="row">
                        <div class="col-6 m-auto">
                           <button style="width: 100%" class="next " 
                           onclick="location='/Today/TodayMain.do'">Home</button>
                        </div>
                        <div class="col-6 m-auto">
                           <form action="/Today/TodaySentence.do" method="post" style="display:inline">
                                    <input type="hidden" value="<%=news_url%>" name="news_url">
                                    <input type="hidden" value="<%=insertdate%>" name="news_url">
                                    <input type="hidden" value="<%=news_name%>" name="news_name">
                                    <input type="hidden" value="<%=sentidx%>" name="sentidx">
                                    <input type="hidden" value="<%=news_title%>" name="news_title">
                                    <button type="submit" style="width: 100%" class="next">다른 문제</button>
                                 </form>
                        </div>
                     </div>
                     
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
	<script type="text/javascript">
		$("#navbar-toggler").on('click', function() {
			if ($(this).hasClass("toggled")) {
				$(this).removeClass("toggled");
				$("html").first().removeClass("nav-open");
			} else {
				$(this).addClass("toggled");
				$("html").first().addClass("nav-open");

			}

		})

		var timer;

		$('textarea').on('keyup', function() {

			el = this;

			clearTimeout(timer);
			timer = setTimeout(function() {
				parent = el.parentElement;
				var progressBar = parent.querySelector(".progress");
				var userAnswer  = parent.querySelector("textarea").value;
				var answer = parent.querySelector(".answer");
				var scoreTag = parent.querySelector(".score");
				var idx = $(parent).attr("data-idx");
				var url = '<%=news_url%>';
				var query = {
					userAnswer : userAnswer, idx : idx, url : url
				};

				$.ajax({
					type : 'POST',
					url : 'scoreTranslate.do',
					data : query,
					dataType : "JSON",
					success : function(json) {
						var score = parseFloat(json.score);
						score *= 10000;
						score = Math.round(score) / 100
						if (score < 50) {
							scoreTag.style.color = 'red';
						} else if (score < 75) {
							scoreTag.style.color = 'orange';
						} else {
							scoreTag.style.color = 'green';
						}
						scoreTag.innerHTML = "유사도 : " + score + "%";
					}
				});

			}, 500);
		})
		
		
		$(".submit-btn").on("click", function() {
			parent = this.parentElement;
			this.classList.add("hidden");
			var progressBar = parent.querySelector(".progress");
			progressBar.classList.remove("hidden");
			var userAnswer = parent.querySelector("textarea").value;
			var answer = parent.querySelector(".answer");
			var scoreTag = parent.querySelector(".score");
			var idx = $(this).attr("data-idx");
			var url = '<%=news_url%>';
			var query = {
				userAnswer : userAnswer,
				idx : idx,
				url : url
			};

			$.ajax({
				type : 'POST',
				url : 'scoreTranslate.do',
				data : query,
				dataType : "JSON",
				success : function(json) {
					answer.innerHTML = json.original;
					progressBar.classList.add("hidden");
					var score = parseFloat(json.score);
					score *= 10000;
					score = Math.round(score) / 100

					scoreTag.innerHTML = "유사도 : " + score + "%";

				}
			});
		})
	</script>
</body>

</html>
