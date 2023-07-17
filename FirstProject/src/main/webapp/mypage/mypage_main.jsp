<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../assets/css/mypage_style.css">
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
	    <div class="row">
	    	<div class="col-sm-1">
			</div>
	    	<div class="col-sm-3">
		       <jsp:include page="../mypage/mypage_nav.jsp"></jsp:include>
		    </div>
		    <div class="col-sm-8">
		       <%-- 변경위치 --%>
		       <jsp:include page="${mypage_jsp }"></jsp:include>
		   </div>
	    </div>
	</div>
</div>	    
</body>
</html>