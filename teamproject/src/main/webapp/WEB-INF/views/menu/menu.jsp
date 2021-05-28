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
});
</script>
<style type="text/css">
#topMenu { position:absolute; left:50%; top:0; margin-left:-600px; width:1200px; height:60px;}
#topMenu ul li { float:left; width:200px;list-style: none;}
#topMenu .menuLink { 
display:block;
height:60px;
line-height:60px; 
font-size:20px; 
text-align:center; 
transition:all 0.4s;
text-decoration: none;
font-weight:bold;
color:black;
}
#topMenu .menuLink:hover {color: #425a73;}
</style>
</head>
<body>
      <div>
        <nav id="topMenu">
          <ul>
            <li ><a class="menuLink" href="#home">HOME</a></li>
            <li><a class="menuLink" href="#김세미">김세미</a></li>
            <li><a class="menuLink" href="#이현용">이현용</a></li>
            <li><a class="menuLink" href="#hjh_main">허진호</a></li>
            <li><a class="menuLink" href="#">xxxx</a></li>
          </ul>
        </nav>
      </div>
</body>
</html>