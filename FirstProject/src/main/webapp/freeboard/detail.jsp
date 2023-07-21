<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
.table{
	border-radius: 7px;
  box-shadow: 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}
.table th{
	background-color: #FFE0B2;
}
</style>
<script type="text/javascript">
let i=0; //전역변수
let u=0;
let k=0;
$(function(){
	$('#del').click(function(){
		if(i==0)
		{	
			
			$(this).text("취소");
			$(this).removeClass('btn-danger').addClass('btn-secondary');
			$('#delTr').show();
			i=1;
		}	
		else
		{
			$(this).text("삭제");
			$(this).removeClass('btn-secondary').addClass('btn-danger');
			$('#delTr').hide();
			i=0;
		}
	})
	$('#delBtn').click(function(){
		let pwd=$('#pwd1').val();
		let no=$('#delBtn').attr("data-no")
		//let no=$(this).attr("data-no")
		if(pwd.trim()=="")
		{
			$('#pwd1').focus();
			return;
		}	
		$.ajax({
			type:'post',
			url:'../freeboard/delete.do',
			data:{"no":no,"pwd":pwd},
			success: function(result)
			{
				let res=result.trim();
				if(res==='NO')
				{
					alert("비밀번호가 틀립니다.")
					$('#pwd1').val("")
					$('#pwd1').focus()
				}	
				else
				{
					location.href="../freeboard/list.do"
				}
			}
		})
	})
	// Update(수정)
	$('.ups').click(function(){
		let no=$(this).attr("data-no");
		$('.ups').text("수정");
		$('.updates').hide();
		if(u===0)
		{
			$('#u'+no).show();
			$(this).text("취소");
			u=1;
		}
		else
		{
			$('#u'+no).hide();
			$(this).text("수정");
			u=0;
		}
	})
	$('.ins').click(function(){
		let no=$(this).attr("data-no");
		$('.ins').text("댓글");
		$('.reins').hide();
		$('.updates').hide();
		if(k==0)
		{
			$(this).text("취소");
			$('#i'+no).show();
			k=1;
		}
		else
		{
			$(this).text("댓글");
			$('#i'+no).hide();
			k=0;
		}
	})
	$('#reBtn').click(function(){
		let cont=$('#recont').val()
		if(cont.trim()=="")
		{
			$('#recont').focus()
			return;
		}
		$('#reForm').submit()
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
            <h2 class="text-center">자유 게시판</h2>
          </div>
        </div>
      </div>
    </div>
</div>  
<div class="popular-categories">
    <div class="container">
	    <div style="height:20px"></div>
	    <div class="row row1">
	    	<table class="table">
	    		<tr>
		  	 		<th width=20% class="text-center">번호</th>
		  	 		<td width=30% class="text-center">${vo.no }</td>
		  	 		<th width=20% class="text-center">작성일</th>
		  	 		<td width=30% class="text-center">${vo.dbday }</td>
		  	 	</tr>
		  	 	<tr>
		  	 		<th width=20% class="text-center">이름</th>
		  	 		<td width=30% class="text-center">${vo.name }</td>
		  	 		<th width=20% class="text-center">조회수</th>
		  	 		<td width=30% class="text-center">${vo.hit }</td>
		  	 	</tr>
		  	 	<tr>
		  	 		<th width=20% class="text-center">제목</th>
		  	 		<td colspan="3">${vo.subject }</td>
		
		  	 	</tr>
		  	 	<tr>
		  	 		<td colspan="4" class="text-left" valign="top" height="200">
		  	 			<pre style="white-space:pre-wrap;border:none;background-color:white;">${vo.content }</pre>
		  	 		</td>
		  	 	</tr>
		  	 	<tr>
		  	 		<td colspan="4" style="text-align: right">
		  	 			<a href="../freeboard/update.do?no=${vo.no }" class="btn btn-sm btn-success">수정</a>
		  	 			<span class="btn btn-sm btn-danger" id="del">삭제</span>
		  	 			<a href="../freeboard/list.do" class="btn btn-sm btn-primary">목록</a>
		  	 		</td>
		  	 		
		  	 	</tr>
		  	 	<tr style="display:none" id="delTr">
		  	 		<td colspan="4" class="inline" style="text-align: right">
		  	 		비밀번호<input type=password name=pwd id=pwd1 size=10
		  	 		class="input-sm">
		  	 		<input type=button value="삭제" data-no="${vo.no }"
		  	 		class="btn btn-sm btn-danger" id="delBtn">
		  	 		</td>
		  	 	</tr>
	    	</table>
	    	<table class="table">
		  	 <%-- 댓글 출력 위치 --%>
		  	 <tr>
		  	 	<td>
		  	 		<c:forEach var="rvo" items="${list }">
		  	 			<table class="table">
		  	 				<tr>
		  	 					<td class="text-left">
		  	 						<c:if test="${rvo.group_tab>0 }">
		  	 							<c:forEach var="i" begin="1" end="${rvo.group_tab }">
		  	 							&nbsp;&nbsp;&nbsp;&nbsp;
		  	 							</c:forEach>
		  	 							<img src="image/arrow.png" style="width: 24px; height: 16px;">
		  	 						</c:if>
		  	 						<img src="image/reply.png" style="width: 15px; height: 15px;">&nbsp;${rvo.name }&nbsp;(${rvo.dbday })
		  	 					</td>
		  	 					<td class="text-right">
		  	 						<c:if test="${sessionScope.id!=null  }">
		  	 							<c:if test="${sessionScope.id==rvo.id || sessionScope.admin=='y'}">
				  	 						<span class="btn btn-sm btn-success ups" data-no="${rvo.no }">수정</span>
				  	 						<a href="../freeboard/reply_delete.do?no=${rvo.no }&bno=${vo.no}" class="btn btn-sm btn-danger">삭제</a>
		  	 							</c:if>
			  	 						<span class="btn btn-sm btn-warning ins" data-no="${rvo.no }">댓글</span>
		  	 						</c:if>
		  	 					</td>
		  	 				</tr>
		  	 				<tr>
		  	 					<td colspan="2"><pre style="white-space: pre-wrap;background-color: white;border: none">${rvo.content }</pre>
		  	 					</td>
		  	 				</tr>
		  	 				<tr style="display: none" class="reins" id="i${rvo.no }">
					  	 		<td colspan="2">
					  	 			<form method="post" action="../freeboard/reply_reply_insert.do" class="inline">
					  	 				<input type="hidden" name="bno" value="${vo.no}">
					  	 				<%-- bno는 다시 detail.do로 이동하기 위함 --%>
					  	 				<input type="hidden" name="pno" value="${rvo.no}">
					  	 				<textarea rows="4" cols="55" name="content" style="float: left"></textarea>
					  						<input type=submit value="댓글쓰기" style="width: 126px;height: 102px;background-color: #FF9800;color: white; border-color: #FF9800; border-radius: 10px;">
					  	 			</form>
					  	 		</td>
					  	 	</tr>
		  	 				<tr style="display: none" class="updates" id="u${rvo.no }">
					  	 		<td colspan="2">
					  	 			<form method="post" action="../freeboard/reply_update.do" class="inline">
					  	 				<input type="hidden" name="bno" value="${vo.no}">
					  	 				<%-- bno는 다시 detail.do로 이동하기 위함 --%>
					  	 				<input type="hidden" name="no" value="${rvo.no}">
					  	 				<textarea rows="4" cols="55" name="content" style="float: left">${rvo.content }</textarea>
					  						<input type=submit value="댓글수정" style="width: 126px;height: 102px;background-color: #FF9800;color: white; border-color: #FF9800; border-radius: 10px;">
					  	 			</form>
					  	 		</td>
					  	 	</tr>
		  	 			</table>
		  	 		</c:forEach>
		  	 	</td>
		  	 </tr>
		  	 </table>
		  	<c:if test="${sessionScope.id!=null }">
	    	<table class="table">
		  	 <%-- 새댓글 입력 --%>
		  	 	<tr>
		  	 		<td>
		  	 			<form method="post" action="../freeboard/reply_insert.do" class="inline" id="reForm">
		  	 				<input type="hidden" name="bno" value="${vo.no}">
		  	 				<textarea rows="4" cols="60" name="content" style="float: left" id="recont"></textarea>
		  						&nbsp;<input type=button value="댓글쓰기" style="width: 126px;height: 102px;background-color: #FF9800;color: white; border-color: #FF9800; border-radius: 10px;" id="reBtn">
		  	 			</form>
		  	 		</td>
		  	 	</tr>
		  	 </table>
		  	</c:if>
	    </div>	
	</div>
</div>	    
</body>
</html>