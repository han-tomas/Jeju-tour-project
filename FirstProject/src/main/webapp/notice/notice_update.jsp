<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.row{
	margin: 0px auto
	width: 600px
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script>
$(function(){
	$('#update').click(function(){
		alert('수정하시겠습니까?')
		let no=$(this).attr("data-no")
		let name=$('#name').val()
		let subject=$('#subject').val()
		let content=$('#content').val()
		let type=$('#type').val()
		$.ajax({
			type: 'post',
			url : '../notice/notice_update_ok.do',
			data : {"no":no,"subject":subject,"content":content,"type":type},
			success : function(result){
				location.href='../notice/notice_detail.do?no='+no;
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
  <h2 class="sectiontitle">수정하기</h2>
  <div class="row">
  <table class="table">
    <tr>
      <th width=15%>유형</th>
      <td width=85%>
        <select name="type" id="type">
          <option>일반공지</option>
          <option>긴급공지</option>
          <option>이벤트 공지</option>
        </select>
      </td>
    </tr>
    <tr>
      <th width=15%>제목</th>
      <td width=85%>
        <input type=text name=subject id=subject size=50 class="input-sm" value="${vo.subject }">
        <input type=hidden name=no value="${vo.no }">
      </td>
    </tr>
    <tr>
      <th width=15%>내용</th>
      <td width=85%>
        <textarea rows="10" cols="50" id=content name=content>${vo.content }</textarea>
      </td> 
    </tr>
    <tr>
      <td colspan=2 class="text-center">
        <input type=button value="수정" class="btn btn-sm btn-success" id="update" data-no="${vo.no }">
        <input type=button value="취소" class="btn btn-sm btn-info" onclick="javascript:history.back()">
      </td>
    </tr>
  </table>
  </div>
  </main>
</div>
</html>