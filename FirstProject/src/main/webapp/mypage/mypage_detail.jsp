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
         <td width=70% class="inline">${vo.id }</td>
        </tr>        
        <tr>
         <th style="text-align:right;" width=30%>이름</th>
         <td width=70% class="inline">${vo.name }</td>
        </tr>
        
        <tr>
         <th style="text-align:right;" width=30%>성별</th>
         <td width=70% class="inline">${vo.sex }</td>
        </tr>
        
        <tr>
         <th style="text-align:right;" width=30%>생년월일</th>
         <td width=70% class="inline">${vo.birth }</td>
        </tr>
        
        <tr>
         <th style="text-align:right;" width=30%>이메일</th>
         <td width=70% class="inline">${vo.email }</td>
        </tr>
        <tr>
         <th style="text-align:right;" width=30%>우편번호</th>
         <td width=70% class="inline">${vo.post }</td>
        </tr>
        
        <tr>
         <th style="text-align:right;" width=30%>주소</th>
         <td width=70% class="inline">${vo.addr1 }</td>
        </tr>
        
        <tr>
         <th style="text-align:right;" width=30%>상세주소</th>
         <td width=70% class="inline">${vo.addr2 }</td>
        </tr>
       
        <tr>
         <th style="text-align:right;" width=30%>전화</th>
         <td width=70% class="inline">${phone1}-${phone2 }-${phone3 }</td>
        </tr>  
        <tr>
         <th style="text-align:right;" width=30%>소개</th>
         <td width=70% class="inline">${vo.content }</td>
        </tr> 
      </table>
    </div>
</body>
</html>