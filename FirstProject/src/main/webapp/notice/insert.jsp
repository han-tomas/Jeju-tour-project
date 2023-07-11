<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

<title>Jeju Project</title>
<style type="text/css">
.popular{
	margin-top: 100px;
}
.row1{
	margin: 0px auto;
	width: 800px
}
</style>
</head>
<body>
  <div class="popular-categories">
  <div class="row1">
  <h2 class="sectiontitle">글쓰기</h2>
  <form method=post action="../notice/insert_ok.do">
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
        <textarea rows="10" cols="50" name=content></textarea>
      </td> 
    </tr>
    <tr>
      <th width=15%>비밀번호</th>
      <td width=85%>
        <input type=password name=pwd size=10 class="input-sm">
      </td>
    </tr>
    <tr>
      <td colspan=2 class="text-center">
        <input type=submit value="글쓰기" class="btn btn-sm btn-success">
        <input type=button value="취소" class="btn btn-sm btn-info" onclick="javascript:history.back()">
      </td>
    </tr>
  </table>
  </form>
  </div>
  </div>
</div>
</body>
</html>