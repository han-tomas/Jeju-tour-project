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
.table-reserve{
	width: 750px;
}
tr{
	border:none;
}

</style>
</head>
<body>
	<h1>예약페이지</h1>
	<table class="table">
	<tr>
		<td>
		<table class="table table-reserve">
			<tr>
				<td style="font-size: 15pt; font-weight: bold;">결제완료</td>
				<td> regdate </td>
				<td><a href="#" class="btn btn-outline-success">예약대기</a></td>
			</tr>
			<tr>
				<td rowspan="2" width="20%"><img
					src="https://d6bztw1vgnv55.cloudfront.net/1504819/offer_photos/101144/603300_original_1681188403.jpg?width=480&height=360"
					class="reserveImg"></td>
				<td width="60%" style="font-size: 17px; font-weight: bold;"
					id="title">title!!</td>
				<td width="20%"><a href="#" class="btn btn-outline-secondary">예약취소</a></td>
			</tr>
			<tr>
				<td width="60%" style="color: gray;">dbday!!<span style="margin-left: 280px;">1,000,000원</span></td>
				<td width="20%"><a href="#" class="btn btn-outline-secondary">리뷰작성</a></td>
			</tr>
		</table>
		</td>
		</tr>
	</table>
</body>
</html>