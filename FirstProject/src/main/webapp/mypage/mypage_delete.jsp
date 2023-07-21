<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	$('#checkBtn').click(function(){
		let pwd = $('#pwd').val()
		if(pwd.trim=="")
		{
			$('#pwd').focus()
			return
		}
		$.ajax({
			type:'post',
			url:'../mypage/mypage_delete_ok.do',
			data:{"pwd":pwd},
			success:function(result)
			{
				let res = result.trim()
				if(res==="NO")
				{
					alert("비밀번호가 틀립니다");
					$('#pwd').val("")
					$('#pwd').focus()
				}
				else
				{
					alert("회원 탈퇴 완료")
					location.href="../main/main.do"
				}	
			}
		})
	})
})
</script>
<style type="text/css">
th,td{
	border:none;
}
.table{
	box-shadow: 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	border-radius: 10px;
}
</style>
</head>
<body>
<h2>회원 탈퇴</h2>
	<div style="height: 30px"></div>
	
	<table class="table">
		<tr>
			<th colspan="2">
				<span style="font-size: 15pt">&nbsp;&nbsp;비밀번호 확인</span>
			</th>
		</tr>
		<tr>
			<td width="30%" style="text-align: right">
				비밀번호&nbsp;
			</td>
			<td width="70%">
				<input type=password size=30 name="pwd" id="pwd">
			</td>	
		</tr>
		<tr>
			<td colspan="2" class="text-center" id="msg">
			</td> 
		</tr>
		<tr>
			<td colspan="2" class="text-center">
				<input type = button class="btn btn-sm btn-danger" value="삭제" id="checkBtn">
				<a href="../mypage/mypage_detail.do"  class="btn btn-sm btn-secondary">취소</a>
			</td>
		</tr>
	</table>
</body>
</html>