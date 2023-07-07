<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../shadow/css/shadowbox.css">
<script type="text/javascript" src="../shadow/js/shadowbox.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
Shadowbox.init({
	players:['iframe']
})
$(function(){
	$('#logoutBtn').click(function(){
		location.href="../member/logout.do"
	})
	$('#logBtn').click(function(){
	   Shadowbox.open({
	      content:'../member/login.do',
	      player:'iframe',
	      width:600,
	      height:370,
	      title:'로그인'
	   })
	})
	
})
</script>
</head>
<body>
<!-- ***** Header Area Start ***** -->
<header class="header-area header-sticky wow slideInDown" data-wow-duration="0.75s" data-wow-delay="0s">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <nav class="main-nav">
          <!-- ***** Logo Start ***** -->
          <a href="../main/main.do" class="logo">
          </a>
          <!-- ***** Logo End ***** -->
          <!-- ***** Menu Start ***** -->
          <ul class="nav">
			<li class="nav-item dropdown">
			  <a class="nav-link dropdown-toggle" href="../category.html" role="button" data-bs-toggle="dropdown" style="color:black;">Travel</a>
			  <ul class="dropdown-menu">
			    <li><a class="dropdown-item" href="#">Travel Search</a></li>
			    <li><a class="dropdown-item" href="../travel/course_list.do">Travel Course</a></li>
			    <li> </li>
			  </ul>
			</li> 
			<li class="nav-item dropdown">
			  <a class="nav-link dropdown-toggle" href="../listing.html" role="button" data-bs-toggle="dropdown" style="color:black;">Reservation</a>
			  <ul class="dropdown-menu">
			    <li><a class="dropdown-item" href="#">Activity</a></li>
			    <li><a class="dropdown-item" href="../hotel/hotel_list.do">Hotel</a></li>
			    <li><a class="dropdown-item" href="#">Rental car</a></li>
			    <li> </li>
			  </ul>
			</li> 
			<li class="nav-item dropdown">
			  <a class="nav-link dropdown-toggle" href="../contact.html" role="button" data-bs-toggle="dropdown" style="color:black;">Community</a>
			  <ul class="dropdown-menu">
			    <li><a class="dropdown-item" href="#">Notice</a></li>
			    <li><a class="dropdown-item" href="#">QnA</a></li>
			    <li><a class="dropdown-item" href="#">Review</a></li>
			    <li> </li>
			  </ul>
			</li> 
			<c:if test="${sessionScope.id==null }">
				<li><input type="button" class="btn btn-outline-dark" id="logBtn" value="Login"/></li>
			</c:if>
			<c:if test="${sessionScope.id!=null }">
				<li><input type="button" class="btn btn-outline-dark" id="myPage" value="${sessionScope.admin=='y'?"AdminPage":"MyPage" }"/></li>
				<li style="padding:0px 12px 0px 12px"><input type="button" class="btn btn-outline-dark" id="logoutBtn" value="Logout"/></li>
			</c:if>
          </ul>
          <a class='menu-trigger'>
              <span>Menu</span>
          </a>
          <!-- ***** Menu End ***** -->
        </nav>
      </div>
    </div>
  </div>
</header>
<!-- ***** Header Area End ***** -->

</body>
</html>