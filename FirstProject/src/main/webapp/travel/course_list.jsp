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
	     <div class="img-thumbnail" style="width: 450px; margin-bottom:30px; background-color: orange;border-radius:10px">
	      <a href="course_detail.do?cno=${vo.cno }">
	        <img src="${vo.poster }" alt="Lights" style="width:100%; height: 250px;border-radius:10px">
	        <div class="caption">
	        
	          <p style="margin-top:10px;text-align: right">
	          	<i class="fa fa-thumbs-o-up fa-sm" style="color: #3378f0; font-style: bold">&nbsp;추천수(${vo.recommend })&nbsp;</i>
	          	<i class="fa fa-heart fa-sm" style="color: #f84949;">&nbsp;찜한수&nbsp;(${vo.jjim})</i>
	          	<%-- <input type=button class="btn btn-sm btn-info" value="복사한수(${vo.copy })"> --%>
	          	<i class="fa fa-eye fa-sm" style="color:  #acb5c3;"></i>&nbsp;조회수&nbsp;(${vo.views })
	          </p>
	          <p class="text-center" style="font-size: 14pt"><a href="course_detail.do?cno=${vo.cno }" style="color: white">${vo.title }</a></p>
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