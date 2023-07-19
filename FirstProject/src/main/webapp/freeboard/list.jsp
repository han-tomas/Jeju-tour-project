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
.row1{
	margin: 0px auto;
	width: 960px;
}
.container1{
	display: flex;
    justify-content: center;
    align-items: center;
}
.pagination .page-item.active .page-link {
    background-color: orange;
    border-color: orange;
  }
.table{
	border-radius: 7px;
  box-shadow: 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}
.table th{
	background-color: #FFE0B2;
}  
</style>
</head>
<body>
<div class="main-banner1">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="top-text header-text">
            <h2 class="text-center">자유 게시판</h2>
          </div>
        </div>
      </div>
    </div>
</div>  
<div class="popular-categories">
    <div class="container">
	    <div style="height:20px"></div>
	    <div class="row row1">
	    	<table class="table1">
	    		<tr>
		  	 		<td>
		  	 			<a href="../freeboard/insert.do" class="btn btn-sm btn-warning" id="fbinsert">
			  	 			<i class="fa fa-pencil-square-o"></i>
			  	 			&nbsp;글쓰기
		  	 			</a>
		  	 		</td>
		  	 	</tr>
	    	</table>
	    	<div style="height: 10px"></div>
	    	<table class="table">
	    		<tr>
	    			<th width=10% class="text-center">번호</th>
		  	 		<th width=45% class="text-center">제목</th>
		  	 		<th width=15% class="text-center">이름</th>
		  	 		<th width=20% class="text-center">작성일</th>
		  	 		<th width=10% class="text-center">조회수</th>
	    		</tr>
	    	<c:forEach var="vo" items="${list }" >
	    		<tr style="font-size: 13pt">
	    			<td width=10% class="text-center">${vo.no }</td>
	  	 			<td width=45%><a href="../freeboard/detail.do?no=${vo.no}">${vo.subject }</a>
	  	 			<c:if test="${today==vo.dbday }">
	  	 				<sup><img src="image/new.gif" style="width: 60px;height: 30px;"></sup>
	  	 			</c:if>
	  	 			</td>
	  	 			<td width=15% class="text-center">${vo.name }</td>
	  	 			<td width=20% class="text-center">${vo.dbday }</td>
	  	 			<td width=10% class="text-center">${vo.hit }</td>
	    		</tr>
	    	</c:forEach>	
	    	</table>
	    	<div class="container1">
    			<ul class="pagination" style="align-items: center">
				<c:if test="${startPage>1 }">
				  <li class="page-item">
					  <a class="page-link" href="../freeboard/list.do?page=${startPage-1}">
					  	Previous
					  </a>
				  </li>
				</c:if>
					  <c:forEach var="i" begin="${startPage }" end="${endPage }">
					  	<li class="page-item ${curpage==i?'active':'' }">
					  		<a class="page-link" href="../freeboard/list.do?page=${i }">${i }</a>
					  	</li>
					  </c:forEach>
				  <c:if test="${endPage<totalpage }">
					  <li class="page-item">
						  <a class="page-link" href="../freeboard/list.do?page=${endPage+1 }">
						  	Next
						  </a>
					  </li>
				 </c:if>
				</ul>
	    	</div>
	    	
	    </div>
    </div> 
</div>      
</body>
</html>