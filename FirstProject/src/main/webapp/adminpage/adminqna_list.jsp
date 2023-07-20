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
.disabled {
    cursor: not-allowed;
    opacity: 0.5;
    pointer-events: none;
  }
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	  $('#qnaDetailBtn').click(function(){
	    let no = $(this).attr('data-no'); // 수정된 코드
	    let button = $(this);
	    let originalText = button.text();
	    button.text("취소");
	    $.ajax({
	      type: 'post',
	      url: '../adminpage/adminqna_detail.do',
	      data:{"no":no},
	      success:function(result){
	        $('#qnaContent').html(result);
	        // 이전 이벤트 제거
	        button.off('click').click(function(){
	          $('#qnaContent').empty();
	          button.text(originalText);
	          
	          // 다시 이벤트 추가
	          button.off('click').click(function(){
	            let no=$(this).data('no');
	            let button=$(this);
	            let originalText=button.text();
	            button.text("취소");
	            $.ajax({
	              type: 'post',
	              url: '../adminpage/adminqna_detail.do',
	              data:{"no":no},
	              success:function(result){
	                $('#qnaContent').html(result);
	                // 이전 이벤트 제거
	                button.off('click').click(function(){
	                  $('#qnaContent').empty();
	                  button.text(originalText);
	                });
	              }
	            });
	          });
	        });
	      }
	    });
	  });
	});
</script>
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
            <span class="btn btn-sm" style="border-color: gray;">답변완료</span>
          </c:if>
          <span class="btn btn-sm" id="qnaDetailBtn" style="border-color: orange" data-no="${vo.no}">내용보기</span>
		</td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
</div>
<div>
  <table class="table">
    <tr>
      <td>
        <span id="qnaContent"></span>
      </td>
    </tr>
  </table>
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