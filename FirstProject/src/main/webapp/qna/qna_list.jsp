<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container1{
	display: flex;
    justify-content: center;
    align-items: center;
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
<div class="container mt-3">
  <h1>QnA 게시판</h1>
  <div style="height: 20px"></div>
  <p>총<span style="color: orange;font-size: 30pt">${rowtotal }</span>개의 게시글이 있습니다</p>
  <table class="table">
  	 	<tr>
  	 		<td>
  	 			<a href="../qna/qna_insert.do" class="btn btn-sm btn-warning">새글</a>
  	 		</td>
  	 	</tr>
  	 </table>            
  <table class="table table-striped">
    <thead>
      <tr>
        <th width=10% class="text-center">번호</th>
 		<th width=45% class="text-center">제목</th>
 		<th width=15% class="text-center">이름</th>
 		<th width=20% class="text-center">작성일</th>
 		<th width=10% class="text-center">조회수</th>
      </tr>
    </thead>
    <tbody>
    	<c:set var="i" value="${rowtotal }"/>
    	<c:forEach var="vo" items="${list }">
   		<tr>
  	 		<td width=10% class="text-center">${i }</td>
  	 		<td width=45%>${vo.subject }</td>
  	 		<td width=15% class="text-center">${vo.name }</td>
  	 		<td width=20% class="text-center">${vo.dbday }</td>
  	 		<td width=10% class="text-center">${vo.hit }</td>
  	 	</tr>
  	 	<c:set var="i" value="${i-1 }"></c:set>
    	</c:forEach>
  </table>
 </div>
<div class="container1">
	
  		<%--
  		<ul class="pagination">
		  <li class="page-item"><a class="page-link" href="#">Previous</a></li>
		  <li class="page-item"><a class="page-link" href="#">1</a></li>
		  <li class="page-item active"><a class="page-link" href="#">2</a></li>
		  <li class="page-item"><a class="page-link" href="#">3</a></li>
		  <li class="page-item"><a class="page-link" href="#">Next</a></li>
		</ul>	
  		 --%>
  		
        <div class="row">
        <ul class="pagination">
          <!-- startPage: 1, 11, 21, 31 ... -->
          <c:if test="${startPage>1 }">
          <li class="page-item"><a class="page-link" href="../qna/qna_list.do?page=${startPage-1 }">&laquo; Previous</a></li>
          </c:if>
          <c:forEach var="i" begin="${startPage }" end="${endPage }">
          <c:if test="${curpage == i}">
		    <li class="page-item active">
		   </c:if>
          <c:if test="${curpage != i}">
		    <li class="page-item">
		  </c:if>
		  <c:if test="${lno==null }">
          <a class="page-link" href="../qna/qna_list.do?page=${i }">${i }</a></li>
		  </c:if>
		  <c:if test="${lno!=null }">
          <a class="page-link" href="../qna/qna_list.do?page=${i }">${i }</a></li>
          </c:if>
          </c:forEach>
         <c:if test="${endPage<totalpage }">
          <li class="page-item"><a class="page-link" href="../qna/qna_list.do?page=${endPage+1 }">Next &raquo;</a></li>
         </c:if>
        </ul>
	</div>
     	   
</div>
</body>
</html>