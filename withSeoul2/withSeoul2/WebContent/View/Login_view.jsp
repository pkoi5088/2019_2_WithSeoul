<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>webprogramming_project</title>
	<link rel="stylesheet" href="../Css/login_view.css">
	<link rel="stylesheet" type="text/css" href="../Css/simpleBanner.css">
	<style type="text/css">
		/* override styles */
		.banner01{ 
			width:200px; height:330px;
		}
		.banner01 ul li a{
			display:block; width:300px; height:200px; /*text-shadow:0 0 2px #666;*/
			/*text-decoration:none; color:#FFF; font-size:24px; font-weight:bold; letter-spacing:-1px; text-align:center; line-height:200px;*/
		}
		.banner01, .banner01 ul li a{ width:200px; }
	</style>
	<script src="http://code.jquery.com/jquery-1.10.1.js"></script>
	<script type="text/javascript" src="../simpleBanner.js"></script>
</head>
<body>
	<form action="../Login/Login.jsp" method="post">
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
	<div id="admitpage"> 
		<h2>로그인</h2>
		<img src="../Image/withseoulLogo.jpg">
		<table id="login_tbl">
		<tr><td id="login_td">ID</td><td id="login_td2"><input id="login_input" type="text" name="userid"><br></td><td rowspan="2">
			<input id="login_button" type="submit" value="LOGIN"></td></tr>
		<tr><td id="login_td">PASSWORD</td><td id="login_td2"><input id="login_input" type="password" name="userpw"><br></td></tr>
		</table>
		<div id="advertisement">
			<div class="simple_banner_wrap banner01">
			<ul>
				<li style="background-image: url('../Image/fest1.jpg')"><a href="#"></a></li>
				<li style="background-image: url('../Image/fest2.jpg');"><a href="#"></a></li>
				<li style="background-image: url('../Image/fest3.jpg');"><a href="#"></a></li>
				<li style="background-image: url('../Image/fest4.jpg');"><a href="#"></a></li>
				<li style="background-image: url('../Image/fest5.jpg');"><a href="#"></a></li>
			</ul>
		</div>
		</div>
		<div id="add_information">
			<div id="first">아직 회원이 아니신가요?</div>
			<div id="to_register"><a href="Register_view.jsp" style="text-decoration: none; color: white;">회원가입 하러가기</a></div>
			<div id="final">-&nbsp;회원가입을 하시고 더 많은 명소를 찾아보세요!<br>-&nbsp;다른 사람들의 리뷰를 보고, 리뷰를 작성할 수 있습니다!</div>
		</div>
		<div id="login_find">
			<a href="">아이디 찾기</a><a href="" style="margin-left:15px;">비밀번호 찾기</a>
		</div>
	</div>
	</form>
</body>
</html>