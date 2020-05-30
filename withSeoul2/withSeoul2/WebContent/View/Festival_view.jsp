<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>축제 안내</title>
	<link rel="stylesheet" type="text/css" href="../Css/festival_view.css">
</head>
<body>
	<div id="top">
		<a href="main_view.jsp"><img src="../Image/main_logo.jpg" id="main_logo"></a>
	<div class="tabbar">
		<ul>
			<li><a href="./Introduce_view.jsp?type=homepage"><div id="div_li">Introduce</div></a>
				<ul>
					<li><a href="./Introduce_view.jsp?type=homepage">홈페이지 소개</a></li>
					<li><a href="./Introduce_view.jsp?type=company">회사 및 운영진 소개</a></li>
				</ul>
			</li>
			<li><a href="./Recommend/Last_view.jsp?page=1"><div id="div_li">추천 명소</div></a>
				<ul>
					<li><a href="./Recommend/Last_view.jsp?page=1">최신순</a></li>
					<li><a href="./Recommend/Hit_view.jsp?page=1">조회순</a></li>
					<li><a href="./Recommend/Old_view.jsp?page=1&age=0">연령대별</a></li>
				</ul>
			</li>
			<li><a href="./Theme_view.jsp?page=1&theme=tour"><div id="div_li">테마로 찾기</div></a>
				<ul>
					<li><a href="./Theme_view.jsp?page=1&theme=tour">관광지/유적지</a></li>
					<li><a href="./Theme_view.jsp?page=1&theme=landmark">랜드마크</a></li>
					<li><a href="./Theme_view.jsp?page=1&theme=art">문화/예술</a></li>
					<li><a href="./Theme_view.jsp?page=1&theme=sports">스포츠</a></li>
				</ul>
			</li>
			<li><a href="./Location_view.jsp?page=1&location=0"><div id="div_li">지역별 명소</div></a></li>
			<li><a href="./Festival_view.jsp"><div id="div_li">축제안내</div></a>
			</li>
			<li><a href="./Post/Write_view.jsp"><div id="div_li">장소 추천하기</div></a>
				<ul>
					<li><a href="./Post/Write_view.jsp">게시글 작성</a></li>
					<li><a href="./Post/My_view.jsp?page=1">내가 쓴 글</a></li>
				</ul>
			</li>
			<li><a href="./Declare/List_view.jsp?page=1"><div id="div_li">고객센터</div></a>
				<ul>
					<li><a href="./Declare/List_view.jsp?page=1">신고하기</a></li>
				</ul>
			</li>
		</ul>
	</div>
	<div class="leftbar">
		<ul>
			<li>축제안내</li>
		</ul>
	</div>
	</div>
	<div id="foster_info"> ※ 이미지를 클릭하면 해당 축제 홈페이지로 이동합니다.</div>
	<div id="foster">
		<div id="foster1">> 가평 봄나들이 봄꽃축제</div><div id="foster2">> 고양 국제 꽃 박람회</div><div id="foster3">> 양평 메기 수염축제</div><div id="foster4">> 춘천 호수 별빛나라 축제</div>
		<div id="foster5">> 부산 불꽃축제</div><div id="foster6">> 서울 빛초롱축제</div><div id="foster7">> 양평 빙어축제</div><div id="foster8">> 평창 송어축제</div>
	<a href="https://korean.visitkorea.or.kr/detail/fes_detail.do?cotid=979d77ca-90d3-46f2-9909-0ab0dadcff4a">
	<img src="../Image/festival/가평봄나들이봄꽃축제.png" id="foster_img1"></a>
	<a href="https://korean.visitkorea.or.kr/detail/fes_detail.do?cotid=a738fc96-b7c4-448e-b7c1-c742f37b1b43">
	<img src="../Image/festival/고양국제꽃박람회.png" id="foster_img2"></a>
	<a href="https://korean.visitkorea.or.kr/detail/fes_detail.do?cotid=91eabe2e-8ddd-41ec-85a2-fc6c5c02d9d1">
	<img src="../Image/festival/양평메기수염축제2.png" id="foster_img3"></a>
	<a href="https://korean.visitkorea.or.kr/detail/fes_detail.do?cotid=5253af70-2832-4bce-a5e6-c4ed9a3ecf01">
	<img src="../Image/festival/춘천호수별빛나라축제2.png" id="foster_img4"></a>
	<a href="https://korean.visitkorea.or.kr/detail/fes_detail.do?cotid=3f61273a-8ae7-4c8f-b62f-e3fa52489826">
	<img src="../Image/festival/부산불꽃축제3.png" id="foster_img5"></a>
	<a href="https://korean.visitkorea.or.kr/detail/fes_detail.do?cotid=6ea28be2-79ab-4d79-b2a1-2aa9a0f04ae4">
	<img src="../Image/festival/서울빛초롱축제3.png" id="foster_img6"></a>
	<a href="https://korean.visitkorea.or.kr/detail/fes_detail.do?cotid=69973e72-1713-43ca-80a2-a125223122c5">
	<img src="../Image/festival/양평빙어축제4.png" id="foster_img7"></a>
	<a href="https://korean.visitkorea.or.kr/detail/fes_detail.do?cotid=75f7b3dc-0e98-49e5-81d8-ca0592b58ae4">
	<img src="../Image/festival/평창송어축제4.png" id="foster_img8"></a>
	</div>
</body>
</html>