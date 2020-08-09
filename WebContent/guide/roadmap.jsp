<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찾아오는 길</title>
</head>
<body>

	<h3>찾아오는 길</h3>
	<input type="text" name="address" id="address" value=""/>
	<input type="button" value="주소검색" onclick="fn_addressChk()" />
	<div id="map" style="width:100%;height:350px;"></div>
	<div id="coordXY">coordXY구역입니다.</div>
<!-- kakaoMap API -->	
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=545c4294aa6730c94094a8c6b2065612&libraries=services"></script>
<script>
var address = document.getElementById('address');	// 주소 입력
var mapContainer = document.getElementById('map');	// 지도를 표시할 div
var coordXY   = document.getElementById('coordXY');	// 위도,경도 표기할 div
var mapOption;
var map;
var markerPosition;
var iwContent;
var infowindow;
var geocoder;
var xVal, yVal;
var marker;

if (address.value == "") {
	mapOption = {
	    center: new kakao.maps.LatLng(35.86710443955666, 128.58659029232882), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};  
}

//지도를 생성합니다    
map = new kakao.maps.Map(mapContainer, mapOption); 
// 기본 마커를 생성합니다.
marker = new kakao.maps.Marker({
	map: map,
	position: new kakao.maps.LatLng(35.86710443955666, 128.58659029232882)
});
infowindow = new kakao.maps.InfoWindow({
    content:'<div style="width:150px;text-align:center;padding:6px 0;">천사 가톨릭 전례복</div>'
});
infowindow.open(map, marker);
coordXY.innerHTML = "<br/>천사 가톨릭 전례복입니다 "
//주소를 체크합니다.
function fn_addressChk(){
	var addrVal = address.value;
	if (addrVal == "") {
		alert('주소를 입력해주세요');
		address.focus();
		return;
	}
	//주소-좌표 변환 객체를 생성합니다
	geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(address.value, function(result, status){
		// 검색이 정상 완료일 때 --
		if (status == daum.maps.services.Status.OK) {
			var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			yVal = result[0].y;
			xVal = result[0].x;
			
			// 결과값으로 받은 위치를 마커로 표시합니다
		    marker = new kakao.maps.Marker({
		        map: map,
		        position: coords
		    });
			
			// 인포윈도우로 장소에 대한 설명을 표시합니다
		    var infowindow = new kakao.maps.InfoWindow({
		        content:'<div style="width:150px;text-align:center;padding:6px 0;">검색결과</div>'
		    });
		    infowindow.open(map, marker);
		
		    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		    map.setCenter(coords);
		    coordXY.innerHTML = "<br/>X좌표 : " + xVal + "Y좌표 : " + yVal;
			}
	});
}
</script>
	


</body>
</html>