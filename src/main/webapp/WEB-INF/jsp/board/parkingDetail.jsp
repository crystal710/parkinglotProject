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
	

	//��� ����Ʈ����
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
					data += '&nbsp;'+"����"+'&nbsp;&nbsp;'+ reply.ranking+'|' +'</td>'
					data += '<td>'+'&nbsp;&nbsp;&nbsp;' + reply.nickname+'&nbsp;&nbsp;&nbsp;'+'|' +'</td>'
					data+='&nbsp;&nbsp;&nbsp;' +'<button id="golist" onclick="goDelete('+reply.boardno+')">��ۻ���</button>'
					data += '</div>'
					$('#replyList').append(data)
					
				}
				
			}, error : function(){
				alert('����')	
			}
		})
	}

	
	$(document).ready(function(){
		getReplyList()
	})

	
	//��� ����
		
	//$(document).ready(function(){
	//	$('#replydel').click(function(){
	//		
	//		$.ajax({url:'${pageContext.request.contextPath}/reply/delete/${board.placeID}'})
	//		,success:function()
	//		
	//	}
	//})
	
		function goDelete(boardno) {
		if(confirm('����� �����ұ��?')){
			location.href = "${pageContext.request.contextPath}/reply/delete?boardno="+boardno+"&placeid=${board.placeID}";
		}
	}
		
		function goUpdate() {
			if(confirm('����� �����ұ��?')){
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
					alert('����߰� ����')
					getReplyList()
					review.value=''
					ranking.value=''
				}, error : function(){
					alert('����߰� ����')
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
		<br>
		<button id="golist" onclick="goList()">��  ��</button>
		

		<c:choose> 
					<c:when test="${ empty userVO }">

				 	</c:when>
				 	<c:otherwise>
						<form name ="replyForm">
							<input id="input1" type="text" name ="review" placeholder="����� �Է��ϼ���" size="40">
							<input id="input2" type ="number" name="ranking" placeholder="����" min="1" max="5">
							<input type ="button" value="����߰�" id="replyBtn">
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