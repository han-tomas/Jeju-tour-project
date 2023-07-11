<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
a {
  text-decoration: none;
  color: inherit;
}
.tabs {
  list-style: none;
  margin: 0;
  padding: 0;
  display: flex;
  justify-content: space-between;
  height: 30px;
  color: #000;
}

.container1 {
  max-width: 700px;
  width: 100%;
  padding: 30px;
  border-radius: 20px;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
} 
.tab-item {
	color: #000;
}

.tab-item a:hover {
  color: inherit;
  padding-bottom: 4px;
  border-bottom: 3px solid #FF7F31;
}

.wrapper_tab-content {
  position: relative;
}

.tab-content {
  position: absolute;
  padding: 1.75em 0;
  visibility: hidden;
  height: 0;
}

.tab-content h1 {
  font-size: 1.12em;
  margin-bottom: .5em;
}

.content-visible {
  position: static;
  visibility: visible;
  height: auto;
}

.actived {
  padding-bottom: 4px;
  border-bottom: 3px solid #FFA63C;
}
.slideImage {
	width: 600px;
	height: 400px;
}

.carousel-inner {
	border: solid 2px gray;
	border-radius: 7px;
}

.col-lg-12 {
	border: solid 2px gray;
	border-radius: 7px;
	padding: 10px;
}
</style>
<script type="text/javascript">

const selectTab = element => {
  const active = document.querySelector('.actived');
  const visible = document.querySelector('.content-visible');
  const tabContent = document.getElementById(element.href.split('#')[1]);
  if (active) {
    active.classList.remove('actived');
  }
  element.classList.add('actived');
  if (visible) {
    visible.classList.remove('content-visible');
  }
  tabContent.classList.add('content-visible');
}
document.addEventListener('click', event => {
  if (event.target.matches('.tab-item a')) {
    selectTab(event.target);
  }
}, false);


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
	<div class="container container1">
		<div class="row" >
			<div class="col-sm-12" style="text-align: center;">
				<div class="col-sm-12">
				<div id="carouselExampleControls" class="carousel slide"
					data-bs-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="${ images[0] }" class="d-block w-100" alt="...">
						</div>
						<c:forEach var="i" begin="1" end="${imagesLength-1}">
							<div class="carousel-item">
								<img src="${images[i]}" class="d-block w-100" alt="...">
							</div>
						</c:forEach>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleControls" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleControls" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
				</div>
			</div>
			<div class="col-lg-12">
				<h4>${ vo.addr1 }</h4>
				<h1>${ vo.name }</h1>
			</div>
			<div class="col-lg-12">
				<ul class="tabs">
					<li class="tab-item"><a href="#item1" class="actived">이용안내</a></li>
					<li class="tab-item"><a href="#item2">부대시설</a></li>
					<li class="tab-item"><a href="#item3">취소/환불규정</a></li>
					<li class="tab-item"><a href="#item4">평점/리뷰</a></li>
					<li class="tab-item"><a href="#item5">지도</a></li>
				</ul>
				<div class="wrapper_tab-content">
					<article id="item1" class="tab-content content-visible">
						<h1>Item One</h1>
						<p>Roof party irony iceland, ugh sartorial banh mi photo booth
							semiotics lyft williamsburg before they sold out celiac chambray
							wolf tumeric. Gastropub typewriter sustainable man bun hoodie.</p>
					</article>
					<article id="item2" class="tab-content">
						<h1>Item Two</h1>
						<p>Roof party irony iceland, ugh sartorial banh mi photo booth
							semiotics lyft williamsburg before they sold out celiac chambray
							wolf tumeric. Gastropub typewriter sustainable man bun hoodie.</p>
					</article>

					<article id="item3" class="tab-content">
						<h1>Item Three</h1>
						<p>Roof party irony iceland, ugh sartorial banh mi photo booth
							semiotics lyft williamsburg before they sold out celiac chambray
							wolf tumeric. Gastropub typewriter sustainable man bun hoodie.</p>
					</article>

					<article id="item4" class="tab-content">
						<h1>Item Four</h1>
						<p>Roof party irony iceland, ugh sartorial banh mi photo booth
							semiotics lyft williamsburg before they sold out celiac chambray
							wolf tumeric. Gastropub typewriter sustainable man bun hoodie.</p>
					</article>

					<article id="item5" class="tab-content">
						<h1>Item Five</h1>
						<p>Roof party irony iceland, ugh sartorial banh mi photo booth
							semiotics lyft williamsburg before they sold out celiac chambray
							wolf tumeric. Gastropub typewriter sustainable man bun hoodie.</p>
					</article>

				</div>
			</div>
		</div>
	</div>
</body>
</html>
