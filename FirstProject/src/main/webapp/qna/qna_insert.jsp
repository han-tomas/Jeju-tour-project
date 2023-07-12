<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function QnA_insert(){
	// 유효성 검사
	// form을 읽기
	let frm=document.frm; // 오라클에서 NOT NULL
	// HTML 문서의 frm이라는 이름을 가진 폼 요소를 변수 frm에 할당합니다. 이를 통해 폼 요소에 접근할 수 있습니다.
	// 폼 요소의 이름(name) 속성을 통해 해당 필드를 식별하고 접근하는 방법
	if(frm.name.value=="")
	{
		frm.name.focus();
		return;
	}
	if(frm.subject.value=="")
	{
		frm.subject.focus();
		return;
	}
	if(frm.content.value=="")
	{
		frm.content.focus();
		return;
	}
	if(frm.pwd.value=="")
	{
		frm.pwd.focus();
		return;
	}
	frm.submit(); // submit버튼을 함수화
}
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
<div class="container mt-3">
  <h2>Question</h2>
  	<div style="height: 20px"></div>
  	<div class="row">
  	 <form method=post action="../qna/qna_insert_ok.do" name="frm">
  	 <table class="table">
  	 	<tr>
  	 		<th width=15%>이름</th>
  	 		<td width=85%>
  	 			<input type=text name="name" size=20 class="input-sm">
  	 		</td>
  	 	</tr>
  	 	<tr>
  	 		<th width=15%>제목</th>
  	 		<td width=85%>
  	 			<input type=text name="subject" size=50 class="input-sm" >
  	 		</td>
  	 	</tr>
  	 	<tr>
  	 		<th width=15%>내용</th>
  	 		<td width=85%>
  	 			<textarea rows="10" cols="50" name="content" ></textarea>
  	 		</td>
  	 	</tr>
  	 	<tr>
  	 		<th width=15%>비밀번호</th>
  	 		<td width=85%>
  	 			<input type=password name="pwd" size=10 class="input-sm">
  	 		</td>
  	 	</tr>
  	 	<tr>
  	 		<td colspan="2" class="text-center">
  	 			<input type=button value="글쓰기" class="btn btn-sm btn-success" onclick="QnA_insert()">
  	 			<input type=button value="취소" class="btn btn-sm btn-info" 
  	 			onclick="javascript:history.back()">
  	 		</td>
  	 	</tr>
  	 </table>
  	 </form>
  	</div>
</div>  
</body>
</html>