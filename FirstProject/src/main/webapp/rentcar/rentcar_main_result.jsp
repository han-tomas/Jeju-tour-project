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
	<c:forEach var="vo" items="${sList}">
	<div class="col-md-4" style="padding:15px; border:1px;">
		<section class="panel">
			<div class="pro-img-box">
				<c:choose>
					<c:when test="${vo.price != 0}">
						<a href="../rentcar/rentcar_detail.do?cid=${vo.cid}" class="pro-title">
							<img src="https://rentinjeju.com${vo.img}" class="img-fluid" style="width:100%; height:300px;  border-radius:30px; " />
						</a>
					</c:when>
					<c:otherwise>
						<a class="pro-title"></a>
						<img src="https://rentinjeju.com${vo.img}" class="img-fluid" style="width:100%; height:300px; border-radius:30px; pointer-events:none;" />
					</c:otherwise>
				</c:choose>
			</div>

			<div class="panel-body text-left">
				<c:if test="${vo.price != 0}">
					<h1>
						<a href="../rentcar/rentcar_detail.do?cid=${vo.cid}" class="pro-title"> ${vo.car_name} </a>
					</h1>
					<hr>
					<span>${vo.car_size}ㆍ${vo.seater}ㆍ${vo.fuel_type}ㆍ${vo.gear_type}ㆍ${vo.brand}</span><br>
					<span></span>
					<span class="pro-title"> ${vo.price}원</span>
				</c:if>
				<c:if test="${vo.price == 0}">
					<h1>
						<a class="pro-title">${vo.car_name}</a>
					</h1>
					<hr>
					<span>${vo.car_size}ㆍ${vo.seater}ㆍ${vo.fuel_type}ㆍ${vo.gear_type}ㆍ${vo.brand}</span><br>
					<span></span>
					<span class="pro-title"> 예약불가 </span>
				</c:if>
			</div>
			<div style="height:10px"></div>
		</section>
	</div>
</c:forEach>
</body>
</html>