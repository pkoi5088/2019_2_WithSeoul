<!-- 2018112049 이정석 문제2번 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<title>장소추천하기-게시글작성</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../../Css/write_view.css">
<script src="http://code.jquery.com/jquery-1.10.1.js"></script>
</head>
<body>
	<%
		String id = (String) session.getAttribute("id");
		if (id == null) {
	%>
	<script>
		alert('로그인상태가 아닙니다.');
		document.location.href("../main_view.jsp");
	</script>
	<%
		}
	%>
	<div id="top">
		<a href="../main_view.jsp"><img src="../../Image/main_logo.jpg" id="main_logo"></a>
		<div class="tabbar">
			<ul>
				<li><a href="../Introduce_view.jsp?type=homepage"><div
							id="div_li">Introduce</div></a>
					<ul>
						<li><a href="../Introduce_view.jsp?type=homepage">홈페이지 소개</a></li>
						<li><a href="../Introduce_view.jsp?type=company">회사 및 운영진
								소개</a></li>
					</ul></li>
				<li><a href="../Recommend/Last_view.jsp?page=1"><div
							id="div_li">추천 명소</div></a>
					<ul>
						<li><a href="../Recommend/Last_view.jsp?page=1">최신순</a></li>
						<li><a href="../Recommend/Hit_view.jsp?page=1">조회순</a></li>
						<li><a href="../Recommend/Old_view.jsp?page=1&age=0">연령대별</a></li>
					</ul></li>
				<li><a href="../Theme_view.jsp?page=1&theme=tour"><div
							id="div_li">테마로 찾기</div></a>
					<ul>
						<li><a href="../Theme_view.jsp?page=1&theme=tour">관광지/유적지</a></li>
						<li><a href="../Theme_view.jsp?page=1&theme=landmark">랜드마크</a></li>
						<li><a href="../Theme_view.jsp?page=1&theme=art">문화/예술</a></li>
						<li><a href="../Theme_view.jsp?page=1&theme=sports">스포츠</a></li>
					</ul></li>
				<li><a href="../Location_view.jsp?page=1&location=0"><div
							id="div_li">지역별 명소</div></a></li>
				<li><a href="../Festival_view.jsp"><div id="div_li">축제안내</div></a>
				</li>
				<li><a href="../Post/Write_view.jsp"><div id="div_li">장소
							추천하기</div></a>
					<ul>
						<li><a href="../Post/Write_view.jsp">게시글 작성</a></li>
						<li><a href="../Post/My_view.jsp?page=1">내가 쓴 글</a></li>
					</ul></li>
				<li><a href="../Declare/List_view.jsp?page=1"><div
							id="div_li">고객센터</div></a>
					<ul>
						<li><a href="../Declare/List_view.jsp?page=1">신고하기</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
	<div class="leftbar">
		<ul>
			<li>장소 추천하기</li>
			<li><a href="../Post/Write_view.jsp">게시글 작성</a></li>
			<li><a href="../Post/My_view.jsp?page=1">내가 쓴 글</a></li>
		</ul>
	</div>
	<div id="notice_bar">
		<form action="../../Post/Insert.jsp" method="post">
			<table>
				<tr>
					<td id="td_1">여행테마</td>
					<td id="td_2"><input type="checkbox" name="theme" value="tour">관광지/유적지
						<input type="checkbox" name="theme" value="landmark">랜드마크
						<input type="checkbox" name="theme" value="art">문화/예술 <input
						type="checkbox" name="theme" value="sports">스포츠</td>
				</tr>
				<tr>
					<td id="td_1">연령대</td>
					<td id="td_2"><input type="radio" name="age" value="0">10대미만
						<input type="radio" name="age" value="1">10대 <input
						type="radio" name="age" value="2">20대 <input type="radio"
						name="age" value="3">30대 <input type="radio" name="age"
						value="4">40대 <input type="radio" name="age" value="5">50대이상</td>
				</tr>
				<tr>
					<td id="td_1">지역</td>
					<td id="td_2"><select name="location" id="select"
						onchange="selectLoc()">
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
					</select></td>
				</tr>
				<tr>
					<td id="td_1">주소</td>
					<td id="td_2"><input type="text" id="adr" disabled="disabled"/></td>
				</tr>
				<tr>
					<td id="td_1">장소</td>
					<td id="td_2"><input type="text" name="place" size="30"
						maxlength="30"></td>
				</tr>
				<tr>
					<td id="td_1">제목</td>
					<td id="td_2"><input type="text" name="title" size="50"
						maxlength="50"></td>
				</tr>
				<tr>
					<td id="td_1">내용</td>
					<td id="td_2"><textarea id="review_text" name="content"
							cols="50" rows="15" placeholder="장소에 대한 설명 및 리뷰"></textarea></td>
				</tr>
				<tr>
					<td colspan="2"
						style="padding: 5px; align: center; padding-left: 380px;"><input
						id="admit_button" type="submit" value="등록하기"> <input
						id="admit_button" type="reset" value="다시쓰기"></td>
				</tr>
			</table>
			<br>
	</div>
	<div id="map"></div>
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
										orders : [
												naver.maps.Service.OrderType.ADDR,
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
											if (addrType === '[지번주소]')
												jibun = address;

											htmlAddresses.push((i + 1) + '. '
													+ addrType + ' ' + address);

										}
										document.getElementById("adr").value = address;
										document.getElementById("adr2").value = address;

										infoWindow
												.setContent([
														'<div style="padding:10px;min-width:200px;line-height:150%;">',
														'<h4 style="margin-top:5px;">검색 좌표</h4><br />',
														htmlAddresses
																.join('<br />'),
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
											document.getElementById("adr2").value = item.jibunAddress;
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
														htmlAddresses
																.join('<br />'),
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

				function selectLoc() {
					var select = document.getElementById("select").value;
					searchAddressToCoordinate(select);
				}
			</script>

			<input type="text" id="adr2" name="selected" hidden="hidden"/>
		</form>
</body>
</html>