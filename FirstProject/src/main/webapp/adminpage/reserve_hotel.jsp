<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
.hotelImage{
	width: 100px;
	height: 100px;
	border-radius: 8px;
}
.container2{
	margin: 0px auto;
}
.container #activity_reserve tbody tr td, thead tr td {
	vertical-align: middle;
	text-align: center;
}
</style>
</head>
<body>
<div class="container container2">
  <table class="table">
    <thead>
      <tr style="border-bottom: 1px solid gray;">
      <th>No</th>
      <th></th>
      <th>숙소명</th>
      <th>이용기간</th>
      <th>총금액</th>
      <th>예약자</th>
      <th></th>
      </tr>
    </thead>
    <c:forEach var="vo" items="${list }">
      <tr>
        <td >${vo.jrno }</td>
        <td >
          <img src="${vo.poster }" class="hotelImage">
        </td>
        <td >${vo.title }</td>
        <td >
		<fmt:formatNumber value="${vo.tprice }" pattern="#,###" />원
		</td>
        <td >${vo.dbday }</td>
        <td >${vo.rname }</td>
        <td >
          	<c:if test="${vo.rok=='n' }">
	        <a href="../adminpage/admin_reserve_ok.do?jrno=${vo.jrno }" class="btn btn-outline-danger">승인대기</a>
	      </c:if>
	      <c:if test="${vo.rok=='y' }">
	        <button class="btn btn-outline-secondary" disabled>승인완료</button>
	      </c:if>
        </td>
      </tr>
    </c:forEach>
  </table>
</div>
</body>
</html>