<%@page import="java.util.Date"%>
<%@page import="javax.xml.crypto.Data"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%	
	String news_name = (String)request.getAttribute("news_name");
	String title = (String)request.getAttribute("news_title");
	Date date = (Date)request.getAttribute("insertdate");
	List<String> sentences = (List<String>)request.getAttribute("original_sentences");
	String news_url = (String)request.getAttribute("news_url");
	out.print("url : " + news_url);
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
			
			<!-- 뉴스 기사 삽입. -->
			<div class="content">
				<div class="card">
					<div class="card-header">
						<h4 class="mt-0 mb-0 text-center"><b><%=news_name %></b></h4>
					</div>
					<hr>
					<div class="card-body">
						<h6 class="m-3" style="color:orange">Today news</h6>
						
						<div class="m-3">
						<h4 class="card-text"><b><%=title %></b></h3>
						<div class="write-name">
						<h6 style="color:grey">Writer's name</h6>
						</div>
						<div class="write-date">
						<h6 style="color:grey"><%=date %></h6>
						</div>
						</div>
						<% for( String sent : sentences ) {%>
						<p class="m-4" style="font-size:15px">
									<%=sent %>
									</p>
								<% } %>
					</div>
				</div>
			<!-- 뉴스 기사 끝. -->
			<!-- 다음으로 넘어가는 버튼 만들기  -->
			<form action="/Today/TodaySentence.do" method="post">
			<input type="hidden"  class="asdf" name="news_url" value="<%=news_url%>" >
			<input type="submit" id="sant" class="btn btn-warning btn-block btn-lg" value="Next" >
			</form>
								</div>
							</div>
						</div>
					
			
		
			<!-- --------------------------------------------------------------------------- -->
			
	<!--   Core JS Files   -->
	<script src="/resources/assets/js/core/popper.min.js"></script>
	<script src="/resources/assets/js/core/bootstrap.min.js"></script>

	<!--  Notifications Plugin    -->
	<script src="/resources/assets/js/plugins/bootstrap-notify.js"></script>
	<!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
	<script src="/resources/assets/js/paper-dashboard.min.js?v=2.0.1"
		type="text/javascript"></script>

	<script>
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
		
		// Sentence으로 값을보내기위한 ajax
/*		
		var doCheck = 'N'
		$("#sant").click(function() {
			var query = {
				news_url : $(news_url).val()
			};

			$.ajax({
				url : "TodaySentence.do",
				type : "post",
				data : query,
				success : function(data) {
					
					
				}
			}); // ajax 끝
		});

*/	
	</script>
	
</body>

</html>
