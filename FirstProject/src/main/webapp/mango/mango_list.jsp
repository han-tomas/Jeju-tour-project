<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/> -->
<style type="text/css">
.pagination1 li a{
	display: inline-block;
	margin: 0px auto;
	
}
.foodtype{
	width: 35px;
	height: 35px;
}
.floating {
  position: sticky; 
  right: 50%; 
  top: 180px;
  text-align: center;
  width: 120px;
}
</style>
</head>
<body>
<div class="wrapper row3">
  <main class="container">
    <div style="height: 200px;"></div>
      <div class="col-md-3">
        <div class="floating">
          <ul>
            <li style="display: inline">
              <a href="../mango/mango_list.do?mcno=1">
                <img src="image/한식.png" class="foodtype"><span style="color: black;font-size: 18px;">한식</span>
              </a>
            </li>
            <li style="display: inline">
              <a href="../mango/mango_list.do?mcno=11">
                <img src="image/양식.png" class="foodtype"><span style="color: black;font-size: 18px;">양식</span>
              </a>
            </li>
            <li style="display: inline">
              <a href="../mango/mango_list.do?mcno=21">
                <img src="image/디저트.png" class="foodtype"><span style="color: black;font-size: 18px;">디저트</span>
              </a>
            </li>
            <li style="display: inline">
              <a href="../mango/mango_list.do?mcno=31">
                <img src="image/카페.png" class="foodtype"><span style="color: black;font-size: 18px;">카페</span>
              </a>
            </li>
            <li style="display: inline">
              <a href="../mango/mango_list.do?mcno=41">
                <img src="image/치킨1.png" class="foodtype"><span style="color: black;font-size: 18px;">치킨</span>
              </a>
            </li>
          </ul>
        </div>
      </div>
      
      <div class="col-md-9">
        <c:forEach var="fvo" items="${flist }">
          <div class="col-md-6 ">
	        <a href="../mango/mango_detail_before.do?fino=${fvo.fino }">
			  <img src="${fvo.poster }" style="width: 330px;height: 280px;border-radius: 12px;">
			</a>
			<h4>
			  <a href="../mango/mango_detail_before.do?fino=${fvo.fino }"><span style="color: black;">${fvo.name }</span></a>
			  <span style="color: orange">${fvo.score }</span>
			</h4>
			<h5>${fvo.address }</h5>
			<i class="fa fa-eye" style="border: 2px;color:gray;"></i>
			  &nbsp;<fmt:formatNumber value="${fvo.hit }" pattern="###,###"/>
			<i class="fa fa-gratipay" style="color: #f07070"></i>&nbsp;${fvo.like_count} 
		  </div>
		</c:forEach>
      </div>
    
    <div class="page" style="text-align:center">
      <ul class="text-center pagenation1">
        <li><a href="../mango/mango_list.do?mcno=${curpage>1?curpage-1:curpage}">&laquo;이전</a></li>
        <c:forEach var="i" begin="1" end="10">
          <c:if test="${curpage >= 1 && curpage <= 10 }">
            <li ${curpage==i?"class=current":"" } style="display: inline-block">
              <a href="../mango/mango_list.do?mcno=${i}">${i }</a>
            </li>
          </c:if>
	      <c:if test="${curpage >= 11 && curpage <= 20  }">
	        <li ${curpage==i?"class=current":"" }><a href="../mango/mango_list.do?mcno=${i+10}">${i+10 }</a></li>
	      </c:if>
	      <c:if test="${curpage >= 21 && curpage <= 30  }">
	        <li ${curpage==i?"class=current":"" }><a href="../mango/mango_list.do?mcno=${i+20}">${i+20}</a></li>
	      </c:if>
		  <c:if test="${curpage >= 31 && curpage <= 40  }">
		    <li ${curpage==i?"class=current":"" }><a href="../mango/mango_list.do?mcno=${i+30}">${i+30}</a></li>
		  </c:if>
		  <c:if test="${curpage >= 41 && curpage <= 50  }">
		    <li ${curpage==i?"class=current":"" }><a href="../mango/mango_list.do?mcno=${i+40}">${i+40 }</a></li>
		  </c:if>
	    </c:forEach>
        <li><a href="../mango/mango_list.do?mcno=${curpage<totalpage?curpage+1:curpage }">다음&raquo;</a></li>
      </ul>
    </div>
    
  </main>
</div>
</body>
</html>