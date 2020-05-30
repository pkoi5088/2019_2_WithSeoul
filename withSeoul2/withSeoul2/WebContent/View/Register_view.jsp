<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>webprogramming_project</title>
	<link rel="stylesheet" href="../Css/register_view.css">
	<script src="http://code.jquery.com/jquery-1.10.1.js"></script>
</head>
<body>
	<form action="../Register/Register.jsp" method="post">
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
		<h2>회원가입</h2>
			<table style="margin-left:40px;">
			<tr>
				<td id="admit_td" style="border-top: 1.5px solid black;">이름</td>
				<td id="admit_td2" style="border-top: 1.5px solid black;">
					<input id="init" type="text" name="register_name" placeholder=" 한글로 작성해주세요!"></td>
			</tr>
			<tr>
				<td id="admit_td">아이디</td>
				<td id="admit_td2"><input id="init" type="text" name="register_id" placeholder=" 영어로 작성해주세요!"></td>
			</tr>
			<tr>
				<td id="admit_td">비밀번호</td>
				<td id="admit_td2"><input id="init" type="password" name="register_pw" placeholder=" 영문+숫자(10자 이내)"></td>
			</tr>
			<tr>
				<td id="admit_td">닉네임</td>
				<td id="admit_td2"><input id="init" type="text" name="register_nick" placeholder=" 자유롭게(5자 이내)" maxlength="5"></td>
			</tr>
			<tr>
				<td id="admit_td">휴대전화번호</td>
				<td id="admit_td2"><input id="init" type="text" name="register_phone" placeholder=" 하이픈(-) 포함 입력"></td>
			</tr> 
			<tr>
				<td id="admit_td" style="border-bottom: 1.5px solid black;">E-Mail</td>
				<td id="admit_td2" style="border-bottom: 1.5px solid black;">
					<input id="init" type="text" name="register_mail" placeholder=" ex) abcdef@gmail.com"></td>
			</tr>
			</table>
		
	</div>
	<input id="admit_loginbutton" type="submit" value="확인">
	</form>
</body>
</html>