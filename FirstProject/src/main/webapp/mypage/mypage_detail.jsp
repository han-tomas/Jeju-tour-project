<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.table{
	box-shadow: 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	border-radius: 10px;
	width: 600px;
	margin: 0px auto;
}
.table th{
	background-color: #FFECB3;
}
.table th,.table td{
	border: none;
}
</style>
</head>
<body>
<h2 class="sectiontitle text-center">My JeJu</h2>
	<div style="height: 30px"></div>
    <div class="row">
      <table class="table">
        <tr>
         <th style="border-top-left-radius: 10px;" width=20% class="text-center">ID</th>
         <td width=70% class="inline">${vo.id }</td>
        </tr>        
        <tr>
         <th class="text-center" width=20%>이름</th>
         <td width=70% class="inline">${vo.name }</td>
        </tr>
        
        <tr>
         <th class="text-center" width=20%>성별</th>
         <td width=70% class="inline">${vo.sex }</td>
        </tr>
        
        <tr>
         <th class="text-center" width=20%>생년월일</th>
         <td width=70% class="inline">${vo.birth }</td>
        </tr>
        
        <tr>
         <th class="text-center" width=20%>이메일</th>
         <td width=70% class="inline">${vo.email }</td>
        </tr>
        <tr>
         <th class="text-center" width=20%>우편번호</th>
         <td width=70% class="inline">${vo.post }</td>
        </tr>
        
        <tr>
         <th class="text-center" width=20%>주소</th>
         <td width=70% class="inline">${vo.addr1 }</td>
        </tr>
        
        <tr>
         <th class="text-center" width=20%>상세주소</th>
         <td width=70% class="inline">${vo.addr2 }</td>
        </tr>
       
        <tr>
         <th class="text-center" width=20%>전화</th>
         <td width=70% class="inline">${phone1}-${phone2 }-${phone3 }</td>
        </tr>  
        <tr>
         <th style="border-bottom-left-radius: 10px;" width=20% class="text-center">소개</th>
         <td width=70% class="inline">${vo.content }</td>
        </tr> 
      </table>
    </div>
</body>
</html>