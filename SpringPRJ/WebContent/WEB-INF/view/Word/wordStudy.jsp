<%@page import="poly.util.WebCrawler"%>
<%@page import="poly.util.TranslateUtil"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	List<String> rList = (List<String>)request.getAttribute("rList");
	List<String> wList = (List<String>)request.getAttribute("wList");
	out.print(rList.size());
	out.print(wList.size());
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
.container {
	height: 500px;
	perspective: 1000px;
}

.card {
	transition: transform 0.3s;
	transform-style: preserve-3d;
	cursor: pointer;
	width: 100%;
	height: 100%;
}

.front, .back {
	position: absolute;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	backface-visibility: hidden;
	width: 100%;
	height: 90%;
}

.front {
	background-color: transparent;
}

.back {
	transform: rotateY(180deg);
	background-color: transparent;
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


			<!-- 카드 뒤집기 -->
			<script>
				
				 function flip(event) {
					var element = event.currentTarget.parentElement;
					if (element.className === "card") {
						$("#star").removeClass("float-right")
						element.style.transform = "rotateY(180deg)";
						element.style.background = "skyblue";
					}
				}; 
			</script>
				
			<div class="content">
				<div class="container mb-3 ">
					<div class="card" id="card">
						<div onclick="flip(event)">
							<div class="front">
								<h3 class="text-center" style="margin-top: 130px;" id="en">
									<%=rList.get(0)%>
								</h3>
								<p class="text-center" style="margin-top: 100px;">클릭해서 확인하세요</p>
							</div>
							<div class="back">
								<h3 class="text-center" style="margin-top: 40px;" id="ko"><%=TranslateUtil.kakaotrans(rList.get(0)) %></h3>
								<p class="mr-5"  id="sub-en"><%=wList.get(0) %></p>
							</div>
						</div>
					</div>
				</div>

				<div class="container" style="height: 100px;">
					<div class="row">
						<div class="col-6">
							<button style="width: 100%" id="O" class="submit text-center">
								<i class="nc-icon nc-satisfied "
									style="font-size: 60px; color: white;"></i>
							</button>
						</div>

						<div class="col-6">
							<button style="width: 100%" id="X" class="next">
								<i class="nc-icon nc-simple-remove 	text-danger"
									style="font-size: 60px;"></i>
							</button>
						</div>
					</div>
				</div>

				<br>
			


			</div>
		</div>
		<!--   Core JS Files   -->
		<script src="/resources/assets/js/core/jquery.min.js"></script>
		<script src="/resources/assets/js/core/popper.min.js"></script>
		<script
			src="/resources/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
		<!--  Google Maps Plugin    -->
		<script
			src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
		<!-- Chart JS -->
		<script src="/resources/assets/js/plugins/chartjs.min.js"></script>
		<!--  Notifications Plugin    -->
		<script src="/resources/assets/js/plugins/bootstrap-notify.js"></script>
		<script>
		
		var mylist = [];
		var myko = [];
		var myen = [];
		var loop=0;
		//db내용 바뀌면 수정 ㄱ
		<%for (int i = 0; i < rList.size(); i++) {%>
		  mylist[loop] ="<%=rList.get(i)%>";
		  myko[loop] = "<%=TranslateUtil.kakaotrans(rList.get(i))%>";
		  myen[loop] = "<%=wList.get(i)%>";
			loop++;
		<%}%>
		
		
			var O = 0;
			var X = 0;
			var no = 0;
			var length = <%=rList.size()%>
			$("#O").on('click', function() {
				if (no < length - 1) {
					no++;
					O++;
					document.getElementById("en").innerHTML = mylist[no];
					document.getElementById("sub-en").innerHTML = myen[no];
					document.getElementById("ko").innerHTML = myko[no];
					
					document.getElementById("card").style.transform ="rotatey(0deg)";
		            document.getElementById("card").style.backgroundColor ="white";
				} else {
					O++;
					no++;
					var form =document.createElement("form");
				   	form.setAttribute("method","post");
				   	form.setAttribute("action", "/Word/wordResult.do");
				   	
				   	var hiddenField = document.createElement("input");
				   	hiddenField.setAttribute("type","hidden");
				   	hiddenField.setAttribute("name", "O");
				   	hiddenField.setAttribute("value", O);
				   	form.appendChild(hiddenField);
				   	
				   	hiddenField = document.createElement("input");
				   	hiddenField.setAttribute("type","hidden");
				   	hiddenField.setAttribute("name", "X");
				   	hiddenField.setAttribute("value", X);
				   	form.appendChild(hiddenField);
				   	
				   	document.body.appendChild(form);
				    form.submit();
				}
			})
			
			$("#X").on('click', function() {
				if (no < length - 1) {
					no++;
					X++;
					document.getElementById("en").innerHTML = mylist[no];
					document.getElementById("sub-en").innerHTML = myen[no];
					document.getElementById("ko").innerHTML = myko[no];
					
					document.getElementById("card").style.transform ="rotatey(0deg)";
		            document.getElementById("card").style.backgroundColor ="white";
				} else {
					no++;
					X++;
					var forms =document.createElement("form");
				   	forms.setAttribute("method","post");
				   	forms.setAttribute("action", "/Word/wordResult.do");
				   	
				   	var hiddenField = document.createElement("input");
				   	hiddenField.setAttribute("type","hidden");
				   	hiddenField.setAttribute("name", "O");
				   	hiddenField.setAttribute("value", O);
				   	forms.appendChild(hiddenField);
				   	
				   	hiddenField = document.createElement("input");
				   	hiddenField.setAttribute("type","hidden");
				   	hiddenField.setAttribute("name", "X");
				   	hiddenField.setAttribute("value", X);
				   	forms.appendChild(hiddenField);
				   	
				   	document.body.appendChild(forms);
				    forms.submit();
				    
				}
			})

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
