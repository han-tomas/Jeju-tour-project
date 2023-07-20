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
			<td><c:forEach var="vo" items="${list }">
					<div
						style="border: solid 1px; border-color: orange; border-radius: 20px; width: 750px; padding: 20px 20px 0px 20px;">
						<table class="table table-reserve">
							<tr>
								<td style="font-size: 15pt; font-weight: bold;">결제완료</td>
								<td>${vo.realDate }</td>
								<td><button class="btn btn-outline-success" disabled>예약대기</button></td>
							</tr>
							<tr>
								<td rowspan="2" width="15%"><img src="${vo.poster }"
									class="reserveImg"></td>
								<td width="65%" style="font-size: 17px; font-weight: bold;"
									id="title">${vo.title }</td>
								<td width="15%"><a href="#" class="btn btn-outline-danger">예약취소</a></td>
							</tr>
							<tr>
								<td width="65%" style="color: gray;"><p>${vo.dbday }</p>
									<p
										style="text-align: right; margin-right: 30px; font-weight: bold; font-size: 18pt">
										<fmt:formatNumber value="${vo.tprice }" pattern="#,###" />
										원
									</p></td>
								<td width="20%"><a href="../review/insert.do"
									class="btn btn-outline-secondary">리뷰작성</a></td>
							</tr>
						</table>
					</div>
					<div style="height: 15px;"></div>
				</c:forEach></td>
		</tr>
	</table>
	<div class="pagination" style="justify-content: center; padding-right: 140px;">
		<c:if test="${startPage > 1}">
			<a href="../mypage/mypage_reserve.do?page=${startPage-1 }" class="page-link" data-page="${startPage - 1}">&laquo;</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href="../mypage/mypage_reserve.do?page=${i }" class="page-link" data-page="${i}">${i}</a>
		</c:forEach>
		<c:if test="${endPage < totalpage}">
			<a href="../mypage/mypage_reserve.do?page=${endPage+1 }" class="page-link" data-page="${endPage + 1}">&raquo;</a>
		</c:if>
	</div>
</body>
</html>