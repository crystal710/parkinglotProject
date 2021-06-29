<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/board.css">
<script src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>

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
		<h2 class = "text-center">사용자 회원 가입</h2>
		<hr>
		<div>
			<form:form method = "post" modelAttribute="MemberVO">
			<table class ="table table-bordered table table-hover" style="width: 60%" >
					<tr>
						<th>아이디</th>
						<td>
							<form:input path="id"/><form:errors path="id"/>
							
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>
							<form:password path="password"/><form:errors path="password"/>
						</td>
					</tr>
					<tr>
						<th>이름</th>
							<td>
							<form:input path= "name" /><form:errors path="name"/>
						</td>
					</tr>
					<tr>
						<th>닉네임</th>
							<td>
								<form:input path="nickname"/>
							</td>
					</tr>			
					<tr>
						<th>핸드폰 번호</th>
							<td>
								<form:input path="phone1"/><form:errors path="phone1"/> - <form:input path="phone2"/><form:errors path="phone2"/> - <form:input path="phone3"/><form:errors path="phone3"/>	
							</td>
					</tr>
				</table>
				<br>
							<button id="btn" type="submit" >회원가입</button>			
			</form:form>
		</div>
	</div>
	</section>
	<footer>
		<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
	</footer>
</body>
</html>