<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jeju Project</title>
<style type="text/css">
.row1{
	margin: 0px auto;
	width: 800px
}
</style>
<script type="text/javascript">
$(function(){
	$('#notiBtn').click(function(){
		   // 필수 입력 필드 배열
		   var requiredFields = ['name','subject','content'];
		   var isValid = true;
		   
		   // 필수 입력 필드를 순회하며 값이 비어있는지 확인
		   for (var i = 0; i < requiredFields.length; i++) {
		      var field = requiredFields[i];
		      var value = $('#' + field).val();
		      if (value === '') {
		         isValid = false;
		         break;
		      }
		   }
		   
		   if (!isValid) {
		      alert("필수 입력 내용을 모두 입력해주세요!");
		      return; // 입력값이 없을 경우 함수를 종료하고 이후 코드를 실행하지 않음
		   }
		   $('#frm').submit();
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
  <div class="row1">
  <h2 class="sectiontitle">공지사항</h2>
  <form method=post action="../notice/notice_insert_ok.do" id="frm">
  <table class="table">
    <tr>
      <th width=15%>구분</th>
      <td width=85%>
        <select name="type">
          <option>일반공지</option>
          <option>긴급공지</option>
          <option>이벤트 공지</option>
        </select>
      </td>
    </tr>
    <tr>
      <th width=15%>제목</th>
      <td width=85%>
        <input type=text name=subject id="subject" size=50 class="input-sm">
      </td>
    </tr>
    <tr>
      <th width=15%>내용</th>
      <td width=85%>
        <textarea rows="10" cols="50" id="content" name=content></textarea>
      </td> 
    </tr>
    <tr>
      <td colspan=2 class="text-center">
        <input type=button value="글쓰기" class="btn btn-sm btn-success" id="notiBtn">
        <input type=button value="취소" class="btn btn-sm btn-info" onclick="javascript:history.back()">
      </td>
    </tr>
  </table>
  </form>
  </div>
  </div>
</body>
</html>