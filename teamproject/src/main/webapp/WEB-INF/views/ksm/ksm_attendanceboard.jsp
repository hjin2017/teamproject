<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>

</script>
</head>
<body>


<h3> 출결 목록</h3>
<div><table border="1">
<tr>
	<th>아이디</th>
	<th>날짜</th>
	<th>출결여부</th>
</tr>
<c:forEach items="${list }" var="data">
<tr>
	<td>${data.id }</td>
	<td>${data.attdate }</td>
	<c:choose>
		<c:when test="${data.status == 0 }">
			<td>미출석</td>
		</c:when>
		<c:when test="${data.status == 1 }">
			<td>출석</td>
		</c:when>
	</c:choose>
	
	
</tr>
</c:forEach>
<col width='40%'><col width='30%'><col width='30%'>
</table>
<!-- <div><input type="button"; value="home" onclick="next3()"></div> -->
</div>

</body>
</html>