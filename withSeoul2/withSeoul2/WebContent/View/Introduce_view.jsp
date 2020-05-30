<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Introduce</title>
	<link rel="stylesheet" type="text/css" href="../Css/introduce_view.css">
</head>
<body>
<!--<a href="Introduce_view.jsp?type=company">company</a>
<a href="Introduce_view.jsp?type=homepage">homepage</a>
<a href="Introduce_view.jsp?type=master">master</a>
<%--<%= request.getParameter("type") --%>view<br>
<a href="main_view.jsp">Main Page</a>-->
	<%
		String id = (String)session.getAttribute("id");
		if(id==null){
	%>
		<a href="Login_view.jsp"><input id="login" type="button" value="Login"></a>
		<a href="Register_view.jsp"><input id="login_2" type="button" value="회원가입"></a>
	<%
		}else{
	%>
	<%
		}
	%>
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
			<li><a href="Theme_view.jsp?page=1&theme=tour"><div id="div_li">테마로 찾기</div></a>
				<ul>
					<li><a href="Theme_view.jsp?page=1&theme=tour">관광지/유적지</a></li>
					<li><a href="Theme_view.jsp?page=1&theme=landmark">랜드마크</a></li>
					<li><a href="Theme_view.jsp?page=1&theme=art">문화/예술</a></li>
					<li><a href="Theme_view.jsp?page=1&theme=sports">스포츠</a></li>
				</ul>
			</li>
			<li><a href="Location_view.jsp?page=1&location=0"><div id="div_li">지역별 명소</div></a></li>
			<li><a href="Festival_view.jsp"><div id="div_li">축제안내</div></a>
			</li>
			<li><a href="Post/Write_view.jsp"><div id="div_li">장소 추천하기</div></a>
				<ul>
					<li><a href="Post/Write_view.jsp">게시글 작성</a></li>
					<li><a href="Post/My_view.jsp?page=1">내가 쓴 글</a></li>
				</ul>
			</li>
			<li><a href="Declare/List_view.jsp?page=1"><div id="div_li">고객센터</div></a>
				<ul>
					<li><a href="Declare/List_view.jsp?page=1">신고하기</a></li>
				</ul>
			</li>
		</ul>
	</div>
	</div>
	<div class="leftbar">
		<ul>
			<li>Introduce</li>
			<li><a href="Introduce_view.jsp?type=homepage">홈페이지 소개</a></li>
			<li><a href="Introduce_view.jsp?type=company">회사 및 운영진 소개</a></li>
		</ul>
	</div>
	<%
	String type = request.getParameter("type");
	if(type == null || !(type.equals("homepage")||type.equals("company"))){
		type = "homepage";
	}
	
	if(type.equals("homepage")){
	%>
	<div id="introduce">
		<div id="title">
			<h2>With Seoul</h2>
		</div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"With Seoul"은 시민 모두가 직접 참여해 함께 만들어 나가는 '서울 관광 지도'입니다.<br><br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;다른 사람들과 함께 서울에 숨겨져 있던 맛집, 명소 등을 공유해서<br><br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;우리 모두를 위한 지도를 함께 만들어 보세요!
	</div>
	<%
	}else if(type.equals("company")){
	%>
	<div id="introduce_2">
		<div id="title">
			<h2>회사 및 운영진 소개 (나이순)</h2>
		</div>
		<div id="intro">
			<div id="ph1"><img src="../Image/logo.jpg"></div><div id="nt1">회사명: K2L<br><br>의미: K 1명과 L 2명이<br>만났다!</div>
			<div id="ph3"><img src="../Image/nhgo.jpg"></div><div id="nt3">성 명 : 고나형<br><br>생 일 : 98. 06. 28.<br><br>동국대학교 컴퓨터공학과 졸업<br>답십리 불주먹</div>
			<div id="ph2"><img src="../Image/jslee.jpg"></div><div id="nt2">성 명 : 이정석<br><br>생 일 : 99. 10. 15.<br><br>사회복무요원 예정<br>기호2번 이정석</div>
			<div id="ph4"><img src="../Image/smlee.jpg"></div><div id="nt4">성 명 : 이상민<br><br>생 일 : 99. 12. 29.<br><br>동국대 최강귀요미><<br> </div>
		</div>
	</div>
	<%
	}
	%>
	<div id="sidebar"><img src="../Image/sidebar1.jpg"></div>
</body>
</html>