<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
	$(function() {

		$('.realbuy').click(
				function() {
					var inwon = $('#inwon').val();
					var date = $('#datepicker').val();
					var acino = $('#acino').val(); // 선택한 방 ID 가져오기 (버튼에 data-속성으로 저장하는 방법도 있음)

					if (date === '') {
						alert('날짜를 선택해주세요.'); // 입력 요청 알림
						return; // 화면을 유지하기 위해 return 문 사용
					}

					// 예약 페이지로 이동하면서 선택한 값을 전달
					location.href = '../activity/activity_reserve.do?acino='
							+ acino + '&inwon=' + inwon + '&date=' + date;
				});
	});
</script>
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

.buyTd button {
	display: block; /* 버튼을 블록 레벨 요소로 설정하여 가운데 정렬을 적용할 수 있도록 함 */
	margin: 0 auto;
}

.wishTd {
	stext-align: center;
	margin: 10px;
}

.wishTd button {
	display: block; /* 버튼을 블록 레벨 요소로 설정하여 가운데 정렬을 적용할 수 있도록 함 */
	margin: 0 auto; /* 수평 가운데 정렬을 위해 왼쪽과 오른쪽 마진을 자동으로 설정 */
}

.wishTd a {
	display: flex; /* 버튼을 flex 컨테이너로 설정 */
	justify-content: center; /* 가로 방향 가운데 정렬 */
	align-items: center; /* 세로 방향 가운데 정렬 */
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
</style>
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


				<div class="input-group" style="width: 360px;">
					<span style="padding: 0px 10px 0px 0px;"><i
						class="fa fa-person fa-2x"></i></span> <select
						class="form-control text-center" style="margin-right: 30px;"
						id="inwon" name="inwon">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
						<option>8</option>
						<option>9</option>
						<option>10</option>
					</select> <i class="fa fa-calendar fa-2x" style="padding: 0px 10px 0px 2px"></i>
					<div>
						<input type="text" id="datepicker"
							class="form-control text-center" value="" name="date">
					</div>
				</div>
				<div style="height: 20px"></div>


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
						<td width="15%"><h1>${vo.score }</h1> <c:forEach var="i"
								begin="1" end="5">
								<sup style="color: gold"> <c:if test="${vo.score+1>i }">★</c:if>
								</sup>
							</c:forEach> <br> <sup>후기 ${vo.review_count }</sup></td>
						<td width="85%">
							<div style="height: 20px"></div> <c:forEach var="i" begin="1"
								end="5">
								<span style="color: gold"> <c:if test="${vo.score+1>i }">★</c:if>
								</span>
							</c:forEach> <!-- <span style="color:gold">★★★★★</span> -->&nbsp;&nbsp;&nbsp;<b>${vo.reviewer }</b><br>
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
										<c:if test="${sessionScope.id==null }">
											<button class="btn btn-block btn-info btn-buy"
												onclick="noIdBuy()"
												style="display: flex; align-items: center;">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src="image/thunder.png"
													id="thunderImg" class="inline">
												<h5 style="color: white;">️티켓 선택</h5>
											</button>
										</c:if>
										<c:if test="${sessionScope.id!=null }">
											<button class="btn btn-block btn-info btn-buy realbuy"
												style="display: flex; align-items: center;">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src="image/thunder.png"
													id="thunderImg" class="inline"> <input type="hidden"
													name="acino" value="${param.acino }" id="acino">
												<h5 style="color: white;">️티켓 선택</h5>
											</button>
											<!-- <a href="../activity/activity_reserve.do"
												class="btn btn-block btn-info btn-buy realbuy"> <img
												src="image/thunder.png" id="thunderImg">
												<h5 style="color: white;">️티켓 선택</h5></a> -->
										</c:if>
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
										<c:if test="${sessionScope.id==null }">
											<button class="btn btn-block btn-light btn-wish"
												onclick="noIdWish()">
												<h5>
													<i class="fa fa-light fa-heart"></i> WishList 담기
												</h5>
											</button>
										</c:if>
										<c:if test="${sessionScope.id!=null }">
											<c:if test="${wish_count==0 }">
												<a
													href="../activity/activityWish_insert.do?acino=${vo.acino }"
													class="btn btn-block btn-light btn-wish">
													<h5>
														<i class="fa fa-light fa-heart"></i> WishList 담기
													</h5>
												</a>
											</c:if>
											<c:if test="${wish_count==1 }">
												<a
													href="../activity/activityWish_cancle.do?acino=${vo.acino }"
													class="btn btn-block btn-light btn-wish">
													<h5>
														<i class="fa fa-solid fa-check"></i> WishList 취소
													</h5>
												</a>
											</c:if>
										</c:if>
									</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="recent-listing">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="section-heading">
							<h2>Recent Listing</h2>
							<h6>Check Them Out</h6>
						</div>
					</div>
					<div class="col-lg-12">
						<div class="owl-carousel owl-listing">
							<c:forEach var="cvo" items="${cList}" varStatus="s">
							<c:if test="${s.index>=0 && s.index<10 }">
								<div class="item">
									<div class="row">
										<div class="col-lg-12">
											<div class="listing-item">
												<div class="left-image">
													<a href="../activity/activity_detail.do?acino=${cvo.acino }"><img
														src="${cvo.main_poster }" style="width: 480px;height: 360px;"></a>
												</div>
												<div class="right-content align-self-center">
													<a href="../activity/activity_detail.do?acino=${cvo.acino }"><h4>${cvo.title}</h4></a>
													<span class="price"><div class="icon">
															<img src="../assets/images/listing-icon-01.png" alt="">
														</div> <fmt:formatNumber value="${cvo.price }" pattern="#,###" />원</span>
													<span class="details"><em></em></span>
													<h1>${cvo.score }</h1>
													<span> <c:forEach var="i" begin="1" end="5">
															<sup style="color: gold"> <c:if
																	test="${cvo.score+1>i }">★</c:if>
															</sup>
														</c:forEach> <br> <sup>후기 ${vo.review_count }</sup></span>
													<div class="main-white-button">
														<a
															href="../activity/activity_detail.do?acino=${cvo.acino }"><i
															class="fa fa-eye"></i> Contact Now</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
	$(function() {
		/* $(window).scroll(
				function() {
					$("#yourDiv").css("margin-top",
							Math.max(0, -200 - $(this).scrollTop()));
				}); */

		/* $(window).scroll(function() {
			  var scrollHeight = $(document).height(); // 문서의 전체 높이
			  var scrollPosition = $(window).height() + $(window).scrollTop(); // 스크롤된 위치
			  var footerHeight = $("footer").outerHeight(); // footer의 높이

			  // 스크롤이 footer까지 도달하기 전까지만 #yourDiv 이동
			  if (scrollPosition < (scrollHeight - footerHeight)) {
			    $("#yourDiv").css("margin-top", Math.max(0, 0 - $(this).scrollTop()));
			  }
			});		 */

		$("#datepicker").datepicker({
			format : "yyyy-mm-dd",
			autoclose : true,
			startDate : '-1d',
			calendarWeeks : false,
			clearBtn : false,
			disableTouchKeyboard : false,
			immediateUpdates : false,
			title : "Calendar",
			showWeekDays : true,
			todayHighlight : true,
			toggleActive : true,
			weekStart : 0,
			defaultDate : new Date()
		});

	});

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

	function noIdWish() {
		alert('로그인이 필요합니다.');
	}

	function noIdBuy() {
		alert('로그인이 필요합니다.');
		return;
	}
</script>
</body>
</html>