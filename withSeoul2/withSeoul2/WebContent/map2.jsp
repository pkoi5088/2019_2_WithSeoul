<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div id="map" style="width: 500px; height: 500px;"></div>
	<script type="text/javascript"
		src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=8degc9s1ca&submodules=geocoder"></script>
	<script>
		var position = new naver.maps.LatLng(37.5748316, 127.0595904);

		var map = new naver.maps.Map('map', {
			center : position,
			zoom : 10
		});

		var marker = new naver.maps.Marker({
			position : position,
			map : map
		});

		var infoWindow = new naver.maps.InfoWindow({
			anchorSkew : true
		});

		naver.maps.onJSContentLoaded = initGeocoder;

		naver.maps.Event.addListener(map, 'click', function(e) {
		});

		function initGeocoder() {
		}
		
		function searchAddressToCoordinate(address) {
			infoWindow.close();

			naver.maps.Service
					.geocode(
							{
								query : address
							},
							function(status, response) {
								if (status === naver.maps.Service.Status.ERROR) {
									return alert('Something Wrong!');
								}

								if (response.v2.meta.totalCount === 0) {
									return alert('아직 지원하지 않는 주소입니다.'
											+ response.v2.meta.totalCount);
								}

								//좌표 불러오기
								var htmlAddresses = [], item = response.v2.addresses[0], point = new naver.maps.Point(
										item.x, item.y);
								map.setCenter(point);
								marker.setPosition(point);
								//infoWindow.open(map, point);
							});
		}

		function makeAddress(item) {
			if (!item) {
				return;
			}

			var name = item.name, region = item.region, land = item.land, isRoadAddress = name === 'roadaddr';

			var sido = '', sigugun = '', dongmyun = '', ri = '', rest = '';

			if (hasArea(region.area1)) {
				sido = region.area1.name;
			}

			if (hasArea(region.area2)) {
				sigugun = region.area2.name;
			}

			if (hasArea(region.area3)) {
				dongmyun = region.area3.name;
			}

			if (hasArea(region.area4)) {
				ri = region.area4.name;
			}

			if (land) {
				if (hasData(land.number1)) {
					if (hasData(land.type) && land.type === '2') {
						rest += '산';
					}

					rest += land.number1;

					if (hasData(land.number2)) {
						rest += ('-' + land.number2);
					}
				}

				if (isRoadAddress === true) {
					if (checkLastString(dongmyun, '면')) {
						ri = land.name;
					} else {
						dongmyun = land.name;
						ri = '';
					}

					if (hasAddition(land.addition0)) {
						rest += ' ' + land.addition0.value;
					}
				}
			}

			return [ sido, sigugun, dongmyun, ri, rest ].join(' ');
		}

		function hasArea(area) {
			return !!(area && area.name && area.name !== '');
		}

		function hasData(data) {
			return !!(data && data !== '');
		}

		function checkLastString(word, lastString) {
			return new RegExp(lastString + '$').test(word);
		}

		function hasAddition(addition) {
			return !!(addition && addition.value);
		}
		
		function selectLoc(){
			var select = document.getElementById("select").value;
			searchAddressToCoordinate(select);
		}
		function ping(){
	        searchAddressToCoordinate(document.getElementById("adr").value);
		}
	</script>
	<input type="text" value="" id="adr" name="select"/>
	<input type="button" value="ㅇㅇ" id="submit" onclick="ping()"/>
	<br>
</body>
</html>