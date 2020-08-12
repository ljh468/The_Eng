<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String user_id  = (String)request.getAttribute("user_id");

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
          <li id="main" >
            <a href="#">
              <i class="nc-icon nc-air-baloon"></i>
              <p>메인</p>
            </a>
          </li>
          <li >
            <a href="#">
              <i class="nc-icosn nc-diamond"></i>
              <p>Icons</p>
            </a>
          </li>
          <li>
            <a href="#">
              <i class="nc-icon nc-pin-3"></i>
              <p>Maps</p>
            </a>
          </li>
          <li>
            <a href="#">
              <i class="nc-icon nc-bell-55"></i>
              <p>Notifications</p>
            </a>
          </li>
          <li>
            <a href="#">
              <i class="nc-icon nc-single-02"></i>
              <p>User Profile</p>
            </a>
          </li>
          <li>
            <a href="#">
              <i class="nc-icon nc-tile-56"></i>
              <p>Table List</p>
            </a>
          </li>
          <li>
            <a href="#">
              <i class="nc-icon nc-caps-small"></i>
              <p>Typography</p>
            </a>
          </li>
          <li class="#">
            <a href="./upgrade.html">
              <i class="nc-icon nc-spaceship"></i>
              <p>Upgrade to PRO</p>
            </a>
          </li>
        </ul>
      </div>
    </div>
    <script>
		

		
		
    $("#main").click( function() {
        $(this).addClass("active");
      } );
		
	</script>