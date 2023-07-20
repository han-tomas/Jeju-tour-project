<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container2{
	margin: 0px auto;
	width: 100%
}
.replyMain table tr th{
	background-color: #f1f3f5;
	text-align: right;
}
.replyMain table tr td{
	background-color: white;
}
.replyhead{
	border-bottom: 1px solid gray;
}
</style>
</head>
<body class="body1">
  <div class="container2">
  <main class="container replyMain">
    <table class="table">
      <tr class="replyhead"><br>
        <h3><i class="fa fa-pencil-square-o fa-lg"></i>문의답변</h3>
      </tr>
      <tr>
        <th width=20%>답변일</th>
        <td width=80%>${vo.dbday }</td>
      </tr>
      <tr style="border-top : 1px solid;background-color: #dedede;"><!-- #dedede -->
        <th width=20%>제목</th>
        <td width=80%>${vo.subject }</td>
      </tr>
      <tr style="border-bottom: 1px solid gray;">
        <th width=20%>내용</th>
        <td width=80% valign="top">
          <pre style="white-space: pre-wrap;border: none;background-color: white">${vo.content }</pre>
        </td>
      </tr>
    </table>
  </main>
</div>
</body>
</html>