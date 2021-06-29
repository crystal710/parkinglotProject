<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>2조 프로젝트_주차장</title>
    <style>
        .body {display: flex;}
		.wrap {position: absolute;left: 0;bottom: 40px;width: 388px;height: 142px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
		.wrap * {padding: 0;margin: 0;}
		.wrap .info {width: 386px;height: 140px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
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
</head>
<body>
<div class="body">
<!-- <iframe width="500px" height="500px" name="iframe" src="http://localhost:1521:xe">
</iframe> -->
<div id="map" style="width:700px;height:500px;"></div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b4d4853c1373399acd61fd1971fdfc33&libraries=clusterer"></script>

<script>
    var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
        center : new kakao.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표 
        level : 15 // 지도의 확대 레벨 
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
            atag.appendChild(document.createTextNode('⭐️Review 게시판⭐️'));
            atag.setAttribute("href", "/map");
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
</div>
</body>
</html>