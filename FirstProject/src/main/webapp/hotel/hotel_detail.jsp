<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
a {
  text-decoration: none;
  color: inherit;
}
.tabs {
  list-style: none;
  margin: 0;
  padding: 0;
  display: flex;
  justify-content: space-between;
  height: 30px;
  color: #000;
}

.container1 {
  max-width: 800px;
  width: 100%;
  padding: 30px;
  border-radius: 20px;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
} 
.tab-item {
	color: #000;
	padding: 0px 15px 0px 15px;
}

.tab-item a:hover {
  color: inherit;
  padding-bottom: 4px;
  border-bottom: 3px solid #FF7F31;
}

.wrapper_tab-content {
  position: relative;
}

.tab-content {
  position: absolute;
  padding: 1.75em 0;
  display: none;
  height: 0;
}

.tab-content h1 {
  font-size: 1.12em;
  margin-bottom: .5em;
}

.content-visible {
  position: static;
  display: block;
  height: auto;
}

.actived {
  padding-bottom: 4px;
  border-bottom: 3px solid #FFA63C;
}
.slideImage {
	width: 600px;
	height: 400px;
}

.carousel-inner {
	border: solid 2px #FF7F31;
	border-radius: 7px;
}

.col-sm-12 {
	border: solid 2px #FF7F31;
	border-radius: 7px;
	padding: 20px;
	margin-bottom: 20px;
}
.col-md-8 {
	border: solid 2px #FF7F31;
	border-radius: 7px;
	padding: 20px;
	margin-bottom: 20px;
}
/* 달력css */
.input-group-append {
  cursor: pointer;
}
.input-search {
  display: flex;
  align-items: center;
  padding: 0.375rem 0.75rem;
  font-size: 1rem;
  font-weight: 400;
  line-height: 1.5;
  color: #212529;
  text-align: center;
  white-space: nowrap;
  background-color: #e9ecef;
  border: 1px solid #ced4da;
  border-radius: 0.25rem;
}
.fa-2x {
	font-size:1.6em;
}
</style>
<script type="text/javascript">
$(function() {
	var huno = $('#huno').val()
	var inwon = $('#inwon').val()
	var date = $('#date').val()
	var today = moment();

	$('.datepicker').daterangepicker({
		startDate: today, // 오늘 날짜를 시작 기간으로 설정
		endDate: today.clone().add(1, 'days') // 오늘 날짜를 1일 뒤로 설정하여 종료 기간으로 설정
	});
	
	$.ajax({
		type:'GET',
		url:'../hotel/room_list.do',
		data:{"huno":huno,"inwon":inwon,"date":date},
		success:function(result){
			alert(huno + "," + inwon + "," + date + '성공!');
			$('#roomResult').html(result);
		}
	})
	
	$('#inwon').change(function() {
	  var inwon = $(this).val();
	  updateRoomList();
	});
	
	// 날짜 선택 (datepicker를 사용하는 경우)
	$('#date').change(function() {
	  date = $(this).val();
	  updateRoomList();
	});
	
	// 방 리스트 업데이트 함수
	function updateRoomList() {
		var inwon = $('#inwon').val();
		var date = $('#date').val();
		
		// AJAX 요청으로 방 리스트 업데이트
		$("#roomResult").empty() 
		$.ajax({
			type:'GET',
			url:'../hotel/room_list.do',
			data:{"huno":huno,"inwon":inwon,"date":date},
			success:function(result){
				$('#roomResult').html(result);
			}
		})
	}
	const selectTab = element => {
	  const active = document.querySelector('.actived');
	  const visible = document.querySelector('.content-visible');
	  const tabContent = document.getElementById(element.href.split('#')[1]);
	  if (active) {
	    active.classList.remove('actived');
	  }
	  element.classList.add('actived');
	  if (visible) {
	    visible.classList.remove('content-visible');
	  }
	  tabContent.classList.add('content-visible');
	  event.preventDefault();
	}
	document.addEventListener('click', event => {
	  if (event.target.matches('.tab-item a')) {
	    selectTab(event.target);
	  }
	}, false);
	
	
})
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
	<div class="container container1">
		<div class="row">
			<div class="col-sm-12" style="text-align: center;">
				<div class="col-sm-12" style="padding:0px; margin:0px; border:none;">
				<div id="carouselExampleControls" class="carousel slide"
					data-bs-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="${ images[0] }" class="d-block w-100" alt="...">
						</div>
						<c:forEach var="i" begin="1" end="${imagesLength-1}">
							<div class="carousel-item">
								<img src="${images[i]}" class="d-block w-100" alt="...">
							</div>
						</c:forEach>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleControls" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleControls" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
				</div>
			</div>
			<div class="col-sm-12">
				<h4>${ vo.addr1 }</h4>
				<h1>${ vo.name }</h1>
			</div>
			<div class="col-sm-12" style="border:none; padding:0px 20px 0px 0px;">
			  <div class="row" style="justify-content: right;">
					<div class="row" style="justify-content: right;">
						<div class="input-group" style="width: 360px;">
							<span style="padding:6px 10px 0px 0px;"><i class="fa fa-person fa-2x"></i></span> 
							<select class="form-control" style="margin-right:30px;" id="inwon">
								<option selected>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
								<option>6</option>
								<option>7</option>
								<option>8</option>
								<option>9</option>
								<option>10</option>
							</select>
							<i class="fa fa-calendar fa-2x" style="padding:4px 10px 0px 0px"></i>
							<input type="text" class="form-control datepicker" value="" id="date" style="width:200px;" /> 
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-12">
				<div class="row">
					<input type="hidden" value="${ vo.huno }" id="huno">
					<div class="col-md-12" id="roomResult">
					
					</div>
				</div>
			</div>
			<div class="col-sm-12">
				<ul class="tabs">
					<li class="tab-item"><a href="#item1" class="actived">숙소소개</a></li>
					<li class="tab-item"><a href="#item2">이용안내</a></li>
					<li class="tab-item"><a href="#item3">취소/환불규정</a></li>
					<li class="tab-item"><a href="#item4">평점/리뷰</a></li>
					<li class="tab-item"><a href="#item5">지도</a></li>
				</ul>
				<div class="wrapper_tab-content">
					<article id="item1" class="tab-content content-visible">
						<table class="table">
							<tr>
								<td style="width:25%"><strong>숙소소개</strong></td>
								<td style="width:75%">
									<c:forTokens var="item" items="${ vo.content }" delims="^">
										<c:choose>
											<c:when test="${fn:contains(item, '**') || fn:contains(item, '※')
												 || fn:contains(item, '찾아오시는') || fn:contains(item, '바로가기')}">
											</c:when>
											<c:otherwise>
												<p>${ item }</p>
											</c:otherwise> 
										</c:choose> 
																				
										<c:if test="">
											
										</c:if>
									</c:forTokens>
								</td>
							</tr>
							<tr>
								<td style="width:25%"><strong>부대시설</strong></td>
								<td style="width:75%">
									<p>${ vo.etc }</p>
								</td>
							</tr>
						</table>
					</article>
					<article id="item2" class="tab-content">
						<table class="table">
							<tr>
								<td style="width:25%"><strong>이용안내</strong></td>
								<td style="width:75%">
									<p>
										<strong><font color="#3366ff">01. 제주도숙박 예약변경 및
												취소</font></strong><br> &nbsp;<font color="#333333"> </font><span
											style="color: #333333"><font color="#333333">①
												예약취소 : 숙박지 예약취소 처리는 전화통화를 통해서만 처리가 가능합니다.<br> &nbsp; ②
												예약변경 : 숙박지 예약변경은 최소 7일전 변경 통보시 처리가 가능합니다.<br> &nbsp; ③
												예약취소시 계약금 환불
										</font><br> - 예약을 취소할 경우 일정 수수료가 공제된 후 환불됩니다.<br> <font
											color="#ff6600"><strong>-</strong> </font><font
											color="#ff6600">이용당일과 이용 전날은 환불이 되지 않습니다.<br> -
												성수기,연휴 취소수수료는&nbsp;&nbsp;별도요금 적용됩니다.
										</font></span><br> <span style="color: #333333"><font
											color="#008080">-</font><font size="2" color="#008080">※
												취소수수료는 각 숙소 규정에 따라 변동이 있을 수 있으므로 유의하시기 바랍니다. (취소수수료 규정은 숙소별
												규정에 의거함.)</font></span><br> <br> <span style="color: #333333"><font
											size="2" color="#ff0000"><font color="#3366ff"><strong>02.
														제주도숙박 입금안내</strong><br> &nbsp;<span style="color: #333333">숙박예약은
														고객님의 숙박지에 입실하기전에 숙박지로 숙박료를 전액 입금을 해야 예약이&nbsp;확정되기 때문에<br>
														&nbsp;숙박료는 전액 입금을 해주셔야 예약 처리가 됨을 양해 바랍니다.
												</span></font></font></span>
									</p>

									<p>
										<span style="color: #333333"><font size="2"><span
												style="color: #333333"><font color="#3366ff"><strong>03.입금확인</strong><br>
														<span style="color: #333333">- 입금 하신 후 전화연락을 주시면 바로
															확인이 가능합니다.<br> - 입금하시면 고객님 예약하실 때 핸드폰 문자로 입금확인 문자를
															보내드리고 있습니다.<br> - 입금확인은 제주토리 홈페이지에서도 확인가능하십니다<font
															color="#0000ff">.(예약확인은 로그인 하지 않은상태에서 확인바랍니다.)</font>
													</span></font></span></font></span>
									</p>

									<p>
										<span style="color: #333333"><font size="2"><span
												style="color: #333333"><font color="#3366ff"><span
														style="color: #333333"><font color="#3366ff"><strong>04.유의사항</strong></font><br>
															<span style="color: #333333">- 예약보다 기준인원을 초과하여
																숙박지로 가셨을때 입실이 거부되는 경우도 있으니 예약시 여행 인원을 정확히 말씀하셔야 합니다.<br>
																<font color="#333333">♦ 입실시간 : 오후 3시부터 저녁9시까지
																	입니다. (저녁9시 이후 입실하실 경우 사전에 반드시 숙소로 연락해 주시기 바랍니다.)<br>
																	♦ 퇴실시간 : 오전 11시까지입니다<br> - 이용 중 집기 파손 및 분실시 실비로
																	변상을 해주셔야 합니다.<br> - 다른고객을 위하여 고성방가, 과다한 음주가무 등은
																	자제해 주세요.<br> - 사이트 이미지와 실제모습과 차이가 날수 있으므로 꼭 필요하신
																	시설(물품)이나 내용이 있으시면 전화상담을 통해 문의 바랍니다.<br> - 숙소의 산전망은
																	바다전망이 아닌 경우를 뜻합니다.
															</font>
														</span></span></font></span></font></span>
									</p>

									<p>
										<span style="color: #333333"><font size="2"><span
												style="color: #333333"><font color="#3366ff"><span
														style="color: #333333"><span style="color: #333333"><font
																color="#3366ff"><strong>05.이용안내</strong></font><br>
																- 모든 숙소는 투숙당일 취소시 전액환불 불가, 투숙일 이전 취소는 비수기/성수기/연휴별 별도
																취소수수료가 부과됩니다.<br> - 천재지변으로 인하여 투숙이 불가능할 경우 전액환불이
																됩니다.<br> &nbsp;<font color="#ff6600"> ♦ 투숙
																	당일날 결항통보 확정되어야 천재지변으로 취급합니다. <font color="#008080">(결항이
																		확정될 경우, 제주토리로 결항확인서를 보내주시기 바랍니다.)</font><br> &nbsp; ♦
																	예상되는 천재지변(태풍북상 등)으로 사전취소시에는 숙소 자체 규정에 따라 취소수수료가 부과됩니다.
															</font><br> - 특급호텔/호텔/리조트는 매월 요금이 변동되므로 홈페이지 내용과 다를 수 있습니다.<br>
																- 동물 반입은 절대 불가합니다. (당일 취소건으로 분류)<br> - 객실 사진의 과일세팅
																및 꽃은 촬영용입니다.</span></span></font></span></font></span>
									</p>

									<p>
										<span style="color: #333333"><font size="2"><span
												style="color: #333333"><font color="#3366ff"><span
														style="color: #333333"><span style="color: #333333"><font
																color="#3366ff"><strong>06.예약접수시 유의사항</strong></font><br>
																- 해당 숙소 정보는 실시간 예약시스템이 아닙니다.예약접수 후 예약가능 여부는 담당상담원이 전화를
																드립니다.</span></span></font></span></font></span>
									</p>

									<p>
										<strong><font color="#3366ff">♦ 업무시간(월~금
												09:00~17:00)에만 취소, 변경처리 업무가 가능합니다.</font></strong>
									</p>


								</td>
							</tr>
						</table>
					</article>

					<article id="item3" class="tab-content">
						<table class="table">
							<tr>
								<td style="width:25%"><strong>취소/환불규정</strong></td>
								<td style="width:75%">
									<p><strong>환불마감시간 	18시</strong></p>
									<p>1. 이용일 15일전 : 전액환불</p>
									<p>2. ~14일전 : 수수료 20%</p>
									<p>3. 13일~7일전 : 수수료 30%</p>
									<p>4. 6일~3일전 : 수수료 50%</p>
									<p>5. 2일전 : 수수료 80%</p>
									<p>6. 1일~당일 : 환불불가</p>
								</td>
							</tr>
						</table>
					</article>

					<article id="item4" class="tab-content">
						<h1>평점장소</h1>
					</article>
					
					<article id="item5" class="tab-content">
						<p style="margin-top:-12px">
						    <em class="link">
						        <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
						            ${ vo.addr2 }
						        </a>
						    </em>
						</p>
						<div id="map" style="width:100%;height:350px;"></div>
						
						<script>
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						    mapOption = {
						        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
						        level: 3 // 지도의 확대 레벨
						    };  
						
						// 지도를 생성합니다    
						var map = new kakao.maps.Map(mapContainer, mapOption); 
						
						// 주소-좌표 변환 객체를 생성합니다
						var geocoder = new kakao.maps.services.Geocoder();
						
						// 주소로 좌표를 검색합니다
						geocoder.addressSearch('${ vo.addr2 }', function(result, status) {
						
						    // 정상적으로 검색이 완료됐으면 
						     if (status === kakao.maps.services.Status.OK) {
						
						        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
						
						        // 결과값으로 받은 위치를 마커로 표시합니다
						        var marker = new kakao.maps.Marker({
						            map: map,
						            position: coords
						        });
						
						        // 인포윈도우로 장소에 대한 설명을 표시합니다
						        var infowindow = new kakao.maps.InfoWindow({
						            content: '<div style="width:150px;text-align:center;padding:6px 0;">${ vo.name }</div>'
						        });
						        infowindow.open(map, marker);
						
						        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
						        map.setCenter(coords);
						    } 
						});    
						</script>
					</article>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
