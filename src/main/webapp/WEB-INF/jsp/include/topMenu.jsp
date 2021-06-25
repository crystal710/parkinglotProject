<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<table border="1" style="width: 100%">
	<tr>
		<th rowspan="2" width="150" id="logo">
			<a href="${ pageContext.request.contextPath }/">
				<img src="${ pageContext.request.contextPath }/resources/images/kakao.png" height="60px;" >
			</a>
		</th>
		<td align="right">
			<a href = "${pageContext.request.contextPath}/favorite">즐겨찾는 주차장</a>
			<c:if test="${ not empty userVO }">
				[${ userVO.name }]님 로그인중...
			</c:if>
		</td>
	</tr>
	<tr>
		<td>
			<nav>
				<c:if test="${ userVO.type eq 'S' }">
				<a href="${pageContext.request.contextPath }/member">회원</a>|
				</c:if> 
				<a href="${ pageContext.request.contextPath }/parkingList">게시판</a> |
				<c:choose> 
					<c:when test="${ empty userVO }">
						<a href = "${ pageContext.request.contextPath }/register">회원가입</a> | 
						<a href="${ pageContext.request.contextPath }/login">로그인</a> |
				 	</c:when>
				 	<c:otherwise>
						<a href="${pageContext.request.contextPath }/mypage">마이페이지</a> | 
						<a href="${ pageContext.request.contextPath }/logout">로그아웃</a>
					</c:otherwise>
				</c:choose>
			</nav>
		</td>
	</tr>
</table>














