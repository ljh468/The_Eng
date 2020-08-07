<%@ page language="java" contentType="text/html; charset=UTF-8"
<<<<<<< HEAD
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
=======
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
>>>>>>> 2f022cecea12454fd98756249f2e4648005828b9
<head>
<meta charset="UTF-8">
<title>TheSignup</title>
</head>
<body>
	<input type="text" id="text" />
	<button id="btns">hello</button>
<<<<<<< HEAD
</body>
<script>
	var doCheck = 'N'
	
		$("#btns").click(function() {
			
			var id = document.getElementById("text").value;
			
			console.log(id);
			
			$.ajax({ 
				  url: '/hello/hello.do?id=' + id,
				  type: 'get', 
				  success: function(res){ 
				      if(res) {
				    	  document.getElementById("btns").innerHTML = "<h1>안녕!</h1>";
				      }
				  } 
				}); 
		}
				)

=======
	Test!!
</body>
<script>
	var doCheck = 'N'

	$("#btns").click(function() {

		var id = document.getElementById("text").value;

		console.log(id);

		$.ajax({
			url : '/hello/hello.do?id=' + id,
			type : 'get',
			success : function(res) {
				if (res) {
					document.getElementById("btns").innerHTML = "<h1>안녕!</h1>";
				}
			}
		});
	})
>>>>>>> 2f022cecea12454fd98756249f2e4648005828b9
</script>
</html>