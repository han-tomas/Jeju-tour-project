<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.row1 {
	margin: 0px auto;
  	width: 1100px;
}
</style>
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
<div class="popular-categories">
    <div class="container">
    <div class="row row1">
    	<div class="col-lg-6">
    	<table class="table">
    	<tr>
    		<td>
    			<center><img src="${cvo.poster }" alt="Lights" style="width:100%"></center>
    		</td>
    	</tr>
    	</table>
    	</div>
    	<div class="col-lg-6">
    		<div id="map" style="width:100%;height:350px;"></div>
    		<script>
			// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
			var infowindow = new kakao.maps.InfoWindow({zIndex:1});
			
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  
			
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			// 장소 검색 객체를 생성합니다
			var ps = new kakao.maps.services.Places(); 
			
			// 키워드로 장소를 검색합니다
			ps.keywordSearch('이태원 맛집', placesSearchCB); 
			
			// 키워드 검색 완료 시 호출되는 콜백함수 입니다
			function placesSearchCB (data, status, pagination) {
			    if (status === kakao.maps.services.Status.OK) {
			
			        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			        // LatLngBounds 객체에 좌표를 추가합니다
			        var bounds = new kakao.maps.LatLngBounds();
			
			        for (var i=0; i<data.length; i++) {
			            displayMarker(data[i]);    
			            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
			        }       
			
			        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			        map.setBounds(bounds);
			    } 
			}
			
			// 지도에 마커를 표시하는 함수입니다
			function displayMarker(place) {
			    
			    // 마커를 생성하고 지도에 표시합니다
			    var marker = new kakao.maps.Marker({
			        map: map,
			        position: new kakao.maps.LatLng(place.y, place.x) 
			    });
			
			    // 마커에 클릭이벤트를 등록합니다
			    kakao.maps.event.addListener(marker, 'click', function() {
			        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
			        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
			        infowindow.open(map, marker);
			    });
			}
			</script>
    	</div>
    	</div>
    	<div class="row row1">
    	<table class="table">
    	<tr>
    		<td class="text-center inline" style="color: white;background-color: orange"><h2>${cvo.title }</h2></td>
    	</tr>
   		</table>
   		<table class="table">
   		<tr>
   			<td><h3>Day1</h3></td>
   		</tr>
    	<tr>
    		<c:forEach var="vo" items="${list}">
    			<c:if test="${vo.daytype==1 }">
    				<td>${vo.coursename }</td>
    			</c:if>
            </c:forEach>
        </tr>   
        <tr>
   			<td><h3>Day2</h3></td>
   		</tr> 
    	<tr>
    		<c:forEach var="vo" items="${list}">
    			<c:if test="${vo.daytype==2 }">
    				<td>${vo.coursename }</td>
    			</c:if>
            </c:forEach>
        </tr> 
        <c:if test="${aa[2]!=0 }">
        <tr>
   			<td><h3>Day3</h3></td>
   		</tr>   
    	<tr>
    		<c:forEach var="vo" items="${list}">
    			<c:if test="${vo.daytype==3 }">
    				<td>${vo.coursename }</td>
    			</c:if>
            </c:forEach>
        </tr>
        </c:if>
        
        <c:if test="${aa[3]!=0 }">
        <tr>
   			<td><h3>Day4</h3></td>
   		</tr>    
    	<tr>
    		<c:forEach var="vo" items="${list}">
    			<c:if test="${vo.daytype==4 }">
    				<td>${vo.coursename }</td>
    			</c:if>
            </c:forEach>
        </tr>  
        </c:if>
    	</table>
    	</div>
    </div>
</div>   
</body>
</html>