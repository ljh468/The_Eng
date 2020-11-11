<%@page import="java.util.Date"%>
<%@page import="poly.util.TranslateUtil"%>
<%@page import="poly.dto.WordQuizDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	

<%
	String news_url = (String) request.getAttribute("news_url");
	String date = (String)request.getAttribute("date");
	String news_title = (String) request.getAttribute("news_title");
	List<String> quiz_sent = (List<String>)request.getAttribute("quiz_sent");
	List<String> word = (List<String>)request.getAttribute("word");
	List<String> translation = (List<String>)request.getAttribute("translation");
	
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
<style>
	#answer {
	width: 130px;
	height: 25px;
	margin: 4px;
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
						<h4 class="mt-0 mb-0 text-center"><b><%=news_title.replace("& #40;", "(").replace("& #41;", ")").replace("& lt;", "<")
	                              .replace("& gt;", ">").replace("& #39;", "'") %></b></h4>
					</div>
						<hr>
						<div class="card-body">
							<h6 class="m-3" style="color:orange">Today Exam</h6>
						<div class="m-3">
							<h6 style="color:grey"><%=date %></h6>
						</div>
						
						<p class="m-2" id="quiz" style="font-size:1em"><%=quiz_sent.get(0)%></p>
						<br>
						<h6 class="m-3" style="color:orange">Translation</h6>
						<p class="m-2" id="trans" style="font-size:1em"><%=translation.get(0)%></p>
						<br>
							<div class="text-center" id="no">
							1 / <%=quiz_sent.size()%>
							</div>
						</div>
					</div>
				</div>

				<div class="text-center">
				<button style="width: 100%" class="submit mb-3" id="submit">submit</button>
				<button style="width: 100%; display:none" class="submit mb-3" id="next">next</button>
				<button style="width: 100%; display:none" class="next mb-3" id="home" onclick="location='/Today/TodayMain.do'">Home</button>
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
	<script>
	
	function showNotificationY() {
	    color = 'success';
	
	    $.notify({
	      icon: "nc-icon nc-bulb-63",
	      message: "정답입니다."
	
	    }, {
	      type: color,
	      delay: 400,
	      timer: 1000,
	      placement: {
	        from: 'top',
	        align: 'center'
	      }
	    });
	 }
	
	function showNotificationN() {
	    color = 'danger';
	
	    $.notify({
	      icon: "nc-icon nc-bulb-63",
	      message: "오답입니다."
	
	    }, {
	      type: color,
	      delay: 400,
	      timer: 1000,
	      placement: {
	        from: 'top',
	        align: 'center'
	      }
	    });
	 }
	
	var ques = [];
	var ques_ko = [];
	var answer = [];
	var loop=0;
	var no =0;
	//db내용 바뀌면 수정 ㄱ
	<%for (int i = 0; i < quiz_sent.size(); i++) {%>
			ques[loop] ="<%=quiz_sent.get(i).replaceAll("\\\"", "\\\\\"")%>";
			ques_ko[loop] = "<%=translation.get(i).replaceAll("\\\"", "\\\\\"")%>";
			answer[loop] = "<%=word.get(i)%>";
			loop++
	<%}%>
	$("#submit").click(function() {
		if(no<loop-1){
			if($("#answer").val()==answer[no]){
				$("#answer").css("border-color", "#00AECD");
				$("#answer").css("border-width", "4px");
				$("#answer").val(answer[no]);
				
				console.log($("#answer").val());
				showNotificationY();
			}else{
				$("#answer").css("border-color", "#FF1111");
				$("#answer").css("border-width", "4px");
				$("#answer").val(answer[no]);
				
				console.log($("#answer").val());
				showNotificationN();
			}
			$("#next").css("display", "inline");
			$("#submit").css("display", "none");
			no++;
		}else{
			$("#next").css("display", "none");
			$("#submit").css("display", "none");
			$("#home").css("display", "inline");
		}
	});
	
	$("#next").click(function(){
		$("#quiz").html(ques[no]);
		$("#trans").text(ques_ko[no]);
		$("#no").text(no+1 +" / " + loop )
		
		$("#next").css("display", "none");
		$("#submit").css("display", "inline");
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
