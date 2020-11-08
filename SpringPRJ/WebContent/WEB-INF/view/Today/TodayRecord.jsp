<%@page import="poly.dto.MongoNewsDTO"%>
<%@page import="poly.util.TranslateUtil"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
	String reIdx = (String) request.getAttribute("reIdx"); // 중복인덱스
	String news_url = (String) request.getAttribute("news_url");
	String news_name = (String) request.getAttribute("news_name");
	String news_title = (String) request.getAttribute("news_title");
	String insertdate = (String) request.getAttribute("insertdate");
	String original_sent = (String) request.getAttribute("original_sent");
	String sentidxst = (String) request.getAttribute("sentidx");
	int sentidx = Integer.parseInt(sentidxst);
	String pageTitle = "읽기 연습";
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

<style>
	#mic{
		background-image:url("/resources/images/mic_disabled.png");
		background-size:15em 15em;
	}
	.ldBar-label{
		display:none;
		}
	#analyzingCircle {
	  border: 0.5em solid #f3f3f3; /* Light grey */
	  border-top: 0.5em solid #3498db; /* Blue */
	  border-radius: 50%;
	  width: 15em;
	  height: 15em;
	  animation: spin 2s linear infinite;
 	  visibility:hidden; 
	}
	
	@keyframes spin {
	  0% { transform: rotate(0deg); }
	  100% { transform: rotate(360deg); }
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
						<a class="navbar-brand" href="javascript:;">
						Today Highlight English</a>
					</div>
					
				</div>
			</nav>
			<!-- End Navbar -->
			<!-- 뉴스 기사 삽입. -->
			<div class="content">
				<div class="card">
					<div class="card-header">
						<h4 class="mt-0 mb-0 text-center"><b><%=news_name%>s</b></h4>
					</div>
					<hr>
					<div class="card-body">
						<div class="m-3">
						<h6 style="color:orange">Today Record</h6>
						<br>
						<!-- 자동으로 바뀌어야 하는 구역 -->
						<h3 class="card-text"><b>Pros and Cons of 5G Technology</b></h3>

						<h6 style="color:grey">2020, Dec 11</h6>
						</div>
						
						<p class="m-4" id='sentence' style="font-size:1.5em">
						</p>
						
						<div class="row" id="navigator">		
						<div class="col-12 mt-1 mb-1 text-center">
							<button type="button" id="prev" disabled='disabled' class="btn btn-info btn-success ">&lt;</button>
							
							<button type="button" id="listen" class="btn btn-info btn-warning">Voice
							<i style="font-size:2rem" class="la la-volume-up"></i></button>
							
							<button type="button" id="next" class="btn btn-info btn-success ">&gt;</button>
						</div>
						</div>
									
						
						<hr>
						<!-- 뉴스 기사 끝. -->
						
						<h6 class="m-3" style="color:orange">Voice Record</h6>
						
						<!--  버튼을 클릭했을 때 기능이 나오게 하기.  -->
						<div style="float:left; width:47%; height:240px; margin-left:10px; margin-right:10px">
						<br>
						<div id="timerBlock">
									<br>
									
									<div id="mic" style="width:15em;height:15em;margin:auto;">
											<div id="progressCircle" style="width:15em;height:15em;color:white;" data-stroke="red" 
											data-preset="circle" class="label-center" data-value="100" data-precision="0.01"></div>
											<div id="analyzingCircle"></div>
									</div>
										
								</div>
						</div>
						
						<div style="float:left; width:47%;">
					
						<div class="text-center">
							<h1 id="timer"></h1>
							<button id="startInterview"  style="height:105px"class="mt-1 btn btn-success btn-block btn-lg">녹음 시작</button>
							<button hidden='hidden' id="resetInterview" style="height:105px" class="btn btn-success btn-block btn-lg">다시 녹음</button>
							<button style="display:none;height:105px;" id="stopInterview" class="btn btn-success btn-block btn-lg">녹음 종료</button>
							<button style="display:none;height:105px" id="submitInterview" class="btn btn-success btn-block btn-lg">제출</button>
						</div>
						
						<input type="button" style="height:105px" onclick="location.href='/today/todayTranslate.do'" class="btn btn-success btn-block btn-lg" value="번역 연습하기">
						</div>
						<div>
						<!-- Header footer section start -->
				<section id="header-footer">
					
						<div style="max-width:50rem">
							<div class="card">
								<div class="card-header">
									
									<div id="waveform" hidden='hidden'></div>
									<div id="waveform2" hidden='hidden'></div>
								</div>
								
								<!-- 강세 분석 결과 표  -->
								<div class="card-body" id="resultBlock" hidden="hidden">
									<div class="row">
										<div class="col-12 mt-1 mb-1">
										<h4 class="card-title mb-0" style="font-size:1.3rem">강세 분석 결과</h4>
										<div id="chartdiv" style="width:100%;height:500px;"></div>
											<div class="row text-left">
												<div class="col-12 text-right">
												<div class="btn-group btn-group-sm" role="group">
				                                <button type="button" id="myVoice" style="background-color: rgba(117, 142, 255, 1); border:none" data-enabled="1" class="btn btn-info">내 목소리</button>
				                                <button type="button" id="nativeVoice" style="background-color: rgba(255,117,117, 1);border:none" data-enabled="1" class="btn btn-danger">원어민 목소리</button>
				                            	</div>
												</div>
											</div>
											
										</div>
									</div>
									
									<div class="row">
										<div class="col-6 offset-3">
											<h4 class="card-title mb-0 text-center" style="font-size:1.3rem">강세 명료도 분석 결과</h4>
											<div id="dynamicsScore" style="width:100%;height:300px;"></div>
										</div>
									</div>
									<div class="row">
									<div class="col-12 text-center">
									<button id="resetInterview2" class="btn btn-warning">다시 녹음</button>
									</div>
									</div>
								</div>
								<!-- 강세분석결과표 끝 -->
			
							</div>
						</div>
						
					
				</section>
						
					
						
						</div>
					</div>
				</div>
			
			<!-- 카드 끝   -->
			
			<div>
			<form action="/Today/TodayTranslate.do" method="post">
					<input type="hidden" value="<%=sentidx%>" name="sentidx">
					<input type="hidden" value="<%=news_name%>" name="news_name">
					<input type="hidden" value="<%=news_url%>" name="news_url">
					<input type="hidden" value="<%=news_title%>" name="news_title">
					<input type="hidden" value="<%=original_sent%>" name="original_sent">
					<input type="submit" style="float:right; width:100%"  class="btn btn-warning btn-block btn-lg" value="Next">
				</form>
			</div>

				</div>
			</div>
		</div>
		
					
			
		
			<!-- --------------------------------------------------------------------------- -->
			
		
	
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
	<script type="text/javascript" src="/js/loading-bar.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/0.8.0/p5.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/0.8.0/addons/p5.sound.js"></script>
<!-- amchart -->
<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
<script src="https://unpkg.com/wavesurfer.js"></script>
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
		
	</script>
	
	<script>
  var sentenceList;
  var sentenceIdx = 0;
  var sentenceAudioIdx;
  var startDiff;
  var audio = WaveSurfer.create({
	  container:"#waveform",
	  waveColor:"blue",
	  progressColor:"purple"
  });
  var answerAudio = WaveSurfer.create({
	  container:"#waveform",
	  waveColor:"blue",
	  progressColor:"purple"
  });
  
  
  var audioIdx = -1;
  var resultJSON;
  var exampleStart;
  var exampleEnd;
  var exampleRatio;
  var chart;
  var exampleSeries;
  var answerSeries;
  var cursorX;
  var cursorY;
  
  var dynamicsChart;
  var similarChart;
  
  $(document).ready(function(){
	  
	  var query = {news_url:"<%=news_url%>"}
  	$.ajax({
			type : "POST",
			url : "getTodaySentences.do",
			data : query,
			dataType : "JSON",
			success : function(json) {
				sentenceList = json.res;
//				$("#all").html(sentenceList.length);
				$("#sentence").html(sentenceList[0].sentence);
				sentenceAudioIdx = sentenceList[0].index * 1;
				audio.load('/audio/getTodaySentenceAudio.do?idx=0&newsUrl=<%=news_url.replaceAll("[^A-Za-z0-9]", "")%>');
				audioIdx = 0;
				sentenceAudioIdx = 0;
//				$("#current").html(sentenceIdx+1);
//				$("#no").html(sentenceIdx+1);
			}
  	})
  })
  
  $("#next").on("click", function(){
	  $("#sentence").html(sentenceList[++sentenceIdx].sentence);
    	refresh();
    });
    
    $("#prev").on("click", function(){
    	$("#sentence").html(sentenceList[--sentenceIdx].sentence);
    	refresh();
    });
    
    function refresh(){
    	
    	$("#timerBlock").removeAttr("hidden");
    	$("#resultBlock").attr("hidden", "hidden");
    	$("#startInterview").removeAttr("hidden");
    	$("#timer").attr("hidden", "hidden");
    	$("#stopInterview").css("display", "None");
	    $("#mic").css("background-image", 'url("/resources/img/mic_disabled.png")');
	    $("#resetInterview").attr("hidden", "hidden");
	    $("#submitInterview").css("display", "None");
	    $("#analyzingCircle").css("visibility", "hidden");
	    
    	$("#current").html(sentenceIdx+1);
    	$("#no").html(sentenceIdx+1);
    	sentenceAudioIdx = sentenceList[sentenceIdx].index * 1;
    	if(sentenceIdx==0){
    		$("#prev").attr("disabled", "disabled");
    	}
    	else{
    		$("#prev").removeAttr("disabled");
    	}
    	if(sentenceIdx+1 == sentenceList.length){
    		$("#next").attr("disabled", "disabled");
    	}else{
    		$("#next").removeAttr("disabled");
    	}
    	audio.pause();
    	audio.currentTime = 0;
    	if(answerAudio!=null){
    		answerAudio.stop();
    	}
    	
    	$("#myVoice").css('background-color', 'rgb(117, 142, 255)')
		$("#myVoice").attr('data-enabled', 1)
		$("#nativeVoice").css('background-color', 'rgb(255,117,117)')
		$("#nativeVoice").attr('data-enabled', 1)
    }
  $("#listen").on("click", function(){
	  if(audioIdx != sentenceAudioIdx){
		  audio.destroy()
		  audio = WaveSurfer.create({
			  container:"#waveform",
			  waveColor:"blue",
			  progressColor:"purple"
		  });
	  	audio.load('/audio/getTodaySentenceAudio.do?newsUrl=<%=news_url.replaceAll("[^A-Za-z0-9]", "")%>&idx=' + sentenceAudioIdx);
	  	audio.on('ready', audio.play.bind(audio));
	  	audioIdx = sentenceAudioIdx;
	  }else{
		  audio.stop();
	  }
	  audio.play();
  })
  
  </script>
  <script>
  window.onload = function(){
	  navigator.mediaDevices.getUserMedia({ audio: true, video: false });
  }
  
	// 음성 데이터 담는 글로벌 변수
	var globalAudioData = {};
	
	$("#resetInterview").on("click", function(){
		refresh();
	})
	$("#resetInterview2").on("click", function(){
		refresh();
	})
	
	var randQ = '';
	$("#startInterview").on("click", function(){
		audio.stop();
		
		if(audioIdx != sentenceAudioIdx){
			  audio.destroy()
			  audio = WaveSurfer.create({
				  container:"#waveform",
				  waveColor:"blue",
				  progressColor:"purple"
			  });
		  	audio.load('/audio/getTodaySentenceAudio.do?newsUrl=<%=news_url.replaceAll("[^A-Za-z0-9]", "")%>&idx=' + sentenceAudioIdx);
		  	audioIdx = sentenceAudioIdx;
		}
		
		$("#startInterview").attr("hidden", "hidden");
		$("#timer").removeAttr("hidden");
		//Countdown Timer
		var countDown = new Date().getTime()+4000;
		// Update the count down every 1 second
		var x = setInterval(function() {
			
			  // Get today's date and time
			    var now = new Date().getTime();
			  
				
			  // Find the distance between now and the count down date
			  var distance = countDown - now;
			
			  // Time calculations for days, hours, minutes and seconds
			  var seconds = Math.floor((distance % (1000 * 60)) / 1000);
				
			  var timer =  document.getElementById("timer");
			  // Display the result in the element with id="demo"
			 $("#navigator").attr("hidden", "hidden");
			 timer.innerHTML = seconds+"초";
			 
			  // If the count down is finished, write some text 
			  if (seconds <=0) {
			    clearInterval(x);
			    audio.play();
			    $("#resetInterview").removeAttr("hidden");
			    $("#mic").css("background-image", 'url("/resources/img/mic.png")');
			    $("#progressCircle").css("display", "inline");
			    timer.style.color = "red";
			    timer.innerHTML = Math.ceil(parseFloat(audio.getDuration()));
			    
			    var bar1 = new ldBar("#progressCircle");
				var bar2 = document.getElementById('progressCircle').ldBar;
				
				
				var constraints = {
					    audio: true,
					    video: false
					}
				navigator.mediaDevices.getUserMedia(constraints)
				  .then(stream => {
				    const mediaRecorder = new MediaRecorder(stream);
				    
				    mediaRecorder.start();
				    const audioChunks = [];
				    mediaRecorder.addEventListener("dataavailable", event => {
				      audioChunks.push(event.data);
				    });
				    mediaRecorder.addEventListener("stop", () => {
				      const audioBlob = new Blob(audioChunks);
				      console.log(audioBlob);
				      const audioUrl = URL.createObjectURL(audioBlob);
				      
				      var reader = new FileReader();
				      var base64data;
				      reader.readAsDataURL(audioBlob); 
				      reader.onloadend = function() {
				          base64data = reader.result;                
				          console.log(base64data);
					      globalAudioData.data = base64data;
					      globalAudioData.sentenceAudioIdx = sentenceAudioIdx;
					      globalAudioData.newsUrl = "<%=news_url %>";
				       }
				    });
					
				    
				    
				    const stopButton = document.getElementById('stopInterview');
				    const resetButton = document.getElementById('resetInterview');
				    
				    resetButton.addEventListener('click', function(){
				    	stopInterview=true;
				    	console.log('stopped')
				    	$("#stopInterview").css("display", "none");
				    	$("#resetInterview").attr("hidden", "hidden");
				    	$("#submitInterview").css("display", "none");
				    })
				    var stopInterview = false;
				    var countDownTimeMilliseconds = parseInt(audio.getDuration() * 1000)
				    var countDown2 = new Date().getTime()+ countDownTimeMilliseconds;
					var x2 = setInterval(function() {
						
						  // Get today's date and time
						  var now2 = new Date().getTime();
						
						  // Find the distance between now and the count down date
						  var distance2 = (countDown2 - now2);
						
						  // Time calculations for days, hours, minutes and seconds
						  var progress = (distance2 % (1000 * 60)) / 1000;
						  var seconds2 = Math.ceil(progress);
							
						  var timer2 =  document.getElementById("timer");
						  // Display the result in the element with id="demo"
						 timer2.innerHTML = seconds2;
						  
						 bar1.set(progress*100 / countDownTimeMilliseconds * 1000);
						  // If the count down is finished, write some text 
						  if (seconds2 <=0 || stopInterview == true) {
							  if(!stopInterview)
								$("#submitInterview").css("display", "inline");
						    clearInterval(x2);
						    mediaRecorder.stop();
						    console.table(mediaRecorder);
						    $("#navigator").removeAttr("hidden");
						    $("#progressCircle").css("display", "none");
						    timer.style.color = "black";
						    timer.innerHTML = "제출 버튼을 누르시면 분석을 시작합니다";
						    bar1.set(0);
						    $("#mic").css("background-image", 'url("/resources/img/mic_disabled.png")');
						  }
					  });
				    
				     
				  });
			    
			  }
		  });
	});
	$("#submitInterview").click(function(){
		$("#resetInterview").attr('hidden', 'hidden');
		$("#submitInterview").hide();
		$("#analyzingCircle").css("visibility", "visible");
		var timer =  document.getElementById("timer");
		timer.innerHTML = "분석중입니다...";
		$.ajax({
	          type: 'POST',
	          url: 'analyzeAudio.do',
	          data: globalAudioData,
	          dataType: "JSON",
	          success: function(json){
	        	  $("#timerBlock").attr('hidden', 'hidden');
	        	  $("#resultBlock").removeAttr("hidden");
	        	  $("#resetInterview").removeAttr('hidden');
	        	  resultJSON = json;
	        	  
	        		// Themes begin
	        		am4core.useTheme(am4themes_animated);
	        		// Themes end
					
	        		chart = am4core.create("chartdiv", am4charts.XYChart);
					var data = [];
					// add data
					
					// get example start time
					var exampleStart = 0;
					for(var i=0; i<json.example_x.length;i++){
	        			if(json.example_y[i] * 1 > 0){
	        				exampleStart = json.example_x[i] * 1;
	        				break;
	        			}
	        		}
					
					// get answer start time
					var answerStart = 0;
					for(var i=0; i<json.answer_x.length;i++){
	        			if(json.answer_y[i] * 1 > 0){
	        				answerStart = json.answer_x[i] * 1;
	        				break;
	        			}
	        		}
					
					startDiff = exampleStart - answerStart;
					
					
					
	        		for(var i=0; i<json.example_x.length;i++){
	        			if(json.example_y[i] * 1 > 0){
	        				data.push({"exampleTime":json.example_x[i] * 1, "examplePitch":json.example_y[i] * 1})
	        			}
	        			
	        		}
	        		
	        		for(var i=0; i<json.answer_x.length;i++){
	        			if(json.answer_y[i] * 1 > 0){
	        				data.push({"answerTime":(json.answer_x[i]) * 1 + startDiff, "answerPitch":json.answer_y[i]*1})
	        			}
	        		}
					
					
	        		chart.data = data;
	
	        		// Create axes
	        		var xAxis = chart.xAxes.push(new am4charts.ValueAxis());
					xAxis.min = 0;
					xAxis.max = 1;
					xAxis.strictMinMax = true;
					
	        		var yAxis = chart.yAxes.push(new am4charts.ValueAxis());
	
	        		// Create series
	        		exampleSeries = chart.series.push(new am4charts.LineSeries());
	        		exampleSeries.dataFields.valueX = "exampleTime";
	        		exampleSeries.dataFields.valueY = "examplePitch";
	        		exampleSeries.tooltipText = "{exampleTime}"
	        		exampleSeries.strokeWidth = 2;
	        		exampleSeries.stroke = am4core.color("rgba(255,117,117, 1)");
	        		
	        		exampleSeries.tooltip.pointerOrientation = "vertical";
	        		
	        		// Create series
	        		answerSeries = chart.series.push(new am4charts.LineSeries());
	        		answerSeries.dataFields.valueX = "answerTime";
	        		answerSeries.dataFields.valueY = "answerPitch";
	        		answerSeries.tooltipText = "{answerTime}"
	        		answerSeries.strokeWidth = 2;
	        		answerSeries.stroke = am4core.color("rgba(117, 142, 255, 1)");
	        		
	        		answerSeries.tooltip.pointerOrientation = "vertical";
	
	        		chart.cursor = new am4charts.XYCursor();
	        		chart.cursor.xAxis = xAxis;
	        		
	        		chart.cursor.events.on("cursorpositionchanged", function(ev) {
        			  var xAxis = ev.target.chart.xAxes.getIndex(0);
        			  var yAxis = ev.target.chart.yAxes.getIndex(0);
        			  cursorX = xAxis.positionToValue(xAxis.toAxisPosition(ev.target.xPosition));
        			  cursorY = yAxis.positionToValue(yAxis.toAxisPosition(ev.target.yPosition));
        			});
	        		
	        		// dynamics score
	        		dynamicsChart = am4core.create("dynamicsScore", am4charts.GaugeChart);
	        		dynamicsChart.innerRadius = -15;
	        		var axis = dynamicsChart.xAxes.push(new am4charts.ValueAxis());
	        		axis.min = 0;
	        		axis.max = 100;
	        		axis.strictMinMax = true;
	        		var colorSet = new am4core.ColorSet();
	        		var range0 = axis.axisRanges.create();
	        		range0.value = 0;
	        		range0.endValue = 50;
	        		range0.axisFill.fillOpacity = 1;
	        		range0.axisFill.fill = am4core.color("rgb(255, 79, 79)");
	        		var range1 = axis.axisRanges.create();
	        		range1.value = 50;
	        		range1.endValue = 80;
	        		range1.axisFill.fillOpacity = 1;
	        		range1.axisFill.fill = am4core.color("rgb(245, 228, 0)");
	        		var range2 = axis.axisRanges.create();
	        		range2.value = 80;
	        		range2.endValue = 100;
	        		range2.axisFill.fillOpacity = 1;
	        		range2.axisFill.fill = am4core.color("rgb(0, 219, 29)");
	        		var hand = dynamicsChart.hands.push(new am4charts.ClockHand());
	        		hand.value = json.dynamics_score * 1;
	        		
	        		split = json.answer_temp_file.split("\\")
	        		tempfile = split[split.length-1];
	        		answerAudio.load('/audio/getAnswerAudio.do?file=' + tempfile);
	        		
	        		chart.events.on("hit", function(e){
	        			audio.stop();
	        			answerAudio.stop();
	        			audio.seekTo(cursorX);
	        			answerAudio.seekTo(cursorX - startDiff);
	        			audio.play();
	        			answerAudio.play();
	        		})
	          }
	          
	      }).done(function(data) {
	             console.log(data); 
	             
	      });
	});
	
	function toggleMyVoice(){
		var el = $("#myVoice");
		if(el.attr('data-enabled')== 1 ){
			el.attr('data-enabled', 0)
			el.css('background-color', 'rgb(75, 89, 153)')
			answerAudio.setVolume(0);
			answerSeries.stroke = am4core.color("rgba(117, 142, 255, 0.3)");
			if($("#nativeVoice").attr('data-enabled')==0){
				toggleNativeVoice();
				
			}
		}else{
			el.css('background-color', 'rgb(117, 142, 255)')
			el.attr('data-enabled', 1)
			answerAudio.setVolume(1);
			answerSeries.stroke = am4core.color("rgba(117, 142, 255, 1)");
		}
	}
	
	function toggleNativeVoice(){
		var el = $("#nativeVoice");
		if(el.attr('data-enabled')== 1 ){
			el.attr('data-enabled', 0)
			el.css('background-color', 'rgb(148, 68, 68)')
			audio.setVolume(0);
			exampleSeries.stroke = am4core.color("rgba(255,117,117, 0.3)");
			if($("#myVoice").attr('data-enabled')==0){
				toggleMyVoice();
			}
		}else{
			el.css('background-color', 'rgb(255,117,117)')
			el.attr('data-enabled', 1)
			exampleSeries.stroke = am4core.color("rgba(255,117,117, 1)");
			audio.setVolume(1);
		}
	}
	
	$("#myVoice").on('click', function(){
		toggleNativeVoice();
	})
	
	$("#nativeVoice").on('click', function(){
		
		toggleMyVoice();
	})
</script>

</body>

</html>