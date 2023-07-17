<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){

	// 방 예약 버튼 클릭 시
	$('.reserveBtn').click(function() {
	  var inwon = $('#inwon').val();
	  var date = $('#date').val();
	  var roomId = $(this).attr("data-no"); // 선택한 방 ID 가져오기 (버튼에 data-속성으로 저장하는 방법도 있음)
	
	  // 예약 페이지로 이동하면서 선택한 값을 전달
	  location.href = '../hotel/hotel_reserve.do?rno=' + roomId + '&inwon=' + inwon + '&date=' + date;
	});
});
</script>
</head>
<body>
	<c:forEach var="rvo" items="${ rList }">
		<div class="row">
		
		<div class="col-md-4" style="padding:15px; border:1px;">
			<section class="panel" style="height:auto;">
				<div id="carouselExampleFade${ rvo.rno }" class="carousel slide carousel-fade" data-bs-interval="false">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="${ rvo.rposters[0] }" class="d-block w-100" id="poster">
						</div>
						<c:forEach var="i" begin="1" end="${fn:length(rvo.rposters)-1}">
							<div class="carousel-item">
								<img src="${rvo.rposters[i]}" class="d-block w-100">
							</div>
						</c:forEach>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleFade${ rvo.rno }" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleFade${ rvo.rno }" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</section>
		</div>
		<div class="col-md-8" style="margin:15px 0px 15px 0px;">
			<div class="row">
				<div class="col-md-6">
					<h4 id="name"> ${ rvo.rname } </h4>
					<h6 id="person"> ${ rvo.person }</h6>
				</div>
				<div class="col-md-6" style="text-align:right">
					<h6>1박 기준</h6>
					<input type="hidden" value="${ rvo.price }" id="price"/>
					<h4> <fmt:formatNumber value="${ rvo.price }" pattern="#,###"/>원~</h4>
				</div>
				<div class="col-md-12" style="text-align:right; margin-top:10px;">
					<input type="hidden" value="${ rvo.huno }" id="huno"/>
					<input type="button" data-no="${ rvo.rno }" class="btn btn-danger reserveBtn" value="예약하기"/>
				</div>
			</div>
		</div>
		</div>
	</c:forEach>
</body>
</html>