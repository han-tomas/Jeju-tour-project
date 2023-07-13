<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import = "com.sist.vo.RentcarVO"%>
<%@page import = "com.sist.dao.RentcarDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">


</script>
</head>
<body>
	  <div class="page-heading" >
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
      <div class="row" >
       
      <c:forEach var="vo" items="${list }">
      <div class="col-md-4">
	     <div class="thumbnail">
	     <c:if test="${vo.price!=0 }">	
	      <a href="../rentcar/rentcar_detail.do?cid=${vo.cid }">
	     </c:if>
	        <img src="https://rentinjeju.com${vo.img }" alt="Lights" style="width:400px; height: 300px; border-radius:20px; ">
	       
	        <div class="caption">
	        <br>
	          <h2>${vo.car_name}</h2>
	         <br>
	      </a>
	          <span>${vo.car_size }ㆍ${vo.seater }ㆍ${vo.fuel_type }ㆍ${vo.gear_type }ㆍ${vo.brand }</span>
	          <hr>
	         
	          <c:if test="${vo.price==0 }">	
	          <span>예약불가</span>
	          </c:if>
	          <c:if test="${vo.price!=0 }">
	          <span>${vo.price }원 (24시간 기준 )</span> 
	          <br><br><br><br>
	          </c:if>
	                  
	        </div>

    	 </div>
 	  </div>
      </c:forEach>
      </div>
    </div>
    <div style="height: 10px"></div>
     <div class="row">
       <div class="text-center">
         <a href="../rentcar/rentcar_main.do?page=${curpage>1?curpage-1:curpage }" class="btn btn-sm btn-danger">이전</a>
           ${curpage } page / ${totalpage } pages
         <a href="../rentcar/rentcar_main.do?page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-sm btn-primary">다음</a>
       </div>
     </div>
</div>      
</body>
</html>