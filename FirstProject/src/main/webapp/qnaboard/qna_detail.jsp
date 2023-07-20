<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
	font-family: Arial;
}
.container1{
	margin: 0px auto;
	width: 1000px;
}
</style>
<script type="text/javascript">
$(function(){
	$('#del').click(function(){
		alert("정말 삭제하시겠습니까?")
		
		let no=$(this).attr('data-no')
		$.ajax({
			type:'post',
			url : '../qnaboard/qna_delete.do',
			data : {"no":no},
			success: function(result){
				location.href="../qnaboard/qna_list.do";
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
    
    <div style="margin-bottom: 20px;">
      <h2 style="display: inline">QnA</h2>
    </div>
    <table class="table">
      <tr style="border-top : 1px solid;background-color: #dedede;"><!-- #dedede -->
        <th width=5% class="text-center">제목 | </th>
        <td width=50% class="text-left">[${vo.type}]&nbsp;&nbsp;${vo.subject }</td>
        <th width=5% class="text-center">작성일</th>
        <td width=10% class="text-center">${vo.dbday }</td>
      </tr>
      <tr>
        <td colspan=6 valign="top" height="200">
          <pre style="white-space: pre-wrap;border: none;background-color: white">${vo.content }</pre>
        </td>
      </tr>
      <tr>
        <td colspan=6>
          <a href="../qnaboard/qna_list.do" class="btn btn-sm" style="border-color: gray">목록</a>
          <c:if test="${sessionScope.id==vo.id }">
            <span class="btn btn-sm" id="del" data-no="${vo.no }" style="border-color: gray;">삭제</span>
          </c:if>
        </td>
      </tr>
    </table>
  </main>
</div>
</body>
</html>