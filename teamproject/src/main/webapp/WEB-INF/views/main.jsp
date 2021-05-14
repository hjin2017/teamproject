<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>teamproject</title>
<script src ="jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	//공통 함수 모임
function ajaxfunction(data,url,fun) {
	var test =	{
			url:'',
			type: 'post' , 
			dataType: 'json' ,
			data:'',
			success: function(e){fun(e);},
			error:function(request,status,error){
				 console.log("code:"+request.status+"\n"+"error:"+error);
			}
	}
			
	test.url = url;
	test.data = data;	
	$.ajax(test);
}
	
    //ajax 스크립트 예제//////////////////////////////////////////////////////////////////
	function s(e){alert(e.process);}
	var data = {'s':10};
	ajaxfunction(data,'/menu',s);
	//////////////////////////////////////////////////////////////////////////////////
});
</script>
<style type="text/css">
/*창 분할 */
#main_body_block{
height: 700px;
width: 100%;
}
#main_foot{
height: 75px;
width: 100%;
background-color: red;
}
header{position:fixed; 
left:0;top:0;
 width:100%; 
 height:60px; 
 z-index:100;
  background-color:rgba(255,255,255,0.5);
}

</style>
</head>
<body>
	<header>
		<%@include file="menu/menu.jsp" %>
	</header>
	<article>
		<div id="main_body_block" style="background-color: pink;"> 
	 		<%@include file="home.jsp" %>
	 	</div>
		<div id="main_body_block" style="background-color: yellow;"> 
	 		<%@include file="ksm/sm.jsp" %>
	 	</div>
	 	<div id="main_body_block" style="background-color: blue;"> 
	 		<%@include file="lhy/hy.jsp" %>
	 	</div>
	 	<div id="main_body_block" style="background-color: purple;"> 
	 		<%@include file="hjh/jh.jsp" %>
	 	</div>
	 </article>
	 <footer>
		<div id="main_foot" >
			<%@include file="foot.jsp" %>
		</div>
	</footer>
</body>
</html>