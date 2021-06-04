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
<div id="ksm_main" style="height: 700px; width: 100%;">
<%@include file="ksm_login.jsp" %>
<%@include file="ksm_attendance.jsp" %>
<%@include file="ksm_attendanceboard.jsp" %>
</div>
</body>
</html>