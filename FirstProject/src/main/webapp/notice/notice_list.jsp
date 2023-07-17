<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jeju Project</title>
<style type="text/css">
body{
	font-family: Arial;
}
.row1{
	margin: 0px auto;
	margin-bottom: 10px;
	width: 800px;	
}
.row1 ul li{
	display: inline;
}
.container1{
	margin: 0px auto;
	width: 1000px;
}
p{
	text-align: left;
	font-size: 13pt;
	margin: 5px;
}
</style>
</head>
<body>
<div class="page-heading">
  <div class="container">
    <div class="row">
      <div class="col-lg-8">
        <div class="top-text header-text">
        </div>
      </div>
    </div>
  </div>
</div>
<div class="container1">
  <h2>공지사항</h2>
  <p>총 ${count }건
    <c:if test="${sessionScope.admin=='y'}">
      <a href="../notice/notice_insert.do" class="btn btn-sm" style="border-color:gray;float:right">글작성</a>
    </c:if>
  </p>
  <table class="table table-striped">
    <thead style="border-top: 1px solid;">
      <tr>
        <th width=10% class="text-center">번호</th>
 		<th width=45% class="text-center">제목</th>
 		<th width=15% class="text-center">작성자</th>
 		<th width=20% class="text-center">작성일</th>
 		<th width=10% class="text-center">조회수</th>
      </tr>
    </thead>
    <tbody>
      <c:set var="no" value="${count }"/>
        <c:forEach var="vo" items="${list }">
          <tr>
            <td width=10% class="text-center">${no}</td>
            <td width=45%>
              <a href="../notice/notice_detail.do?no=${vo.no}" style="color: black">[${vo.type}]&nbsp;&nbsp;${vo.subject }</a>
              <c:if test="${today.equals(vo.dbday) }">
                <sub style="color: red">new</sub>
              </c:if>
            </td>
            <td width=15% class="text-center">${vo.name }</td>
            <td width=20% class="text-center">${vo.dbday }</td>
            <td width=10% class="text-center">${vo.hit }</td>
          </tr>
         <c:set var="no" value="${no-1 }"/>
      </c:forEach>
    </tbody>
  </table>
</div>
<div class="row1">
  <ul class="text-center">
    <li><a href="../notice/notice_list.do?page=${curpage>1?curpage-1:curpage}" class="btn btn-sm" style="background-color: #EEEEEE;">이전</a></li>
    <li>${curpage } / ${totalpage }</li>
    <li><a href="../notice/notice_list.do?page=${curpage<totalpage?curpage+1:curpage}" class="btn btn-sm" style="background-color: #E7E3E3">다음</a></li>
  </ul>
</div>
</body>
</html>