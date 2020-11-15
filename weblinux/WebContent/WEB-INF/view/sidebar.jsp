
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String user_id  = (String)session.getAttribute("user_id");

%>
<div class="sidebar" data-color="white" data-active-color="danger">
      <div class="logo">
        <a href="#" class="simple-text logo-mini">
          <div class="logo-image-small">
            <img src="/resources/assets/img/logo-small.png">
          </div>
          <!-- <p>CT</p> -->
        </a>
        <div>
        <a href="#" class="simple-text logo-normal">
          <%=user_id %>
						<a href="/The/TheLogout.do">
							로그아웃							
						</a>
        </a>
        </div>
      </div>
     <div class="sidebar-wrapper">
        <ul class="nav" >
          <li id="index">
            <a href="/Today/TodayMain.do" >
              <i class="nc-icon nc-air-baloon"></i>
              <p>오늘의 학습</p>
            </a>
          </li>
          <li id="wordCard">
            <a href="/Word/wordCard.do">
              <i class="nc-icon nc-book-bookmark"></i>
              <p>단어장</p>
            </a>
          </li>
          <li>
            <a href="/Restudy/NewsSelect.do">
              <i class="nc-icon nc-atom"></i>
              <p>복습하기</p>
            </a>
          </li>
          <li>
            <a href="/Setting/setting.do">
              <i class="nc-icon nc-settings-gear-65"></i>
              <p>설정</p>
            </a>
          </li>
        </ul>
      </div>
    </div>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   
    <!-- 선택 메뉴창을 클릭했을때 active클래스 추가 삭제-->
    <script>
    
    $('li').on('click', function() {
    	$('li').removeClass('active');
    	$(this).addClass('active');
        
   });
   </script>

