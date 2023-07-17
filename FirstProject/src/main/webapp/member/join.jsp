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
</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.14.0/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery.js"></script>
  <script src="https://code.jquery.com/ui/1.14.0/jquery-ui.js"></script>
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
	      alert("필수 입력 내용을 모두 입력해주세요!");
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
          <select name=phone1 class="input-sm">
           <option>010</option>
          </select>
          <input type=text name=phone id=phone size=12 class="input-sm">
          <input type=button value="전화체크" 
            class="btn btn-sm btn-warning" id="phoneBtn">
         </td>
        </tr> 
       
        <tr>
         <th style="text-align:right;" width=30%><sup style="color:red">*</sup>소개</th>
         <td width=70% class="inline">
          <textarea rows="10" cols="55" name=content></textarea>
         </td>
        </tr> 
        <tr>
	     <th width=20%></th>
         <td width=80% >
         	<div style="text-align:right;">
         	<sub style="color:red;">*은 필수 입력 사항입니다.</sub>
         	</div>
         </td>
        </tr>
        <tr>
          <td colspan="2" class="text-center">
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