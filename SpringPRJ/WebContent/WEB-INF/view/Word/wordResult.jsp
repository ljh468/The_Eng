<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--
=========================================================
* Paper Dashboard 2 - v2.0.1
=========================================================

* Product Page: https://www.creative-tim.com/product/paper-dashboard-2
* Copyright 2020 Creative Tim (https://www.creative-tim.com)

Coded by www.creative-tim.com

 =========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
-->
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="/resources/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="/resources/assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    Today Highlight English
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
  <!-- CSS Files -->
  <link href="/resources/assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="/resources/assets/css/paper-dashboard.css?v=2.0.1" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="/resources/assets/demo/demo.css" rel="stylesheet" />
</head>

<body class="">
  <div class="wrapper ">
    <%@ include file="/WEB-INF/view/sidebar.jsp" %>
    <div class="main-panel">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-absolute fixed-top navbar-transparent">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <div class="navbar-toggle">
              <button type="button" class="navbar-toggler" id="navbar-toggler">
                <span class="navbar-toggler-bar bar1"></span>
                <span class="navbar-toggler-bar bar2"></span>
                <span class="navbar-toggler-bar bar3"></span>
              </button>
            </div>
            <a class="navbar-brand" href="javascript:;">Today Highlight English</a>
          </div>
          </div>
      </nav>
      <!-- End Navbar -->
      
      
      <div class="content">
      <div class="card">
      	<div class="card-header">
      		<h2 class="text-center mb-0">총 단어 <% %> 개</h2>
      	</div>
      	<hr>
      	<div class="card-body">
      		<div class="row">
      			<div class="col-6">
      				<i class="nc-icon nc-satisfied text-success pl-3" style="font-size: 40px"></i>
      			</div>
      			
      			<div class="col-6">
      				<h3 class="text-center"> <% %> 개</h3>
      			</div>
      		</div>
      		
      		<br>
      		
      		<div class="row">
      			<div class="col-6">
      				<i class="nc-icon nc-simple-remove text-danger pl-3" style="font-size: 40px"></i>
      			</div>
      			
      			<div class="col-6">
      				<h3 class="text-center"> <% %> 개</h3>
      			</div>
      		</div>
      		
      		<br>
      		
			<div class="row">
				<div class="ml-auto mr-auto">
					<button class="btn btn-primary btn-round">
					<i class="nc-icon nc-refresh-69 mr-3"></i>
					틀린 단어 학습하기
					</button>
				</div>
			</div>      		
      	</div>
      </div>
      
      </div>
      
      
      <footer class="footer footer-black  footer-white ">
        <div class="container-fluid">
          <div class="row">
            <nav class="footer-nav">
              <ul>
                <li><a href="https://www.creative-tim.com" target="_blank">Creative Tim</a></li>
                <li><a href="https://www.creative-tim.com/blog" target="_blank">Blog</a></li>
                <li><a href="https://www.creative-tim.com/license" target="_blank">Licenses</a></li>
              </ul>
            </nav>
            <div class="credits ml-auto">
              <span class="copyright">
                © <script>
                  document.write(new Date().getFullYear())
                </script>, made with <i class="fa fa-heart heart"></i> by Creative Tim
              </span>
            </div>
          </div>
        </div>
      </footer>
    </div>
  </div>
  <!--   Core JS Files   -->
  <script src="/resources/assets/js/core/jquery.min.js"></script>
  <script src="/resources/assets/js/core/popper.min.js"></script>
  <script src="/resources/assets/js/core/bootstrap.min.js"></script>
  <script src="/resources/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!--  Google Maps Plugin    -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <!-- Chart JS -->
  <script src="/resources/assets/js/plugins/chartjs.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="/resources/assets/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="/resources/assets/js/paper-dashboard.min.js?v=2.0.1" type="text/javascript"></script><!-- Paper Dashboard DEMO methods, don't include it in your project! -->
  <script src="/resources/assets/demo/demo.js"></script>
  <script>
    $(document).ready(function() {
      // Javascript method's body can be found in assets/assets-for-demo/js/demo.js
      demo.initChartsPages();
    });
    
    $("#navbar-toggler").on('click', function(){
    	if($(this).hasClass("toggled")){
    		$(this).removeClass("toggled");
    		$("html").first().removeClass("nav-open");
    	}else{
    		$(this).addClass("toggled");
    		$("html").first().addClass("nav-open");
    		
    	}
    	
    })
	
 
  </script>
</body>

</html>
