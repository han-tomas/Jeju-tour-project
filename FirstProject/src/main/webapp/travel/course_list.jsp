<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.btn-sm {
	font-size:0.5rem;
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
    <div class="container">
      <div class="row">
      <c:forEach var="vo" items="${list }">
      <div class="col-md-4">
	     <div class="thumbnail" style="width: 350px; margin-bottom:15px;">
	      <a href="course_detail.do?cno=${vo.cno }">
	        <img src="${vo.poster }" alt="Lights" style="width:350px; height: 250px; border-radius:10px;">
	        <div class="caption">
	        
	          <p class="text-center" style="margin-top:2px;">
	          	<input type=button class="btn btn-sm btn-warning" value="추천수(${vo.recommend })">
	          	<input type=button class="btn btn-sm btn-danger" value="찜한수(${vo.jjim })">
	          	<input type=button class="btn btn-sm btn-info" value="복사한수(${vo.copy })">
	          	<input type=button class="btn btn-sm btn-success" value="조회수(${vo.views })">
	          </p>
	          <p class="text-center">${vo.title }</p>
	        </div>
	      </a>
    	 </div>
 	  </div>
      </c:forEach>
      </div>
    </div>
</div>      
</body>
</html>