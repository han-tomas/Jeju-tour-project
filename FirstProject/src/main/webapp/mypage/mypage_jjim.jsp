<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com//jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.cdetail').click(function(){
		let cno=$(this).attr("data-cno");
		$.ajax({
			type:'post',
			url:'../travel/course_info.do',
			data:{"cno":cno},
			success:function(result)
			{
				$('#jjim_info').html(result)
			}
		})
	})
})
</script>
</head>
<body>
	<h2>${sessionScope.name }님의 찜 목록</h2>
	<div style="height: 30px"></div>
	<h4>여행코스</h4>
	<table class="table">
		<tr>
			<th class="text-center">no.</th>	
			<th class="text-center">코스명</th>
			<th class="text-center">찜한수</th>
			<th class="text-center">추천수</th>
			<th class="text-center"></th>
		</tr>
		<c:forEach var="vo" items="${list }" varStatus="s">
			<tr>
				<th class="text-center">${s.index+1}</th>
				<td class="text-center">${vo.title }</td>
				<td class="text-center">${vo.jjim }</td>
				<td class="text-center">${vo.recommend }</td>
				<td>
					<span class="btn btn-sm btn-warning cdetail" data-cno="${vo.cno}">상세보기</span>
				</td>
			</tr>
		</c:forEach>
	</table>
	
	<table class="table">
		<tr>
			<td>
				<div id="jjim_info"></div>
			</td>
		</tr>		
	</table>

</body>
</html>