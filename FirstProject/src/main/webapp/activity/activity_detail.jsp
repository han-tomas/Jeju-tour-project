<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.css" />
<style type="text/css">
.row {
	margin: 0px auto;
	width: 1100px;
}

button {
	border: none;
	background-color: white;
}

#thunderImg {
	width: 28px;
	height: 33px;
}

#score_icon {
	width: 15px;
	height: 15px;
	vertical-align: middle;
	margin-top: -5px;
}

h4 {
	font-weight: bold;
	padding-top: 5px;
	padding-bottom: 5px;
}

.buyBox {
	position: fixed;
	width: 400px;
}

.btn-buy {
	width: 300px;
	height: 50px;
}

.btn-wish {
	width: 300px;
	height: 40px;
}

.buyTd {
	stext-align: center;
	margin: 10px;
}

.wishTd {
	stext-align: center;
	margin: 10px;
}

.wishTd button {
	display: block; /* 버튼을 블록 레벨 요소로 설정하여 가운데 정렬을 적용할 수 있도록 함 */
	margin: 0 auto; /* 수평 가운데 정렬을 위해 왼쪽과 오른쪽 마진을 자동으로 설정 */
}

.buyTd a {
	display: flex; /* 버튼을 flex 컨테이너로 설정 */
	justify-content: center; /* 가로 방향 가운데 정렬 */
	align-items: center; /* 세로 방향 가운데 정렬 */
	margin: 0 auto; /* 수평 가운데 정렬을 위해 왼쪽과 오른쪽 마진을 자동으로 설정 */
}

table {
	border-collapse: collapse;
}

table, th, td {
	border: none;
}

table td {
	padding: 10px;
}

.guard {
	width: 27px;
	height: 27px;
	vertical-align: middle;
	margin-top: -5px;
}

.calendar {
	display: none; /* 처음에는 달력을 숨깁니다. */
	position: absolute; /* 다른 요소 위로 올라갈 수 있도록 설정합니다. */
	background-color: #f9f9f9;
	border: 1px solid #ccc;
	padding: 10px;
	z-index: 1; /* 다른 요소보다 위에 표시될 수 있도록 설정합니다. */
}
</style>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.js"></script>
<script type="text/javascript">
	function toggleMoreImages() {
		var moreImagesDiv = document.getElementById("moreImages");
		var showMoreImagesBtn = document.getElementById("showMoreImagesBtn");

		if (moreImagesDiv.style.display === "none") {
			moreImagesDiv.style.display = "block";
			showMoreImagesBtn.textContent = "닫기";
		} else {
			moreImagesDiv.style.display = "none";
			showMoreImagesBtn.textContent = "더 보기";
		}
	}
	$(function() {
		$(window).scroll(
				function() {
					$("#yourDiv").css("margin-top",
							Math.max(0, 0 - $(this).scrollTop()));
				});

		$('#datepicker').datepicker();

	})
</script>
<script>
	function toggleCalendar() {
		var calendar = document.getElementById("calendar");
		if (calendar.style.display === "none") {
			calendar.style.display = "block"; // 달력을 표시합니다.
		} else {
			calendar.style.display = "none"; // 달력을 숨깁니다.
		}
	}

	// FullCalendar 초기화
	document.addEventListener("DOMContentLoaded", function() {
		var calendarEl = document.getElementById("calendar");

		var calendar = new FullCalendar.Calendar(calendarEl, {
			plugins : [ "dayGrid" ],
			defaultView : "dayGridMonth",
			events : [
			// 이벤트를 여기에 추가합니다.
			{
				title : "이벤트 1",
				start : "2023-07-01",
				end : "2023-07-03"
			}, {
				title : "이벤트 2",
				start : "2023-07-10",
				end : "2023-07-12"
			} ]
		});

		calendar.render();
	});
</script>
</head>
<body>
	<div class="page-heading">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="top-text header-text"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-sm-8">
				<h2>${vo.title }</h2>
				<div style="height: 10px"></div>
				<button>
					<span>${vo.score }</span><span>${vo.review_count }</span> <img
						src="https://dffoxz5he03rp.cloudfront.net/icons/ic_arrowright_12x12_gray_500.svg"
						id="score_icon">
				</button>
				<hr>
				<div style="height: 5px;"></div>
				<img src="image/guard.png" class="guard"> <b>최저가 보장제</b> 차액의
				두배 포인트 보상<br>
				<div style="height: 15px;"></div>
				<img src="image/now.png" class="guard"> <b>즉시확정</b> 구매 즉시 예약
				확정 (일부 상품 이용일 추가 예약 필요)
				<div style="height: 5px;"></div>
				<hr>
				<div style="height: 10px;"></div>
				<i class="fa fa-print fa-lg"></i> 모바일 또는 프린트 바우처 <span
					style="margin-left: 200px;"><img src="image/earth.png"
					class="guard"> 한국어 </span>
				<div style="height: 10px;"></div>
				<hr>
				<h4 class="text-left">
					<strong>옵션 선택</strong>
				</h4>

			<img alt="" src="${images[0] }">
			<div id="moreImages" style="display: none;">
				<c:forEach var="i" begin="1" end="${imagesLength}">
					<img alt="" src="${images[i]}">
				</c:forEach>
			</div>
			<div class="d-grid">
				<button type="button" id="showMoreImagesBtn"
					class="btn btn-primary btn-block" onclick="toggleMoreImages()">
					더 보기</button>
			</div>
			<%-- <c:forTokens items="${vo.poster }" delims="^" var="img">
						<div>
							<img src="${img }" style="width:100%">
						</div>
				</c:forTokens> --%>

			<hr>
			<table class="table">
				<tr>
					<td width="10%"><h1>${vo.score }</h1> <sup>★★★★★</sup><br>
						<sup>후기 ${vo.review_count }</sup></td>
					<td width="90%">
						<div style="height: 20px"></div> ★★★★★&nbsp;<b>${vo.reviewer }</b><br>
						<br> ${vo.review_content }
					</td>
				</tr>
			</table>
			<hr>
			<h3 class="text-left">
				<strong>이용 안내</strong>
			</h3>
			<div style="height: 20px;"></div>
			<h5 class="text-left">이용 시간</h5>
			<div style="height: 10px;"></div>
			<pre class="text-left" style="background-color: white;">${vo.hours_use }</pre>
			<div style="height: 20px;"></div>
			<h5 class="text-left">위치 안내</h5>
			<div style="height: 10px;"></div>
			<p class="text-left">${vo.location_name }</p>
			<div style="height: 10px;"></div>
			<div id="map" style="width: 100%; height: 350px;"></div>
			<script>
				//지도 출력
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
					level : 3
				// 지도의 확대 레벨
				};

				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption);

				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();

				// 주소로 좌표를 검색합니다
				geocoder
						.addressSearch(
								'${addr1 }',
								function(result, status) {

									// 정상적으로 검색이 완료됐으면 
									if (status === kakao.maps.services.Status.OK) {

										var coords = new kakao.maps.LatLng(
												result[0].y, result[0].x);

										// 결과값으로 받은 위치를 마커로 표시합니다
										var marker = new kakao.maps.Marker({
											map : map,
											position : coords
										});

										// 인포윈도우로 장소에 대한 설명을 표시합니다
										var infowindow = new kakao.maps.InfoWindow(
												{
													content : '<div style="width:150px;text-align:center;padding:6px 0;">${vo.title}</div>'
												});
										infowindow.open(map, marker);

										// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
										map.setCenter(coords);
									}
								});
			</script>
			<div style="height: 20px;"></div>
			<h5 class="text-left">사용 방법</h5>
			<div style="height: 10px;"></div>
			<pre style="background-color: white;">${vo.how_use }</pre>
			</div>
			<div class="col-sm-4" id="yourDiv">
				<div class="buyBox">
					<div class="buyBoxContent">
						<table class="table">
							<tr>
								<td>
									<h3>
										<sup style="color: gray;">구매가</sup>&nbsp;
										<fmt:formatNumber value="${vo.price }" pattern="#,###" />
										원
									</h3>
								</td>
							</tr>
							<tr>
								<td class="center buyTd">
									<div class="d-grid">
										<a href="../activity/activity_reserve.do?acino=${vo.acino }"
											class="btn btn-block btn-info btn-buy"> <img
											src="image/thunder.png" id="thunderImg">
											<h5 style="color: white;">️티켓 선택</h5></a>
									</div>
								</td>
							</tr>
							<tr>
								<td class="text-center" style="font-size: 10pt; color: gray;">구매
									후 즉시 확정됩니다.</td>
							</tr>
							<tr>
								<td class="center wishTd">
									<div class="d-grid">
										<button class="btn btn-block btn-light btn-wish">
											<h5>🤍 위시리스트에 담기</h5>
										</button>
									</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>