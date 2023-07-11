<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<style type="text/css">
.row {
	margin: 0px auto;
	width: 1200px;
}

button {
	border: none;
	background-color: white;
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
</style>
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
	<div style="height: 120px;"></div>
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
				<img alt="" src="${images[0] }">
				<div id="moreImages" style="display: none;">
					<c:forEach var="i" begin="1" end="${imagesLength}">
						<img alt="" src="${images[i]}">
					</c:forEach>
				</div>

				<button type="button" id="showMoreImagesBtn"
					class="btn btn-primary btn-block" onclick="toggleMoreImages()">
					<h4>더 보기</h4>
				</button>

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
				<h4 class="text-left">이용 시간</h4>
				<pre class="text-left" style="background-color: white;">${vo.hours_use }</pre>
				<h4 class="text-left">위치 안내</h4>
				<p class="text-left">${vo.location_name }</p>

				카카오 이미지 api..


				<div id="map" style="width: 100%; height: 350px;"></div>
				<script>
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
											var marker = new kakao.maps.Marker(
													{
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
			<h4 class="text-left">사용 방법</h4>
			<pre style="background-color: white;">${vo.how_use }</pre>
			</div>
			<div class="col-sm-4">
				<table class="table">
					<tr>
						<td>구매하기 들어갈 자리</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>