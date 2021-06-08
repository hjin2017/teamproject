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
width: 430px;height: 20px;
}
</style>
</head>
<body style="background-color: yellow;">
		<h3>회원 가입</h3>
		<div id ="hjh_sing_up" >
		<input  type="text" placeholder="ID"><br><br>
		<input  type="text" placeholder="이름 : 홍길동"><br><br>
		<input  type="text" placeholder="주소"><br><br>
		<input  type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" placeholder="전화 번호"><br><br>
		<input  type="password" placeholder="패스워드 8자리 이상">
		<input  type="password" placeholder="패스워드 재입력"><br><br>
		<input style="height: 50px;background-color:#00a0e9; " type="button" value="회원 가입" onclick="hjh_join()"><br>
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
	
	
	
	function hjh_join(){
		function sing_up(e){
			//id 검사
			//페스워드 검사
			if(e.process=='성공')
				window.close();
			
			alert(e.process);
		}
		
		var input = $('#hjh_sing_up').find('input');
		var data = {'id':input.eq(0).val(),'addr':input.eq(2).val(),'name':input.eq(1).val(),'phon':input.eq(3).val(),'pass':input.eq(4).val()};
		
		var alertStr = '';
		if(input.eq(0).val() == '')
			alertStr = 'id를 입력 하세요\n';
		
		if(input.eq(1).val() == '')
			alertStr += '이름을 입력 하세요\n';		
		
		if(input.eq(2).val() == '')
			alertStr += '주소를 입력 하세요\n';
		
		if(input.eq(3).val()=='')
			alertStr += '전화 번호를 입력 하세요\n';
		else if(input.eq(3).val().length!=11)
			alertStr += '전화 번호를 확인 하세요\n';
		
		if(input.eq(4).val()=='')
			alertStr += '패스워드를 입력 하세요\n';
		else if(input.eq(4).val().length<8||(input.eq(4).val()!=input.eq(5).val()))
			alertStr += '패스워드를 확인하세요.\n';
		
		if(alertStr != '' ){
			alert(alertStr);
			return;
		}
		ajaxfunction(data,'/hjh_join',sing_up);
	}
</script>
</html>