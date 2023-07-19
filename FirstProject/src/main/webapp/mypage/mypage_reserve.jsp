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
								<td>${vo.regdate }</td>
								<td><a href="#" class="btn btn-outline-success">예약대기</a></td>
							</tr>
							<tr>
								<td rowspan="2" width="20%"><img
									src="${vo.poster }"
									class="reserveImg"></td>
								<td width="60%" style="font-size: 17px; font-weight: bold;"
									id="title">${vo.title }</td>
								<td width="20%"><a href="#"
									class="btn btn-outline-secondary">예약취소</a></td>
							</tr>
							<tr>
								<td width="60%" style="color: gray;">${vo.dbday }<span
									style="margin-left: 280px;">
								<fmt:formatNumber value="${vo.price }" pattern="#,###" />원
								</span></td>
								<td width="20%"><a href="#"
									class="btn btn-outline-secondary">리뷰작성</a></td>
							</tr>
						</table>
					</div>
				</c:forEach>
			</td>
		</tr>
	</table>
</body>
</html>