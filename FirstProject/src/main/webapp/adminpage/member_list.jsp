<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<style>
body{
	font-family: "Open Sans", sans-serif;
}
#member_table > thaed {
	font-size: 11pt;
	border-bottom: 1px solid;
}
#member_table > tbody {
	font-size: 10pt;
}
.container2{
	margin: 0px auto;
}
</style>
</head>
<body>
<div class="container container2">
  <table class="table" id="member_table">
    <thead>
      <tr style="border-bottom: 1px solid gray;">
      <th class="text-center">등록일</th>
      <th class="text-center">아이디</th>
      <th class="text-center">비밀번호</th>
      <th class="text-center">이메일</th>
      <th class="text-center">연락처</th>
      <th class="text-center">성별</th>
      <th class="text-center">생년월일</th>
      <th>주소</th>
      <th class="text-center">관리자</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="vo" items="${list }">
      <tr>
        <td class="text-center">${vo.db_date }</td>
        <td class="text-center">${vo.id }</td>
        <td class="text-center">${vo.pwd }</td>
        <td class="text-center">${vo.email }</td>
        <td class="text-center">${vo.phone }</td>
        <td class="text-center">${vo.sex }</td>
        <td class="text-center">${vo.birth }</td>
        <td>${vo.addr1 }</td>
        <td class="text-center">${vo.admin }</td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
</div>
</body>
</html>