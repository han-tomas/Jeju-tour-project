<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Insert title here</title>
<!-- Bootstrap core CSS -->
 <!-- <link href="../assets/css/bootstrap.css" rel="stylesheet">  -->
 <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Fontawesome core CSS -->
<link href="../assets/css/font-awesome.min.css" rel="stylesheet" />
<!--GOOGLE FONT -->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css'>
<!--Slide Show Css -->
<link href="../assets/css/main-style.css" rel="stylesheet" />
<!-- custom CSS here -->
<link href="../assets/css/style.css" rel="stylesheet" />
<style type="text/css">
.pagination {
	display: flex;
	justify-content: center;
	align-items: center;
}

.pagination a {
	color: black;
	padding: 8px 16px;
	text-decoration: none;
}

.aLogo {
	width: 30px;
	height: 27px
}

li:hover {
	background-color: rgb(245, 246, 247);
}

li {
	transition: background-color 0.6s ease;
}

.img-fluid {
	border-radius: 12px;
}

.panel-body {
	position: relative;
}

.pro-title {
	position: absolute;
	bottom: 0;
	left: 0;
	margin: 0;
	padding: 5px;
	color: #000;
	font-size: 14px;
	width: 100%;
	box-sizing: border-box;
}

.starIcon {
	width: 15px;
	height: 15px;
	vertical-align: middle;
	margin-top: -5px;
}
.container1{
	width:1000px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		let accno=1;		
		$.ajax({
			type : 'GET',
			url : '../activity/activity_list_result.do',
			data : {
				"accno" : 1
			},
			success : function(result) {
				$('#result').html(result);
			}
		})
		$('.list-group-item').css("cursor", "pointer")
		$('.list-group-item').click(function() {
			let accno = $(this).attr("data-no")
			$.ajax({
				type : 'GET',
				url : '../activity/activity_list_result.do',
				data : {
					"accno" : accno
				},
				success : function(result) {
					$('#result').html(result);
				}
			})
		})
	})
</script>
</head>
<body>
	<div class="page-heading">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="top-text header-text"></div>
				</div>
			</div>
		</div>
	</div>
	<div style="height: 100px"></div>
	<div class="container container1">
		<div class="row">
			<div class="col-md-3">
				<div>
					<a class="list-group-item active" data-no="1">Activity </a>
					<ul class="list-group">
						<li class="list-group-item" data-no="1"><img
							src="image/activity.png" class="aLogo"> 액티비티</li>

						<li class="list-group-item" data-no="2"><img
							src="image/activity_logo.png" class="aLogo"> 클래스</li>
						<li class="list-group-item" data-no="3"><img
							src="image/ticket_logo.png" class="aLogo"> 입장권 </li>
						<li class="list-group-item" data-no="4"><img
							src="image/snap_logo.png" class="aLogo"> 스냅촬영 </li>
						<li class="list-group-item" data-no="5"><img
							src="image/tour_logo.png" class="aLogo"> 투어 </li>
						<li class="list-group-item" data-no="6"><img
							src="image/rental_logo.png" class="aLogo"> 여행편의 </li>
						<li class="list-group-item" data-no="7"><img
							src="image/foodie_logo.png" class="aLogo"> 미식 </li>
						<li class="list-group-item" data-no="8"><img
							src="image/spa_healing_logo.png" class="aLogo"> 스파/힐링 </li>
						<li class="list-group-item" data-no="9"><img
							src="image/transportation_logo.png" class="aLogo"> 이동/교통편의
							</li>
						<li class="list-group-item" data-no="10"><img
							src="image/kids_logo.png" class="aLogo"> 키즈 </li>
					</ul>
				</div>
			</div>
			<!-- /.col -->
			<div class="col-md-9">
				<div class="row">
					<div>
						<h4>
							<b>총 ${totalCategory}개</b>
						</h4>
					</div>
					<div class="row" id="result"></div>
				</div>
				<div class="pagination">
					<c:if test="${startPage>1 }">
						<a
							href="../activity/activity_list.do?page=${startPage-1 }&accno=${accno}">
							&laquo;</a>
					</c:if>
					<c:forEach var="i" begin="${startPage }" end="${endPage }">

						<a href="../activity/activity_list.do?page=${i}&accno=${accno}">${i}</a>
					</c:forEach>

					<c:if test="${endPage<totalpage }">
						<a
							href="../activity/activity_list.do?page=${endPage+1 }&accno=${accno }">
							&raquo;</a>
					</c:if>
				</div>
			</div>
		</div>
	</div>

	<script src="http://code.jquery.com/jquery.js"></script>
	<script src="../assets/js/bootstrap.js"></script>
</body>
</html>