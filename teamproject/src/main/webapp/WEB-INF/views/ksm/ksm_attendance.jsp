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
function next2(){
	$("#ksm_att").hide();
	$("#ksm_board").show();
}
</script>
</head>
<body>
<div id ='ksm_att' style="background-color: blue; position:relative; top:50%; left: 50%; width: 500px; height: 500px; transform:translate(-50%, -50%); display: none;">
<div style="background-color: red; width: 100%; height: 85%;">ssdd </div>
<div>
<input type="button" value="얼굴 등록">
<input type="button" value="출결 확인">
<input type="button" value="HOME">
<input type="button"value="next" onclick="next2()">
</div>
</div>
</body>
</html>