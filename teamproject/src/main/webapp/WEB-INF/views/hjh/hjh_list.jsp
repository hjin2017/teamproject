<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
let map_list = new Map();
$(document).ready(function(){	
	function list_table(server_response){
		for(i in server_response){
			var Menu = server_response[i].representativeMenu.split('!');
			
			//블럭 생성
			$("#ListWindow").append("<div>---------------------------------------------------------"
					+"<div>"+server_response[i].restaurantName+"</div>"
					+"<div>"+server_response[i].streetNameAddress+"  : "+Math.round(server_response[i].distance)+"미터"+"</div>"
					+"<div>"+'연락처 : '+server_response[i].restaurantPhone+"</div>"
					+"<div class = 'list_menu'></div>"
					+"<div>"
						+"<table>"
						+"<col width='40%'><col width='30%'><col width='10%'><col width='10%'><col width='10%'>"
						+"</table>"
					+"</div>"
				+"</div>");
		//메뉴 생성
			for(j in Menu)
				$(".list_menu").eq(i).append(Menu[j]+"<input type='checkbox' value='"+Menu[j] +"'>");
			
			 	$(".list_menu").eq(i).find('input').on('click',function(){
				 //+ - 선택자 중복 차단
				 if($(this).val()=='+'|| $(this).val()=='-')return;
				 // 체크되면
				 if($(this).is(':checked')==true){
					 var table = $(this).parent().parent().find('table');
					 table.append(
							 "<tr><td>"+$(this).val()+"</td><td>"+10000+"</td><td><input type='button' value='+'></td><td><input type='button' value='-'></td><td>1</td></tr>");
					 //map_list.set($(this).val(),1);
					 var div =  table.parent().parent().find('div');
		
					 map_list.set($(this).val(),1).set(div.eq(0).text(),"");;
					 

					 list_add(10000);
					 //생성된 input 만 콜백 생성
					 var tr =  $(this).parent().parent().find('table').find('tr');
					 tr.eq(tr.length-1).find('input').on('click',function(){
							var temp = $(this).parent().parent().find('td');
							//+누르면
							if($(this).val() == '+'){
								temp.eq(4).text(parseInt(temp.eq(4).text())+1);
								var count = $(this).parent().parent().find('td').eq(4).text();
								temp.eq(1).text(10000*count);
								 map_list.set(temp.eq(0).text(),count).set(div.eq(0).text(),"");
								list_add(10000);
								}
							// - 누르면
							else{
								if(temp.eq(4).text()>1){
									 temp.eq(4).text(parseInt(temp.eq(4).text())-1);
									 var count = $(this).parent().parent().find('td').eq(4).text();
									 
									 map_list.set(temp.eq(0).text(),count).set(div.eq(0).text(),"");
									 list_add(-10000);
								}else{
									var tr = $(this).parent().parent();
									var input = tr.parent().parent().parent().find('div').eq(3).find('input');
									var td = tr.find('td');
									
									map_list.delete(td.eq(0).text());
									map_list.delete(div.eq(0).text());
									list_add(-10000)
									for(var j =0; j<input.length; j++)
										if(input.eq(j).val() == td.eq(0).text())
											input.eq(j).prop('checked',false)
									
									tr.remove();
								}
								var count = $(this).parent().parent().find('td').eq(4).text();
									temp.eq(1).text(10000*count);
							}//add end
					 });// add but end
				 }
				 //체크가 풀리면
				 else {
					 
					var tr = $("#ListWindow table tr");
					for(var j =0 ; j <tr.length; j++ ){
						if(tr.eq(j).find('td').eq(0).text() == $(this).val()){
							list_add(-10000* map_list.get(tr.eq(j).find('td').eq(0).text()))
							map_list.delete(tr.eq(j).find('td').eq(0).text());
							map_list.delete($(this).parent().parent().find('div').eq(0).text());
							
							tr.eq(j).remove();
							
						}
					}
				}//checked end
			 });//input end
		}//for end
	}//fun end

	ajaxfunction({'userId':'gjwlsgh1230'},'/chabot_list',list_table);
});

var sub="";
function list_buy(){
	var str ='';
	map_list.forEach((value, key, mapObject) => str += key + ':'+ value +'\n');
	
	if($('#list_add').text()==0)return;
	str+="\n총 금액: "+$('#list_add').text()+" 원\n";
	str+="\n주문하시겠습니까?";
	
	//여기서 분기
	if(confirm(str)){
		alert("주문 완료되었습니다.");
		//주문 정보 owner_list로 보내기
		sub = str.substring(0, str.length - 9);
		console.log(sub);
		
		var formData = new FormData();
		formData.append("id", "hwang");
    	formData.append("list", sub);
        	$.ajax({
       		url:'/chabot_list2',	//jsp주소
       		type:'POST',
       		data:formData,
        	    processData: false,    // 반드시 작성
             	contentType: false,    // 반드시 작성
            success:function(){
             	alert("데이터 전송 성공");
       		},
       		error:function(jqXHR, textStatus, errorThrown){
       			alert("데이터 전송 실패: " + textStatus+": " + errorThrown);
       		} 
        });//ajax end*/
	}//if end
	
	else{
		alert("사용자가 주문을 취소하였습니다.");
	}//else end
}//func end


function list_add(add){
	$('#list_add').text(parseInt($('#list_add').text())+ add);
}



</script>
</head>
<body>
	<div style="width: 400px;height: 680px;float: left; margin-top:10px;">
		<div id = "ListWindow" style="background-color: yellow; width: 400px;height: 625px; overflow:scroll; overflow-x:hidden">
		</div>
		<div>
		<table style="width: 400px;height: 60px;">
		<tr>
			<td>총합</td><td id ='list_add'>0</td>
			<td><input type="button" value="주문" onclick="list_buy()"></td>
		</tr>
		<col width='10%'>
		<col width='80%'>
		<col width='10%'>
		</table> 
		</div>
	</div>
</body>
</html>