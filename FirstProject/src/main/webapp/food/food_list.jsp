<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css'>
<link rel="stylesheet" href="../food/style.css">
<style type="text/css">
.page{
	margin: 30px 0px 30px 0px;
	font-size: 17px;
}
.page ul{
	display: inline;
}
.page ul li{
	display: inline;
}
.page ul li a{
	color: black;
	margin: 4px;
}
.container1{
	width: 1000px;
	margin: 0px auto;
}
#side-nav a:hover{
	color: black;
}
.foodImage{
	width: 30px;
	height: 30px;
	margin-top: 10px;
	margin-left: 10px;
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
  <div class="container container1">

    <div class="row">
      <div class="col-sm-3">

			<nav id="side-nav">
		    <span id=logo>Category</span>
		     <ul>
		      <li class="selected">
		        <img src="image/한식.png" class="foodImage">
		        <a href="../food/food_list.do?mcno=1">
		          <span>한식</span></a>
		        </li>
		      </ul>
		      <ul>
		      <li class="selected">
		      <img src="image/양식.png" class="foodImage">
		          <a href="../food/food_list.do?mcno=11">
		          <span>양식</span></a>
		       </li>
		      </ul>
		      <ul>
		      <li class="selected">
		        <img src="image/디저트.png" class="foodImage">
		         <a href="../food/food_list.do?mcno=21">
		          <span>디저트</span></a>
		      </li>
		      </ul>
		      <ul>
		      <li class="selected">
		        <img src="image/카페.png" class="foodImage">
		         <a href="../food/food_list.do?mcno=31">
		          <span>카페</span></a>
		      </li>
		      </ul>
		      <ul>
		      <li class="selected">
		        <img src="image/치킨.png" class="foodImage">
		         <a href="../food/food_list.do?mcno=41">
		          <span>치킨</span></a>
		      </li>
		      </ul>
		  </nav>
			
      </div>
      <div class="col-sm-9">
        <div><h4>총 1000개</h4></div>
        <div class="row">
        <c:forEach var="fvo" items="${flist }">
          <div class="col-md-6" style="padding: 15px;">
	        <a href="../food/food_detail_before.do?fino=${fvo.fino }">
			  <img src="${fvo.poster }" style="height: 300px; border-radius: 12px;margin-bottom: 10px;border: 1px solid #cfd8e7">
			</a>
			  <a href="../food/food_detail_before.do?fino=${fvo.fino }"><span style="color: black;font-size: 16pt;">${fvo.name }</span></a>
			  <span style="color: orange;font-size: 14pt">${fvo.score }</span>
			<p style="font-size: 12pt;">${fvo.address }</p>
			<i class="fa fa-eye" style="border: 2px;color:gray;"></i>
			  &nbsp;<fmt:formatNumber value="${fvo.hit }" pattern="###,###"/>
			<i class="fa fa-gratipay" style="color: #f07070"></i>&nbsp;${fvo.like_count} 
		  </div>
		</c:forEach>
		</div>
      </div>
    </div>
    <div class="row">
    <div class="page" style="text-align:center">
      <ul class="text-center pagenation1">
        <li><a href="../food/food_list.do?mcno=${curpage>1?curpage-1:curpage}" class="btn btn-xs btn-success">이전</a></li>
        <c:forEach var="i" begin="1" end="10">
          <c:if test="${curpage >= 1 && curpage <= 10 }">
            <li ${curpage==i?"class=current":"" } style="display: inline">
              <a href="../food/food_list.do?mcno=${i}">${i }</a>
            </li>
          </c:if>
	      <c:if test="${curpage >= 11 && curpage <= 20  }">
	        <li ${curpage==i?"class=current":"" }><a href="../food/food_list.do?mcno=${i+10}">${i+10 }</a></li>
	      </c:if>
	      <c:if test="${curpage >= 21 && curpage <= 30  }">
	        <li ${curpage==i?"class=current":"" }><a href="../food/food_list.do?mcno=${i+20}">${i+20}</a></li>
	      </c:if>
		  <c:if test="${curpage >= 31 && curpage <= 40  }">
		    <li ${curpage==i?"class=current":"" }><a href="../food/food_list.do?mcno=${i+30}">${i+30}</a></li>
		  </c:if>
		  <c:if test="${curpage >= 41 && curpage <= 50  }">
		    <li ${curpage==i?"class=current":"" }><a href="../food/food_list.do?mcno=${i+40}">${i+40 }</a></li>
		  </c:if>
	    </c:forEach>
        <li><a href="../food/food_list.do?mcno=${curpage<totalpage?curpage+1:curpage }" class="btn btn-xs btn-info">다음</a></li>
      </ul>
    </div>
    </div>
   </div>
</body>
</html>