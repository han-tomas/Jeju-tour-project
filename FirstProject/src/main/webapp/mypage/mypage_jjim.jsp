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
let i=0;
$(function(){
	$('.cdetail').click(function(){
		if(i==0)
		{
			$(this).text("상세보기")
			$('#detailtable').show()
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
			i=1;	
		}
		else
		{
			$(this).text("상세보기")
			$('#detailtable').hide()
			i=0;
		}
		
	})
	const selectTab = element => {
		  const active = document.querySelector('.actived');
		  const visible = document.querySelector('.content-visible');
		  const tabContent = document.getElementById(element.href.split('#')[1]);
		  if (active) {
		    active.classList.remove('actived');
		  }
		  element.classList.add('actived');
		  if (visible) {
		    visible.classList.remove('content-visible');
		  }
		  tabContent.classList.add('content-visible');
		  event.preventDefault();
		}
		document.addEventListener('click', event => {
		  if (event.target.matches('.tab-item a')) {
		    selectTab(event.target);
		  }
		}, false);
})
</script>
<style type="text/css">
.btn-outline-danger {
	width:74px;
}
.a1 {
	text-decoration: none;
	color: inherit;
}
.tabs {
  list-style: none;
  margin: 0;
  padding: 0;
  display: flex;
  height: 30px;
  color: #000;
}

.container2 {
  max-width: 1000px;
  width: 100%;
  padding: 15px 0px 15px 0px;
} 
.tab-item {
	color: #000;
	padding: 0px 15px 0px 15px;
}

.tab-item a:hover {
  color: inherit;
  padding-bottom: 4px;
  border-bottom: 3px solid #FF7F31;
}

.wrapper_tab-content {
  position: relative;
}

.tab-content {
  position: absolute;
  padding: 1.75em 0;
  display: none;
  height: 0;
}

.tab-content h1 {
  font-size: 1.12em;
  margin-bottom: .5em;
}

.content-visible {
  position: static;
  display: block;
  height: auto;
}

.actived {
  padding-bottom: 4px;
  border-bottom: 3px solid #FFA63C;
}

.travelhead{
	background-color: #FFB900;
}
.listImage{
	width: 70px;
	height: 50px;
}
</style>
</head>
<body>
	<h2>${sessionScope.name }님의 찜 목록</h2>
	<div style="height: 30px"></div>
	<h4>여행코스</h4>
	<table class="table">
		<tr class="travelhead">
			<th class="text-center">no.</th>	
			<th class="text-center">코스명</th>
			<th class="text-center">찜한수</th>
			<th class="text-center">추천수</th>
			<th class="text-center"></th>
		</tr>
		<c:forEach var="vo" items="${list }" varStatus="s">
			<tr>
				<td class="text-center">${s.index+1}</td>
				<td class="text-center">${vo.title }</td>
				<td class="text-center">${vo.jjim }</td>
				<td class="text-center">${vo.recommend }</td>
				<td>
					<span class="btn btn-sm btn-warning cdetail" data-cno="${vo.cno}">상세보기</span>
					<a href="../jjim/jjim_cancel.do?cno=${vo.cno }" 
					class="btn btn-sm btn-danger" data-cno="${vo.cno}">
					삭제</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	
	<table class="table" id="detailtable" style="display:none">
		<tr>
			<td class="travelhead">
				<div id="jjim_info"></div>
			</td>
		</tr>		
	</table>
	
	<h4>맛집</h4>
	<table class="table">
		<tr style="background-color: #fbc6c6">
			<th class="text-center">No</th>	
			<th class="text-center"></th>
			<th class="text-center">업체</th>
			<th class="text-center">전화번호</th>
			<th class="text-center"></th>
		</tr>
		<c:forEach var="fvo" items="${flist }" varStatus="ss">
			<tr>
				<td class="text-center">${ss.index+1}</td>
				<td><img src="${fvo.poster }" class="listImage"></td>
				<td class="text-center">${fvo.name }</td>
				<td class="text-center">${fvo.phone }</td>
				<td>
			      <a href="../food/food_detail.do?fino=${fvo.fino }"><span class="btn btn-sm btn-warning">상세보기</span></a>
				</td>
			</tr>
		</c:forEach>
	</table>
	<div style="height: 50px"></div>
	<h4>예약</h4>
	<div class="container container2">
	<div class="row">
		<ul class="tabs">
			<li class="tab-item"><a href="#item1" class="a1 actived">Activity</a></li>
			<li class="tab-item"><a href="#item2" class="a1">Hotel</a></li>
			<li class="tab-item"><a href="#item3" class="a1">Rentcar</a></li>
		</ul>
		<div class="wrapper_tab-content">
			<article id="item1" class="tab-content content-visible">
				<table class="table">
					<tr style="background-color: rgb(219,249,216)">
						<th class="text-center" width="10%">No</th>	
						<th class="text-center" width="15%"></th>
						<th class="text-center" width="55%">상품명</th>
						<th class="text-center" width="20%"></th>
					</tr>
					<c:forEach var="avo" items="${ alist }" varStatus="ss">
						<tr>
							<td class="text-center">${ss.index+1}</td>
							<td><img src="${ avo.main_poster }" class="listImage"></td>
							<td class="text-left">${ avo.title }</td>
							<td>
						      <a href="../activity/activity_detail.do?acino=${ avo.acino }"><span class="btn btn-sm btn-outline-warning">상세보기</span></a>
							  <a href="../activity/activityWish_Mycancle.do?acino=${avo.acino }"  class="btn btn-sm btn-outline-danger" data-acino="${avo.acino}">
							  삭제</a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</article>
			
			<article id="item2" class="tab-content">
				<table class="table">
					<tr style="background-color: rgb(219,249,216)">
						<th class="text-center" width="10%">No</th>	
						<th class="text-center" width="15%"></th>
						<th class="text-center" width="55%">상품명</th>
						<th class="text-center" width="20%"></th>
					</tr>
					<c:forEach var="hvo" items="${ hlist }" varStatus="ss">
						<tr>
							<td class="text-center">${ss.index+1}</td>
							<td><img src="${ hvo.main_poster }" class="listImage"></td>
							<td class="text-left">${ hvo.title }</td>
							<td>
						      <a href="../hotel/hotel_detail.do?huno=${hvo.huno }"><span class="btn btn-sm btn-outline-warning">상세보기</span></a>
							  <a href="../hotel/hotelWish_Mycancle.do?hdno=${hvo.hdno }"  class="btn btn-sm btn-outline-danger" data-hdno="${hvo.hdno}">
							  삭제</a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</article>

			<article id="item3" class="tab-content">
				<table class="table">
					<tr style="background-color: rgb(219,249,216)">
						<th class="text-center" width="10%">No</th>	
						<th class="text-center" width="15%"></th>
						<th class="text-center" width="55%">상품명</th>
						<th class="text-center" width="20%"></th>
					</tr>
					<c:forEach var="rvo" items="${rlist }" varStatus="ss">
						<tr>
							<td class="text-center">${ss.index+1}</td>
							<td><img src="${ rvo.main_poster }" class="listImage"></td>
							<td class="text-left">${ rvo.title }</td>
							<td>
						      <a href="../rentcar/rentcar_detail.do?cid=${ rvo.cid }"><span class="btn btn-sm btn-outline-warning">상세보기</span></a>
							  <a href="../rentcar/rentcarWish_Mycancel.do?cid=${rvo.cid }"  class="btn btn-sm btn-outline-danger" data-cid="${rvo.cid}">
							  삭제</a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</article>
		</div>
	</div>
	</div>
	
</body>
</html>