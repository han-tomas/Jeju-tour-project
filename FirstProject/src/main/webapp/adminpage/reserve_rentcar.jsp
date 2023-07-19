<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
.rentcarImage{
	width: 100px;
	height: 100px;
	border-radius: 8px;
}
.container2{
	margin: 0px auto;
}
.container #activity_reserve thead tr th {
  justify-content: center;
}
.container #activity_reserve tbody tr td {
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
      <th>차종</th>
      <th>이용기간</th>
      <th>총금액</th>
      <th>예약자</th>
      <th></th>
      </tr>
    </thead>
    <%-- <c:forEach var="vo" items="${list }"> --%>
      <tr>
        <td >1</td>
        <td >
          <img src="../adminpage/temp/rentcar.jpg" class="rentcarImage">
        </td>
        <td>그랜드스타렉스 12인승</td>
        <td>2023-07-19(수) ~ 2023-07-19(수)</td>
        <td>15,900원</td>
        <td>심청이</td>
        <td>
          <input type=button class="btn btn-outline-danger" value="승인">
        </td>
      </tr>
    <%-- </c:forEach> --%>
  </table>
</div>
</body>
</html>