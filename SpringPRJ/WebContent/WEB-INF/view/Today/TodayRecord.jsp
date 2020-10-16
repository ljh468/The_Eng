<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

	String answer_sent = (String)request.getAttribute("answer_sent");
	String news_url = (String) request.getAttribute("news_url");
	String news_name = (String)request.getAttribute("news_name");
	String news_title = (String)request.getAttribute("news_title");
	String insertdate = (String)request.getAttribute("insertdate");
	String original_sent = (String)request.getAttribute("original_sent");
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
<link rel="stylesheet" href="/resources/scss/Button.css">
</head>

<body class="">
	<div class="wrapper ">
		<%@ include file="/WEB-INF/view/sidebar.jsp"%>
		<div class="main-panel">
			<!-- Navbar -->
			
			<!-- End Navbar -->
			<!-- 뉴스 기사 삽입. -->
			<div class="content" style="margin-top: 30px;">
				<div class="card">
					<div class="card-header">
						<h4 class="mt-0 mb-0 text-center"><b><%=news_name %></b></h4>
					</div>
					<hr>
					<div class="card-body">
						<div class="m-3">
						<h6 style="color:orange">Today Record</h6>
						<br>
						<!-- 자동으로 바뀌어야 하는 구역 -->
						<h3 class="card-text"><b><%=news_title %></b></h3>
						<h6 style="color:grey"><%=insertdate %></h6>
						</div>
						
						<p class="m-4" style="font-size:1.5em"><%=answer_sent %></p>
						
						<hr>
						<!-- 뉴스 기사 끝. -->
						
						<h6 class="m-3" style="color:orange">Voice Record</h6>
						
						<!--  버튼을 클릭했을 때 기능이 나오게 하기.  -->
						<input style="float:left; width:45%; height:100px" type="button" class="btn btn-success btn-block btn-lg" value="발음듣기">
						
						<button style="float:right; width:45%; height:100px" type="button" class="btn btn-primary btn-block btn-lg" 
						data-toggle="modal" data-target="#exampleModalScrollable">녹음하기</button>
						
						<!-- Modal -->
						<div class="modal fade" id="exampleModalScrollable" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
						  <div class="modal-dialog modal-dialog-scrollable" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalScrollableTitle">녹음하기</h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
						      </div>
						      <div class="modal-body">
						      <button type="button" class="btn btn-success">녹음시작</button>
						      <button type="button" class="btn btn-primary">다시 녹음하기</button>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						        <button type="button" class="btn btn-primary">exam</button>
						      </div>
						    </div>
						  </div>
						</div>
					</div>
				</div>

				<!-- 다음으로 넘어가는 버튼 만들기  -->
				<div>
					<button style="width: 100%" class="submit mb-0"
					onclick="location='/Today/TodayResult.do'">결과</button>
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
