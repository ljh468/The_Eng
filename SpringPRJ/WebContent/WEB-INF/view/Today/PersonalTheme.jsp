<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="form-group has-success">
  <label class="form-control-label" for="inputSuccess1">Valid input</label>
  <input type="text" value="correct value" class="form-control is-valid" id="inputValid">
  <div class="valid-feedback">Success! You've done it.</div>
</div>

<div class="form-group has-danger">
  <label class="form-control-label" for="inputDanger1">Invalid input</label>
  <input type="text" value="wrong value" class="form-control is-invalid" id="inputInvalid">
  <div class="invalid-feedback">Sorry, that username's taken. Try another?</div>
</div>
</body>
</html>