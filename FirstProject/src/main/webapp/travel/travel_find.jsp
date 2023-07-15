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
<style type="text/css">
.container2 {
      display: flex;
      justify-content: center;
      align-items: center;
}
.list-group-item.active {
    background-color: #FFCD28; /* 배경색을 원하는 색상으로 변경 */
    border-color: #FFCD28;
  } 
.list-group-item{
	width: 200px;
	text-align: rigth;
	height: 55px;
	font-size: 15pt;
}
.pagination .page-item.active .page-link {
    background-color: #FFCD28;
    border-color: #FFCD28;
  }
.col-md-3{
	align-content: right;
}
a{
	width: 100%;
}

.table1{
	border: 2px solid orange;
	background-color: white;
}
td{
	border: none;
}
.aLogo{
	width: 30px;
	height: 27px;
	transition: background-color 0.6s ease;
	margin-right: 10px;
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

<div class="container container1">
		<div class="row">
			<div class="col-md-1" style="text-align: right;">
			</div>
			<div class="col-md-2">
			<%-- 카테고리 --%>
				<div style="position: fixed;">
		  			<li class="list-group-item" style="background-color: orange">travel</li>
		  			<a href ="../travel/travel_find.do" class="categories"><li class="list-group-item ${lno==null?'active':'' }"><img src="image/all.png" class="aLogo">전체</li></a>
		  			<a href ="../travel/travel_find.do?lno=1&fd=${fd }" class="categories"><li class="list-group-item ${lno==1?'active':'' }"><img src="image/travel.png" class="aLogo">관광지</li></a><!-- lno=1 -->
		  			<a href ="../travel/travel_find.do?lno=2&fd=${fd }" class="categories"><li class="list-group-item ${lno==2?'active':'' }"><img src="image/restaurant.png" class="aLogo">음식점</li></a><!-- lno=2 -->
		  			<a href ="../travel/travel_find.do?lno=3&fd=${fd }" class="categories"><li class="list-group-item ${lno==3?'active':'' }"><img src="image/rest.png" class="aLogo">숙박</li></a><!-- lno=3 -->
		  			<a href ="../travel/travel_find.do?lno=4&fd=${fd }" class="categories"><li class="list-group-item ${lno==4?'active':'' }"><img src="image/festival.png" class="aLogo">행사/축제</li></a><!-- lno=3 -->
		  		</div>
			</div>
			<div class="col-md-9">
				<table class="table">
					<thead style="background-color: orange">
		  			<tr>
		  				<td style="text-align: right">
		  					<form method="post" action="../travel/travel_find.do" class="inline" id="locFrm">
				          	<input type=text name=fd id=fd size=26 style="height: 40px;" class="input-sm" value="${fd }">
				          	<c:if test="${lno!=null }">
				          	<input type=hidden name=lno value="${lno }">
				          	</c:if>
				          		<button type="button" class="btn btn-xs btn-secondary" style="margin-right: 10px" id="findBtn">Search&nbsp;<i class="fa fa-search"></i></button>
				          	</form>
		  				</td>
		  			</tr>
		  			</thead>
		  			<tbody style="background-color:#FFCD28 ">
		  			<tr>
		  				<td>
		  					<c:forEach var="vo" items="${list }">
		  						<table class="table table1">
		  							<tr>
		  								<td width=35% class="text-center" rowspan="4">
		  									<a href="../travel/travel_find_detail_before.do?no=${vo.no }">
		  									<img src="${vo.poster }" style="width:300px;height: 200px" class="img-thumbnail">
		  									</a>
		  								</td>
										<td width=65%>
											<a href="../travel/travel_find_detail_before.do?no=${vo.no }">
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
					</tbody>
  				</table>
  				<div class="row" >
  					<div class="col-12 d-flex justify-content-center">
			        <ul class="pagination" style="white-space: nowrap;">
			          <!-- startPage: 1, 11, 21, 31 ... -->
			          
			        
				          <c:if test="${lno==null }">
				          	<li class="page-item"><a class="page-link" href="../travel/travel_find.do?page=${startPage>1?startPage-1:startPage }&fd=${fd}">&laquo; Previous</a></li>
				          </c:if>
				          <c:if test="${lno!=null }">
				          	<li class="page-item"><a class="page-link" href="../travel/travel_find.do?page=${startPage>1?startPage-1:startPage }&fd=${fd}&lno=${lno}">&laquo; Previous</a></li>
				          </c:if>

			         <c:forEach var="i" begin="${startPage }" end="${endPage }">
						  <c:if test="${lno==null }">
				          <li class="page-item  ${curpage == i?'active':''}"><a class="page-link" href="../travel/travel_find.do?page=${i }&fd=${fd}">${i }</a></li>
						  </c:if>
						  <c:if test="${lno!=null }">
				          <li class="page-item  ${curpage == i?'active':''}"><a class="page-link ${curpage == i?'active':''}" href="../travel/travel_find.do?page=${i }&fd=${fd}&lno=${lno}">${i }</a></li>
				          </c:if>
			         </c:forEach>
			         <c:if test="${endPage<totalpage }">
			          <c:if test="${lno==null }">
			          <li class="page-item"><a class="page-link" href="../travel/travel_find.do?page=${endPage+1 }&fd=${fd}">Next &raquo;</a></li>
			          </c:if>
			          <c:if test="${lno!=null }">
			          <li class="page-item"><a class="page-link" href="../travel/travel_find.do?page=${endPage+1 }&fd=${fd}&lno=${lno}" >Next &raquo;</a></li>
			          </c:if>
			         </c:if>
			        </ul>
				</div>
			</div>
			<div class="row" style="height: 30px"></div>
			<div class="row">
				<h4>최근 검색 목록</h4>
		      <table class="table">	
				<tr>
				 <c:forEach var="vo" items="${cList }" varStatus="s">
			        <c:if test="${s.index>=0 && s.index<5 }">
			         <td>
			           <a href="../travel/travel_find_detail.do?no=${vo.no }">
			           	<img class="img-thumbnail" src="${vo.poster }" title="${vo.title }" style="width: 185px; height: 150px">
			           </a>   
			         </td>
			        </c:if>
		       </c:forEach> 
		      </tr>
		     </table> 
		    </div>
		</div>
	</div>			
</div> 

</body>
</html>