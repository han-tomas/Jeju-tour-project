<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.reserveImg {
	width: 120px;
	height: 120px;
	border-radius: 8px;
}

.table-reserve {
	width: 750px;
}

tr, td {
	border: none;
}
</style>
</head>
<body>
	<h1>예약페이지</h1>
	<table class="table table-borderless">
		<tr>
			<td>
				<c:forEach var="vo" items="${list }">
					<div
						style="border: solid 1px; border-color: orange; border-radius: 20px; width: 750px; padding: 20px 20px 0px 20px;">
						<table class="table table-reserve">
							<tr>
								<td style="font-size: 15pt; font-weight: bold;">결제완료</td>
								<td>${vo.realDate }</td>
								<td><button class="btn btn-outline-success" disabled>예약대기</button></td>
							</tr>
							<tr>
								<td rowspan="2" width="15%"><img
									src="${vo.poster }"
									class="reserveImg"></td>
								<td width="65%" style="font-size: 17px; font-weight: bold;"
									id="title">${vo.title }</td>
								<td width="15%"><a href="#" class="btn btn-outline-danger">예약취소</a></td>
							</tr>
							<tr>
								<td width="65%" style="color: gray;"><p>${vo.dbday }</p>
								<p style="text-align:right;margin-right: 30px;font-weight: bold;font-size: 18pt">${vo.price }</p>
								</td>
								<td width="20%"><a href="../review/insert.do"
									class="btn btn-outline-secondary">리뷰작성</a></td>
							</tr>
						</table>
					</div>
					<div style="height: 15px;"></div>
				</c:forEach>
				<%-- <div
						style="border: solid 1px; border-color: orange; border-radius: 20px; width: 750px; padding: 20px 20px 0px 20px;">
						<table class="table table-reserve">
							<tr>
								<td style="font-size: 15pt; font-weight: bold;">결제완료</td>
								<td>2023년 7월 19일(수)</td>
								<td><button class="btn btn-outline-success" disabled>예약대기</button></td>
							</tr>
							<tr>
								<td rowspan="2" width="20%"><img
									src="https://d6bztw1vgnv55.cloudfront.net/1504819/offer_photos/101144/603300_original_1681188403.jpg?width=480&height=360"
									class="reserveImg"></td>
								<td width="60%" style="font-size: 17px; font-weight: bold;"
									id="title">[제주 애월] 9.81 파크 이용권</td>
								<td width="20%"><a href="../mypage/reserve_cancel.do?no=${vo.no }" class="btn btn-outline-secondary">예약취소</a></td>
							</tr>
							<tr>
								<td width="60%" style="color: gray;">2023년 7월 28일 - 2023년 7월 29일<span
									style="margin-left: 280px;">
								1,000,000원
								</span></td>
								<td width="20%"><a href="../review/insert.do"
									class="btn btn-outline-secondary">리뷰작성</a></td>
							</tr>
						</table>
					</div>
					<div style="height: 15px;"></div>
					<div
						style="border: solid 1px; border-color: orange; border-radius: 20px; width: 750px; padding: 20px 20px 0px 20px;">
						<table class="table table-reserve">
							<tr>
								<td style="font-size: 15pt; font-weight: bold;">결제완료</td>
								<td>2023년 7월 19일(수)</td>
								<td><button class="btn btn-success" disabled>예약승인</button></td>
							</tr>
							<tr>
								<td rowspan="2" width="15%"><img
									src="https://d6bztw1vgnv55.cloudfront.net/1504819/offer_photos/101144/603300_original_1681188403.jpg?width=480&height=360"
									class="reserveImg"></td>
								<td width="65%" style="font-size: 17px; font-weight: bold;"
									id="title">[제주 애월] 9.81 파크 이용권</td>
								<td width="15%"><a href="../mypage/reserve_cancel.do?no=${vo.no }" class="btn btn-outline-danger">예약취소</a></td>
							</tr>
							<tr>
								<td width="65%" style="color: gray;"><p>2023년 7월 28일-2023년 7월 29일</p>
								<p style="text-align:right;margin-right: 30px;font-weight: bold;font-size: 18pt">1,000,000원</p>
								</td>
								<td width="20%"><a href="../review/insert.do"
									class="btn btn-outline-secondary">리뷰작성</a></td>
							</tr>
						</table>
					</div> --%>
			</td>
		</tr>
	</table>
</body>
</html>