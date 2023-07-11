<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

<title>Jeju Project</title>

<!-- Bootstrap core CSS -->
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Additional CSS Files -->
<link rel="stylesheet" href="../assets/css/fontawesome.css">
<link rel="stylesheet" href="../assets/css/templatemo-plot-listing.css">
<link rel="stylesheet" href="../assets/css/animated.css">
<link rel="stylesheet" href="../assets/css/owl.css">
<style type="text/css">
.popular{
	margin-top: 100px;
}
.row1{
	margin: 0px auto;
	width: 800px;	
}
</style>
</head>
<body>
  <div class="popular-categories">
  <div class="row1">
  <h2 class="sectiontitle">공지사항</h2>
  <div style="height: 450px">
  <table class="table">
   <c:if test="${sessionScope.admin=='y'}">
    <tr>
      <td>
        <a href="../notice/notice_insert.do" class="btn btn-sm btn-danger">새글</a>
      </td>
    </tr>
    </c:if>
  </table>
  <table class="table">
    <tr>
      <th width=10% class="text-center">번호</th>
      <th width=45% class="text-center">제목</th>
      <th width=15% class="text-center">이름</th>
      <th width=20% class="text-center">작성일</th>
      <th width=10% class="text-center">조회수</th>
    </tr>
    <c:set var="count" value="${count }"/>
    <c:forEach var="vo" items="${list }">
      <tr>
        <td width=10% class="text-center">${count }</td>
        <td width=45%>
          <a href="../notice/notice_detail.do?no=${vo.no}">${vo.subject }</a>
          &nbsp;
          <c:if test="${today.equals(vo.dbday) }">
            <sub style="color: red">new</sub>
          </c:if>
        </td>
        <td width=15% class="text-center">${vo.name }</td>
        <td width=20% class="text-center">${vo.dbday }</td>
        <td width=10% class="text-center">${vo.hit }</td>
      </tr>
     <c:set var="count" value="${count-1 }"/>
    </c:forEach>
  </table>
  </div>
  </div>
</div>
</body>
</html>