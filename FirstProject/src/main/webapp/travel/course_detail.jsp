<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
function detail(coursename){
	
    $.ajax({
    	type:'post',
    	url:'../travel/coursename_related.do',
    	data:{"coursename":coursename},
    	success:function(result)
    	{
    		
    		$('#coursename_related').html(result);
    	}
    })
}
</script>
<style type="text/css">
.container1{
	border: 1px solid orange;
	border-radius: 10px;
	width: 1200px;
	margin: 0px auto;
}
.row1 {
	border: 1px solid orange;
	width: 1200px;
	margin: 0px auto;
}
.row2 {
	border: 1px solid orange;
	width: 1200px;
	margin: 0px auto;
	background-color: #FFCD28;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
}
.coursename {
	border-bottom: none;
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
    <div class="container1">
    <div class="row row2">
    	<div style="height: 10px"></div>
    	<div style="text-align:right;">
    		<c:if test="${sessionScope.id!=null }">
    			<c:if test="${jjim_count==0 }">
	    			<a href="../jjim/jjim_insert.do?cno=${cvo.cno }" class="btn btn-xs btn-outline-danger"><i class="fa fa-heart fa-sm">&nbsp;찜하기</i></a>			
    			</c:if>
    			<c:if test="${jjim_count!=0 }">
	    			<span class="btn btn-xs btn-danger"><i class="fa fa-heart fa-sm" style="color: white; font-style: bold">&nbsp;찜하기</i></span>			
    			</c:if>
    			<c:if test="${recommend_count==0 }">
	  				<a href="../recommend/recommend_insert.do?cno=${cvo.cno }" class="btn btn-xs btn-outline-primary"><i class="fa fa-thumbs-o-up fa-sm">&nbsp;추천</i></a>
	  			</c:if>
	  			<c:if test="${recommend_count!=0 }">
	  				<span class="btn btn-xs btn-primary"><i class="fa fa-thumbs-o-up fa-sm" style="color: white; font-style: bold">&nbsp;추천</i></span>
	  			</c:if>	
    		</c:if>
    		<a href ="../travel/course_list.do" class="btn btn-xs btn-outline-secondary" style="margin-right: 10px" ><i class="fa fa-list fa-sm" style="color: white; font-style: bold;">&nbsp;목록</i></a>
    	</div>
    	<div style="height: 10px"></div>
    </div>
    <div class="row">
    	<div class="col-lg-6" style="height: 400px; overflow: auto;">
    	<table class="table">
    	<tr>
    		<td id="coursename_related">
    			<img src="${cvo.poster }" alt="Lights" style="width:100%;height: 370px;">
    		</td>
    	</tr>
    	</table>
    	</div>
    	<div class="col-lg-6">
    		<div id="map" style="width:100%;height:380px; margin-top: 10px"></div>
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
    		<td class="text-center inline" style="color: white;background-color: #FFCD28;"><h2>${cvo.title }</h2></td>
    	</tr>
   		</table>
   		<table class="table">
   		<tr>
   			<td class="coursename"><h3>Day1</h3></td>
   		</tr>
    	<tr>
    		
    		<c:forEach var="vo" items="${list}" varStatus="s">
    			<c:if test="${vo.daytype==1 }">
    				<td class="text-center coursename" style="white-space: nowrap;">
    					<c:choose>
		                    <c:when test="${vo.coursename eq '렌터카 페이지로 이동하기'}">
		                        <a href="../rentcar/rentcar_main.do">
		                            ${vo.coursename }
		                        </a>
		                    </c:when>
		                    <c:otherwise>
		                        <a href="#" onclick="showLocationOnMap('${vo.coursename}');detail('${vo.coursename }')">
		                            ${vo.coursename}
		                        </a>
		                    </c:otherwise>
		                </c:choose>
    					
    				</td>
    				
    			</c:if>
            </c:forEach>
        </tr>   
        <tr>
   			<td class="coursename"><h3>Day2</h3></td>
   		</tr> 
    	<tr>
		    <c:forEach var="vo" items="${list}">
		        <c:if test="${vo.daytype==2 }">
		            <td class="text-center coursename">
		            	<a href="#" onclick="showLocationOnMap('${vo.coursename}');detail('${vo.coursename }')">
    						${vo.coursename}
    					</a>
		            </td>
		        </c:if>
		    </c:forEach>
		</tr>
        <c:if test="${aa[2]!=0 }">
        <tr>
   			<td class="coursename"><h3>Day3</h3></td>
   		</tr>   
    	<tr>
    		<c:forEach var="vo" items="${list}">
    			<c:if test="${vo.daytype==3 }">
    				<td class="text-center  coursename">
    					<a href="#" onclick="showLocationOnMap('${vo.coursename}');detail('${vo.coursename }')">
    						${vo.coursename}
    					</a>
    				</td>
    			</c:if>
            </c:forEach>
        </tr>
        </c:if>
        
        <c:if test="${aa[3]!=0 }">
        <tr>
   			<td class="coursename"><h3>Day4</h3></td>
   		</tr>    
    	<tr>
    		<c:forEach var="vo" items="${list}">
    			<c:if test="${vo.daytype==4 }">
    				<td class="text-center  coursename">
    					<a href="#" onclick="showLocationOnMap('${vo.coursename}');detail('${vo.coursename}')">
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