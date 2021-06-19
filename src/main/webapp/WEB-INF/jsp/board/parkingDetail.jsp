<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/board.css">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script>
	function goList() {
		location.href = "${ pageContext.request.contextPath}/parkingList";	
	}
		
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
		<br><br>
		<button onclick="goList()">목  록</button>
		
		<form name ="replyForm">
			댓글 :<input type="text" name ="content" size="50">
			이름 :<input type ="text" name ="writer" size="10">
			<input type ="button" value="댓글추가" id="replyBtn">
		</form>
		
		<div id="replyList" >
		</div>
		
	</div>
	</section>
	<footer>
		<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
	</footer>
</body>
</html>