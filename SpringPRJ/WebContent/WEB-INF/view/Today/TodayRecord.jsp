<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String answer_sent = (String) request.getAttribute("answer_sent");
String news_url = (String) request.getAttribute("news_url");
String news_name = (String) request.getAttribute("news_name");
String news_title = (String) request.getAttribute("news_title");
String insertdate = (String) request.getAttribute("insertdate");
String original_sent = (String) request.getAttribute("original_sent");
String word = (String) request.getAttribute("word");
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
			<div class="content" style="margin-top: 30px;">
				<div class="card">
					<div class="card-header">
						<h4 class="card-header mt-0 mb-0 text-center">
							<b><%=news_name%></b>
						</h4>
						<div id="waveform" hidden='hidden'></div>
						<div id="waveform2" hidden='hidden'></div>
					</div>
					<hr>
					<div class="card-body">
						<div class="m-3">
							<h6 style="color: orange">Today Record</h6>
							<br>
							<!-- 자동으로 바뀌어야 하는 구역 -->
							<h3 class="card-text">
								<b><%=news_title.replace("& #40;", "(").replace("& #41;", ")").replace("& lt;", "<")
				                  .replace("& gt;", ">").replace("& #39;", "'")%></b>
							</h3>
							<h6 style="color: grey"><%=insertdate%></h6>
						</div>
						<button type="button" id="listen" >
						<p class="m-4" style="font-size: 1.5em"><%=answer_sent%></p>
						</button>
						<hr>
						<!-- 뉴스 기사 끝. -->

						<!-- 녹음  -->
						<h6 class="m-3" style="color: orange">Voice Record</h6>
						<div class="card-body p-0" id="timerBlock">
							<br>
							<div id="mic" style="width: 15em; height: 15em; margin: auto">
								<div id="progressCircle"
									style="width: 15em; height: 15em; color: white;"
									data-stroke="red" data-preset="circle" class="label-center"
									data-value="100" data-precision="0.01"></div>
								<div id="analyzingCircle"></div>
							</div>
							<div class="text-center">
								<h1 id="timer"></h1>
								<button id="startInterview" class="mt-1 btn btn-danger">녹음
									시작</button>
								<button hidden='hidden' id="resetInterview"
									class="btn btn-warning">다시 녹음</button>
								<button style="display: none" id="stopInterview"
									class="btn btn-danger">녹음 종료</button>
								<button style="display: none" id="submitInterview"
									class="btn btn-danger">제출</button>
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
  	$.ajax({
			type : "POST",
			url : "getTodaySentences.do",
			dataType : "JSON",
			success : function(json) {
				sentenceList = json.res;
				$("#all").html(sentenceList.length);
				$("#sentence").html(sentenceList[0].sentence);
				sentenceAudioIdx = sentenceList[0].index * 1;
				audio.load('/audio/getTodaySentenceAudio.do?idx=0');
				audioIdx = 0;
				sentenceAudioIdx = 0;
				$("#current").html(sentenceIdx+1);
				$("#no").html(sentenceIdx+1);
			}
  	})
  })
    
    function refresh(){
    	
    	$("#timerBlock").removeAttr("hidden");
    	$("#resultBlock").attr("hidden", "hidden");
    	$("#startInterview").removeAttr("hidden");
    	$("#timer").attr("hidden", "hidden");
    	$("#stopInterview").css("display", "None");
	    $("#mic").css("background-image", 'url("/resources/images/mic-icon.png")');
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
	  	audio.load('/audio/getTodaySentenceAudio.do?idx=' + sentenceAudioIdx);
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
		  	audio.load('/audio/getTodaySentenceAudio.do?idx=' + sentenceAudioIdx);
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
			 timer.innerHTML = "녹음 시작까지 "+seconds+"초";
			 
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
