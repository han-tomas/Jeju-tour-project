<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../assets/css/mypage_style.css">
<style type="text/css">
.row1{
  margin: 0px auto;
  width: 1200px;
}
</style>
</head>
<body>
<div class="page-heading">
  <div class="container">
    <div class="row">
      <div class="col-lg-8">
        <div class="top-text header-text">
        </div>
      </div>
    </div>
  </div>
</div>
<div class="popular-categories">
    <div class="container1">
	    <div class="row row1">
	    	
	    	<div class="col-lg-3">
		       <jsp:include page="../mypage/mypage_nav.jsp"></jsp:include>
		    </div>
		    <div class="col-lg-9">
		       <%-- 변경위치 --%>
		       <jsp:include page="${mypage_jsp }"></jsp:include>
		   </div>
	    </div>
	</div>
</div>	    
</body>
</html>