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
	function store(server_response){
		for(i in server_response){
			//블럭 생성
			/* $("#ListWindow2").append("<div>---------------------------------------------------------"
					+"<h1>"+server_response[i].id+"</h1>"
					+"<div>"+'주소 : ' +server_response[i].list+"</div>"
					+"<div>"+'연락처 : '+server_response[i].phon+"</div>"
				+"---------------------------------------------------------</div>"); */

		}//for end
		
	}//func end
	//ajaxfunction({'id':'hwang'},'/chabot_list2', store);
});


</script>
</head>
<body>
	<div style="width: 400px;height: 680px;float: left; margin-top:10px;">
		<div id = "ListWindow2" style="background-color: yellow; width: 400px;height: 625px; overflow:scroll; overflow-x:hidden">
		</div>
	</div>
</body>
</html>