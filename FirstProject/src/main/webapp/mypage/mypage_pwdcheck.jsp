<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
th,td{
	border: none;
}
.table{
	box-shadow: 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	border-radius: 10px;
}
</style>
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
			url:'../mypage/mypage_pwdcheck_ok.do',
			data:{"pwd":pwd},
			success:function(result)
			{
				let res = result.trim()
				if(res==="NO")
				{
					$('#msg').html('<span style="color:red; font-size:10pt">비밀번호가 틀립니다</span>')
				}
				else
				{
					location.href="../mypage/mypage_update.do"
				}	
			}
		})
	})
})
</script>
</head>
<body>
	<h2>내정보관리</h2>
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
				<input type = button class="btn btn-sm btn-info" value="다음" id="checkBtn">
				<input type = button class="btn btn-sm btn-secondary" value="취소"
				 onclick="javascript:history.back()">
			</td>
		</tr>
	</table>
</body>
</html>