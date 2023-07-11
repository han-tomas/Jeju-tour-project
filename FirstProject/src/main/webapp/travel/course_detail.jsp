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
  	width: 1200px;
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
    	<div style="text-align:right;">
    		<a href ="../travel/course_list.do" class="btn btn-sm btn-warning">목록</a>
    	</div>
    	<div style="height: 20px"></div>
    </div>
    <div class="row row1">
    	<div class="col-lg-6">
    	<table class="table">
    	<tr>
    		<td>
    			<img src="${cvo.poster }" alt="Lights" style="width:100%;height: 380px;">
    		</td>
    	</tr>
    	</table>
    	</div>
    	<div class="col-lg-6">
    		<div id="map" style="width:100%;height:380px"></div>
    		<script>
			var infowindow = new kakao.maps.InfoWindow({zIndex:1});
			var mapContainer = document.getElementById('map');
			var mapOption = {
			    center: new kakao.maps.LatLng(37.566826, 126.9786567),
			    level: 3
			};  
			var map = new kakao.maps.Map(mapContainer, mapOption);
			var ps = new kakao.maps.services.Places();
			var markers = []; // 마커를 담을 배열

			function displayMarker(place) {
			    var marker = new kakao.maps.Marker({
			        map: map,
			        position: new kakao.maps.LatLng(place.y, place.x) 
			    });
			    markers.push(marker); // 배열에 마커 추가

			    kakao.maps.event.addListener(marker, 'click', function() {
			        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
			        infowindow.open(map, marker);
			    });
			}

			function removeAllMarkers() {
			    for (var i = 0; i < markers.length; i++) {
			        markers[i].setMap(null);
			    }
			    markers = [];
			}

			function showLocationOnMap(coursename) {
			    removeAllMarkers(); // 이전 마커 제거

			    // 키워드로 장소 검색
			    ps.keywordSearch(coursename, function(data, status) {
			        if (status === kakao.maps.services.Status.OK) {
			            var bounds = new kakao.maps.LatLngBounds();

			            for (var i = 0; i < data.length; i++) {
			                displayMarker(data[i]);
			                bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
			            }

			            map.setBounds(bounds);
			        }
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
    				<td class="text-center">
    					<a href="#" onclick="showLocationOnMap('${vo.coursename}')">
    						${vo.coursename}
    					</a>
    				</td>
    			</c:if>
            </c:forEach>
        </tr>   
        <tr>
   			<td><h3>Day2</h3></td>
   		</tr> 
    	<tr>
		    <c:forEach var="vo" items="${list}">
		        <c:if test="${vo.daytype==2 }">
		            <td class="text-center">
		                <c:choose>
		                    <c:when test="${vo.coursename eq '렌터카 페이지로 이동하기'}">
		                        <a href="#">
		                            ${vo.coursename}
		                        </a>
		                    </c:when>
		                    <c:otherwise>
		                        <a href="#" onclick="showLocationOnMap('${vo.coursename}')">
		                            ${vo.coursename}
		                        </a>
		                    </c:otherwise>
		                </c:choose>
		            </td>
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
    				<td class="text-center">
    					<a href="#" onclick="showLocationOnMap('${vo.coursename}')">
    						${vo.coursename}
    					</a>
    				</td>
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
    				<td class="text-center">
    					<a href="#" onclick="showLocationOnMap('${vo.coursename}')">
    						${vo.coursename}
    					</a>
    				</td>
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