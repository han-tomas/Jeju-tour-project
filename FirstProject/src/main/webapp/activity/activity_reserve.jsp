<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
#agreeBtn1{
vertical-align: middle;
	margin-top: -10px;
	border: none;
	border-radius: 14px;
}
#agreeBtn2{
vertical-align: middle;
	margin-top: -10px;
	border: none;
	border-radius: 14px;
}
#agreeBtn3{
vertical-align: middle;
	margin-top: -12px;
	border: none;
	border-radius: 14px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
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
	})
</script>
<script type="text/javascript">
	Shadowbox.init({
		players : [ 'iframe' ]
	})
$(function(){
	$('#agreeBtn1').click(function() {
		Shadowbox.open({
			content : '../activity/agreeBtn1.do',
			player : 'iframe',
			width : 700,
			height : 600,
			title : '개인정보 제공 동의 (필수)'
		})
	})
	
	$('#agreeBtn2').click(function() {
		Shadowbox.open({
			content : '../activity/agreeBtn2.do',
			player : 'iframe',
			width : 700,
			height : 600,
			title : '개인정보 수집 및 이용 동의 (필수)'
		})
	})
	
	$('#agreeBtn3').click(function() {
		Shadowbox.open({
			content : '../activity/agreeBtn3.do',
			player : 'iframe',
			width : 700,
			height : 600,
			title : '개인정보 국외 이전 동의 (필수)'
		})
	})
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
						<td rowspan="2" width="20%"><img src="${vo.main_poster }"
							class="reserveImg"></td>
						<td width="80%" style="font-size: 17px; font-weight: bold;">${vo.title }</td>
					</tr>
					<tr>
						<td style="color: gray">${date }</td>
					</tr>
					<tr style="background-color: rgb(248, 249, 250)">
						<td width="20%">인원별 가격</td>
						<td width="80%" class="text-right"><fmt:formatNumber
								value="${vo.price }" pattern="#,###" />원</td>
					</tr>
					<tr style="background-color: rgb(248, 249, 250)">
						<td width="20%">인원수</td>
						<td width="80%" class="text-right">${people }명</td>
					</tr>
					<tr>
						<td width="20%">총 상품 금액</td>
						<td width="80%" class="text-right"><fmt:formatNumber
								value="${vo.price*people }" pattern="#,###" />원</td>
					</tr>
				</table>
				<div style="height: 20px"></div>
				<h4>
					<strong>예약자</strong>
				</h4>
				<hr>
				<table class="table">
					<tr>
						<td>${name }</td>
					</tr>
					<tr>
						<td>${mvo.email }</td>
					</tr>
					<tr>
						<td>${mvo.phone }</td>
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
								<td><fmt:formatNumber value="${vo.price*people }"
										pattern="#,###" />원</td>
							</tr>
							<tr height="60px;"
								style="vertical-align: middle; background-color: rgb(246, 251, 255);">
								<td style="color: rgb(80, 150, 230);"><strong>총 결제
										금액</strong></td>
								<td style="font-size: 20pt; color: rgb(80, 150, 230);"><b>
										<fmt:formatNumber value="${vo.price*people }" pattern="#,###" />원
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
													이용 동의 (필수) </label><button id="agreeBtn2">
													<img
														src="https://dffoxz5he03rp.cloudfront.net/icons/ic_arrowright_12x12_gray_500.svg"
														id="score_icon">
												</button></td>
										</tr>
										<tr>
											<td><input class="checkbox" style="zoom: 2.0;"
												type="checkbox" id="check3"> <label
												style="position: relative; bottom: 6px;">개인정보 국외 이전
													동의 (필수) </label><button id="agreeBtn3">
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
										<button class="btn btn-block btn-primary btn-wish"
											style="height: 50px;" disabled="disabled" id="buyBtn">
											<h5>
												<strong> <fmt:formatNumber
														value="${vo.price*people }" pattern="#,###" />원 결제하기
												</strong>
											</h5>
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