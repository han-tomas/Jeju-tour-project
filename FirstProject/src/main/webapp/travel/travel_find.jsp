<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#findBtn').on("click",function(){
		let fd=$('#fd').val();
		if(fd.trim()=="")
		{
			$('#fd').focus();
			return;
		}
		$('#locFrm').submit();
		
	})
})
</script>
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
  		<div style="text-align: right">
  			<a href ="../travel/travel_find.do" class="btn btn-sm btn-danger">전체</a>
  			<a href ="../travel/travel_find.do?lno=1&fd=${fd }" class="btn btn-sm btn-info">관광지</a><!-- lno=1 -->
  			<a href ="../travel/travel_find.do?lno=2&fd=${fd }" class="btn btn-sm btn-warning">음식점</a><!-- lno=2 -->
  			<a href ="../travel/travel_find.do?lno=3&fd=${fd }" class="btn btn-sm btn-success">숙박</a><!-- lno=3 -->
  			<a href ="../travel/travel_find.do?lno=4&fd=${fd }" class="btn btn-sm btn-primary">행사/축제</a><!-- lno=3 -->
  		</div>
  	</div>
   		<div class="row">
  		<table class="table">
  			<tr>
  				<td style="text-align: right">
  					<form method="post" action="../travel/travel_find.do" class="inline" id="locFrm">
		          	<input type=text name=fd id=fd size=26 class="input-sm" value="${fd }">
		          	<c:if test="${lno!=null }">
		          	<input type=hidden name=lno value="${lno }">
		          	</c:if>
		          	<input type=button value="검색" class="btn btn-sm btn-secondary" id="findBtn">
		          	</form>
  				</td>
  			</tr>
  			<tr>
  				<td>
  					<c:forEach var="vo" items="${list }">
  						<table class="table">
  							<tr>
  								<td width=35% class="text-center" rowspan="4">
  									<a href="../travel/travel_find_detail.do?no=${vo.no }">
  									<img src="${vo.poster }" style="width:300px;height: 200px" class="img-rounded">
  									</a>
  								</td>
								<td width=65%>
									<a href="../travel/travel_find_detail.do?no=${vo.no }">
									<h3>${vo.title }</h3>
									</a>
								</td>
  							</tr>
							<tr>
								<td width=65%>
									<h6>${vo.tag }</h6>
								</td>
							</tr>
							<tr>
								<td width=65%>
									<h6>${vo.label }</h6>
								</td>
							</tr>
							<tr>
							
								<td width=65%>
									<h6>${vo.loc }</h6>
								</td>
							</tr>
  						</table>
  					</c:forEach>
  				</td>
  			</tr>
  		</table>
  		 
  	</div>
        <ul class="pagination">
          <!-- startPage: 1, 11, 21, 31 ... -->
          <c:if test="${startPage>1 }">
          <li class="page-item"><a class="page-link" href="../travel/travel_find.do?page=${startPage-1 }&fd=${fd}&lno=${lno}">&laquo; Previous</a></li>
          </c:if>
          <c:forEach var="i" begin="${startPage }" end="${endPage }">
          <c:if test="${curpage == i}">
		    <li class="page-item active">
		   </c:if>
          <c:if test="${curpage != i}">
		    <li class="page-item">
		  </c:if>
		  <c:if test="${lno==null }">
          <a class="page-link" href="../travel/travel_find.do?page=${i }&fd=${fd}">${i }</a></li>
		  </c:if>
		  <c:if test="${lno!=null }">
          <a class="page-link" href="../travel/travel_find.do?page=${i }&fd=${fd}&lno=${lno}">${i }</a></li>
          </c:if>
          </c:forEach>
         <c:if test="${endPage<totalpage }">
          <li class="page-item"><a class="page-link" a href="../travel/travel_find.do?page=${endPage+1 }&fd=${fd}&lno=${lno}">Next &raquo;</a></li>
         </c:if>
        </ul>

   </div>
</div>
</body>
</html>