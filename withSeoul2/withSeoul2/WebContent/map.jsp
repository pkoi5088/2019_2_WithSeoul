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

		map.setCursor('pointer');

		naver.maps.onJSContentLoaded = initGeocoder;

		naver.maps.Event.addListener(map, 'click', function(e) {
			marker.setPosition(e.coord);
		});

		function initGeocoder() {
			map.addListener('click', function(e) {
				searchCoordinateToAddress(e.coord);
			});
		}

		function searchCoordinateToAddress(latlng) {
			infoWindow.close();

			naver.maps.Service
					.reverseGeocode(
							{
								coords : latlng,
								orders : [ naver.maps.Service.OrderType.ADDR,
										naver.maps.Service.OrderType.ROAD_ADDR ]
										.join(',')
							},
							function(status, response) {
								if (status === naver.maps.Service.Status.ERROR) {
									return alert('Something Wrong!');
								}

								var items = response.v2.results, address = '', htmlAddresses = [];
								var jubun = '';

								for (var i = 0, ii = items.length, item, addrType; i < ii; i++) {
									item = items[i];
									address = makeAddress(item) || '';
									addrType = item.name === 'roadaddr' ? '[도로명 주소]'
											: '[지번 주소]';
									if(addrType==='[지번주소]')
										jibun=address;

									htmlAddresses.push((i + 1) + '. '
											+ addrType + ' ' + address);
									
								}
								document.getElementById("adr").value = address;

								infoWindow
										.setContent([
												'<div style="padding:10px;min-width:200px;line-height:150%;">',
												'<h4 style="margin-top:5px;">검색 좌표</h4><br />',
												htmlAddresses.join('<br />'),
												'</div>' ].join('\n'));

								//infoWindow.open(map, latlng);
							});
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

								if (item.roadAddress) {
									htmlAddresses.push('[도로명 주소] '
											+ item.roadAddress);
								}

								if (item.jibunAddress) {
									htmlAddresses.push('[지번 주소] '
											+ item.jibunAddress);
									document.getElementById("adr").value = item.jibunAddress;
								}

								if (item.englishAddress) {
									htmlAddresses.push('[영문명 주소] '
											+ item.englishAddress);
								}

								infoWindow
										.setContent([
												'<div style="padding:10px;min-width:200px;line-height:150%;">',
												'<h4 style="margin-top:5px;">검색 주소 : '
														+ address
														+ '</h4><br />',
												htmlAddresses.join('<br />'),
												'</div>' ].join('\n'));

								map.setCenter(point);
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
	</script>
	<input type="text" value="" id="adr" disabled="disabled" />
	<br>
	<select id="select" onchange="selectLoc()">
		<option value="강남구" selected>강남구</option>
		<option value="강동구">강동구</option>
		<option value="강북구">강북구</option>
		<option value="강서구">강서구</option>
		<option value="관악구">관악구</option>
		<option value="광진구">광진구</option>
		<option value="구로구">구로구</option>
		<option value="금천구">금천구</option>
		<option value="노원구">노원구</option>
		<option value="도봉구">도봉구</option>
		<option value="동대문구">동대문구</option>
		<option value="동작구">동작구</option>
		<option value="마포구">마포구</option>
		<option value="서대문구">서대문구</option>
		<option value="서초구">서초구</option>
		<option value="성동구">성동구</option>
		<option value="성북구">성북구</option>
		<option value="송파구">송파구</option>
		<option value="양천구">양천구</option>
		<option value="영등포구">영등포구</option>
		<option value="용산구">용산구</option>
		<option value="은평구">은평구</option>
		<option value="종로구">종로구</option>
		<option value="중구">중구</option>
		<option value="중랑구">중랑구</option>
	</select>
</body>
</html>