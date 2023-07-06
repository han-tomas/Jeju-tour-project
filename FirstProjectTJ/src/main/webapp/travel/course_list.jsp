<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="popular-categories">
    <div class="container">
      <div class="row">
      <c:forEach var="vo" items="${list }">
      <div class="col-md-4">
	     <div class="thumbnail">
	      <a href="course_detail.do?cno=${vo.cno }">
	        <img src="${vo.poster }" alt="Lights" style="width:400px; height: 300px">
	        <div class="caption">
	        
	          <p class="text-right">
	          	<input type=button class="btn btn-xs btn-success" value="추천수(${vo.recommend })">
	          	<input type=button class="btn btn-xs btn-primary" value="찜한수(${vo.jjim })">
	          	<input type=button class="btn btn-xs btn-warning" value="복사한수(${vo.copy })">
	          	<input type=button class="btn btn-xs btn-info" value="조회수(${vo.views })">
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