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
		<h1>������ ����</h1>
		<hr>
		<br>
		
		<table border="1" style="width:100%">
			<tr>
				<th width="25%">������ ��ȣ</th>
				<td>${ board.placeID }</td>
			</tr>
			<tr>
				<th width="25%">������ �̸�</th>
				<td>${ board.parkingLotName }</td>
			</tr>
			<tr>
				<th width="25%">������ Ÿ��</th>
				<td>${ board.lotType1} / ${board.lotType2 }
				</td>
			</tr>
			<tr>
				<th width="25%">������ �ּ�</th>
				<td>���θ� �ּ� : ${ board.roadAddr } <br>
				�ּ� : ${board.addr}</td>
			</tr>
			<tr>
				<th width="25%">��� ����</th>
				<td>${board.payment}
				</td>
			</tr>
			<tr>
				<th width="25%">���� ���</th>
				<td>�⺻ ��� : ${ board.normalCharge} ��<br>
					�߰� ��� : ${board.addCharge } ��<br>
					������ ��� : ${board.onedayCharge } ��<br>
					������ ��� : ${board.monthCharge } ��
				</td>
			</tr>
			<tr>
				<th width="25%">�̿�ð�</th>
				<td>���� ��ð� : ${ board.weekday_start} ~ ${board.weekday_end }<br>
					����� ��ð� : ${board.sat_start } ~ ${board.sat_end }<br>
					�Ͽ���/������ ��ð� : ${board.holi_start } ~ ${board.holi_end }
				</td>
			</tr>
		</table>
		<br><br>
		<button onclick="goList()">��  ��</button>
		
		<form name ="replyForm">
			��� :<input type="text" name ="content" size="50">
			�̸� :<input type ="text" name ="writer" size="10">
			<input type ="button" value="����߰�" id="replyBtn">
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