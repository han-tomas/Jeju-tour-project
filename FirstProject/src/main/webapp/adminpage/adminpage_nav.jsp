<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title></title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
  <link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css'>
  <link rel="stylesheet" href="../adminpage/style.css">
  <script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
  <script type="text/javascript">
  $(function(){
	  $('#side-nav ul li.selected ul').hide();
	  $('#side-nav ul li.selected span').click(function(){
		  if ($(this).parent().siblings().hasClass('selected')) {
		      $(this).parent().siblings('.selected').children('ul').hide();
		    }
		  $(this).siblings('ul').toggle();
	    // sbling은 선택한 요소의 형제요소 선택
	    // toggle() : 선택한 요소의 가시성 전환 (On/Off)
	    // => 선택한 요소가 보이는 상태에서 호출하면 숨겨지고, 이미 숨겨진 상태에서 호출하면 보인다
	  });
	});
  </script>
</head>
<body>
  <nav id="side-nav">
    <span id=logo>LIST</span>
    <ul>
      <li class="selected">
          <i class="fa fa-users"></i>
          <span><a href="../adminpage/member_list.do">회원관리</a></span>
      </li>
      <li class="selected">
          <i class="fa fa-calendar"></i>
          <span>예약관리</span>
        <ul>
          <li><a href="../adminpage/reserve_activity.do">activity</a></li>
          <li><a href="../adminpage/reserve_hotel.do">숙박</a></li>
          <li><a href="../adminpage/reserve_rentcar.do">렌터카</a></li>
        </ul>
      </li>
      <li class="selected">
          <i class="fa fa-users"></i>
          <span><a href="../adminpage/adminqna_list.do">QnA관리</a></span>
      </li>
    </ul>
  </nav>
</body>
</html>

