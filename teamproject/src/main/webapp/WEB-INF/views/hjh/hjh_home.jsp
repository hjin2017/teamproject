<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<div style="width: 820px;height: 700px;margin: 0px auto;">
	<div id ='hjh_user_login' style="position:relative; top:50%; left: 50%; width: 210px; height: 180px; transform:translate(-50%, -50%);">
		<div>사용자</div>
		<div><input type="text" style="width: 200px; "></div>
		<div><input type="password" style="width: 200px;"></div>
		<div>사업자<input type="checkbox" ></div>
		<br>
		<div><a href='#hjh_user_login' onclick="window.open('sing_up', 'sss','width=460, height=400, scrollbars=no, resizable=no, toolbars=no, menubar=no')">회원 가입하기</a> </div>
		<br>
		<div><input type="button" onclick="hjh_login()" value="login" style="background-color:#00a0e9 ; width: 210px; height:30px;"></div>
	</div>
</div>
<script>
function hjh_login(){
	function login(e){
		if(e.process=='성공'){
			alert('성공')
			$('#hjh_main_show').hide();
			$('#hjh_user_show').show();
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