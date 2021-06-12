<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
body {
  background-image: #34495e;
}

.loginForm {
 
  width:300px;
  height:400px;
  padding: 30px, 20px; 
  background-color:#FFFFFF;
  text-align:center;
  position:relative;
  top:50%;
  left:50%;
  transform: translate(-50%,-50%); 
  border-radius: 15px;
}

.loginForm h2{
  padding: 10px;
  text-align: center;
  margin: 30px; 
}

.idForm{
  border-bottom: 2px solid #adadad;
  margin: 30px;
  padding: 10px 10px;
}

.passForm{
  border-bottom: 2px solid #adadad;
  margin: 30px;
  padding: 10px 10px;
}

.id {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.pw {
  width: 100%;
  border:none;
  outline:none;
  color: #636e72;
  font-size:16px;
  height:25px;
  background: none;
}

.btn {
  position:relative;
  left:40%;
  transform: translateX(-50%);
  margin-bottom: 40px;
  width:80%;
  height:40px;
  background: linear-gradient(125deg,#81ecec,#6c5ce7,#81ecec);
  background-position: left;
  background-size: 200%;
  border-radius: 10px;
  color:white;
  font-weight: bold;
  border:none;
  cursor:pointer;
  transition: 0.4s;
  display:inline;
}

.btn:hover {
  background-position: right;
}
</style>
</head>
<body>
<div style="width: 820px;height: 700px;margin: 0px auto;"> 
<form method="post" class="loginForm" >
	<div id ='hjh_user_login' style="position:relative;">
		<h2>로그인</h2>
		<div class="idForm"><input class="id" type="text" placeholder="ID"></div>
		<div class="passForm"><input class="pw" type="password" placeholder="PW"></div>
		<div>사업자<input type="checkbox" id="check"></div>
		<br>
		<div><a href='#hjh_user_login' onclick="window.open('sign_up', 'sss','width=570, height=450, scrollbars=no, resizable=no, toolbars=no, menubar=no')">회원 가입하기</a> </div>
		<br>
		<div><input class="btn" type="button" onclick="hjh_login()" value="login"></div>
	</div>
</form>
</div>
<script>
function hjh_login(){
	function login(e){
		if(e.process=='성공'){
			alert('성공')
			$('#hjh_main_show').hide();
			
			if($('input:checkbox[id="check"]').is(":checked")==true){
				$('#hjh_owner_show').show();
				
			}
			else{
				$('#hjh_user_show').show();
			}
			
			return;
		}
		alert(e.process);
	}
	
	var input = $('#hjh_user_login').find('input');
	var str = '';
	if(input.eq(0).val()=='')
		str += 'id를 입력 하세요\n';
	if(input.eq(1).val() == ''||input.eq(1).val().length<8 )
		str +='비밀번호를 확인 하세요\n';
	if(str !=''){
		alert(str);
		return;
	}
	ajaxfunction({'id':input.eq(0).val(),'pass':input.eq(1).val()},'/hjh_login',login)
}
</script>
</body>
</html>