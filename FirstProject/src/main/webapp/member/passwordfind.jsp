<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.row1{
  margin: 0px auto;
  width:800px;
}
.btn-sm {
	font-size: 0.5rem;
}
.main-banner1 {
  background-repeat: no-repeat;
  background-position: center center;
  background-size: cover;
  background-image: url(../assets/images/idpwdfind.jpg);
  padding: 200px 0px 100px 0px;
  position: relative;
  overflow: hidden;
}
.main-banner1 .top-text h2 {
  color: #fff;
  font-size: 45px;
  font-weight: 800;
  text-transform: capitalize;
  margin-top: 15px;
  margin-bottom: 45px;
  margin: 0px auto;
}
.nav-item{
	width: 200px; 
	font-size: 15pt;
	white-space: nowrap;
}
th{
	text-align: right;
}
</style>
<script type="text/javascript">
$(function(){
	$('#emailBtn').click(function(){
    	let name=$('#name').val();
    	if(name.trim()==="")
    	{
    		$('#name').focus();
    		return;
    	}
    	
    	let email=$('#email').val();
    	if(email.trim()==="")
    	{
    		$('#email').focus();
    		return;
    	}
    	//axios.get(), axios.post() => vue,react => 서버 연결, 결과값 받기
    	$.ajax({
    		type:'post',
    		url:'../member/passwordfindOk.do',
    		data:{"name":name, "email":email},
    		success:function(result)
    		{
    			let res=result.trim();
    			if(res==='NO')
    			{
    				$('#pwd_email').html('<span style="color:red">이름이나 이메일이 존재하지 않습니다</span>')
    			}
    			else
    			{
    				$('#pwd_email').html('<span style="color:blue">'+res+'</span>')
    			}
    		}
    		
    	})
    })
	$('#telBtn').click(function(){
    	let name=$('#name2').val();
    	if(name.trim()==="")
    	{
    		$('#name2').focus();
    		return;
    	}
    	
    	let tel=$('#tel').val();
    	if(tel.trim()==="")
    	{
    		$('#tel').focus();
    		return;
    	}
    	//axios.get(), axios.post() => vue,react => 서버 연결, 결과값 받기
    	$.ajax({
    		type:'post',
    		url:'../member/passwordfindOk2.do',
    		data:{"name2":name, "tel":tel},
    		success:function(result)
    		{
    			let res=result.trim();
    			if(res==='NO')
    			{
    				$('#pwd_tel').html('<span style="color:red">존재하지 않는 전화번호입니다.</span>')
    			}
    			else
    			{
    				$('#pwd_tel').html('<span style="color:blue">'+res+'</span>')
    			}
    		}
    		
    	})
    })
})
</script>
</head>
<body>
<div class="main-banner1">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="top-text header-text">
            <h2 class="text-center">비밀번호 찾기</h2>
           </div>
         </div>
       </div>
     </div>
   </div>         
<div class="container mt-3 row1">
  
  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li class="nav-item">
      <a class="nav-link active text-center" data-bs-toggle="tab" href="#home">이메일로 찾기</a>
    </li>
    <li class="nav-item text-center">
      <a class="nav-link" data-bs-toggle="tab" href="#menu1">전화번호로 찾기</a>
    </li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div id="home" class="container tab-pane active"><br>
      	<table class="table">
				<tr>
					<th width=20%>이름</th>
					<td width=80%>
						<input type=text id="name" class="input-sm">
					</td>
				</tr>
				<tr>
					<th width=20%>이메일</th>
					<td width=80%>
						<input type=text id="email" class="input-sm">
					</td>
				</tr>
				<tr>
					<td class="text-center" colspan="2">
						<input type=button value="검색"
							class="btn btn-outline-secondary" id="emailBtn">
					</td>
				</tr>
				<tr>
					<td class="text-center" colspan="2">
						<h3 id="pwd_email"></h3>
						
					</td>
				</tr>
			</table>
    </div>
    <div id="menu1" class="container tab-pane fade"><br>
		<table class="table">
				<tr>
					<th width=20%>이름</th>
					<td width=80%>
						<input type=text id="name2" class="input-sm">
					</td>
				</tr>
				<tr>
					<th width=20%>전화번호</th>
					<td width=80%>
						<input type=text id="tel" class="input-sm" value="010-">
					</td>						
				</tr>
				<tr>
					<td class="text-center" colspan="2">
						<input type=button value="검색"
							class="btn btn-outline-secondary" id="telBtn">
					</td>
				</tr>
				<tr>
					<td class="text-center"  colspan="2">
						<h3 id="pwd_tel"></h3>
						
					</td>
				</tr>
			</table>
    </div>
  </div>
</div>
</body>
</html>