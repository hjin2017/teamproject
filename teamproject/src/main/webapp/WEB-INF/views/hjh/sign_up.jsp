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
.box {
	width: 430px;height: 30px;
	margin-bottom:5px;
	margin-right:5px;
}
.join_form table tr{
	margin-bottom:10px;
}
.join_form table th span{
	color:#404040;
	font-size:14px;
	display:inline-block;
	position:relative;
	text-indent:5px;
	
}
.title{
  text-align: left;
  margin: 20px;
}
.btn {
  position:relative;
  left:40%;
  transform: translateX(-50%);
  margin:center;
  margin-left:55px;
  margin-top:20px;
  width:90%;
  height:40px;
  background: linear-gradient(125deg,#81ecec,#6c5ce7,#81ecec);
  background-position: center;
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
		<h2 class='title'>회원 가입</h2>
<!-- 		<div id ="hjh_sign_up" >
		<input class='box' type="text" placeholder="ID"><br><br>
		<input class='box' type="text" placeholder="이름 : 홍길동"><br><br>
		<input class='box' type="text" placeholder="주소"><br><br>
		<input class='box' type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" placeholder="전화 번호"><br><br>
		<input class='box' type="password" placeholder="패스워드 8자리 이상">
		<input class='box' type="password" placeholder="패스워드 재입력"><br><br>
		<input class="btn" type="button" value="회원 가입" onclick="hjh_join()"><br>

		</div> -->
		<div class="join_form" id="hjh_sign_up">
            <table>
              <colgroup>
                <col width="30%"/>
                <col width="auto"/>
              </colgroup>
              <tbody>
                <tr>
                  <th><span>아이디</span></th>
                  <td><input class = 'box' type="text" placeholder="ID 를 입력하세요."></td>
                </tr>
                <tr>
                  <th><span>이름</span></th>
                  <td><input class = 'box'  type="text" placeholder="이름을 입력하세요"></td>
                </tr>
	    		<tr>
                  <th><span>주소</span></th>
                  <td><input  class = 'box' type="text" placeholder="주소를 입력해주세요."></td>
                </tr>
	    		<tr>
                  <th><span>전화번호</span></th>
                  <td><input  class = 'box' type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" placeholder="전화번호를 입력해주세요."></td>
                </tr>
                <tr>
                  <th><span>비밀번호</span></th>
                  <td><input  class = 'box' type="text" placeholder="비밀번호를 입력해주세요.(8자리 이상)"></td>
                </tr>
                <tr>
                  <th><span>비밀번호 확인</span></th>
                  <td><input class = 'box'  type="text" placeholder="비밀번호를 확인하세요"></td>
                </tr>
                </tbody>
              </table>
              <input class="btn" type="button" value="회원 가입" onclick="hjh_join()"><br>
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
		function sign_up(e){
			//id 검사
			//페스워드 검사
			if(e.process=='성공')
				window.close();
			
			alert(e.process);
		}
		
		var input = $('#hjh_sign_up').find('input');
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
		else if(input.eq(3).val().length!=10)
			alertStr += '전화 번호를 확인 하세요\n';
		
		if(input.eq(4).val()=='')
			alertStr += '패스워드를 입력 하세요\n';
		else if(input.eq(4).val().length<8||(input.eq(4).val()!=input.eq(5).val()))
			alertStr += '패스워드를 확인하세요.\n';
		
		if(alertStr != '' ){
			alert(alertStr);
			return;
		}
		ajaxfunction(data,'/hjh_join',sign_up);
	}
</script>
</html>