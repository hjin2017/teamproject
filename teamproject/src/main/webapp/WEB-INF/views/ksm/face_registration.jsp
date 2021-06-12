<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src ="jquery-3.2.1.min.js"></script>
<script defer src='face-api.min.js'></script>
<script defer src='js/script3.js'></script>
<script>
$(document).ready(function(){
	var canvas = $('#body1').find('canvas');
	var input = $('#aa').find('input');
	input.on('click',function(){

	
    
        	
	})
	
});
</script>
<style>
 #body1 {
 margin:0;
padding: 0;
widows: 100vw;
height: 100vh;
display: flex;
justify-content: center;
align-items: center;
}
canvas {
position:absolute;
}
video {
position:absolute;
}
</style>
</head>
<body>
<div id ='body1'>
<video id ='video' width="720" height="560" autoplay muted></video>
<canvas id ='canvas' width="720" height="560" autoplay muted></canvas>
</div>
<div id ='aa'></div>
</body>
</html>