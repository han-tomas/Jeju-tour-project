<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
  	 <form method=post action="../qna/qna_insert_ok.do">
  	 <table class="table">
  	 	<tr>
  	 		<th width=15%>이름</th>
  	 		<td width=85%>
  	 			<input type=text name=name size=20 class="input-sm">
  	 		</td>
  	 	</tr>
  	 	<tr>
  	 		<th width=15%>제목</th>
  	 		<td width=85%>
  	 			<input type=text name=subject size=50 class="input-sm">
  	 		</td>
  	 	</tr>
  	 	<tr>
  	 		<th width=15%>내용</th>
  	 		<td width=85%>
  	 			<textarea rows="10" cols="50" name="content"></textarea>
  	 		</td>
  	 	</tr>
  	 	<tr>
  	 		<th width=15%>비밀번호</th>
  	 		<td width=85%>
  	 			<input type=password name=pwd size=10 class="input-sm">
  	 		</td>
  	 	</tr>
  	 	<tr>
  	 		<td colspan="2" class="text-center">
  	 			<input type=submit value="글쓰기" class="btn btn-sm btn-success">
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