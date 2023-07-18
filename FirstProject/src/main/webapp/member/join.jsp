<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../shadow/css/shadowbox.css">

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
  background-image: url(../assets/images/jeju-join.jpg);
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
.table td,.table th{
	border: none;
}
</style>
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.14.0/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery.js"></script>
  <script src="https://code.jquery.com/ui/1.14.0/jquery-ui.js"></script> -->
<script type="text/javascript">
Shadowbox.init({
   players:['iframe']
})
$(function(){
   $('#idCheckBtn').click(function(){
      Shadowbox.open({
    	  content:'../member/idcheck.do',
    	  player:'iframe',
    	  width:370,
    	  height:180,
    	  title:'아이디 중복체크'
      })
   })
   
   $('#postBtn').click(function(){
      Shadowbox.open({
    	  content:'../member/postfind.do',
    	  player:'iframe',
    	  width:520,
    	  height:350,
    	  title:'우편번호 검색'
      })
   })
   $('#emailBtn').click(function(){
	  let email=$('#email').val();
	  if(email.trim()=="")
	  {
		  $('#email').focus();
		  return;
	  }
	  $.ajax({
		  type:'post',
		  url:'../member/emailfind.do',
		  data:{"email":email},
		  success:function(result)
		  {
			  let count =Number(result.trim());
			  if(count==0)
			  {
				// 중복된 이메일이 없는 경우
				  $('#emailmsg').html('<span style="color:green; font-size:8px">사용가능한 이메일 입니다.</span>')
				  
			  }
			  else
			  {	  
				  // 중복된 이메일이 있는 경우
				  $('#emailmsg').html('<span style="color:red; font-size:8px">'+email+'은(는)존재하는 이메일 입니다.</span>')
				  $('#email').val("")
				  $('#email').focus()
			  }
		  }
	  })
	  
   })
   $('#phoneBtn').click(function(){
	    let tel1=$('#tel1').val()
	   	let tel2=$('#tel2').val()
	   	let tel3=$('#tel3').val()
	   	let phone=tel1.trim()+tel2.trim()+tel3.trim()
    	if(tel2.trim()=="")
    	{
    		$('#tel2').focus();
    		return;
    	}
    	else if(tel3.trim()=="")
    	{
    		$('#tel3').focus();
    		return;
    	}
	    $.ajax({
	    	type:'post',
	    	url:'../member/phonefind.do',
	    	data:{"phone":phone},
	    	success:function(result)
	    	{
	    		let count =Number(result.trim());
	    		if(count==0)
	    		{
	    			// 중복된 전화번호가 없는 경우
					$('#phonemsg').html('<span style="color:green; font-size:8px">사용가능한 전화번호 입니다.</span>')
	    		}
	    		else
	    		{
					$('#phonemsg').html('<span style="color:red; font-size:8px">사용중인 전화번호 입니다.</span>')    			
					$('#tel2').val("")
					$('#tel3').val("")
				  	$('#tel2').focus()
				  	
	    		}	
	    	}
	    })
   })
   
     $('#joinBtn').click(function(){
	   // 필수 입력 필드 배열
	   var requiredFields = ['id', 'name', 'post', 'pwd', 'birth', 'sex', 'addr1', 'addr2', 'content'];
	   var isValid = true;
	   
	   // 필수 입력 필드를 순회하며 값이 비어있는지 확인
	   for (var i = 0; i < requiredFields.length; i++) {
	      var field = requiredFields[i];
	      var value = $('#' + field).val();
	      if (value === '') {
	         isValid = false;
	         break;
	      }
	   }
	   
	   if (!isValid) {
	      $('#warning').html('<span style="color:blue; font-size:8px">입력사항들을 모두 입력해주세요</span>')
	      return; // 입력값이 없을 경우 함수를 종료하고 이후 코드를 실행하지 않음
	   }

	   alert("회원가입 완료!");
	   $('#joinFrm').submit();
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
            <h2 class="text-center">회원가입</h2>
           </div>
         </div>
       </div>
     </div>
   </div>         
<div class="popular-categories">
    <div class="container">
    <div style="height:20px"></div>
    <div class="row row1">
     <form method="post" action="../member/join_ok.do" name="joinFrm" id="joinFrm">
      <table class="table">
        <tr>
         <th style="text-align:right;" width=30%><sup style="color:red">*</sup>ID</th>
         <td width=70% class="inline">
          <input type=text name=id id=id size=20 class="input-sm"
           readonly>
          <input type=button value="중복체크" class="btn btn-sm btn-success" id="idCheckBtn">
         </td>
        </tr>
        
        <tr>
         <th style="text-align:right;" width=30%><sup style="color:red">*</sup>비밀번호</th>
         <td width=70% class="inline">
          <input type=password name=pwd id=pwd size=20 class="input-sm">
          &nbsp;재입력&nbsp;<input type=password name=pwd1 id=pwd1 size=20 class="input-sm">
         </td>
        </tr>
        
        <tr>
         <th style="text-align:right;" width=30%><sup style="color:red">*</sup>이름</th>
         <td width=70% class="inline">
          <input type=text name=name id=name size=20 class="input-sm">
         </td>
        </tr>
        
        <tr>
         <th style="text-align:right;" width=30%><sup style="color:red">*</sup>성별</th>
         <td width=70% class="inline">
          <input type="radio" name=sex value="남자" checked>남자
          <input type="radio" name=sex value="여자">여자
         </td>
        </tr>
        
        <tr>
         <th style="text-align:right;" width=30%><sup style="color:red">*</sup>생년월일</th>
         <td width=70% class="inline">
          <input type="date" name=birthday id=birth size=20>
         </td>
        </tr>
        
        <tr>
         <th style="text-align:right;" width=30%>이메일</th>
         <td width=70% class="inline">
          <input type=text name=email id=email size=45 class="input-sm">
          <input type=button value="이메일체크" 
            class="btn btn-sm btn-danger" id="emailBtn">
         </td>
        </tr>
        <tr>
        	<th width="30%"></th>
        	<td width="70%" id="emailmsg"></td>
        </tr>
        <tr>
         <th style="text-align:right;" width=30%><sup style="color:red">*</sup>우편번호</th>
         <td width=70% class="inline">
          <input type=text name=post id=post size=10 class="input-sm">
          <input type=button value="우편번호검색" class="btn btn-sm btn-info"
            id="postBtn">
         </td>
        </tr>
        
        <tr>
         <th style="text-align:right;" width=30%><sup style="color:red">*</sup>주소</th>
         <td width=70% class="inline">
          <input type=text name=addr1 id=addr1 size=55 class="input-sm"
           readonly
          >
         </td>
        </tr>
        
        <tr>
         <th style="text-align:right;" width=30%><sup style="color:red">*</sup>상세주소</th>
         <td width=70% class="inline">
          <input type=text name=addr2 id=addr2 size=55 class="input-sm">
         </td>
        </tr>
       
        <tr>
         <th style="text-align:right;" width=30%>전화</th>
         <td width=70% class="inline">
          <select name=phone1 id="tel1" class="input-sm">
           <option>010</option>
           <option>011</option>
           <option>016</option>
           <option>070</option>
          </select>
          -<input type=text name=phone2 id="tel2" size=4 class="input-sm">
          -<input type=text name=phone3 id="tel3" size=4 class="input-sm">
          <input type=button value="전화체크" 
            class="btn btn-sm btn-warning" id="phoneBtn">
         </td>
        </tr>
        <tr>
        	<th width="30%"></th>
        	<td width="70%" id="phonemsg"></td>
        </tr> 
       
        <tr>
         <th style="text-align:right;" width=30%><sup style="color:red">*</sup>소개</th>
         <td width=70% class="inline">
          <textarea rows="10" cols="55" name=content></textarea>
         </td>
        </tr> 
        <tr>
	     <th width=20%></th>
         <td width=80% id="warning" style="text-align: right">
         	
         </td>
        </tr>
        <tr>
        	<th width=20%></th>
          <td width=80% class="text-center">
           <input type="button" value="회원가입" 
             class="btn btn-success btn-sm" id="joinBtn">
           <input type=button value="취소"
             class="btn btn-info btn-sm" onclick="javascript:history.back()">
          </td>
        </tr>
      </table>
      </form>
    </div>
   </div>
  </div>
</body>
</html>