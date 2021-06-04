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

	//$("#hjh_user_show").hide();
});
</script>
</head>
<body>
<div id="hjh_main" style="background-color: gray;">
	<div  style="background-color: yellow; width: 820px;height: 700px;margin: 0px auto;">
		<div id = 'hjh_main_show'>
			<%@include file="hjh_home.jsp" %>
		</div>	
		<div id = 'hjh_user_show' style="display: none;">
			<%@include file="hjh_chatbot.jsp" %>
			<%@include file="hjh_list.jsp" %>	
		</div>	
	</div>
</div>
</body>
</html>