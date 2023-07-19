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
.activityImage{
	width: 100px;
	height: 100px;
	border-radius: 8px;
}
.container2{
	margin: 0px auto;
}
.container #activity_reserve tbody tr td {
	
	text-align: center;
}
</style>
</head>
<body>
<div class="container container2">
  <table class="table">
    <thead>
      <tr style="border-bottom: 1px solid gray;">
      <th >No</th>
      <th ></th>
      <th >상품명</th>
      <th >금액</th>
      <th >예약일</th>
      <th >예약자</th>
      <th ></th>
      </tr>
    </thead>
    <%-- <c:forEach var="vo" items="${list }"> --%>
      <tr>
        <td >1</td>
        <td >
          <img src="../adminpage/temp/activity.jpg" class="activityImage">
        </td>
        <td >[제주 애월] 9.81 파크 이용권</td>
        <td >28,615원</td>
        <td >2023-07-19</td>
        <td >심청이</td>
        <td >
          <input type=button class="btn btn-outline-danger" value="승인">
        </td>
      </tr>
    <%-- </c:forEach> --%>
  </table>
</div>
</body>
</html>