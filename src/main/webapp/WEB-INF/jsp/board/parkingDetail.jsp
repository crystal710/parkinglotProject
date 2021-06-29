<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/board.css">

<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>
	#input1 {width:500px;height:50px;border-top :none;
	border-left:none; border-right:none; border-bottom 3px solid black; }
	#input2 {width:100px;height:50px;border-top :none; text-align:center;
	border-left:none; border-right:none; border-bottom 3px solid black;}
	#replyBtn {
    width:100px;
    background-color: #E6EDF5;
    border: none;
    color:#4F76A3;
    padding: 15px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 4px;
    cursor: pointer;
}
#replyBtn:hover{
    background-color: white;
    display: inline-block;
    padding: 15px 0;
    border:1px;
    color:#4F76A3;
    cursor: pointer;
}
#golist{
    width:70px;
    background-color: #E6EDF5;
    border: none;
    color:#4F76A3;
    padding: 15px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 13px;
    margin: 4px;
    cursor: pointer;
}
#golist:hover{
    background-color: white;
    display: inline-block;
    padding: 15px 0;
    border:1px;
    color:#4F76A3;
    cursor: pointer;
}

/* 	#replyBtn {margin-reight:-4px; border:1px solid skyblue; background-color:rgba(0,0,0,0); color:skyblue;padding:5px}
	#replyBtn button:hover{ color:white; background-color: skyblue; } */


</style>
<script>
	function goList() {
		location.href = "${ pageContext.request.contextPath}/parkingList";	
	}
	

	//댓글 리스트보기
	function getReplyList(){
		
		$('#replyList').empty()
		
		$.ajax({
			url: '${pageContext.request.contextPath}/reply/${board.placeID}'
			, success : function(responseData){
				
				//let replyList = JSON.parse(responseData)
				let replyList=responseData;
				for(let reply of replyList){
					let data = '<hr>'
					data += '<div>'
					data += '<td>'+ reply.reg_date+'|' +'</td>'
					data += '&nbsp;&nbsp;&nbsp;' + reply.review+'&nbsp;&nbsp;&nbsp;'+'|' +'</td>'
					data += '&nbsp;'+"평점"+'&nbsp;&nbsp;'+ reply.ranking+'|' +'</td>'
					data += '<td>'+'&nbsp;&nbsp;&nbsp;' + reply.nickname+'&nbsp;&nbsp;&nbsp;'+'|' +'</td>'
					data+='&nbsp;&nbsp;&nbsp;' +'<button id="golist" onclick="goDelete('+reply.boardno+')">댓글삭제</button>'
					data += '</div>'
					$('#replyList').append(data)
					
				}
				
			}, error : function(){
				alert('실패')	
			}
		})
	}

	
	$(document).ready(function(){
		getReplyList()
	})

	
	//댓글 삭제
		
	//$(document).ready(function(){
	//	$('#replydel').click(function(){
	//		
	//		$.ajax({url:'${pageContext.request.contextPath}/reply/delete/${board.placeID}'})
	//		,success:function()
	//		
	//	}
	//})
	
		function goDelete(boardno) {
		if(confirm('댓글을 삭제할까요?')){
			location.href = "${pageContext.request.contextPath}/reply/delete?boardno="+boardno+"&placeid=${board.placeID}";
		}
	}
		
		function goUpdate() {
			if(confirm('댓글을 수정할까요?')){
				location.href = "${pageContext.request.contextPath}/reply/update/${board.placeID}"
			}
		
	}
	
	$(document).ready(function(){
		$('#replyBtn').click(function(){
			let review = document.replyForm.review
			let ranking = document.replyForm.ranking
			
			$.ajax({
				url: '${pageContext.request.contextPath}/reply'
				,type: 'post'
				, data: {
					review: review.value
					, placeID : "${board.placeID}"
					, ranking : ranking.value
					
				}, success: function(){
					alert('댓글추가 성공')
					getReplyList()
					review.value=''
					ranking.value=''
				}, error : function(){
					alert('댓글추가 실패')
				}
			})
		})
	})
	
</script>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/jsp/include/topMenu.jsp" />
	</header>
	<section>
		<div align="center">
		<hr>
		<h1>주차장 정보</h1>
		<hr>
		<br>
		
		<table border="1" style="width:100%">
			<tr>
				<th width="25%">주차장 번호</th>
				<td>${ board.placeID }</td>
			</tr>
			<tr>
				<th width="25%">주차장 이름</th>
				<td>${ board.parkingLotName }</td>
			</tr>
			<tr>
				<th width="25%">주차장 타입</th>
				<td>${ board.lotType1} / ${board.lotType2 }
				</td>
			</tr>
			<tr>
				<th width="25%">주차장 주소</th>
				<td>도로명 주소 : ${ board.roadAddr } <br>
				주소 : ${board.addr}</td>
			</tr>
			<tr>
				<th width="25%">요금 정보</th>
				<td>${board.payment}
				</td>
			</tr>
			<tr>
				<th width="25%">주차 요금</th>
				<td>기본 요금 : ${ board.normalCharge} 원<br>
					추가 요금 : ${board.addCharge } 원<br>
					일주차 요금 : ${board.onedayCharge } 원<br>
					월주차 요금 : ${board.monthCharge } 원
				</td>
			</tr>
			<tr>
				<th width="25%">이용시간</th>
				<td>평일 운영시간 : ${ board.weekday_start} ~ ${board.weekday_end }<br>
					토요일 운영시간 : ${board.sat_start } ~ ${board.sat_end }<br>
					일요일/공휴일 운영시간 : ${board.holi_start } ~ ${board.holi_end }
				</td>
			</tr>
		</table>
		<br>
		<button id="golist" onclick="goList()">목  록</button>
		

		<c:choose> 
					<c:when test="${ empty userVO }">

				 	</c:when>
				 	<c:otherwise>
						<form name ="replyForm">
							<input id="input1" type="text" name ="review" placeholder="댓글을 입력하세요" size="40">
							<input id="input2" type ="number" name="ranking" placeholder="평점" min="1" max="5">
							<input type ="button" value="댓글추가" id="replyBtn">
							</div>
						</form>
					</c:otherwise>
				</c:choose>
		
		<div id="replyList" >
		</div>
		
		
		
		

		
	</div>
	</section>
	<footer>
		<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
	</footer>
</body>
</html>