<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
$(document).ready(function(){
	
});
function next1(){
	$("#ksm_login").hide();
	$("#ksm_att").show();
}
</script>
</head>
<body>
<div id ='ksm_login' style="background-color: red; position:relative; top:50%; left: 50%; width: 180px; height: 100px; transform:translate(-50%, -50%);">
<div>로그인</div>
<div><input type="text"></div>
<div><input type="password"></div>
<div><input type="button" value="login"><input type="button"value="join"><input type="button"value="next" onclick="next1()"></div>
</div>
</body>
</html>