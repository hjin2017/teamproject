<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script defer src='face-api.min.js'></script>
<script defer src='js/script.js'></script>
<style>
#body1 {
margin:0;
padding: 0;
widows: 100vw;
height: 100vh;
display: flex;
justify-content: center;
align-items: center;
flex-direction: column;
}
canvas {
position:absolute;
right: 0;
}
</style>
<script>
$(document).ready(function(){
	
});
</script>
</head>
<body >
<div id= 'body1'>
<input type="file"id = 'imageUpload'>
</div>
</body>
</html>