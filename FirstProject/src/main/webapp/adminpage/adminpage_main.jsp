<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.container1{
	width: 1200px;
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
<div class="col-sm-3" style="height: 500px;"><!-- background-color: orange; -->
  <jsp:include page="../adminpage/adminpage_nav.jsp"></jsp:include>
</div>
<div class="col-sm-9" style="height: 500px;"><!-- background-color: yellow; -->
  <%--변경위치 --%>
  <jsp:include page="${adminpage_jsp }"></jsp:include>
</div>
</div>
</div>
</body>
</html>