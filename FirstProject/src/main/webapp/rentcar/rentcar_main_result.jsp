<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach var="vo" items="${ sList }">
		<div class="col-md-4" style="padding:15px; border:1px;">
			<section class="panel">
				<div class="pro-img-box">
					<a href="../rentcar/rentcar_detail.do?cid=${ vo.cid }" class="pro-title">
						<img src="https://rentinjeju.com${vo.img }" class="img-fluid" style="width:100%; height:300px;" />
					</a>
				</div>

				<div class="panel-body text-left">
					<h4>
						<a href="../rentcar/rentcar_detail.do?cid=${ vo.cid }" class="pro-title"> ${ vo.car_name } </a>
					</h4>
					<h6> ${ vo.car_size }</h6>
				</div>
				<div style="height:10px"></div>
			</section>
		</div>
	</c:forEach>
</body>
</html>