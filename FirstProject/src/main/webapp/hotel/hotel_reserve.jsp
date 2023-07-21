<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.row{
	margin: 0px auto;
	width:1100px;
}
.reserveImg{
	width:120px;
	height:120px;
	border-radius: 8px;
}
.buyBox {
	width: 400px;
}
#thunderImg{
	width:28px;
	height: 33px;
}
.text-right {
	text-align: right !important;
}
.btn-buy{
	width: 300px;
	height: 50px;	
}
.btn-wish{
	width: 300px;
	height: 40px;
}
.buyTd{
	stext-align: center;
	margin:10px;
}
.wishTd{
	stext-align: center;
	margin:10px;
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
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript">
$(function(){
	$('#checkall').click(function(){ 
	    if($('#checkall').is(':checked')){ 
	        $('.checkbox').prop("checked",true); 
	        $('#reserveBtn').prop("disabled",false);
	        $('#agreeMsg').hide();
	    }else{ 
	        $('.checkbox').prop("checked",false); 
	        $('#reserveBtn').prop("disabled",true);
	        $('#agreeMsg').show();
	    } 
	}); 
	$('.checkbox').click(function(){
		if($('#check1').is(':checked') && $('#check2').is(':checked')
				&& $('#check3').is(':checked')) {
			$('#checkall').prop("checked",true); 
			$('#reserveBtn').prop("disabled",false);
			$('#agreeMsg').hide();
		} else {
			$('#checkall').prop("checked",false);
			$('#reserveBtn').prop("disabled",true);
			$('#agreeMsg').show();
		}
	})
})
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
	
	let name=$('#name').val();
	let email=$('#email').val();
	let phone=$('#phone').val();
	let rno=$('#rno').val();
	let startDate=$('#startDate').val();
	let endDate=$('#endDate').val();
	let inwon=$('#inwon').val();
	let price=$('#price').val();
	let tprice=$('#tprice').val();
	let date=$('#date').val();
	let poster=$('#poster').val();
	let title=$('#title').val();
	$('#reserveBtn').click(function(){
		$.ajax({
			type:'post',
			url:'../mypage/mypage_hotel_reserve.do',
			data:{"name":name,"email":email,"phone":phone,"rno":rno,"startDate":startDate,
				"endDate":endDate,"inwon":inwon,"price":price,"tprice":tprice,"date":date,
				"poster":poster,"title":title},
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
    name : $('#title').val(),
    amount : $('#tprice').attr('data-price'),
    buyer_email : $('#email').val(),
    buyer_name : $('#name').val(),
    buyer_tel : $('#phone').val(),
    buyer_addr : $('#addr1').val(),
    buyer_postcode : $('#post').val(),
    app_scheme : 'iamporttest' //in app browser결제에서만 사용 
}, function(rsp) {
	    if ( rsp.success ) {
	        var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	    } else {
	    	location.href="../mypage/mypage_reserve.do";
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
				<h3><strong>예약하기</strong></h3>
				<div style="height: 30px"></div>
				<h4><strong>상품정보</strong></h4>
				<hr>
				<table class="table">
					<tr>
						<td rowspan="3" width="20%">
							<img src="${ vo.rposter }" class="reserveImg">
						</td>
						<td width="20%">숙소명</td>
						<td width="60%" colspan="2"><h3>${ hname }</h3></td>
					</tr>
					<tr style="background-color: rgb(248,249,250)">
						<td>객실타입</td>
						<td style="color:gray" colspan="2"><h5>${ vo.rname }</h5></td>
					</tr>
					<tr>
						<td width="20%">이용기간</td>
						<td width="45%" style="color:gray">${ date } &nbsp;<span style="color:red;">·${ days }박</span></td>
						<td width="15%" style="color:gray">&nbsp;&nbsp;&nbsp;&nbsp;인원 : ${ inwon }명</td>
					</tr>
					<tr style="background-color: rgb(248,249,250)">
						<td width="20%"></td>
						<td width="20%">1박당 가격</td>
						<td width="60%" class="text-right" colspan="3">
							<fmt:formatNumber value="${ vo.price }" pattern="#,###" />원
						</td>
					</tr>
					<tr>
						<td width="20%"></td>
						<td width="20%">인원별 가격</td>
						<td width="60%" class="text-right" colspan="3">
							<fmt:formatNumber value="${ vo.price }" pattern="#,###" />원
						</td>
					</tr>
					<tr style="background-color: rgb(248,249,250)">
						<td width="20%"></td>					
						<td width="20%">총 상품 금액</td>					
						<td width="60%" class="text-right" colspan="3">
							<fmt:formatNumber value="${ vo.price * days}" pattern="#,###" />원
						</td>					
					</tr>
				</table>
				<div style="height: 20px"></div>
				<h4><strong>예약자</strong></h4>
				<hr>
				<table class="table">
					<tr>
						<td>${ mvo.name }</td>
					</tr>
					<tr>
						<td>
							${ mvo.email }
						</td>
					</tr>
					<tr>
						<td>
							${ mvo.phone }
						</td>
					</tr>
				</table>
				
				<div style="height: 20px"></div>
				<h4><strong>결제 방법</strong></h4>
				<hr>
			</div>
			<div class="col-sm-4" style="color:black" id="yourDiv">
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
							<tr height="60px;" style="vertical-align: middle;font-size: 10pt;">
								<td>주문 금액</td>
								<td>
									<fmt:formatNumber value="${ vo.price * days}" pattern="#,###" />원
								</td>
							</tr>
							<tr height="60px;" style="vertical-align: middle;background-color: rgb(246,251,255);">
								<td style="color: rgb(80,150,230);"><strong>총 결제 금액</strong></td>
								<td style="font-size: 20pt;color: rgb(80,150,230);"><b>
									<fmt:formatNumber value="${ vo.price * days }" pattern="#,###" />원
									</b>
								</td>
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
										<!-- <tr id="refuseMsg">
											<td style="color: red;"></td>
										</tr> -->
									</table></td>
							</tr>
							<tr>
								<td colspan="2" class="center wishTd">
								<div class="d-grid">
										<input type="hidden" name="rno" id="rno" value="${ vo.rno }"/>
										<input type="hidden" name="startDate" id="startDate" value="${ startDate }"/>
										<input type="hidden" name="endDate" id="endDate"  value="${ endDate }"/>
										<input type="hidden" name="inwon" id="inwon"  value="${ inwon }"/>
										<input type="hidden" name="price" id="price"  value="${ vo.price }"/>
										<input type="hidden" name="tprice" id="tprice" data-price="${ vo.price * days }"  value="${ vo.price * days }"/>
										<input type="hidden" name="name" id="name"  value="${ mvo.name }"/>
										<input type="hidden" name="email" id="email"  value="${ mvo.email }"/>
										<input type="hidden" name="phone" id="phone"  value="${ mvo.phone }"/>
										<input type="hidden" name="date" id="date"  value="${ date }"/>
										<input type="hidden" name="poster" id="poster"  value="${ vo.rposter }"/>
										<input type="hidden" name="title" id="title"  value="${ hname }"/>
										<input type="hidden" name="addr1" id="addr1"  value="${ mvo.addr1 }"/>
										<input type="hidden" name="post" id="post"  value="${ mvo.post }"/>
									<button class="btn btn-block btn-primary btn-wish" style="height: 50px;" disabled="disabled" id="reserveBtn">
										<h5>
										<strong>
										<fmt:formatNumber value="${ vo.price * days }" pattern="#,###" />원 결제하기
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