<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="poly.dto.UserDTO"%>
<%@ page import="static poly.util.CmmUtil.nvl"%>
<%@page import="poly.util.CmmUtil"%>
<%
	String[] interest = (String[]) request.getAttribute("interest");
%>
<!DOCTYPE html>
<html lang="en">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="/resources/assets/demo/demo.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<style>
	label{
		float: left;
	}
</style>
</head>

<body class="" style="background-color: #F3F4EF">
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
						<a class="navbar-brand" href="javascript:;">Today Highlight
							English</a>
					</div>
				</div>
			</nav>
			<!-- End Navbar -->

			<div class="content">
				<div class="card">
					<div class="card-header">
						<h4 class="mt-0 mb-0 text-center">
							<b>관심분야 수정</b>
						</h4>
					</div>
					<hr>
					<div class="card-body">

						<div style="text-align: right; font-size: 30px;">
							<form action="/Mypage/interestSettingProc.do">
								<label for="checkAll">전체 선택</label> <input type="checkbox"
									name="checkAll" id="checkAll" onclick="checkAll();"> <br>
								<hr>
								<label for="interest1">토익</label> <input type="checkbox"
									name="interest" id="interest1" value="toeic"
									<%=CmmUtil.checked(interest, "toeic")%>> <br> 
									
									<label
									for="interest2">학술/논문</label> <input type="checkbox"
									name="interest" id="interest2" value="academic"
									<%=CmmUtil.checked(interest, "academic")%>> <br> 
									
									<label
									for="interest3">비즈니스</label>
									<input
									type="checkbox" name="interest" id="interest3" value="business"
									<%=CmmUtil.checked(interest, "business")%>> <br>
									
									 <input
									class="btn btn-success btn-block btn-lg" type="submit"
									value="확인"> <input type="button"
									onclick="location.href='/Setting/TheMypage.do'"
									class="btn btn-warning btn-block btn-lg" value="뒤로">

							</form>
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
	<script type="text/javascript">
		$(function(){ //전체선택 체크박스 클릭
			$("#checkAll").click(function(){ //만약 전체 선택 체크박스가 체크된상태일경우 
				if($("#checkAll").prop("checked")) { //해당화면에 전체 checkbox들을 체크해준다 
					$("input[type=checkbox]").prop("checked",true); // 전체선택 체크박스가 해제된 경우 
				} else { //해당화면에 모든 checkbox들의 체크를해제시킨다. 
					$("input[type=checkbox]").prop("checked",false); 
				} 
			}) 
		})

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
