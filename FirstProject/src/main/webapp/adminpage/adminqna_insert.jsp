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
	$('#replyBtn').click(function(){
		   // 필수 입력 필드 배열
		   var requiredFields = ['subject','content'];
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
  <div class="container1">
  <div class="row1">
  <h2 class="sectiontitle" style="border-bottom: 1px solid gray;">답변하기</h2>
  <form method=post action="../adminpage/adminqna_insert_ok.do" id="frm">
  <table class="table">
    <tr>
      <th width=15% class="text-center">구분</th>
      <td width=85%>
        <select name="type">
          <option>답변완료</option>
        </select>
      </td>
    </tr>
    <tr>
      <th width=15% class="text-center">제목</th>
      <td width=85%>
        <input type=text name=subject id="subject" size=50 class="input-sm">
        <input type=hidden name=qno value="${no }">
      </td>
    </tr>
    <tr>
      <th width=15% class="text-center">내용</th>
      <td width=85%>
        <textarea rows="10" cols="50" id="content" name=content></textarea>
      </td> 
    </tr>
    <tr>
      <td colspan=2 class="text-center">
        <input type=button value="답변" class="btn btn-sm" style="border-color: gray;" id="replyBtn">
        <input type=button value="취소" class="btn btn-sm" style="border-color: gray;" onclick="javascript:history.back()">
      </td>
    </tr>
  </table>
  </form>
  </div>
  </div>
</body>
</html>