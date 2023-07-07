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
	border-radius: 4px 4px 0 0;
	-webkit-border-radius: 4px 4px 0 0;
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
}
.curtab {
	background-color:#FF7F31;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function () {
	$('#category_1').click(function(){
		location.replace('../hotel/activity_list.do')
	})
	$('#category_2').click(function(){
		location.replace('../hotel/hotel_list.do')
	})
	$('#category_3').click(function(){
		location.replace('../hotel/rentcar_list.do')
	})
	$.ajax({
			type:'GET',
			url:'../hotel/hotel_list_result.do',
			data:{"type":0},
			success:function(result){
				$('#result').html(result);
			}
		})
 	$('.list_tab').click(function(){
 		let type= $(this).attr("data-no")
		$.ajax({
			type:'GET',
			url:'../hotel/hotel_list_result.do',
			data:{"type":type-1},
			success:function(result){
				$('.list_tab').removeClass('curtab') 
				$('#nav_'+type).addClass('curtab')
				$('#result').html(result);
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
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="naccs">
						<div class="grid">
							<div class="row">
								<div class="col-lg-2">
									<div id="category_1" style="padding: 0px; height: 50px; margin-bottom:15px;">
											<div class="category" style="height: 50px; display: flex; justify-content: center; align-items: center;">
												Activity</div>
									</div>
									<div id="category_2" style="padding: 0px; height: 50px; margin-bottom:15px;">
											<div class="category_active" style="height: 50px; display: flex; justify-content: center; align-items: center;">
												Hotel</div>
									</div>
									<div id="category_3" style="padding: 0px; height: 50px; margin-bottom:15px;">
											<div class="category" style="height: 50px; display: flex; justify-content: center; align-items: center;">
												Rentcar</div>
									</div>
								</div>
								<div class="col-lg-10">
									<div class="row">
									<div class="col-md-9">
										<div class="list_tab curtab" data-no="1" id="nav_1" style="padding: 0px; width: 70px; height: 40px; display: inline-block; margin:0px;">
											<div style="width: 70px; height: 40px; display:flex; justify-content: center; align-items: center; margin:0px;">
												전체</div>
										</div>
										<div class="list_tab" data-no="2" id="nav_2" style="padding: 0px; width: 70px; height: 40px; display: inline-block; margin:0px;">
											<div style="width: 70px; height: 40px; display:flex; justify-content: center; align-items: center; margin:0px;">
												펜션</div>
										</div>
										<div class="list_tab" data-no="3" id="nav_3" style="padding: 0px; width: 70px; height: 40px; display: inline-block; margin:0px;">
											<div style="width: 70px; height: 40px; display:flex; justify-content: center; align-items: center; margin:0px;">
												리조트</div>
										</div>
										<div class="list_tab" data-no="4" id="nav_4" style="padding: 0px; width: 70px; height: 40px; display: inline-block; margin:0px;">
											<div style="width: 70px; height: 40px; display:flex; justify-content: center; align-items: center; margin:0px;">
												호텔</div>
										</div>
										<div class="list_tab" data-no="5" id="nav_5" style="padding: 0px; width: 70px; height: 40px; display: inline-block; margin:0px;">
											<div style="width: 70px; height: 40px; display:flex; justify-content: center; align-items: center; margin:0px;">
												기타</div>
										</div>
									</div>
									<div class="col-md-3">
										<section class="panel">
										<div class="panel-body">
											<div class="pull-right">
												<ul class="pagination">
												  <li class="page-item"><a class="page-link" href="#">&lt;</a></li>
												  <li class="page-item active"><a class="page-link" href="#">1</a></li>
												  <li class="page-item"><a class="page-link" href="#">2</a></li>
												  <li class="page-item"><a class="page-link" href="#">3</a></li>
												  <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
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