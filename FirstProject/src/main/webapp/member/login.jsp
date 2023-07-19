<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="preconnect" href="https://fonts.gstatic.com">

<!-- Bootstrap core CSS -->
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


<!-- Additional CSS Files -->
<link rel="stylesheet" href="../assets/css/fontawesome.css">
<link rel="stylesheet" href="../assets/css/templatemo-plot-listing.css">
<link rel="stylesheet" href="../assets/css/animated.css">
<link rel="stylesheet" href="../assets/css/owl.css">
<title>Jeju Project - Login</title>
<style>
.contact-page {
	margin-top:5px;
}
.row {
	width: 480px;
	margin:5px;
}
.row1 {
	display: flex;
	align-items: center;
	justify-content: center;
}
.logtable th,.logtable td {
	border: none;
}
.loglogo{
	width: 400px;
	height: 200px;
	margin: 0px auto;
	margin-top: 100px;
}

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#logBtn').click(function(){
		let id=$('#id').val();
		if(id.trim()=="") {
			$('#id').focus();
			return;
		}
		let pwd = $('#pwd').val();
		if (pwd.trim()=="") {
			$('#pwd').focus();
			return;
		}
		// 전송 => 실행결과를 가지고 온다 (자체처리) (요청/응답 : Ajax, Vue, React)
		$.ajax({
			type:'post',
			url:'../member/loginCheck.do',
			data:{"id":id, "pwd":pwd},
			success:function(result) { // NOID, NOPWD, OK
				let res = result.trim();
				if (res === 'NOID') {
					alert("아이디가 존재하지 않습니다!");
					$('#id').val("");
					$('#pwd').val("");
					$('#id').focus();
				} else if (res === 'NOPWD') {
					alert("비밀번호가 틀립니다");
					$('#pwd').val("");
					$('#pwd').focus();
				} else {
					parent.location.href="../main/main.do";
				}
			}
		})
		
	})
	$('#joinBtn').click(function() {
	  // 회원가입 페이지로 이동
	  parent.location.href = "../member/join.do";
	  // Shadowbox 닫기
	  Shadowbox.close();
	});
	$('#loglogo').click(function(){
		parent.location.href = "../main/main.do";
		// Shadowbox 닫기
		Shadowbox.close();
	});
	$('#idfind').click(function(){
		parent.location.href="../member/idfind.do";
		Shadowbox.close();
	})
	$('#pwdfind').click(function(){
		parent.location.href="../member/passwordfind.do";
		Shadowbox.close();
	})
})
</script>
</head>
<body>
  <div class="contact-page">
      <div class="row">
	      	<a href="#" class="loglogo" id="loglogo">
	      		<img src="jeju_logo.png">
	         </a>  	
      	<table class="table logtable">
      		
      		<tr class="inline">
      			<td width="30%" style="text-align: right">아이디</td>
      			<td width="40%">
      				<input type=text name="id" id="id" tabindex="1">
      			</td>
      			<td rowspan="2" width="30%">
      				<button type="submit" id="logBtn" class="btn btn-outline-warning" style="width: 100px;height: 100px;" tabindex="3">로그인</button>
      			</td>
      		</tr>
      		<tr>
      			<td width="30%" style="text-align: right">비밀번호</td>
      			<td width="40%">
      				<input type="password" name="pwd" id="pwd" tabindex="2">
      			</td>
      		</tr>
      		<tr>
      			<td colspan="3" class="text-center">
      				<button type="submit" id="joinBtn" class="btn btn-outline-success">회원가입</button>
                    <span class="btn btn-outline-danger" id="idfind">아이디 찾기</span>
                    <span class="btn btn-outline-primary" id="pwdfind">비밀번호 찾기</span>
      			</td>
      		</tr>
      	</table>
      </div>
  </div>    	
  <!-- Scripts -->
	<script src="../vendor/jquery/jquery.min.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="../assets/js/owl-carousel.js"></script>
	<script src="../assets/js/animation.js"></script>
	<script src="../assets/js/imagesloaded.js"></script>
	<script src="../assets/js/custom.js"></script>
</body>
</html>