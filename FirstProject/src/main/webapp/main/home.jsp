<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	window.addEventListener("load", initializeCategory);
	function initializeCategory() {
		let select = document.getElementById("chooseCategory");
		if (select.value === "") {
			select.removeAttribute("name"); // 선택된 값이 전체일 경우 name 속성 제거
		} else {
			select.setAttribute("name", "lno"); // 다른 옵션 선택 시 name 속성 추가
		}
	}
	function handleCategoryChange(select) {
	    if (select.value === "") {
	        select.removeAttribute("name"); // 선택된 값이 전체일 경우 name 속성 제거
	    } else {
	        select.setAttribute("name", "lno"); // 다른 옵션 선택 시 name 속성 추가
	    }
	}
</script>
</head>
<body>
	<div class="main-banner">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="top-text header-text">
						<h2>Jeju Travel</h2>
					</div>
				</div>
				<div class="col-lg-12">
					<form id="search-form" name="gs" method="get" role="search"
						action="../travel/travel_find.do">
						<input type="hidden" name="page" value="1">
						<div class="row">
							<div class="col-lg-3 align-self-center">
								<fieldset>
									<select name="lno" style="color: #FF7F31" class="form-select"
										aria-label="Area" id="chooseCategory" onchange="handleCategoryChange(this); this.form.click();">
										<option value="" selected>전체</option>
										<option value="1">관광지</option>
										<option value="2">음식점</option>
										<option value="3">숙박</option>
										<option value="4">행사/축제</option>
									</select>
								</fieldset>
							</div>
							<div class="col-lg-6 align-self-center">
								<fieldset>
									<input type="text" name="fd" class="searchText"
										placeholder="검색어를 입력하세요." required>
								</fieldset>
							</div>
							<div class="col-lg-3">
								<fieldset>
									<button class="main-button" style="background-color: #FFA63C;">
										<i class="fa fa-search"></i> Search Now
									</button>
								</fieldset>
							</div>
						</div>
					</form>
				</div>
				<div class="col-lg-10 offset-lg-1">
					<ul class="categories">
						<li><a href="../food/food_list.do"><span class="icon"><img
									src="../assets/images/search-icon-02.png" alt="Food"></span>
								Food </a></li>
						<li><a href="../travel/course_list.do"><span class="icon"><img
									src="../assets/images/search-icon-05.png" alt="Travel"></span>
								Courses </a></li>
						<li><a href="../activity/activity_list.do"><span
								class="icon"><img
									src="../assets/images/search-icon-06.png" alt="Activity"></span>
								Activity </a></li>
						<li><a href="../hotel/hotel_list.do"><span class="icon"><img
									src="../assets/images/search-icon-01.png" alt="Hotel"></span>
								Hotel </a></li>
						<li><a href="../rentcar/rentcar_main.do"><span
								class="icon"><img
									src="../assets/images/search-icon-03.png" alt="RentalCar"></span>
								Cars </a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
<div style="height: 70px;"></div>
	<div class="popular-categories">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-heading">
						<h2>Popular Categories</h2>
						<h6>Check Them Out</h6>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="naccs">
						<div class="grid">
							<div class="row">
								<div class="col-lg-3">
									<div class="menu">
										<div class="first-thumb active">
											<div class="thumb">
												<span class="icon"><img
													src="../assets/images/search-icon-01.png" alt=""></span>
												Hotel
											</div>
										</div>
										<div>
											<div class="thumb">
												<span class="icon"><img
													src="../assets/images/search-icon-02.png" alt=""></span>
												Food
											</div>
										</div>
										<div>
											<div class="thumb">
												<span class="icon"><img
													src="../assets/images/search-icon-03.png" alt=""></span>
												Rentcar
											</div>
										</div>
										<div>
											<div class="thumb">
												<span class="icon"><img
													src="../assets/images/search-icon-06.png" alt=""></span>
												Activity
											</div>
										</div>
										<div class="last-thumb">
											<div class="thumb">
												<span class="icon"><img
													src="../assets/images/search-icon-05.png" alt=""></span>
												Travel
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-9 align-self-center">
									<ul class="nacc">
										<li class="active">
											<div>
												<div class="thumb">
													<div class="row">
														<div class="col-lg-5 align-self-center">
															<div class="left-text">
																<h4>One Of The Most Trending Stuffs Right Now!</h4>
																<p>Plot Listing is a responsive Bootstrap 5 website
																	template that included 4 different HTML pages. This
																	template is provided by TemplateMo website. You can
																	apply this layout for your static or dynamic CMS
																	websites.</p>
																<div class="main-white-button">
																	<a href="#"><i class="fa fa-eye"></i> Discover More</a>
																</div>
															</div>
														</div>
														<div class="col-lg-7 align-self-center">
															<div class="right-image">
																<img src="../assets/images/tabs-image-01.jpg" alt="">
															</div>
														</div>
													</div>
												</div>
											</div>
										</li>
										<li>
											<div>
												<div class="thumb">
													<div class="row">
														<div class="col-lg-5 align-self-center">
															<div class="left-text">
																<h4>Food and Lifestyle category is here</h4>
																<p>You can feel free to download, edit and apply
																	this template for your website. Please tell your
																	friends about TemplateMo website.</p>
																<div class="main-white-button">
																	<a href="#"><i class="fa fa-eye"></i> Explore More</a>
																</div>
															</div>
														</div>
														<div class="col-lg-7 align-self-center">
															<div class="right-image">
																<img src="../assets/images/tabs-image-02.jpg"
																	alt="Foods on the table">
															</div>
														</div>
													</div>
												</div>
											</div>
										</li>
										<li>
											<div>
												<div class="thumb">
													<div class="row">
														<div class="col-lg-5 align-self-center">
															<div class="left-text">
																<h4>Best car rentals for your trips!</h4>
																<p>Did you know? You can get the best free HTML
																	templates on Too CSS blog. Visit the blog pages and
																	explore fresh and latest website templates.</p>
																<div class="main-white-button">
																	<a href="../listing.html"><i class="fa fa-eye"></i>
																		More Listing</a>
																</div>
															</div>
														</div>
														<div class="col-lg-7 align-self-center">
															<div class="right-image">
																<img src="../assets/images/tabs-image-03.jpg"
																	alt="cars in the city">
															</div>
														</div>
													</div>
												</div>
											</div>
										</li>
										<li>
											<div>
												<div class="thumb">
													<div class="row">
														<div class="col-lg-5 align-self-center">
															<div class="left-text">
																<h4>Shopping List: Images from Unsplash</h4>
																<p>Image credits go to Unsplash website that
																	provides free stock photos for anyone. Images used in
																	this Plot Listing template are from Unsplash.</p>
																<div class="main-white-button">
																	<a href="#"><i class="fa fa-eye"></i> Discover More</a>
																</div>
															</div>
														</div>
														<div class="col-lg-7 align-self-center">
															<div class="right-image">
																<img src="../assets/images/tabs-image-04.jpg"
																	alt="Shopping Girl">
															</div>
														</div>
													</div>
												</div>
											</div>
										</li>
										<li>
											<div>
												<div class="thumb">
													<div class="row">
														<div class="col-lg-5 align-self-center">
															<div class="left-text">
																<h4>Information and Safety Tips for Traveling</h4>
																<p>You are allowed to use this template for your
																	commercial websites. You are NOT allowed to
																	redistribute this template ZIP file on any Free CSS
																	collection websites.</p>
																<div class="main-white-button">
																	<a rel="nofollow" href="https://templatemo.com/contact"><i
																		class="fa fa-eye"></i> Read More</a>
																</div>
															</div>
														</div>
														<div class="col-lg-7 align-self-center">
															<div class="right-image">
																<img src="../assets/images/tabs-image-05.jpg"
																	alt="Traveling Beach">
															</div>
														</div>
													</div>
												</div>
											</div>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="recent-listing">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-heading">
						<h2>Recent Listing</h2>
						<h6>Check Them Out</h6>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="owl-carousel owl-listing">
						<%-- Activity 출력 --%>
						<c:forEach var="cvo" items="${cList}">
							<div class="item">
								<div class="row">
									<div class="col-lg-12">
										<div class="listing-item">
											<div class="left-image">
												<a href="../activity/activity_detail.do?acino=${cvo.acino }">
													<img src="${cvo.main_poster }" class="recentImg" style="width: 480px;height: 400px;">
												</a>
											</div>
											<div class="right-content align-self-center">
												<a href="../activity/activity_detail.do?acino=${cvo.acino }">
													<h4>${cvo.title}</h4>
												</a> <span class="price">
													<div class="icon">
														<img src="../assets/images/listing-icon-01.png" alt="">
													</div> <fmt:formatNumber value="${cvo.price }" pattern="#,###" />원
												</span> <span class="details"> <em></em>
												</span>
												<h1>${cvo.score }</h1>
												<span> <c:forEach var="i" begin="1" end="5">
														<sup style="color: gold"> <c:if
																test="${cvo.score+1>i }">★</c:if>
														</sup>
													</c:forEach> <br> <sup>후기 ${cvo.review_count }</sup>
												</span>
												<div class="main-white-button">
													<a
														href="../activity/activity_detail.do?acino=${cvo.acino }">
														<i class="fa fa-eye"></i> Contact Now
													</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>

						<%-- Course 출력 --%>
						<c:forEach var="tvo" items="${tList}">
							<div class="item">
								<div class="row">
									<div class="col-lg-12">
										<div class="listing-item">
											<div class="left-image">
												<a href="../travel/travel_find_detail.do?no=${tvo.no }">
													<img src="${tvo.poster }" class="recentImg" style="width: 480px;height: 400px;">
												</a>
											</div>
											<div class="right-content align-self-center">
												<a href="../travel/travel_find_detail.do?no=${tvo.no }">
													<h4>${tvo.title}</h4>
												</a> <span class="price">
													<div class="icon">
														<img src="../assets/images/listing-icon-01.png" alt="">
													</div>
												</span> <span class="details"> <em></em>
												</span> <span> <br>
												</span>
												<div class="main-white-button">
													<a href="../travel/travel_find_detail.do?no=${tvo.no }">
														<i class="fa fa-eye"></i> Show Detail
													</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>

						<%-- Hotel 출력 --%>
						<c:forEach var="hvo" items="${hList}">
							<div class="item">
								<div class="row">
									<div class="col-lg-12">
										<div class="listing-item">
											<div class="left-image">
												<a href="../hotel/hotel_detail.do?huno=${hvo.huno }"> <img
													src="http://www.jejutori.com/${hvo.poster }"
													class="recentImg" style="width: 480px;height: 400px;">
												</a>
											</div>
											<div class="right-content align-self-center">
												<a href="../hotel/hotel_detail.do?huno=${hvo.huno }">
													<h4>${hvo.name}</h4>
												</a> <span class="price">
													<div class="icon">
														<img src="../assets/images/listing-icon-01.png" alt="">
													</div>
												</span> <span class="details"> <em></em>
												</span> <span> <br>
												</span>
												<div class="main-white-button">
													<a href="../hotel/hotel_detail.do?huno=${hvo.huno }"> <i
														class="fa fa-eye"></i> 상세보기
													</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
						
						<%-- food 출력 --%>
						<c:forEach var="fvo" items="${fList}">
							<div class="item">
								<div class="row">
									<div class="col-lg-12">
										<div class="listing-item">
											<div class="left-image">
												<a href="../food/food_detail.do?fino=${fvo.fino }">
												<img src="${fvo.poster }" class="recentImg" style="width: 480px;height: 400px;">
												</a>
											</div>
											<div class="right-content align-self-center">
												<a href="../food/food_detail.do?fino=${fvo.fino }">
												  <h4>${fvo.name}</h4>		
												</a>
												<span class="details">
												  <strong style="color: orange">평점&nbsp;&nbsp;${fvo.score }</strong>
												</span><br>
												<span>
												  <i class="fa fa-map-marker"></i>&nbsp;&nbsp;${addr1 }
												</span><br>
												<span>
												  <ul>
									                <c:forTokens items="${fvo.menu }" delims="원" var="m">
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
												</span>
												<div class="main-white-button">
													<a href="../food/food_detail.do?fino=${fvo.fino }"> <i
														class="fa fa-eye"></i> 상세보기
													</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>