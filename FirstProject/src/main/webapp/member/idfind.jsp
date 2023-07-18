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
$( function() {
    $('#emailBtn').on('click',function(){
    	let email=$('#email').val();
    	if(email.trim()=="")
    	{
    		$('#email').focus();
    		return;
    	}
    	
    	$.ajax({
    		type:'post',
    		url:'../member/idfind_ok.do',
    		data:{"email":email},
    		success:function(result)
    		{
    			let res=result.trim();
    			if(res==='NO')
    			{
    				//email이 없는 경우 => email이 존재하지 않습니다.
    				//email => UNIQUE KEY
    				$('#id_email').html('<span style="color:red">이메일이 존재하지 않습니다</span>');
    			}
    			else
    			{
    				//email이 있는 경우 => id출력
    				//shim => s***
    				$('#id_email').html('<span style="color:blue">'+res+'</span>');
    				
    			}
    		}
    		
    	})
    		
    })
    $('#telBtn').on('click',function(){
    	let phone=$('#tel').val();
    	if(phone.trim()=="")
    	{
    		$('#tel').focus();
    		return;
    	}
    	$.ajax({
    		type:'post',
    		url:'../member/idfind_ok2.do',
    		data:{"tel":phone},
    		success:function(result)
    		{
    			let res=result.trim();
    			if(res==='NO')
    			{
    				//email이 없는 경우 => email이 존재하지 않습니다.
    				//email => UNIQUE KEY
    				$('#id_tel').html('<span style="color:red">존재하지 않는 전화번호입니다.</span>');
    			}
    			else
    			{
    				//email이 있는 경우 => id출력
    				//shim => s***
    				$('#id_tel').html('<span style="color:blue">'+res+'</span>');
    				
    			}
    		}
    	})
    })		
  });
</script>
</head>
<body>
<div class="main-banner1">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="top-text header-text">
            <h2 class="text-center">아이디 찾기</h2>
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
				<tr class="inline">
					<th width=30% style="text-align: right;font-size: 15pt">
						이메일
					</th>
					<td width=70%>	
						<input type=text id="email" class="input-sm" style="height: 40px">
						<input type=button value="검색"
							class="btn btn-outline-secondary" id="emailBtn">
					</td>
				</tr>
				<tr>
					<td class="text-center" colspan="2">
						<h3 id="id_email"></h3>
						
					</td>
				</tr>
			</table>
    </div>
    <div id="menu1" class="container tab-pane fade"><br>
		<table class="table">
				<tr class="inline">
					<th width=30%  style="text-align: right;font-size: 15pt">
						전화번호
					</th>
					<td width=70%>	
						<input type=text id="tel" class="input-sm" style="height: 40px" value="010-">
						<input type=button value="검색"
							class="btn btn-outline-secondary" id="telBtn">
					</td>
				</tr>
				<tr>
					<td class="text-center" colspan="2">
						<h3 id="id_tel"></h3>
						
					</td>
				</tr>
			</table>
    </div>
  </div>
</div>
</body>
</html>