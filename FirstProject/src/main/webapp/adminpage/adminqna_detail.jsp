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
</style>
</head>
<body>
  <main class="container clear">
    <table class="table">
      <tr style="border-top : 1px solid;background-color: #dedede;">
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
    </table>
  </main>
</body>
</html>