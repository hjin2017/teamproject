<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
$(document).ready(function(){
	$("#ksm_board").hide();
});
function next3(){
	$("#ksm_board").hide();
	$("#ksm_login").show();
}
</script>
</head>
<body>
<div id ='ksm_board' style="background-color: blue; position:relative; top:50%; left: 50%; width: 600px; height: 500px; transform:translate(-50%, -50%); display: none;">
<div> 출결 몰록</div>
<div><table  style="width: 100%; height: 100%;">
<tr style="background-color: red;"><td>이름</td><td>날짜</td><td>출결여부</td></tr>
<tr><td>이름</td><td>날짜</td><td>출결여부</td></tr>
<tr><td>이름</td><td>날짜</td><td>출결여부</td></tr>
<tr><td>이름</td><td>날짜</td><td>출결여부</td></tr>
<tr><td>이름</td><td>날짜</td><td>출결여부</td></tr>
<tr><td>이름</td><td>날짜</td><td>출결여부</td></tr>
<tr><td>이름</td><td>날짜</td><td>출결여부</td></tr>
<tr><td>이름</td><td>날짜</td><td>출결여부</td></tr>
<tr><td>이름</td><td>날짜</td><td>출결여부</td></tr>
<tr><td>이름</td><td>날짜</td><td>출결여부</td></tr>
<tr><td>이름</td><td>날짜</td><td>출결여부</td></tr>
<tr><td>이름</td><td>날짜</td><td>출결여부</td></tr>
<tr><td>이름</td><td>날짜</td><td>출결여부</td></tr>
<tr><td>이름</td><td>날짜</td><td>출결여부</td></tr>
<tr><td>이름</td><td>날짜</td><td>출결여부</td></tr>
<tr><td>이름</td><td>날짜</td><td>출결여부</td></tr>
<tr><td>이름</td><td>날짜</td><td>출결여부</td></tr>
<tr><td>이름</td><td>날짜</td><td>출결여부</td></tr>
<col width='40%'><col width='30%'><col width='30%'>
</table>
<div><input type="button"; value="next" onclick="next3()"></div>
</div>
</div>
</body>
</html>