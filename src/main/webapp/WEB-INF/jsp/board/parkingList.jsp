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
		.wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: center;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
		.wrap * {padding: 0;margin: 0;}
		.wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
		.wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
		.info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
		.info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
		.info .close:hover {cursor: pointer;}
		.info .body {position: relative;overflow: hidden;}
		.info .desc {position: relative;margin: 13px 0 0 13px;height: 75px;}
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
	<style>
	
		#input1 {width:300px;height:50px;border-top :none;
	border-left:none; border-right:none; border-bottom 3px solid black; }
	#input2 {width:100px;height:50px;border-top :none; text-align:center;
	border-left:none; border-right:none; border-bottom 3px solid black;}
		#search {
    width:50px;
    background-color: #E6EDF5;
    border: none;
    color:#4F76A3;
    padding: 10px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 10px;
    margin: 4px;
    cursor: pointer;
 
}
#search:hover{
    background-color: white;
    display: inline-block;
    padding: 10px 0;
    border:1px;
    color:#4F76A3;
    cursor: pointer;
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b4d4853c1373399acd61fd1971fdfc33&libraries=clusterer"></script>

<script>
    var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
        center : new kakao.maps.LatLng(37.513465425428926, 127.10014432677444), // 지도의 중심좌표 
        level : 5 // 지도의 확대 레벨 
    });
    
    // 마커 클러스터러를 생성합니다 
    var clusterer = new kakao.maps.MarkerClusterer({
        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
        minLevel: 10 // 클러스터 할 최소 지도 레벨 
    });
    // 데이터를 가져오기 위해 jQuery를 사용합니다
    // 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
    
    $.get("/map/map", function(data) {
        // 데이터에서 좌표 값을 가지고 마커를 표시합니다
        // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
        var markers = $(data.positions).map(function(i, position) {
        	
            var marker = new kakao.maps.Marker({
                position : new kakao.maps.LatLng(position.lat, position.lng),
                title: position.parkingLotName,
                clickable :true
                
            });
            

                 
                // console.log("kakao : " + kakao);
            var overlay = new kakao.maps.CustomOverlay({
		                    map: map,
		                    position: new kakao.maps.LatLng(position.lat, position.lng)      
	                        });
                            overlay.setMap(null);
                            
                // console.log("marker:"+marker);
                // console.log("marker.getPosition:"+marker.getPosition());
            // var target = overlay.getContent();
            // console.log(JSON.stringify(target));
            // var target2 = target.document.getElementsByClassName("close");
            
            // target.addEventListener("click", makeOutListener(overlay));
            
            var content = document.createElement('div');
            content.classList.add('wrap');

            var info = document.createElement('div');
            info.classList.add('info');
            content.appendChild(info);
            
            var title = document.createElement('div');
            title.classList.add('title');
            info.appendChild(title);
            title.appendChild(document.createTextNode(position.parkingLotName+" 주차장"));
            
            var close = document.createElement('div');
            close.classList.add('close');
            close.onclick = function() { overlay.setMap(null); };
            title.appendChild(close);
            
            var body = document.createElement('div');
            body.classList.add('body');
            info.appendChild(body);

            var desc = document.createElement('div');
            desc.classList.add('desc');
            body.appendChild(desc);

            var ellipsis = document.createElement('div');
            ellipsis.classList.add('jibun');

            if(position.addr == ' '){
                ellipsis.appendChild(document.createTextNode("도로명주소 : "+position.roadAddr));
            }else{
            	
                ellipsis.appendChild(document.createTextNode("지번주소 : "+position.addr));
            }
            desc.appendChild(ellipsis);

            var jibun_ellipsis = document.createElement('div');
            jibun_ellipsis.classList.add('jibun');
            jibun_ellipsis.appendChild(document.createTextNode("운영일 : "+position.opWeekly));
            desc.appendChild(jibun_ellipsis);

            var payment = document.createElement('div');
            payment.classList.add('jibun');
            // console.log("position.paymentOption:"+position.paymentOption);
            if(position.paymentOption == ' ' ||position.payment=="무료"){
            payment.appendChild(document.createTextNode("지불 : "+position.payment));
            }else{
                payment.appendChild(document.createTextNode("지불 : "+position.payment+" 지불 방법 : "+position.paymentOpt));
            }
            desc.appendChild(payment);

            var charge = document.createElement('div');
            charge.classList.add('jibun');
            if(position.normalTime == ' '|| position.normalTime == '0'){
            }else{
                charge.appendChild(document.createTextNode(" 기본시간 : "+position.normalTime+"분 요금 : "+position.normalCharge+"원"));
            }
            if(position.addTime == ' '|| position.addTime == '0'){
            }else{
                charge.appendChild(document.createTextNode(" 추가시간 : "+position.addTime+"분 요금 : "+position.addCharge+"원"));
            }
            desc.appendChild(charge);

            var link = document.createElement('div');
            desc.appendChild(link);

            var atag = document.createElement('a');
            atag.classList.add('link');
            atag.appendChild(document.createTextNode('⭐️상세보기⭐️'));
            atag.setAttribute("href", "/board/detail?placeID=" +  position.placeID);
            atag.setAttribute("target", "iframe");
            link.appendChild(atag);

            // var closeBtn = document.createElement('button');
            // closeBtn.appendChild(document.createTextNode('닫기'));
            // closeBtn.onclick = function() { overlay.setMap(null); };
            // content.appendChild(closeBtn);

            overlay.setContent(content);

            var selectedMarker = data.selectedMarker;

            // marker.normalImage = normalImage;
            // kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, overlay));
            kakao.maps.event.addListener(marker, 'rightclick', makeOutListener(overlay));
            

            // 마커에 mouseover 이벤트를 등록합니다
            kakao.maps.event.addListener(marker, 'mouseover', function() {

            // 클릭된 마커가 없고, mouseover된 마커가 클릭된 마커가 아니면
            // 마커의 이미지를 오버 이미지로 변경합니다
            overlay.setMap(null);
            if (!selectedMarker || selectedMarker !== marker) {
                overlay.setMap(map);
            }
            });

            // 마커에 mouseout 이벤트를 등록합니다
            kakao.maps.event.addListener(marker, 'mouseout', function() {

            // 클릭된 마커가 없고, mouseout된 마커가 클릭된 마커가 아니면
            // 마커의 이미지를 기본 이미지로 변경합니다
            if (!selectedMarker || selectedMarker !== marker) {
                overlay.setMap(null);
            }
            selectedMarker = null;
            });

            // 마커에 click 이벤트를 등록합니다
            kakao.maps.event.addListener(marker, 'click', function() {
                // console.log("click1");
            // 클릭된 마커가 없고, click 마커가 클릭된 마커가 아니면
            // 마커의 이미지를 클릭 이미지로 변경합니다
            if (!selectedMarker || selectedMarker !== marker) {

                // 클릭된 마커 객체가 null이 아니면
                // 클릭된 마커의 이미지를 기본 이미지로 변경하고
                !!selectedMarker && overlay.setMap(null);;

                // 현재 클릭된 마커의 이미지는 클릭 이미지로 변경합니다
                overlay.setMap(map);
            }
            // console.log("click");
            // 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
            selectedMarker = marker;
            overlay.setMap(map);
            
            });
            

            return marker ;
        });


        // 클러스터러에 마커들을 추가합니다
        clusterer.addMarkers(markers);

        // $(data.positions).map(function(i, p) {
        //     // console.log("myposition = " + p);

        //     var overlay = new kakao.maps.CustomOverlay({
        //     content: content,
        //     map: map,
        //     position: new kakao.maps.LatLng(p.lat, p.lng)     
        //     });
        //     overlay.setMap(null);

        // });
        
        
        
        
        
        // 마커 위에 커스텀오버레이를 표시합니다
        // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
        // var overlay = new kakao.maps.CustomOverlay({
        //     content: content,
        //     map: map
        //     // position: markers.getPosition()     
        // });
        // overlay.setMap(null);
        
        
    });

    function makeOverListener(map, marker, overlay) {
        return function() {
            overlay.setMap(map);
        };
    }

    // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
    function makeOutListener(overlay) {
        return function() {
            overlay.setMap(null);
        };
    }

    // var marker = new kakao.maps.Marker({
	// 	map: map, 
	// 	position: new kakao.maps.LatLng(33.450701, 126.570667)
	// });
    // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
    // var overlay = new kakao.maps.CustomOverlay({
	// 	content: content,
	// 	map: map,
	// 	position: marker.getPosition()       
	// });

    // kakao.maps.event.addListener(marker, 'click', function() {
	// 	overlay.setMap(map);
	// });

    // // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
    
	// // 마커 위에 커스텀오버레이를 표시합니다
	// // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
	// var overlay = new kakao.maps.CustomOverlay({
	// 	content: content,
	// 	map: map,
	// 	position: new kakao.maps.LatLng(markers.map.position.lat,markers.map.position.lng)       
	// });
	// overlay.setMap(null);

	
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

		<form action ="searchParkingList" method="post" align="center">
			<select id="input2" name="searchType">
					<option value="addr">지역</option>
					<option value="lotType1">주차장 타입</option>
					<option value="parkingLotName">주차장 이름</option>
					<option value="payment">주차장 요금</option>
				</select>
				<input id="input1" type="text"name="keyword">
				<input id="search" type="submit" value="검색"/>
		</form>

		<!-- search{e} -->


	</section>
	<footer>
		<%@ include file="/WEB-INF/jsp/include/footer.jsp" %>
	</footer>
</body>
</html>