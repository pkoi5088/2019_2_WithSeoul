<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="beans.Javabeans"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>webprogramming_project</title>
	<link rel="stylesheet" type="text/css" href="../../Css/view.css">
</head>
<body>
	<div id="top">
		<a href="../main_view.jsp"><img src="../../Image/main_logo.jpg" id="main_logo"></a>
	<div class="tabbar">
		<ul>
			<li><a href="../Introduce_view.jsp?type=homepage"><div id="div_li">Introduce</div></a>
				<ul>
					<li><a href="../Introduce_view.jsp?type=homepage">홈페이지 소개</a></li>
					<li><a href="../Introduce_view.jsp?type=company">회사 및 운영진 소개</a></li>
				</ul>
			</li>
			<li><a href="../Recommend/Last_view.jsp?page=1"><div id="div_li">추천 명소</div></a>
				<ul>
					<li><a href="../Recommend/Last_view.jsp?page=1">최신순</a></li>
					<li><a href="../Recommend/Hit_view.jsp?page=1">조회순</a></li>
					<li><a href="../Recommend/Old_view.jsp?page=1&age=0">연령대별</a></li>
				</ul>
			</li>
			<li><a href="../Theme_view.jsp?page=1&theme=tour"><div id="div_li">테마로 찾기</div></a>
				<ul>
					<li><a href="../Theme_view.jsp?page=1&theme=tour">관광지/유적지</a></li>
					<li><a href="../Theme_view.jsp?page=1&theme=landmark">랜드마크</a></li>
					<li><a href="../Theme_view.jsp?page=1&theme=art">문화/예술</a></li>
					<li><a href="../Theme_view.jsp?page=1&theme=sports">스포츠</a></li>
				</ul>
			</li>
			<li><a href="../Location_view.jsp?page=1&location=0"><div id="div_li">지역별 명소</div></a></li>
			<li><a href="../Festival_view.jsp"><div id="div_li">축제안내</div></a>
			</li>
			<li><a href="../Post/Write_view.jsp"><div id="div_li">장소 추천하기</div></a>
				<ul>
					<li><a href="../Post/Write_view.jsp">게시글 작성</a></li>
					<li><a href="../Post/My_view.jsp?page=1">내가 쓴 글</a></li>
				</ul>
			</li>
			<li><a href="../Declare/List_view.jsp?page=1"><div id="div_li">고객센터</div></a>
				<ul>
					<li><a href="../Declare/List_view.jsp?page=1">신고하기</a></li>
				</ul>
			</li>
		</ul>
	</div>
	</div>
	<div class="leftbar">
		<ul>
			<li>내가 쓴 글</li>
		</ul>
	</div>
	<%
	Javabeans db = (Javabeans)session.getAttribute("db");
	boolean flag = true;
	String num = request.getParameter("num");
	if(num == null||db==null){
		flag = false;
		%>
		<script>
			alert('num오류');
			document.location.href="../main_view.jsp";
		</script>
		<%
	}
	
	if(flag){
		String sql = "select * from post_tbl where num = " + num;
		ResultSet rs = db.executeQuery(sql);
		rs.next();
	%>
		<h2>> 내가 쓴 글 보기</h2>
		<a href="javascript:history.go(-1)"><input id="reset_button" type="button" value="뒤로가기"></a><br>
		<div id="notice_tbl">
		<table>
		<tr><td id="td1">제목</td><td id="td2"><%= rs.getString("title") %></td><td id="td1">작성자</td><td id="td2"><%= rs.getString("name") %></td></tr>
		<tr><td id="td1">주소</td><td id="td2" colspan="3"><%= rs.getString("address") %></td></tr>
		<tr style="height: 350px;"><td id="td1">내용</td><td id="td2" colspan="3"><%= rs.getString("content") %></td></tr>
		</table>
		</div>
		<input hidden="hidden" id="td3" value="<%= rs.getString("address") %>"/>
	<%
	int good = rs.getInt("good");
	sql = "update post_tbl set good = "+(good+1)+" where num = "+num;
	db.executeUpdate(sql);
	}
	%>
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
		var position = searchAddressToCoordinate(document.getElementById("td3").value);
	</script>
</body>
</html>