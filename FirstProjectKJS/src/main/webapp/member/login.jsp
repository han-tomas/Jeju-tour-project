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
	height: 350px;
	margin:5px;
}
.row1 {
	display: flex;
	align-items: center;
	justify-content: center;
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
})
</script>
</head>
<body>
  <div class="contact-page">
      <div class="row">
          <div class="inner-content" style="padding:0px">
              <div class="col-sm-12 align-self-center" id="contact">
                  <div class="row row1">
                    <div class="col-sm-6" style="margin-top:10px">
                      <fieldset>
                        아이디<input type=text name="id" id="id" autocomplete="on" required>
                      </fieldset>
                    </div>
                    <div class="col-sm-6">
                      <fieldset>
                        비밀번호<input type="password" name="pwd" id="pwd" placeholder="pwd" autocomplete="on" required>
                      </fieldset>
                    </div>
                    <div class="col-sm-12 d-flex justify-content-center">
                      <fieldset>
                        <button type="submit" id="logBtn" class="main-button">로그인</button>
                        <button type="submit" id="joinBtn" class="main-button">회원가입</button>
                      </fieldset>
                    </div>
                  </div>
            </div>
        </div>
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