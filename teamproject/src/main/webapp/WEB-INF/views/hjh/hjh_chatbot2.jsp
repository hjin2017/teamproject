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

function cahbottxt(server_response){
	var bubbles = server_response.bubbles;
	for(var b in bubbles){
		if(bubbles[b].type == 'text'){// 텍스트 답변 처리 시작 
			$("#messageWindow").append
			("<div><span style=background-color:#ffffff;>chatbot : " 
			+ bubbles[b].data.description + "</span></div><br>");
		}
	}
}

function send(){
	var inputMessage = $("#inputMessage").val();
	$("#messageWindow").append(
			"<div><span style=background-color:yellow;margin:10px;float:right;border-radius:5px 5px 5px 5px>나 : "
			+ inputMessage + "</span></div><br><br>");
	
	ajaxfunction({'message':inputMessage},'/chabot2',cahbottxt);
	
	$("#inputMessage").val("");
}

function enterkey(){
	//  엔터키 입력(a - 97  0 - 48 엔터키 - 13)하면 send  함수 동일 효과
	if(window.event.keyCode == 13){
		send();
	}
} 
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