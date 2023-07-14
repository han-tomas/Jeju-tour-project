<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<style type="text/css">
.table1{
	border: none;
}
.row1
	display: inline;
}
.table1 sub{f
	font-size: 12px;
}
.table1 tr{
	line-height: 30px;
	font-size: 14px;
}
.table1 th{
	font-size: 16px;
}
</style>
<script type="text/javascript">
function goBackList(){
	location.href="../food/food_list.do";
}
</script>
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
   <div class="wrapper row3">
     <main class="container">
       <table class="table1">
       	  <c:forEach var="i" begin="0" end="4">
		    <td>
		      <c:if test="${posters[i]!=null }">
		      	<img src="${posters[i]}" style="width: 100%; padding: 5px;">
		      </c:if>
		      <c:if test="${posters[i]==null }">
		      	<img src="https://innotalk.co.kr/images/error/no-image.png" style="width: 100%; padding: 5px;">
		      </c:if>
		    </td>
		  </c:forEach>
		</table>
       <div style="height: 30px"></div>
       <div class="row">
       <div class="col-sm-7">
       <table class="table1">
         <tr>
           <td colspan=2>
             <h2>${vo.name }&nbsp;<span style="color: orange">${vo.score }</span></h2>
           </td>
         </tr>
       </table>
       <div style="height: 20px"></div>
       <div class="row1">
       <i class="fa fa-eye fa-lg" style="border: 2px;color:gray;"></i>
       &nbsp;<fmt:formatNumber value="${vo.hit }" pattern="###,###"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   <c:if test="${sessionScope.id==null }">
	     <i class="fa fa-gratipay fa-lg" style="color: #f07070"></i>&nbsp;${vo.like_count}
	   </c:if>
	   <c:if test="${sessionScope.id!=null }">
	   <c:if test="${like_ok==0 }">
	     <a href="../foodLike/food_like_insert.do?fino=${ vo.fino }">
	     <i class="fa fa-heart" style="color: gray"></i></a>&nbsp;${vo.like_count}
	   </c:if>
	   <c:if test="${like_ok!=0 }">
	     <a href="../foodLike/food_like_cancle.do?fino=${ vo.fino }">
	     <i class="fa fa-heart" style="color: #f07070"></i></a>&nbsp;${vo.like_count}
	   </c:if>
	   </c:if>
	   
	   </div>
       <table class="table1">
         <tr height="20px"></tr>
          <tr>
            <th width=40% class="text-left" style="border-spacing: 0 10px;">주소</th>
            <td width=60%><i class="fa fa-map-marker"></i>&nbsp;&nbsp;${addr1 }
              <br>
              <sub style="color:gray">지번 : ${addr2 }</sub>
            </td>
          </tr>
          <tr>
            <th width=40% class="texet-center">연락처</th>
            <td width=60%>${vo.phone }</td>
          </tr>
          <tr>
            <th width=40% class="texet-center">음식종류</th>
            <td width=60%>${vo.type }</td>
          </tr>
          <tr>
            <th width=40% class="texet-center">가격대</th>
            <td width=60%>${vo.price }</td>
          </tr>
          <tr>
            <th width=40% class="texet-center">주차</th>
            <td width=60%>${vo.parking }</td>
          </tr>
          <tr>
            <th width=40% class="texet-center">운영시간</th>
            <td width=60%>${vo.time }</td>
          </tr>
          <tr>
            <th width=40% class="texet-center">메뉴</th>
            <td width=60%>
              <ul>
                <c:forTokens items="${vo.menu }" delims="원" var="m">
                  <c:choose>
                    <c:when test="${m eq 'no' }">
                      <li style="display: block;">정보없음</li>
                    </c:when>
                    <c:otherwise>
                      <li style="display:block;">${m }원</li>
                    </c:otherwise>
                  </c:choose>
                </c:forTokens>
              </ul>
            </td>
          </tr>
          <tr>
          </tr>
        </table>
        <div class="d-flex justify-content-end" style="margin: 10px;">
          <button class="btn btn-sm btn-success" onclick="goBackList()">목록</button>
        </div>
        </div>
        <div class="col-sm-5">
        <div id="map" style="width:100%;height:350px;"></div>
        <script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  
			
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch('${addr1}', function(result, status) {
			
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
			
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
			
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">${vo.name}</div>'
			        });
			        infowindow.open(map, marker);
			
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});    
		</script>
        </div>
        </div>
     </main>
   </div>
</body>
</html>