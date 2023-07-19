<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
#qna_table > thaed {
	font-size: 11pt;
	border-bottom: 1px solid;
}
#qna_table > tbody {
	font-size: 10pt;
}
.container2{
	margin: 0px auto;
}
</style>
</head>
<body>
<div class="container container2">
  <table class="table" id="qna_table">
    <thead>
      <tr style="border-bottom: 1px solid gray;">
      <th width=10% class="text-center">No</th>
      <th width=45% class="text-center">제목</th>
      <th width=15% class="text-center">작성자</th>
      <th width=15% class="text-center">등록일</th>
      <th width=15% class="text-center"></th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="vo" items="${list }" varStatus="s">
      <tr>
        <td width=10% class="text-center">${s.index+1 }</td>
        <td width=45% class="text-center">${vo.subject }</td>
        <td width=15% class="text-center">${vo.id }</td>
        <td width=15% class="text-center">${vo.dbday }</td>
		<td width=15% class="text-center">
		  <c:if test="${vo.isreply==0 }">
            <a href="../adminpage/adminqna_insert.do?no=${vo.no }" class="btn btn-sm" style="border-color: blue">답변대기</a>
          </c:if>
          <c:if test="${vo.isreply==1 }">
            <span class="btn btn-sm" style="border-color: gray">답변완료</span>
          </c:if>
          <span class="btn btn-sm" style="border-color: orange">내용보기</span>
		</td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
</div>
<div>

</div>
<div>
  <table class="table table-borderless">
	<tr>
      <td colspan=5 class="text-center">
        <a href="#" class="btn btn-sm btn-success">이전</a>
          ${curpage } page / ${totalpage } pages
        <a href="#" class="btn btn-sm btn-info">다음</a>
      </td>
    </tr>
  </table>
</div>
</body>
</html>