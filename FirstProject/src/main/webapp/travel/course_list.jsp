<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
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
	     <div class="thumbnail" style="width: 350px;">
	      <a href="course_detail.do?cno=${vo.cno }">
	        <img src="${vo.poster }" alt="Lights" style="width:350px; height: 250px">
	        <div class="caption">
	        
	          <p class="text-right">
	          	<input type=button class="btn btn-xs btn-warning" value="추천수(${vo.recommend })">
	          	<input type=button class="btn btn-xs btn-danger" value="찜한수(${vo.jjim })">
	          	<input type=button class="btn btn-xs btn-info" value="복사한수(${vo.copy })">
	          	<input type=button class="btn btn-xs btn-success" value="조회수(${vo.views })">
	          </p>
	          <p>${vo.title }</p>
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