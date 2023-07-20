<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.table td,.table th{
	border: none;
}
</style>
</style>
<script type="text/javascript">
Shadowbox.init({
   players:['iframe']
})
$(function(){
   $('#pwd1').keyup(function(){
	   let pwd=$('#pwd').val()
	   let pwd1=$('#pwd1').val()
	   if(pwd.trim()===pwd1.trim())
	   {
		   $('#pwdmsg').html('<span style="color:green;font-size:8px">비밀번호가 일치합니다</span>')
	   }
	   else
	   {
		   $('#pwdmsg').html('<span style="color:red;font-size:8px">비밀번호가 일치하지 않습니다.</span>')
		  
	   }  
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
	   let requiredFields = ['id', 'name', 'post', 'pwd', 'birth', 'sex', 'addr1', 'addr2', 'content'];
	   let isValid = true;
	   let pwd=$('#pwd').val()
	   let pwd1=$('#pwd1').val()
	   // 필수 입력 필드를 순회하며 값이 비어있는지 확인
	   for (let i = 0; i < requiredFields.length; i++) {
	      let field = requiredFields[i];
	      let value = $('#' + field).val();
	      if (value === '') {
	         isValid = false;
	         break;
	      }
	   }
	   
	   if (!isValid) {
	      $('#warning').html('<span style="color:blue; font-size:8px">입력사항들을 모두 입력해주세요</span>')
	      return; // 입력값이 없을 경우 함수를 종료하고 이후 코드를 실행하지 않음
	   }
	   if(pwd.trim()!==pwd1.trim())
		{
		   $('#pwd1').val("")
		   $('#pwd1').focus()
		   
		}
	   else
	   {
		   alert("정보 수정 완료!");
		   $('#joinFrm').submit();
	   }
	})
})
</script>
</head>
<body>
<h2 class="sectiontitle">내정보 수정</h2>
	<div style="height: 30px"></div>
    <div class="row">
     <form method="post" action="../mypage/mypage_update_ok.do" name="joinFrm" id="joinFrm">
      <table class="table">
        <tr>
         <th style="text-align:right;" width=30%>ID</th>
         <td width=70% class="inline">
          <input type=text name=id id=id size=20 class="input-sm" value="${vo.id }"
           readonly>
         </td>
        </tr>
        
        <tr>
         <th style="text-align:right;" width=30%>비밀번호</th>
	         <td width=70% class="inline">
	          <input type=password name=pwd id=pwd size=20 class="input-sm" value="${vo.pwd }">
	         </td>
        </tr>
        <tr>
         <th style="text-align:right;" width=30%>재입력</th>
         <td>
         	<input type=password name=pwd1 id=pwd1 size=20 class="input-sm" value="${vo.pwd }">
         </td>
        </tr>
        <tr>
        	<th width=30%></th>
        	<td width=70% id="pwdmsg">
        	</td>
        </tr>
        
        <tr>
         <th style="text-align:right;" width=30%>이름</th>
         <td width=70% class="inline">
          <input type=text name=name id=name size=20 class="input-sm" value="${vo.name }">
         </td>
        </tr>
        
        <tr>
         <th style="text-align:right;" width=30%>성별</th>
         <td width=70% class="inline">
          <input type="radio" name=sex value="남자" ${vo.sex=='남자'?"checked":"" }>남자
          <input type="radio" name=sex value="여자" ${vo.sex=='여자'?"checked":"" }>여자
         </td>
        </tr>
        
        <tr>
         <th style="text-align:right;" width=30%>생년월일</th>
         <td width=70% class="inline">
          <input type="date" name=birthday id=birth size=20 value="${vo.birth }">
         </td>
        </tr>
        
        <tr>
         <th style="text-align:right;" width=30%>이메일</th>
         <td width=70% class="inline">
          <input type=text name=email id=email size=45 class="input-sm" value="${vo.email }">
          <input type=button value="이메일체크" 
            class="btn btn-sm btn-danger" id="emailBtn">
         </td>
        </tr>
        <tr>
        	<th width="30%"></th>
        	<td width="70%" id="emailmsg"></td>
        </tr>
        <tr>
         <th style="text-align:right;" width=30%>우편번호</th>
         <td width=70% class="inline">
          <input type=text name=post id=post size=10 class="input-sm" value="${vo.post }">
          <input type=button value="우편번호검색" class="btn btn-sm btn-info"
            id="postBtn">
         </td>
        </tr>
        
        <tr>
         <th style="text-align:right;" width=30%>주소</th>
         <td width=70% class="inline">
          <input type=text name=addr1 id=addr1 size=55 class="input-sm"
           readonly value="${vo.addr1 }"
          >
         </td>
        </tr>
        
        <tr>
         <th style="text-align:right;" width=30%>상세주소</th>
         <td width=70% class="inline">
          <input type=text name=addr2 id=addr2 size=55 class="input-sm" value="${vo.addr2 }">
         </td>
        </tr>
       
        <tr>
         <th style="text-align:right;" width=30%>전화</th>
         <td width=70% class="inline">
          <select name=phone1 id="tel1" class="input-sm">
           <option>010</option ${phone1=='010'?"selected":"" }>
           <option>011</option ${phone1=='011'?"selected":"" }>
           <option>016</option ${phone1=='016'?"selected":"" }>
           <option>070</option ${phone1=='070'?"selected":"" }>
          </select>
          -<input type=text name=phone2 id="tel2" size=4 class="input-sm" value="${phone2 }">
          -<input type=text name=phone3 id="tel3" size=4 class="input-sm" value="${phone3 }">
          <input type=button value="전화체크" 
            class="btn btn-sm btn-warning" id="phoneBtn">
         </td>
        </tr>
        <tr>
        	<th width="30%"></th>
        	<td width="70%" id="phonemsg"></td>
        </tr> 
       
        <tr>
         <th style="text-align:right;" width=30%>소개</th>
         <td width=70% class="inline">
          <textarea rows="10" cols="55" name=content>${vo.content }</textarea>
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
           <input type="button" value="완료" 
             class="btn btn-success btn-sm" id="joinBtn">
           <input type=button value="취소"
             class="btn btn-secondary btn-sm" onclick="javascript:history.back()">
          </td>
        </tr>
      </table>
      </form>
    </div>
</body>
</html>