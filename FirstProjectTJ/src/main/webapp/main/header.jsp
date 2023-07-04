<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../shadow/css/shadowbox.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.row{
  margin: 0px auto;
  width:100%;
}
</style>
<script type="text/javascript" src="../shadow/js/shadowbox.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
Shadowbox.init({
   players:['iframe']
});

$(function(){
	$('#logoutBtn').click(function(){
		location.href="../member/logout.do";
	})
   $('#logBtn').click(function(){
      Shadowbox.open({
         content:'../member/login.do',
         player:'iframe',
         width:800,
         height:600,
         title:'  '
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
          <a href="main.jsp" class="logo">
          </a>
          <!-- ***** Logo End ***** -->
          <!-- ***** Menu Start ***** -->
          <ul class="nav">
			<li class="nav-item dropdown">
			  <a class="nav-link dropdown-toggle" href="../category.html" role="button" data-bs-toggle="dropdown">Travel</a>
			  <ul class="dropdown-menu">
			    <li><a class="dropdown-item" href="#">Travel Search</a></li>
			    <li><a class="dropdown-item" href="#">Travel Course</a></li>
			    <li> </li>
			  </ul>
			</li> 
			<li class="nav-item dropdown">
			  <a class="nav-link dropdown-toggle" href="../listing.html" role="button" data-bs-toggle="dropdown">Reservation</a>
			  <ul class="dropdown-menu">
			    <li><a class="dropdown-item" href="#">Activity</a></li>
			    <li><a class="dropdown-item" href="#">Hotel</a></li>
			    <li><a class="dropdown-item" href="#">Rental car</a></li>
			    <li> </li>
			  </ul>
			</li> 
			<li class="nav-item dropdown">
			  <a class="nav-link dropdown-toggle" href="../contact.html" role="button" data-bs-toggle="dropdown">Community</a>
			  <ul class="dropdown-menu">
			    <li><a class="dropdown-item" href="#">Notice</a></li>
			    <li><a class="dropdown-item" href="#">QnA</a></li>
			    <li><a class="dropdown-item" href="#">Review</a></li>
			    <li> </li>
			  </ul>
			</li> 
			<c:if test="${sessionScope.id==null }">
			<input type=button value="LogIn" class="btn btn-sm btn-info" id="logBtn">
			</c:if>
			<c:if test="${sessionScope.id!=null }">
			<input type=button value="LogOut" class="btn btn-sm btn-info" id="logoutBtn">&nbsp;
			<input type=button value="MyPage" class="btn btn-sm btn-info" id="mypageBtn">
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