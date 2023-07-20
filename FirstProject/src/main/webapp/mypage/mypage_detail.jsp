<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2 class="sectiontitle">내정보</h2>
	<div style="height: 30px"></div>
    <div class="row">
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
	          <input type=password name=pwd id=pwd size=20 class="input-sm" value="${vo.pwd }" readonly>
	         </td>
        </tr>
        
        <tr>
         <th style="text-align:right;" width=30%>이름</th>
         <td width=70% class="inline">
          <input type=text name=name id=name size=20 class="input-sm" value="${vo.name }" readonly>
         </td>
        </tr>
        
        <tr>
         <th style="text-align:right;" width=30%>성별</th>
         <td width=70% class="inline">
          <input type="radio" name=sex value="남자" ${vo.sex=='남자'?"checked":"disabled" }>남자
          <input type="radio" name=sex value="여자" ${vo.sex=='여자'?"checked":"disabled" }>여자
         </td>
        </tr>
        
        <tr>
         <th style="text-align:right;" width=30%>생년월일</th>
         <td width=70% class="inline">
          <input type="date" name=birthday id=birth size=20 value="${vo.birth }" readonly>
         </td>
        </tr>
        
        <tr>
         <th style="text-align:right;" width=30%>이메일</th>
         <td width=70% class="inline">
          <input type=text name=email id=email size=45 class="input-sm" value="${vo.email }" readonly>
         </td>
        </tr>
        <tr>
         <th style="text-align:right;" width=30%>우편번호</th>
         <td width=70% class="inline">
          <input type=text name=post id=post size=10 class="input-sm" value="${vo.post }" readonly>
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
          <input type=text name=addr2 id=addr2 size=55 class="input-sm" value="${vo.addr2 }" readonly>
         </td>
        </tr>
       
        <tr>
         <th style="text-align:right;" width=30%>전화</th>
         <td width=70% class="inline">
          <select name=phone1 id="tel1" class="input-sm">
           <option>${phone1}</option>
          </select>
          -<input type=text name=phone2 id="tel2" size=4 class="input-sm" value="${phone2 }" readonly>
          -<input type=text name=phone3 id="tel3" size=4 class="input-sm" value="${phone3 }" readonly>
         </td>
        </tr>  
        <tr>
         <th style="text-align:right;" width=30%>소개</th>
         <td width=70% class="inline">
          <textarea rows="10" cols="55" name=content readonly>${vo.content }</textarea>
         </td>
        </tr> 
      </table>
    </div>
</body>
</html>