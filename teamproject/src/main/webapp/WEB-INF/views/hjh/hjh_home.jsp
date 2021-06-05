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
</script>
</head>
<body>
<div style="width: 820px;height: 700px;margin: 0px auto;">
	<div id ='hjh_user_login' style="position:relative; top:50%; left: 50%; width: 210px; height: 180px; transform:translate(-50%, -50%);">
		<div>사용자</div>
		<div><input type="text" style="width: 200px; "></div>
		<div><input type="password" style="width: 200px;"></div>
		<div>사업자<input type="checkbox" ></div>
		<br>
		<div><a href='#hjh_user_login' onclick="window.open('sing_up', 'sss','width=400, height=400, scrollbars=no, resizable=no, toolbars=no, menubar=no')">회원 가입하기</a> </div>
		<br>
		<div><input type="button" value="login" style="background-color:#00a0e9 ; width: 210px; height:30px;"></div>
	</div>
</div>
</body>
</html>