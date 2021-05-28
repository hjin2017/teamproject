<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){

});
</script>
</head>
<body>
<% String [] filelist = (String[])request.getAttribute("filelist"); // 리퀘스트 어트리뷰트는 오브젝트 타입이라 스트링 배열로 변환	
%>
<h1>이미지에 있는 글자를 읽어보자</h1>
<form action="<%=request.getContextPath() %>/ocr"
method=post enctype="multipart/form-data"  >

<input type="file" name="file1" ><br>

<input type=submit value="읽기 ㄱ">

</body>

<script >
var formData = new FormData();
formData.append("file.txt");
$.ajax({
	url:'/imgupload',
	type:'post',
	data:formData,
	processData:false,
	contentType:false,
	success:function(response){
		$.ajax({
			url:'/ocr',
			type:'get',
			data:{"txtfile.txt"},
				success:function(responsetext){
				var json = JSON.parse(responsetext);
				$("#inputMessage").val(json.text);
				
				}
		});
		
	}
});
</script>
</html>