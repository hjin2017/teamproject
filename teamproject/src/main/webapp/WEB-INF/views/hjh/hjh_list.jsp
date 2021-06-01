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
	function list_table(server_response){
		$("#ListWindow div").eq(0).text(server_response[0].restaurantName);
		$("#ListWindow div").eq(1).text(server_response[0].streetNameAddress);
		$("#ListWindow div").eq(2).text('연락처 : '+server_response[0].restaurantPhone);
		var strs = server_response[0].representativeMenu.split('!');
		for(i in strs)
			$("#ListWindow div").eq(3).append(strs[i]+"<input type='checkbox' value='"+strs[i]+"'>");
	}
	
	ajaxfunction({'userId':'gjwlsgh1230'},'/chabot_list',list_table);
});
function list_checkbox(){
	alert($(this).val());
}
</script>
</head>
<body>
	<div style="width: 400px;height: 680px;float: left; margin-top:10px;">
		<div id = "ListWindow" style="background-color: yellow; width: 400px;height: 625px; overflow:scroll; overflow-x:hidden">
		<div id ="s"> 이름</div>
		<div>주소</div><input id ="t" type='checkbox' value="aaa" onclick="list_checkbox()" >
		<div></div>
		<div ></div>
		</div>
	</div>
</body>
</html>