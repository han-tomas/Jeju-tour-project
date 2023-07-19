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
a{
	color: rgb(255, 255, 0);
}
a:hover{
	color: rgb(255, 255, 0);
}
</style>
</head>
<body>
<div class="container-fluid">
        <div class="row">    
            <div id="admin-sidebar">
                <ul class="sidenav admin-sidenav">
                	<li id=menutitle >마이페이지</li>
                    <a href="#"><li>홈</li></a>
                    <a href="#"><li>내정보관리</li></a>
                    <a href="#"><li>회원탈퇴</li></a>
                    <a href="../mypage/mypage_cart.do"><li>장바구니</li></a>
                    <a href="../mypage/mypage_buy.do"><li>구매목록</li></a>
                    <a href="../mypage/mypage_reserve_list.do"><li>예약리스트</li></a>
                    <a href="../mypage/mypage_jjim_list.do" style="color: yellow"><li>찜 목록</li></a>                  
                </ul>
            </div>
        </div>
</div>            
</body>
</html>