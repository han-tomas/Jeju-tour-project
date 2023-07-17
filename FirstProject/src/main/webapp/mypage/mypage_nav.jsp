<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#menutitle{
	transition: none;
	transform: none;
  	opacity: 1;
  	width: auto;
  	height: auto;
  	color: rgb(255, 255, 255);
  	font-size: 20pt
}
#menutitle:hover{
  border-radius: 0 0 0 0;
  border-color: rgb(255, 128, 0);
  transform: none;
  background: rgb(255, 128, 0);
}
</style>
</head>
<body>
<div class="container-fluid">
        <div class="row">    
            <div id="admin-sidebar">
                <ul class="sidenav admin-sidenav">
                	<li id=menutitle >마이페이지</li>
                    <li><a href="#">홈</a></li>
                    <li><a href="#">내정보관리</a></li>
                    <li><a href="#">회원탈퇴</a></li>
                    <li><a href="#">abcdefg</a></li>
                    <li><a href="../mypage/mypage_reserve_list.do">예약리스트</a></li>
                    <li><a href="../mypage/mypage_jjim_list.do">찜 목록</a></li>                  
                </ul>
            </div>
        </div>
</div>            
</body>
</html>