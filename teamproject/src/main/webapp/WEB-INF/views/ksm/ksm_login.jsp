<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" type="text/css" href="css/login.css"> -->
<script>
$(document).ready(function(){
	
});
function next1(){
	$("#ksm_login").hide();
	$("#ksm_att").show();
}
</script>
</head>
 <body width="100%" height="100%">
    <form method="post" class="loginForm">
      <h2>로그인</h2>
      <div class="idForm">
        <input type="text" class="id" placeholder="ID">
      </div>
      <div class="passForm">
        <input type="password" class="pw" placeholder="PW">
      </div>
      <button type="button" class="btn" onclick="button()">
        LOG IN
      </button>
      <script>
      	let button = () => {
        	alert('login Button !')
      	}
      </script>

      <div class="bottomText">
        Don't you have ID? <a href="#">sign up</a>
      </div>
      
      <button type="button" value="next" class="btn" onclick="next1()">
      
    </form>
</body>
</html>