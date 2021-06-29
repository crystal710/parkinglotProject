<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/layout.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/board.css">
<script src="${ pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script>
	function checkLogin() {
		
		let f = document.loginForm
		if(f.id.value == '') {
			alert('아이디를 입력해주세요')
			f.id.focus()
			return false
		}
		
		if(f.password.value == '') {
			alert('비밀번호를 입력해주세요')
			f.password.focus()
			return false
		}
		
		return true
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
				<h1>로그인</h1>
			<hr>
			<br>
			<form name="loginForm" action="${pageContext.request.contextPath}/login" method="post" onsubmit="return checkLogin()">
				<table style="width: 60%">
					<tr>
						<th>아이디</th>
						<td><input type="text" name="id"></td>
					</tr>
					<tr>
						<th>패스워드</th>
						<td><input type="password" name="password"></td>
					</tr>
				</table>
				<br>
				<button type="submit">로그인</button>
			</form>
		</div>
	</section>
	<footer>
		<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
	</footer>
</body>
</html>