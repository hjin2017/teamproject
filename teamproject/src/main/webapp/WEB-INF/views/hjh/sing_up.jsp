<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src ="jquery-3.2.1.min.js"></script>

<style type="text/css">
input {
width: 350px;height: 20px;
}
</style>
</head>
<body style="background-color: yellow;">
		<h3>회원 가입</h3>
		<div id ="hjh_sing_up">
		<input  type="text" placeholder="ID"><br><br>
		<input  type="text" placeholder="이름 : 홍길동"><br><br>
		<input  type="text" placeholder="주소"><br><br>
		<input  type="text" placeholder="전화 번호 : - 없이 입력"><br><br>
		<input  type="password" placeholder="패스워드">
		<input  type="password" placeholder="패스워드 재입력"><br><br>
		<input style="height: 50px;background-color:#00a0e9; " type="button" value="회원 가입" onclick="join()"><br>
		</div>
</body>
<script>
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
	function join(){
		function s(e){alert(e.process);}
		var input = $('#hjh_sing_up').find('input');
		//String id, String addr,String name,int phon,String pass
		var data = {'id':input.eq(0).val(),'addr':'a','name':input.eq(1).val(),'phon':0,'pass':'0' };
		ajaxfunction(data,'/hjh_join',s);
	}
</script>
</html>