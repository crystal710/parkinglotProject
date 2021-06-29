<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 수정</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/board.css">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script>
function update(){ 
	alert("수정되었습니다"); 
	} 
</script>
</head>
<style>
#btn{
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
#btn:hover{
    background-color: white;
    display: inline-block;
    padding: 15px 0;
    border:1px;
    color:#4F76A3;
    cursor: pointer;
}
</style>
<body>
<header>
	<jsp:include page="/WEB-INF/jsp/include/topMenu.jsp" />
</header>
<section>
	<div align="center">
	<hr>
		<h2 class="text-center">회원수정</h2>
	<hr>
		<form action="updateUserForm" method="post">
			<input type="hidden" name="id" value="${member.id}"/>
			<table class="table table-bordered table table-hover" style="width: 60%">
				<tr>
					<th>아이디</th>
					<td>${member.id }</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						${member.name }
					</td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td>
						<input type="text" name="nickname" value="${member.nickname }"/>
					</td>
				</tr>
				<tr>
					<th>이전 비밀번호</th>
					<td>
						${member.password }
					</td>
				</tr>
				<tr>
					<th>새로운 비밀번호</th>
					<td>
						<input type="password" name="password" id="password" required="required"/>
					</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>
						<input type="text" name="phone1" value="${member.phone1 }"/>-<input type="text" name="phone2" value="${member.phone2}"/>-<input type="text" name="phone3" value="${member.phone3}"/>
					</td>
				</tr>
			</table>
			<br>
					<input id="btn" type="submit" role="button" onclick="javascript:update()" value="수정">
			</form>
	</div>
</section>
<footer>
	<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
</footer>
</body>
</html>