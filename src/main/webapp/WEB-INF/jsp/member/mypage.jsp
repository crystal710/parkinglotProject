<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/board.css">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<header>
	<jsp:include page="/WEB-INF/jsp/include/topMenu.jsp" />
</header>
<section>
	<div align="center">
	<hr>
		<h2 class="text-center" >마이페이지</h2>
	<hr>
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
						${member.nickname }
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						${member.password }
					</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>
						${member.phone1}-${member.phone2}-${member.phone3}
					</td>
				</tr>
				<tr>
					<th>가입일</th>
					<td>
						${member.regDate }
					</td>
				</tr>
				<tr>
					<td class="text-center" colspan="2">
					<a type="button" href="updateUserForm?id=${member.id }">수정</a>
			</table>
		</h2>
	</div>
</section>
<footer>
	<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
</footer>
</body>
</html>