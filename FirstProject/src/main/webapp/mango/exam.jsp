<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.row1{
	margin-top: 100px;
}
</style>
</head>
<body>
<div class="row1">
    <table class="table">
      <tr class="text-center">
        <td>
          <c:forEach var="i" items="${clist }">
          <a href="#" class="btn btn-lg btn-success">i</a>
          </c:forEach>
        </td>
      </tr>
    </table>
  </div>
</body>
</html>