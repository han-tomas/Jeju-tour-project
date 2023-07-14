<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table class="table table-hover">
    <thead>
		<tr>
			<th>관련 검색어</th>
		<tr>
	</thead>
	<tbody>
	<c:forEach var="vo" items="${list }">
		<tr class="a">
			<td width=30% rowspan="2"><a href="../travel/travel_find_detail.do?no=${vo.no }"><img src="${vo.poster }" width="20px" height="80px"></a></td>
			<td width=70%><a href="../travel/travel_find_detail.do?no=${vo.no }">${vo.title }</a></td>
		</tr>
		<tr class="a">
			<td width=70%><sub>${vo.label }</sub></td>
		</tr>
	</c:forEach>
	</tbody>
	</table>
</body>
</html>