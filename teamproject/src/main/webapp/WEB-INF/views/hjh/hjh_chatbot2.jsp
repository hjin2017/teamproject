<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
$(document).ready(function(){
	
});

</script>
</head>
<body>
<div style="width: 400px;height: 680px;float: left; margin-left:10px;margin-top:10px;">
	<div id = "messageWindow" style="background-color: #abcdef; width: 400px;height: 625px; overflow:scroll; overflow-x:hidden">
	</div>
	<div>이미지 + /</div>
	<input type=text id="inputMessage" style="width:392px; height: 30px;float: left;"  onkeyup="enterkey()" > 
</div>
</body>
</html>