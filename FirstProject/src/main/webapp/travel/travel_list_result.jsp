<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
<table class="table">
	<c:forEach var="vo" items="${list }">
	<tr>
		<td width=35% class="text-center" rowspan="4">
			<a href="../travel/travel_find_detail.do?no=${vo.no }">
	<img src="${vo.poster }" style="width:300px;height: 200px" class="img-thumbnail">
				</a>
			</td>
	<td width=65%>
		<a href="../travel/travel_find_detail.do?no=${vo.no }">
	<h3>${vo.title }</h3>
			</a>
		</td>
			</tr>
	<tr>
		<td width=65%>
			<h6>${vo.tag }</h6>
		</td>
	</tr>
	<tr>
		<td width=65%>
			<h6>${vo.label }</h6>
		</td>
	</tr>
	<tr>
	
		<td width=65%>
			<h6>${vo.loc }</h6>
		</td>
	</tr>
	</c:forEach>
 </table>

</body>
</html>