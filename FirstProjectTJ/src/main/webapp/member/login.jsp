<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="../shadow/css/shadowbox.css">
<style type="text/css">
.container{
margin-top:20px;
}
.row{
margin : 0px auto;
width:500px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">

$(function(){ 

   $('#loginBtn').click(function(){
      let id = $('#id').val();
      if (id.trim() == "") {
         $('#id').focus();
         return;
      }
      let pwd = $('#pwd').val();
      if (pwd.trim() == "") {
         $('#pwd').focus();
         return;
      }

      $.ajax({
         type: 'post',
         url: '../member/login_ok.do',
         data: { "id": id, "pwd": pwd },
         success: function (result) {
            let res = result.trim();
            if (res === 'NOID') {
               alert("아이디가 존재하지 않습니다.")
               $('#id').val("");
               $('#pwd').val("");
               $('#id').focus();
            } else if (res === 'NOPWD') {
               alert("비밀번호가 틀립니다.")
               $('#pwd').val("");
               $('#pwd').focus();
            } else {
               
               parent.location.href = "../main/main.do";
            }
         }
      });
   });
   $('#joinBtn').click(function() {
	   // 회원가입 페이지로 이동
	   parent.location.href = "../member/join.do";
	   // Shadowbox 닫기
	   Shadowbox.close();
	 });
});
</script>
</head>
<body>
	<div class="container">
		<div class="row">
		<center><h2>LogIn</h2></center>
			<table class="table">
			<tr>
				<th class="text-right" width="20%">아이디</th>
				<td width="60%">
					<input type="text" name="id" id="id" class="input-sm" size=20>
				</td>
				<td width="20%" rowspan="2">
					<input type="button" value="로그인" id="loginBtn" style="width:100px;height:100px" class="btn btn-primary">
				</td>
			</tr>
			<tr>
				<th class="text-right" width="20%">비밀번호</th>
				<td width="60%">
					<input type="password" name="pwd" id="pwd" class="input-sm" size=20>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="text-center">
					<a href="../member/join.do" class="btn btn-xs btn-primary" id="joinBtn">회원가입</a>
					<a href="#" class="btn btn-xs btn-primary">아이디 찾기</a>
					<a href="#" class="btn btn-xs btn-primary">비밀번호 찾기</a>
				</td>
			</tr>
		</table>
		</div>
	</div>
</body>
</html>