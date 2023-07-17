<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.table1 th {
  background-color: #FFB900; 
}
.table1 td,.table1 th {
  border: 1px solid #FF8200;  
}
.thumbnail-cell {
  width: 40%; 
}

.thumbnail-cell img {
  width: 100%; 
  height: auto; 
  margin-top: center;
}
.tumbnail-cell{
	border:1px solid none; 
}
.td no-border{
	border:none;
}
</style>
</head>
<body>	
<h4>선택 코스 미리보기</h4>
<table class="table table1">
	<tr>
		<th class="text-center" style="font-size: 10pt">${cvo.title}</th>	
		<th class="text-center">Day1</th>
		<th class="text-center">Day2</th>
	<c:if test="${aa[2]!=0 }">
		<th class="text-center">Day3</th>
	</c:if>
	<c:if test="${aa[3]!=0 }">
		<th class="text-center">Day4</th>
	</c:if>
</tr>
<tr>
	<td class="thumbnail-cell no-border text-center">
		<img src="${cvo.poster }" class="img-thumbnail">
	</td>
	<td class="text-center">
		<c:forEach var="vo" items="${list}">
		<c:if test="${vo.daytype==1 }">
			${vo.coursename }<br>
		</c:if>
		</c:forEach>	
	</td>
	<td class="text-center">
		<c:forEach var="vo" items="${list}">
		<c:if test="${vo.daytype==2 }">
			${vo.coursename }<br>
		</c:if>
		</c:forEach>
	</td>
	<c:if test="${aa[2]!=0 }">
	<td class="text-center">
		<c:forEach var="vo" items="${list}">
		<c:if test="${vo.daytype==3 }">
			${vo.coursename }<br>
		</c:if>
		</c:forEach>
	</td>
	</c:if>
	<c:if test="${aa[3]!=0 }">
	<td class="text-center">
		<c:forEach var="vo" items="${list}">
		<c:if test="${vo.daytype==4 }">
			${vo.coursename }<br>
		</c:if>
		</c:forEach>
	</td>
	</c:if>
 			</tr>
</table>

</body>
</html>