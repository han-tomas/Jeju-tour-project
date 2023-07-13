<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.main{
	margin: 0px auto
	margin-top: 100px
	width: 800px
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#del').click(function(){
		alert("정말 삭제하시겠습니까?")
		
		let no=$(this).attr('data-no')
		$.ajax({
			type:'post',
			url : '../notice/notice_delete.do',
			data : {"no":no},
			success: function(result){
				location.href="../notice/notice_list.do"
			}
		})
	})
})
</script>
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
  <main class="container clear">
    <h2 class="sectiontitle">글보기</h2>
    <table class="table">
      <tr>
        <th width=20% class="text-center">번호</th>
        <td width=30% class="text-center">${vo.no }</td>
        <th width=20% class="text-center">작성일</th>
        <td width=30% class="text-center">${vo.dbday }</td>
      </tr>
      <tr>
        <th width=20% class="text-center">이름</th>
        <td width=30% class="text-center">${vo.name }</td>
        <th width=20% class="text-center">조회수</th>
        <td width=30% class="text-center">${vo.hit }</td>
      </tr>
      <tr>
        <th width=20% class="text-center">제목</th>
        <td colspan=3>${vo.subject }</td>
      </tr>
      <tr>
        <td colspan=4 class="text-left" valign="top" height="200">
          <pre style="white-space: pre-wrap;border: none;background-color: white">${vo.content }</pre>
        </td>
      </tr>
      <tr>
        <td colspan=4 class="text-right">
          <c:if test="${sessionScope.admin=='y' }">
          <a href="../notice/notice_update.do?no=${vo.no }" class="btn btn-xs btn-info">수정</a>
          <span class="btn btn-xs btn-danger" id="del" data-no="${vo.no }">삭제</span>
          </c:if>
          <a href="../notice/notice_list.do" class="btn btn-xs btn-warning">목록</a>
        </td>
      </tr>
    </table>
  </main>
</div>
</body>
</html>