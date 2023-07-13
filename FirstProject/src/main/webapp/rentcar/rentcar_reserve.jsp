<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <style>
    /* CSS 스타일을 추가합니다. */

    /* .thumbnail 클래스의 스타일 */
    .thumbnail {
      display: flex;
      flex-direction: column;
      align-items: center;
      text-align: center;
      margin-bottom: 20px;
      
    }

    /* .thumbnail 이미지 스타일 */
    .thumbnail img {
      width: 400px;
      height: 300px;
    }

    /* .caption 클래스의 스타일 */
    .caption {
      display: flex;
      flex-direction: column;
      align-items: center;
      text-align: center;
      width:400px;
      height:300px;
      margin: 0 auto;
      
    }
    
    /* .caption 클래스의 스타일 */
    .caption2 {
      display: flex;
      flex-direction: column;
      align-items: center;
      text-align: center;
      
      margin: 0 auto;
      
    }

    /* .caption span 스타일 */
    .caption span {
      margin-bottom: 5px;
    }

    /* .caption hr 스타일 */
    .caption hr {
      width: 100%;
      margin: 10px 0;
    }

    /* .caption .more 스타일 */
    .caption .more {
      color: blue;
      text-decoration: underline;
    }
    
    .caption2 {
    display: flex; justify-content: center;
    margint-top:10px;
    
    }
   
  .btn-reservation {
    font-size: 24px;
    padding: 15px 30px;
  }

    
  </style>
</head>
<body>

  <div class="page-heading">
    <div class="container">
      <div class="row">
        <div class="col-lg-8">
          <div class="top-text header-text"></div>
        </div>
      </div>
    </div>
  </div>
  <div class="popular-categories">
    <div class="container">
      <div class="row">
        <div class="col-md-4">
          <div class="thumbnail">
            
              <img src="https://rentinjeju.com${vo.img}" style="alt=Lights; border-radius:20px;">
              
          </div>
        </div>
        <div class="col-md-8">
          <div class="thumbnail">
            	
       		
              <div class="caption2">
                <h1>${vo.car_name}</h1>
                <hr>
                <span>${vo.car_size}ㆍ${vo.seater}ㆍ${vo.fuel_type}ㆍ${vo.gear_type}ㆍ${vo.brand}</span>
                <hr>
                <table class="table">
                <tr>
                	<th>대여일</th>
                </tr>
                 <tr>
                	<th>반납일</th>
                </tr>
                 <tr>
                	<th>총 사용시간</th>
                </tr>
                
                </table>
                
                <hr>
              </div>
            
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="popular-categories">
    <div class="container">
    <div class="thumbnail">
           <h3>인수 반납 장소</h3>
           <hr>
           <pre style="background-color: white;">
	인수장소 : 본사				반납장소 : 본사
	</pre>
    </div>

    <br>
    <div class="container">
    <div class="thumbnail">
           <h3></h3>
           <hr>

    </div>
    </div>
    
    </div>
    </div>
    <h3 style= "text-align:center">예약자 정보 입력</h3>
   <div class="wrapper row3">
   <main class="container clear">
    
    <div class="row">
     <form method="post" action="../member/join_ok.do" name="joinFrm" id="joinFrm">
      <table class="table">
 
        <tr>
         <th class="text-right" width=10%>이름</th>
         <td width=90% class="inline">
          <input type=text name=name id=name size=20 class="input-sm" required>
         </td>
        </tr>
 
        <tr>
         <th class="text-right" width=10%>이메일</th>
         <td width=90% class="inline">
          <input type=text name=email id=email size=55 class="input-sm">
          <input type=button value="이메일체크" 
            class="btn btn-sm btn-danger" id="emailBtn">
         </td>
        </tr>

        <tr>
         <th class="text-right" width=10%>전화</th>
         <td width=90% class="inline">
          <select name=phone1 class="input-sm">
           <option>010</option>
          </select>
          <input type=text name=phone id=phone size=12 class="input-sm" required>
          <input type=button value="전화체크" 
            class="btn btn-sm btn-warning" id="phoneBtn">
         </td>
        </tr> 
       
        <tr>
         <th class="text-right" width=10%>전달 메세지</th>
         <td width=90% class="inline">
          <textarea rows="10" cols="55" name=content></textarea>
         </td>
        </tr> 
        
        <tr>
          <td colspan="2" class="text-center">
           <input type="button" value="결제" 
             class="btn btn-success btn-sm" id="joinBtn">
           <input type=button value="취소"
             class="btn btn-info btn-sm" onclick="javascript:history.back()">
          </td>
        </tr>
      </table>
      </form>
    </div>
   </main>
   <div class="row">
        <div class="col-md-12">
        <div class="thumbnail">
        
           <h3 style="text-align: center;">최종 금액</h3>
           <hr>
			<font color="red" size="50px">${vo.price }원</font>
        </div>
      </div>
    </div>
  </div>
   <div class="container">
    	<div class="row">
    		<div class="col-md-12 text-center">
    		<a href="../rentcar/rentcar_reserve.do?cid=${vo.cid }">
    			<input type=button class="btn btn-lg btn-danger btn-reservation" value="결제하기" style="width: 150px" id="reserveBtn" >
    		</a>
    		<br><br>
    		</div>
    	</div>
    </div>
</body>
</html>