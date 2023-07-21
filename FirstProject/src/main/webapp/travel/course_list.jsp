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
.card{
 box-shadow: 0 6px 20px 0 rgba(0, 0, 0, 0.19);
 border-radius: 10px;
 margin-bottom: 10px;
}
.btn{
	align-content: right;
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
			<div class="container mt-3">
				<div class="card" style="width: 400px">
					<img class="card-img-top" src="${vo.poster }" alt="Card image"
						style="width: 100%; height: 250px">
					<div class="card-body">
						<h6 class="card-title text-center" style="font-size: 13pt">${vo.title }</h6>
						<p class="card-text"
							style="text-align: right; margin-right: 5px">
							<i class="fa fa-thumbs-o-up fa-sm"
								style="color: #3378f0; font-style: bold">&nbsp;추천수(${vo.recommend })&nbsp;</i>
							<i class="fa fa-heart fa-sm" style="color: #f84949;">&nbsp;찜한수&nbsp;(${vo.jjim})</i>
							<i class="fa fa-eye fa-sm" style="color: #acb5c3;"></i>&nbsp;조회수&nbsp;(${vo.views })
						</p>
						<div style="text-align: right">
						<a href="course_detail.do?cno=${vo.cno }"
							class="btn btn-warning">Go to detail&nbsp;<i class="fa fa-location-arrow"></i></a>
						</div>	
					</div>
				</div>
			</div>
		</div>
	 </c:forEach>
     </div>
    </div>
</div> 
 
</body>
</html>