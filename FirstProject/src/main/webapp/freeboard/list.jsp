<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.main-banner1 {
  background-repeat: no-repeat;
  background-position: center center;
  background-size: cover;
  background-image: url(../assets/images/freeboard.jpg);
  padding: 200px 0px 100px 0px;
  position: relative;
  overflow: hidden;
}
.main-banner1 .top-text h2 {
  color: #fff;
  font-size: 45px;
  font-weight: 800;
  text-transform: capitalize;
  margin-top: 15px;
  margin-bottom: 45px;
  margin: 0px auto;
}
</style>
</head>
<body>
<div class="main-banner1">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="top-text header-text">
            <h2 class="text-center">아이디 찾기</h2>
          </div>
        </div>
      </div>
    </div>
</div>  
<div class="popular-categories">
    <div class="container">
	    <div style="height:20px"></div>
	    <div class="row row1">
	    	<table class="table">
	    		<tr>
	    			<th width=10% class="text-center">번호</th>
		  	 		<th width=45% class="text-center">제목</th>
		  	 		<th width=15% class="text-center">이름</th>
		  	 		<th width=20% class="text-center">작성일</th>
		  	 		<th width=10% class="text-center">조회수</th>
	    		</tr>
	    		<tr>
	    			<td width=10% class="text-center">${vo.no }</td>
	  	 			<td width=45%><a href="../board/detail.do?no=${vo.no}">${vo.subject }</a></td>
	  	 			<td width=15% class="text-center">${vo.name }</td>
	  	 			<td width=20% class="text-center">${vo.dbday }</td>
	  	 			<td width=10% class="text-center">${vo.hit }</td>
	    		</tr>
	    	</table>
	    </div>
    </div> 
</div>      
</body>
</html>