<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery 라이브러리 로드 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- jQuery UI 라이브러리 로드 -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


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
<script type="text/javascript">
$(function() {
    // datepicker 초기화
    //$(".datepicker").daterangepicker();
    $(".datepicker").daterangepicker({
		//format : "yyyy-mm-dd", //데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
		//mindate:0;
		//todayHighlight : true, //오늘 날짜에 하이라이팅 기능 기본값 :false 
		//toggleActive : true, //이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제		
    
	});
})

</script>
</head>
<body>

<!-- <form action="../rentcar/rentcar_reserve.do"> -->
  <div class="page-heading">
    <div class="container">
      <div class="row">
        <div class="col-lg-8">
          <div class="top-text header-text"></div>
        </div>
      </div>
    </div>
  </div>
  <form method="post" action="../rentcar/rentcar_reserve.do" id="rFrm">
  <div class="popular-categories">
    <div class="container">
      <div class="row">
        <div class="col-md-4">
          <div class="thumbnail">
              <img src="https://rentinjeju.com${vo.img}" style= "alt:Lights; border-radius:20px; ">
          </div>
        </div>
        <div class="col-md-8">
          <div class="thumbnail">
            	
       		
              <div class="caption2">
                <h1>${vo.car_name}</h1>
                <hr>
                <span>${vo.car_size}ㆍ${vo.seater}ㆍ${vo.fuel_type}ㆍ${vo.gear_type}ㆍ${vo.brand}</span>
               <hr>
 			<!--<h3>대여기간 선택</h3>
 			<table class="table">
           
           <tr>
             <td id="diary"></td>
           </tr>
          </table>-->
          
    <div class="row" style="justify-content: right;">
    
    <input type=hidden name="cid" value="${vo.cid}">
						<div class="input-group" style="width: 360px;">
							
							
							<i class="fa fa-calendar fa-2x" style="padding:4px 10px 0px 0px"></i>
							<input type="text" class="form-control datepicker" value="" name="date" id="date" style="width:200px;" />
						</div>
						
					</div>
               		
               
              </div>
            
          </div>
        </div>
      </div>
    </div>
  </div>
  
  
   
    <div class="container">
      <div class="row">
        <div class="col-md-12">
        
           <h3 style="text-align: center;">자차 면책 선택</h3>
           <br>
			<div class="row">
          		 
          
			    <div class="col-md-4">
			    <input type="radio" name="insOpt" value="가입안함" checked> 가입 안함 <br><br>
			    <font color="red" >&nbsp;</font>
			    <hr>
<pre style="background-color: white;">
- 자차 미가입.
<br>
※ 만21세 이상, 운전면허 취득 후 2년이상 경과.
   </pre>
			    </div>
			    <div class="col-md-4">
			    <input type="radio" name="insOpt" value="일반자차"> 일반 자차<br><br>
			    <font color="red" >+5000원</font>
   				<hr>
    			<pre style="background-color: white;">
- 보상한도:300만원
<br>
- 면책금:수리비의 20%(최저20만원 ~ 최고50만원)
<br>
- 휴차보상료:1일대여요금의 50% X 수리기간
<br>
- 보험내용:보상한도초과금 고객부담 / 단독사고 
및 임차인100% 과실사고건 자차처리 불가
<br> 
※ 만26세 이상, 운전면허 취득 후 1년이상 경과.
   				</pre>
			    </div>
			    <div class="col-md-4">
			    <input type="radio" name="insOpt" value="고급자차" > 고급 자차 <br><br>
			    <font color="red" >+10000원</font>
			    <hr>
<pre style="background-color: white;">
- 보상한도:250~400만원
<br>
- 면책금:없음
<br>
- 휴차보상료:없음
<br>
※ 만23세 이상, 운전면허 취득 후 2년이상 경과.
   </pre>
			    </div>
			    
			   
			</div>
         </div>  	
        </div>
      </div>
	<c:if test="${sessionScope.id!=null }">
    <div class="container">
    	<div class="row">
    		<div class="col-md-12 text-center">
    			<input type=submit class="btn btn-lg btn-danger btn-reservation" value="예약하기" style="width: 150px" id="reserveBtn" >
    		</div>
    	</div>
    </div>
    </c:if>
    </form>
    <c:if test="${sessionScope.id==null }">
    <div class="container">
    	<div class="row">
    		<div class="col-md-12 text-center">
    			<input class="btn btn-lg btn-danger btn-reservation" value="로그인하세요" style="width: 200px">
    		</div>
    	</div>
    </div>
    </c:if>
    
   <!--  </form> -->
    <br>
    
    <div class="container">
    	<div class="row">
    	<div class="col-md-12">
        <div class="thumbnail">
    	<pre style="background-color: white;">
<h1 style ="text-align:center;">렌트카 추가정보</h1>
<br>
＊ 실시간 가격비교사이트이며 예약확정시 인수관련 안내메세지가 카카오톡 또는 문자메세지로 들어가오니 꼭 확인바라며 전송이 안됬을경우 전화연락바랍니다.  

▶ 렌트카 이용안내  

* 기본 차량대여조건은 만21세이상 면허취득후 만1년이상만 대여가능합니다.
- 단,차종/자차보험에따라 연령 및 경력기준은 다를수 있음(예약페이지참고)  

* 운전면허증 필수지참해야만 대여가능하며 미지참시 대여불가합니다.
- 운전자등록은 최대2인까지가능  

* 모든차량은 종합보험 가입(대인/대물/자손)이 되어있으며 자차보험은 선택사항입니다.
- 자차보험 미가입시 과실로 인한 차량손해는 임차인책임  

* 자차는 1회성보험이며, 단독사고는 보장이 안됩니다.  

* 자차가입시 면책적용 불가사항품목(타이어,휠,출동서비스,실내부품,네비게이션,침수,차키,배터리,견인 등등)이 있으므로 이점 숙지바랍니다.  

* 낚시용품소지자 또는 군인, 애견동반, 국제면허증이용시에는 차량대여불가합니다
-일부 렌트카회사중 애견동반이 가능한 업체도 있으므로 사전문의바랍니다  

* 인수/반납은 지정된 렌트카본사에서만 가능하고 타지역배차는 불가능합니다.  

* 승차정원 초과시에 대여불가하며 총 대여시간이 120시간을 초과하는경우 전화연락바랍니다.  

* 인수/반납은 기본 08시~20시까지며 그외에 인수/반납을 원할경우 지정된 렌트카회사로 전화하셔서 문의바랍니다.
  (업체별로 추가비용이발생하거나 대여가 불가능할수 있으므로 꼭 사전에 확인부탁드립니다)

* 차량 이미지는 참고용사진이며 실제와 다를수 있으며 색상지정은 불가능합니다  

* 예약변경 및 취소는 업무시간에만 처리가능합니다
-(월~금 09시~18시 / 토~일·공휴일휴무)  

* 렌트카 조기반납 시 미사용 일정에 대한 대여료·보험료 환불불가

* 취소시 취소규정에 따라 전체금액에서 취소수수료적용됩니다.
- 천재지변으로인해 취소할경우 "결항확인서" 제출시 100% 환불가능 

▶ 면허증 분실시

  - 면허증 분실및 소지하셨을경우 면허증을 대체할 서류와 신분증을 지참해오시면 렌트대여가능합니다
  - 대체서류와 신분증을 지참하지 않으실 경우에는 렌트대여불가로 당일취소로 처리되어 환불이 불가능합니다

* 면허증 대체서류 받는방법 *

 1. 신분증 지참 후 가까운 경찰서 민원실 방문하여 "임시면허증" 발급

 2. 민원 24에서 "운전경력증명서"를 방급
 </pre>
    	</div>
    </div>
    </div>
    </div>
  
  
</body>
</html>