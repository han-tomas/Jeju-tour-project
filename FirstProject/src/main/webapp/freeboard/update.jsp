<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.main-banner1 {
  background-repeat: no-repeat;
  background-position: center center;
  background-size: cover;
  background-image: url(../assets/images/freeboard.jpg);
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
.row1{
	margin: 0px auto;
	width: 960px;
}
.container1{
	display: flex;
    justify-content: center;
    align-items: center;
}
.pagination .page-item.active .page-link {
    background-color: orange;
    border-color: orange;
  }
.row1{
	width: 600px;
	margin: 0px auto;
}
.table{
	border-radius: 7px;
  box-shadow: 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}
</style>
<script type="text/javascript">
$(function(){
	$('#updateBtn').click(function(){
		let no=$('#no').val()
		let name=$('#name').val()
		let subject=$('#subject').val()
		let content=$('#content').val()
		let pwd=$('#pwd').val()
		if(name.trim()=="")
		{
			$('#name').focus()
			return
		}
		else if(subject.trim()=="")
		{
			$('#subject').focus()
			return
		}
		else if(content.trim()=="")
		{
			$('#content').focus()
			return
		}
		else if(pwd.trim()=="")
		{
			$('#pwd').focus()
			return
		}
		else
		{
			$.ajax({
				type:'post',
				url:'../freeboard/update_ok.do',
				data:
						{
							"no":no,
							"name":name,
							"subject":subject,
							"content":content,
							"pwd":pwd
						},
				success:function(result)
				{
					alert(result)
					let res=result.trim();
					if(res==="false")
					{
						alert("비밀번호가 틀립니다")
						$('#pwd').val("")
						$('#pwd').focus()
					}
					else
					{
						location.href="../freeboard/detail.do?no="+no
					}
				}
			})
		}
		
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
            <h2 class="text-center">글쓰기</h2>
          </div>
        </div>
      </div>
    </div>
</div>  
<div class="popular-categories">
    <div class="container">
	    <div style="height:20px"></div>
	    <div class="row row1">
	    <!-- action="../freeboard/update_ok.do" -->
	    	<table class="table">
	    		<tr>
		  	 		<th width=15%>이름</th>
		  	 		<td width=85%>
		  	 			<input type=text name=name size=20 class="input-sm" id="name" value="${vo.name }">
		  	 			<input type=hidden id="no" value="${vo.no }">
		  	 		</td>
		  	 	</tr>
		  	 	<tr>
		  	 		<th width=15%>제목</th>
		  	 		<td width=85%>
		  	 			<input type=text name=subject size=50 class="input-sm" id="subject" value="${vo.subject }">
		  	 		</td>
		  	 	</tr>
		  	 	<tr>
		  	 		<th width=15%>내용</th>
		  	 		<td width=85%>
		  	 			<textarea rows="10" cols="50" name="content" id="content">${vo.content }</textarea>
		  	 		</td>
		  	 	</tr>
		  	 	<tr>
		  	 		<th width=15%>비밀번호</th>
		  	 		<td width=85%>
		  	 			<input type=password name=pwd size=10 class="input-sm" id="pwd">
		  	 		</td>
		  	 	</tr>
		  	 	<tr>
		  	 		<td colspan="2" class="text-center">
		  	 			<input type=button value="저장" class="btn btn-sm btn-success" id="updateBtn">
		  	 			<input type=button value="취소" class="btn btn-sm btn-info" onclick="javascript:history.back()">
		  	 		</td>
		  	 	</tr>
	    	</table>
	    </div>
	</div>
</div>    	
</body>
</html>