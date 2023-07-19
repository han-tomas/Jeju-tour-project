<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
/*panel*/
.panel {
	border: none;
	box-shadow: none;
	background-color:#fff;
	border-radius:4px;
}

.panel-heading {
	border-color: #eff2f7;
	font-size: 16px;
	font-weight: 300;
}

.panel-title {
	color: #2A3542;
	font-size: 14px;
	font-weight: 400;
	margin-bottom: 0;
	margin-top: 0;
	font-family: 'Open Sans', sans-serif;
}

/*product list*/
.prod-cat li a {
	border-bottom: 1px dashed #d9d9d9;
}

.prod-cat li a {
	color: #3b3b3b;
}

.prod-cat li ul {
	margin-left: 30px;
}

.prod-cat li ul li a {
	border-bottom: none;
}

.prod-cat li ul li a:hover, .prod-cat li ul li a:focus, .prod-cat li ul li.active a,
	.prod-cat li a:hover, .prod-cat li a:focus, .prod-cat li a.active {
	background: none;
	color: #ff7261;
}

.pro-lab {
	margin-right: 20px;
	font-weight: normal;
}

.pro-sort {
	padding-right: 20px;
	float: left;
}

.pro-page-list {
	margin: 5px 0 0 0;
}

.product-list img {
	width: 100%;
	border-radius: 4px 4px 4px 4px;
	-webkit-border-radius: 4px 4px 4px 4px;
}

.product-list .pro-img-box {
	position: relative;
}

.adtocart {
	background: #fc5959;
	width: 50px;
	height: 50px;
	border-radius: 50%;
	-webkit-border-radius: 50%;
	color: #fff;
	display: inline-block;
	text-align: center;
	border: 3px solid #fff;
	left: 45%;
	bottom: -25px;
	position: absolute;
}

.adtocart i {
	color: #fff;
	font-size: 25px;
	line-height: 42px;
}

.pro-title {
	color: #5A5A5A;
	display: inline-block;
	margin-top: 20px;
	font-size: 16px;
}

.product-list .price {
	color: #fc5959;
	font-size: 15px;
}

.pro-img-details {
	margin-left: -15px;
}

.pro-img-details img {
	width: 100%;
}

.pro-d-title {
	font-size: 16px;
	margin-top: 0;
}

.product_meta {
	border-top: 1px solid #eee;
	border-bottom: 1px solid #eee;
	padding: 10px 0;
	margin: 15px 0;
}

.product_meta span {
	display: block;
	margin-bottom: 10px;
}

.product_meta a, .pro-price {
	color: #fc5959;
}

.pro-price, .amount-old {
	font-size: 18px;
	padding: 0 10px;
}

.amount-old {
	text-decoration: line-through;
}

.quantity {
	width: 120px;
}

.pro-img-list {
	margin: 10px 0 0 -15px;
	width: 100%;
	display: inline-block;
}

.pro-img-list a {
	float: left;
	margin-right: 10px;
	margin-bottom: 10px;
}

.pro-d-head {
	font-size: 18px;
	font-weight: 300;
}
.nav-link {
	color:black;
}
.nav-item > .active {
	background-color:#FF7F31;
}
.category_active {
	border-radius: 7px;
	background-color:#FF7F31;
}
.category {
	border-radius: 7px;
	background-color:#FFA63C;
}
.list_tab {
	border-radius: 7px;
	background-color:#FFA63C;
	padding: 0px; width: 70px; height: 40px; display: inline-block; margin:0px;
}
.list_tab_2 {
	width: 70px; height: 40px; display:flex; justify-content: center; align-items: center; margin:0px;
}
.curtab {
	background-color:#FF7F31;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function () {
	
	$.ajax({
			type:'GET',
			url:'../rentcar/rentcar_main_result.do',
			data:{"type":0},
			success:function(result){
				$('#result').html(result);
			}
		})
	$('.list_tab').css("cursor", "pointer")
 	$('.list_tab').click(function(){
 		let l_type= $(this).attr("data-type")
		$.ajax({
			type:'GET',
			url:'../rentcar/rentcar_main_result.do',
			data:{"type":l_type, "page":1},
			success:function(result){
				$('.list_tab').removeClass('curtab') 
				$('#nav_'+l_type).addClass('curtab')
				$('#result').html(result)
			}
		})
	})
	/* <li class="page-item"><span class="page-link" id="prev" href="../hotel/hotel_list_result.do?page=${ startPage-1 }">&laquo;</span></li> */
	$('.page-link').click(function(){
		let p_type = $(this).attr("data-type")
		let p_page = $(this).attr("data-page")
		$.ajax({
			type:'GET',
			url:'../rentcar/rentcar_main_result.do',
			data:{"type":p_type,"page":p_page},
			success:function(result){
				$('.page-item').removeClass('active')
				$('.page_'+p_page).addClass('active')
				$('#result').html(result)
			}
		})
	})
});
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

	<div class="listing-page">
		<div class="container" style="text-align:center;">
			<div class="row">
				<div class="col-lg-12">
					<div class="naccs">
						<div class="grid">
							<div class="row">
								<div class="col-lg-12">
									<div class="row">
									<div class="col-md-9" style="text-align:left;">
										<div class="list_tab curtab" data-type="0" id="nav_0">
											<div class="list_tab_2">전체</div>
										</div>
										<div class="list_tab" data-type="1" id="nav_1">
											<div class="list_tab_2">국산차</div>
										</div>
										<div class="list_tab" data-type="2" id="nav_2">
											<div class="list_tab_2">해외차</div>
										</div>
										<div class="list_tab" data-type="3" id="nav_3">
											<div class="list_tab_2">소형</div>
										</div>
										<div class="list_tab" data-type="4" id="nav_4">
											<div class="list_tab_2">중형</div>
										</div>
										<div class="list_tab" data-type="5" id="nav_5">
											<div class="list_tab_2">오픈카</div>
										</div>
									</div>
									<div class="col-md-3">
										<section class="panel">
										<div class="panel-body">
											<div class="pull-right">
												<ul class="pagination">
													<c:if test="${ startPage>1 }">
														<li class="page-item"><a href="../rentcar/rentcar_main.do?type=${ type }&page=${ startPage-1 }" class="page-link">&laquo;</a></li>
													</c:if>
													<c:forEach var="i" begin="${ startPage }" end="${ endPage }">
														<li class="page-item page_${ i } ${ curpage==i?"active":"" }"><span class="page-link" data-type="${ type }" data-page="${ i }">${ i }</span></li>
													</c:forEach>
													<c:if test="${ endPage<totalpage }">
														<li class="page-item"><a href="../rentcar/rentcar_main.do?type=${ type }&page=${ endPage+1 }" class="page-link">&raquo;</a></li>
													</c:if>
												</ul>
											</div>
										</div>
										</section>
									</div>
									</div>
									<div class="row">
									<div class="col-md-12">
										<div class="row product-list" id="result">
											
										</div>
									</div>
								</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>