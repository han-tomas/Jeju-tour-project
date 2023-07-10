<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach var="vo" items="${ list}">
						<div class="col-md-4" style="padding: 8px;">
							<section class="panel" s>
								<div class="pro-img-box">
									<a
										href="../activity/activity_detail_before.do?acino=${vo.acino }">
										<img src="${ vo.main_poster }" class="img-fluid"
										style="width: 240px; height: 240px;">
									</a>
								</div>
								<div class="panel-body text-left">
									<h5>
										<a
											href="../activity/activity_detail_before.do?acino=${vo.acino }"
											class="pro-title"> ${ vo.title } </a>
									</h5>
								</div>
								<img
									src="https://dffoxz5he03rp.cloudfront.net/icons/ico_star.svg"
									class="starIcon">&nbsp;<b>${vo.score }</b>&nbsp;${vo.review_count }
								<h4 style="font-weight: bold">
									<fmt:formatNumber value="${vo.price }" pattern="#,###" />
									원
								</h4>
							</section>
						</div>
					</c:forEach>
</body>
</html>