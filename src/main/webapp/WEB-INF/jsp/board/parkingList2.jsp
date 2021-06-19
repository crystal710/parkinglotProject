<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/layout.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/board.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script src="${ pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<c:url var="getParkingListURL" value="/board/parkingList"></c:url>
<style>
		.wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
		.wrap * {padding: 0;margin: 0;}
		.wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
		.wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
		.info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
		.info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
		.info .close:hover {cursor: pointer;}
		.info .body {position: relative;overflow: hidden;}
		.info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
		.desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
		.desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
		.info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
		.info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
		.info .link {color: #5085BB;}
	</style>
	<style>
		th{
			text-align: center
		}
	</style>
	
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/jsp/include/topMenu.jsp" />
	</header>
	<section>
		<div align="center">
		<br>
		<hr>
		<h1>전체주차장 목록</h1>
		<hr>
		
		
	<div id="map" style="height:400px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b4d4853c1373399acd61fd1971fdfc33"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도의 중심좌표
		mapOption = { 
			center: new kakao.maps.LatLng(33.451475, 126.570528), // 지도의 중심좌표
			level: 3 // 지도의 확대 레벨
		}; 

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	// 지도에 마커를 표시합니다 
	var marker = new kakao.maps.Marker({
		map: map, 
		position: new kakao.maps.LatLng(33.450701, 126.570667)
	});

	// 커스텀 오버레이에 표시할 컨텐츠 입니다
	// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
	// 별도의 이벤트 메소드를 제공하지 않습니다 
	var content = '<div class="wrap">' + 
				'    <div class="info">' + 
				'        <div class="title">' + 
				'            카카오 스페이스 주차장' + 
				'            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
				'        </div>' + 
				'        <div class="body">' + 
				'            <div class="desc">' + 
				'                <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>' + 
				'                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
				'                <div><a href="http://localhost/MAMP" target="_blank" class="link">⭐️Review 게시판⭐️</a></div>' + 
				'            </div>' + 
				'        </div>' + 
				'    </div>' +    
				'</div>';

	// 마커 위에 커스텀오버레이를 표시합니다
	// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
	var overlay = new kakao.maps.CustomOverlay({
		content: content,
		map: map,
		position: marker.getPosition()       
	});
	overlay.setMap(null);

	// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
	kakao.maps.event.addListener(marker, 'click', function() {
		overlay.setMap(map);
	});

	// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
	function closeOverlay() {
		overlay.setMap(null);     
	}
</script>
<br>
		<table border="1" style="width: 100%">
			<tr>
				<th width="15%">주차장 번호</th>
				<th>주차장 이름</th>
				<th width="15%">주차장 타입</th>
				<th width="40%">주차장 주소</th>
			</tr>
			<c:forEach items="${ parkingList }" var="board">
				<tr>
					<td align="center">${ board.placeID }</td>
					<td align="center"><a href="${ pageContext.request.contextPath }/board/detail?placeID=${ board.placeID }">${board.parkingLotName}</a></td>
					<td align="center">${ board.lotType1 }</td>
					<td align="center">${ board.addr }</td>
				
			</c:forEach>
		</table>
				</tr>
					<td colspan="7" , align="center">${PAGE_LINK_TAG }</td>
				<tr>
		<br><br>
	</div>
	<!-- search{s} -->

		<form action ="searchParkingList" method="post">
			<select name="searchType">
					<option value="addr">지역</option>
					<option value="lotType1">주차장 타입</option>
					<option value="parkingLotName">주차장 이름</option>
					<option value="payment">주차장 요금</option>
				</select>
				<input type="text"name="keyword">
				<input type="submit" value="검색"/>
		</form>

		<!-- search{e} -->


	</section>
	<footer>
		<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
	</footer>
</body>
</html>