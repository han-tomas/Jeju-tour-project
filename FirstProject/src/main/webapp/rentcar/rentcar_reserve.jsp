<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.row {
	margin: 0px auto;
	width: 1100px;
}

.reserveImg {
	width: 120px;
	height: 120px;
	border-radius: 8px;
}

.buyBox {
	position: fixed;
	width: 400px;
}

#thunderImg {
	width: 28px;
	height: 33px;
}

.text-right {
	text-align: right !important;
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

#score_icon {
	width: 10px;
	height: 10px;
	vertical-align: middle;
	margin-top: -5px;
}

#agreeBtn1 {
	vertical-align: middle;
	margin-top: -10px;
	border: none;
	border-radius: 14px;
}

#agreeBtn2 {
	vertical-align: middle;
	margin-top: -10px;
	border: none;
	border-radius: 14px;
}

#agreeBtn3 {
	vertical-align: middle;
	margin-top: -12px;
	border: none;
	border-radius: 14px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>

<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript">
	Shadowbox.init({
		players : [ 'iframe' ]
	})
	$(function() {
		$('#checkall').click(function() {
			if ($('#checkall').is(':checked')) {
				$('.checkbox').prop("checked", true);
				$('#buyBtn').prop("disabled", false);
				$('#agreeMsg').hide();
			} else {
				$('.checkbox').prop("checked", false);
				$('#buyBtn').prop("disabled", true);
				$('#agreeMsg').show();
			}
		});
		$(window).scroll(
				function() {
					$("#yourDiv").css("margin-top",
							Math.max(-450, 0 - $(this).scrollTop()));
				});
		$('#agreeBtn1').click(function() {
			Shadowbox.open({
				content : '../rentcar/agreeBtn1.do',
				player : 'iframe',
				width : 700,
				height : 600,
				title : '개인정보 제공 동의 (필수)'
			})
		})

		$('#agreeBtn2').click(function() {
			Shadowbox.open({
				content : '../rentcar/agreeBtn2.do',
				player : 'iframe',
				width : 700,
				height : 600,
				title : '개인정보 수집 및 이용 동의 (필수)'
			})
		})

		$('#agreeBtn3').click(function() {
			Shadowbox.open({
				content : '../rentcar/agreeBtn3.do',
				player : 'iframe',
				width : 700,
				height : 600,
				title : '개인정보 국외 이전 동의 (필수)'
			})
		})
		let cid = $('#buyBtn').attr("data-no");
		//let price = $('#price').val();
		let tprice = $('#total_price').attr('data-total');
		let dbday = $('#dbday').val();
		let startDate = $('#startDate').val();
		let endDate = $('#endDate').val();
		
		$('#buyBtn').click(function(){
			$.ajax({
				type:'post',
				url:'../mypage/mypage_rentcar_reserve.do',
				data:{"cid":cid,"tprice":tprice,"dbday":dbday,"startDate":startDate,"endDate":endDate},
				success:function(result){
					requestPay()
				}
			})
	})
	})
	var IMP = window.IMP; // 생략 가능
		IMP.init("imp36806187"); // 예: imp00000000
		function requestPay() {
			console.log('clicked');
			// IMP.request_pay(param, callback) 결제창 호출
			IMP.request_pay({
				pg : 'html5_inicis', // version 1.1.0부터 지원.
				/*
				    'kakao':카카오페이,
				    'inicis':이니시스, 'html5_inicis':이니시스(웹표준결제),
				    'nice':나이스,
				    'jtnet':jtnet,
				    'uplus':LG유플러스
				 */
				pay_method : 'card', // 'card' : 신용카드 | 'trans' : 실시간계좌이체 | 'vbank' : 가상계좌 | 'phone' : 휴대폰소액결제
				merchant_uid : 'merchant_' + new Date().getTime(),
				name :  $('#name').text() ,
				amount : $('#total_price').attr('data-total'),
				buyer_email : $('#email').text(),
				buyer_name : $('#name').text(),
				buyer_tel : $('#phone').text(),
				buyer_addr : $('#addr1').val(),
				buyer_postcode : $('#post').val(),
				app_scheme : 'iamporttest' //in app browser결제에서만 사용 
			}, function(rsp) {
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;
				} else {
					location.href = "../mypage/mypage_reserve.do";
				}
			});
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
	<div class="container">
		<div class="row">
			<div class="col-sm-8">
				<h3>
					<strong>예약하기</strong>
				</h3>
				<div style="height: 30px"></div>
				<h4>
					<strong>상품정보</strong>
				</h4>
				<hr>
				<table class="table">
					<tr>
						<td rowspan="3" width="20%"><img
							src="https://rentinjeju.com${vo.img }" class="reserveImg"></td>
						<td width="80%" style="font-size: 17px; font-weight: bold;">${vo.car_name }</td>
					</tr>
					<tr>
						<td style="color: gray">${date }</td>
					</tr>
					<tr>
						<td style="color: gray"></td>
					</tr>
					<tr style="background-color: rgb(248, 249, 250)">
						<td width="20%">1일 대여 가격</td>
						<td width="80%" class="text-right"><fmt:formatNumber
								value="${vo.price }" pattern="#,###" />원</td>
					</tr>
					<tr style="background-color: rgb(248, 249, 250)">
						<td width="20%">대여 일수</td>
						<td width="80%" class="text-right">${days }일</td>
					</tr>
					<tr style="background-color: rgb(248, 249, 250)">
						<td width="20%">보험 종류</td>
						<td width="80%" class="text-right">${insOpt}</td>
					</tr>
					<tr style="background-color: rgb(248, 249, 250)">
						<td width="20%">보험비</td>
						<td width="80%" class="text-right">${insPrice }원</td>
					</tr>
					<tr>
						<td width="20%">최종 금액</td>
						<td width="80%" class="text-right"><fmt:formatNumber
								value="${vo.price*days+insPrice }" pattern="#,###" />원</td>
					</tr>
				</table>
				<div style="height: 20px"></div>
				<h4>
					<strong>예약자</strong>
				</h4>
				<hr>
				<table class="table">
					<tr>
						<td id="name">${name }</td>
					</tr>
					<tr>
						<td id="email">${mvo.email }</td>
					</tr>
					<tr>
						<td id="phone">${mvo.phone }</td>
					</tr>
				</table>

				<div style="height: 20px"></div>
				<h4>
					<strong>결제 방법</strong>
				</h4>
				<hr>
				<div style="height: 1000px"></div>
			</div>
			<div class="col-sm-4" style="color: black" id="yourDiv">
				<div class="buyBox">
					<div class="buyBoxContent">
						<table class="table buyBoxAll">
							<tr>
								<td colspan="2">
									<div style="height: 15px;"></div>
									<h4>
										<strong>결제 정보</strong>
									</h4>
									<hr>
								</td>
							</tr>
							<tr height="60px;"
								style="vertical-align: middle; font-size: 10pt;">
								<td>주문 금액</td>
								<td><fmt:formatNumber value="${vo.price*days+insPrice }" pattern="#,###" />원</td>
							</tr>
							<tr height="60px;"
								style="vertical-align: middle; background-color: rgb(246, 251, 255);">
								<td style="color: rgb(80, 150, 230);"><strong>총 결제
										금액</strong></td>
								<td style="font-size: 20pt; color: rgb(80, 150, 230);"><b>
										<fmt:formatNumber value="${vo.price*days+insPrice }"
											pattern="#,###" />원
								</b></td>
							</tr>
							<tr>
								<td colspan="2">
									<div style="height: 20px;"></div>
									<h4>
										<strong>약관 안내</strong>
									</h4>
									<hr>
								</td>
							</tr>
							<tr>
								<td colspan="2"><input class="checkbox" style="zoom: 2.0;"
									type="checkbox" id="checkall"> <label
									style="position: relative; bottom: 6px;">전체 약관 동의</label>
									<table class="table buyBoxAll" style="font-size: 12pt;">
										<tr>
											<td><input class="checkbox" style="zoom: 2.0;"
												type="checkbox" id="check1"> <label
												style="position: relative; bottom: 6px;">개인정보 제공 동의
													(필수) </label>
												<button id="agreeBtn1">
													<img
														src="https://dffoxz5he03rp.cloudfront.net/icons/ic_arrowright_12x12_gray_500.svg"
														id="score_icon">
												</button></td>
										</tr>
										<tr>
											<td><input class="checkbox" style="zoom: 2.0;"
												type="checkbox" id="check2"> <label
												style="position: relative; bottom: 6px;">개인정보 수집 및
													이용 동의 (필수) </label>
											<button id="agreeBtn2">
													<img
														src="https://dffoxz5he03rp.cloudfront.net/icons/ic_arrowright_12x12_gray_500.svg"
														id="score_icon">
												</button></td>
										</tr>
										<tr>
											<td><input class="checkbox" style="zoom: 2.0;"
												type="checkbox" id="check3"> <label
												style="position: relative; bottom: 6px;">개인정보 국외 이전
													동의 (필수) </label>
											<button id="agreeBtn3">
													<img
														src="https://dffoxz5he03rp.cloudfront.net/icons/ic_arrowright_12x12_gray_500.svg"
														id="score_icon">
												</button></td>
										</tr>
										<tr id="agreeMsg">
											<td style="color: orange; font-size: 10pt;">약관에 동의해주세요.</td>
										</tr>
									</table></td>
							</tr>
							<tr>
								<td colspan="2" class="center wishTd">
									<div class="d-grid">
										<input type="hidden" id="total_price" data-total="${vo.price*days+insPrice }"> 
											<input type="hidden" id="post" value="${mvo.post }"> 
											<input type="hidden" id="addr1" value="${mvo.addr1 }">
											<input type="hidden" id="dbday" value="${date }">
											<input type="hidden" id="startDate" value="${startDate }">
											<input type="hidden" id="endDate" value="${endDate }">
										<c:if test="${sessionScope.id!=null }">
											<button class="btn btn-block btn-primary btn-wish"
												style="height: 50px;" disabled="disabled" id="buyBtn"
												data-no="${vo.cid }">
												<h5>
													<strong> <fmt:formatNumber
															value="${vo.price*days+insPrice }" pattern="#,###" />원
														결제하기
													</strong>
												</h5>
											</button>
										</c:if>
									</div> <%-- <div class="d-grid">
										<c:if test="${sessionScope.id==null }">
										<button class="btn btn-block btn-primary btn-wish"
											style="height: 50px;" disabled="disabled" id="NbuyBtn">
											<h5>
												<strong> 로그인 하세요
												</strong>
											</h5>
										</button>
										</c:if>
									</div> --%>
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