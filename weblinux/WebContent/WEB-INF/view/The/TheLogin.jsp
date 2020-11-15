<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Login</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--===============================================================================================-->
<link rel="icon" type="image/png"
   href="../resources2/images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
   href="../resources2/vendor/bootstrap/css/bootstrap.min.css" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
   href="../resources2/fonts/font-awesome-4.7.0/css/font-awesome.min.css" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
   href="../resources2/fonts/iconic/css/material-design-iconic-font.min.css" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
   href="../resources2/vendor/animate/animate.css" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
   href="../resources2/vendor/css-hamburgers/hamburgers.min.css" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
   href="../resources2/vendor/animsition/css/animsition.min.css" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
   href="../resources2/vendor/select2/select2.min.css" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
   href="../resources2/vendor/daterangepicker/daterangepicker.css" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="../resources2/css/util.css" />
<link rel="stylesheet" type="text/css" href="../resources2/css/main.css" />
<!--===============================================================================================-->
<link
   href="https://fonts.googleapis.com/css2?family=Fredericka+the+Great&display=swap"
   rel="stylesheet" />
<style>
#flexbox {
display: flex;
justify-content: center;
margin-bottom: 5px;
}
.maintext {
   font-family: 'Fredericka the Great', cursive;
   font-size: 80px;
   color: black;
   animation: fadeout 5s ease-in-out;
}

@keyframes fadeout {
from { opacity:0;   
}
to {
   opacity: 1;
}
}
</style>
</head>

<body>
   <div class="limiter">
      <div class="container-login100" style="background-color: #f4f3ef">
         <div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54 shadowbox">
            <form class="login100-form validate-form"
               action="/The/TheLoginProc.do" method="post">
               <div id="flexbox">
               <span class="maintext"> THE </span>
               </div>

               <div class="wrap-input100 validate-input m-b-23"
                  data-validate="Username is reauired">
                  <span class="label-input100">Username</span> <input
                     class="input100" type="text" name="id"
                     placeholder="Type your username" /> <span class="focus-input100"
                     data-symbol="&#xf206;"></span>
               </div>

               <div class="wrap-input100 validate-input"
                  data-validate="Password is required">
                  <span class="label-input100">Password</span> <input
                     class="input100" type="password" name="pwd"
                     placeholder="Type your password" /> <span class="focus-input100"
                     data-symbol="&#xf190;"></span>
               </div>

               <div class="text-right p-t-8 p-b-31">
                  <a href="#"> Forgot password? </a>
               </div>

               <div class="container-login100-form-btn">
                  <div class="wrap-login100-form-btn">
                     <div class="login100-form-bgbtn"></div>
                     <button type="submit" class="login100-form-btn btn">Login</button>
                  </div>
               </div>


               <div class="flex-col-c p-t-155" style="padding-top: 30px">
                  <a href="/The/TheSignUp.do" class="txt2"> Sign Up </a>
               </div>
            </form>
         </div>
      </div>
   </div>

   <div id="dropDownSelect1"></div>

   <!--===============================================================================================-->
   <script src="../resources2/vendor/jquery/jquery-3.2.1.min.js"></script>
   <!--===============================================================================================-->
   <script src="../resources2/vendor/animsition/js/animsition.min.js"></script>
   <!--===============================================================================================-->
   <script src="../resources2/vendor/bootstrap/js/popper.js"></script>
   <script src="../resources2/vendor/bootstrap/js/bootstrap.min.js"></script>
   <!--===============================================================================================-->
   <script src="../resources2/vendor/select2/select2.min.js"></script>
   <!--===============================================================================================-->
   <script src="../resources2/vendor/daterangepicker/moment.min.js"></script>
   <script src="../resources2/vendor/daterangepicker/daterangepicker.js"></script>
   <!--===============================================================================================-->
   <script src="../resources2/vendor/countdowntime/countdowntime.js"></script>
   <!--===============================================================================================-->
   <script src="../resources2/js/main.js"></script>
</body>
</html>