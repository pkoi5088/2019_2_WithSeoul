<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*"%>
<%@ page import="beans.Javabeans"%>
<html>
<head>
<title>with_Seoul</title>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="../Css/main_view.css">
<link rel="stylesheet" type="text/css" href="../Css/simpleBanner.css">
<style type="text/css">
/* override styles */
.simple_banner_wrap {
	position: absolute;
	left: 740px;
	top: 315px;
	overflow: hidden;
}

.banner01 {
	width: 475px;
	height: 300px;
}

.banner01 ul li a {
	display: block;
	width: 300px;
	height: 200px; /*text-shadow:0 0 2px #666;*/
	/*text-decoration:none; color:#FFF; font-size:24px; font-weight:bold; letter-spacing:-1px; text-align:center; line-height:200px;*/
}

.banner01, .banner01 ul li a {
	width: 475px;
}
</style>
<script src="http://code.jquery.com/jquery-1.10.1.js"></script>
<script type="text/javascript" src="../simpleBanner.js"></script>
</head>
<body>
	<%
	try{
		Javabeans db = (Javabeans)session.getAttribute("db");
		String id = (String)session.getAttribute("id");
		if(id==null){
	%>
	<a href="Login_view.jsp"><input id="login" type="button"
		value="Login"></a>
	<a href="Register_view.jsp"><input id="login_2" type="button"
		value="회원가입"></a>
	<%
		}else{
	%>

	<%
		}
	%>
	<div id="top">
		<a href="main_view.jsp"><img src="../Image/main_logo.jpg"
			id="main_logo"></a>
	</div>
	<div id="bottom">
		<div class="tabbar">
			<ul>
				<li><a href="./Introduce_view.jsp?type=homepage"><div
							id="div_li">Introduce</div></a>
					<ul>
						<li><a href="./Introduce_view.jsp?type=homepage">홈페이지 소개</a></li>
						<li><a href="./Introduce_view.jsp?type=company">회사 및 운영진
								소개</a></li>
					</ul></li>
				<li><a href="./Recommend/Last_view.jsp?page=1"><div
							id="div_li">추천 명소</div></a>
					<ul>
						<li><a href="./Recommend/Last_view.jsp?page=1">최신순</a></li>
						<li><a href="./Recommend/Hit_view.jsp?page=1">조회순</a></li>
						<li><a href="./Recommend/Old_view.jsp?page=1&age=0">연령대별</a></li>
					</ul></li>
				<li><a href="Theme_view.jsp?page=1&theme=tour"><div
							id="div_li">테마로 찾기</div></a>
					<ul>
						<li><a href="Theme_view.jsp?page=1&theme=tour">관광지/유적지</a></li>
						<li><a href="Theme_view.jsp?page=1&theme=landmark">랜드마크</a></li>
						<li><a href="Theme_view.jsp?page=1&theme=art">문화/예술</a></li>
						<li><a href="Theme_view.jsp?page=1&theme=sports">스포츠</a></li>
					</ul></li>
				<li><a href="Location_view.jsp?page=1&location=0"><div
							id="div_li">지역별 명소</div></a></li>
				<li><a href="Festival_view.jsp"><div id="div_li">축제안내</div></a>
				</li>
				<li><a href="Post/Write_view.jsp"><div id="div_li">장소
							추천하기</div></a>
					<ul>
						<li><a href="Post/Write_view.jsp">게시글 작성</a></li>
						<li><a href="Post/My_view.jsp?page=1">내가 쓴 글</a></li>
					</ul></li>
				<li><a href="Declare/List_view.jsp?page=1"><div id="div_li">고객센터</div></a>
					<ul>
						<li><a href="Declare/List_view.jsp?page=1">신고하기</a></li>
					</ul></li>
			</ul>
		</div>
		<div id="map_seoul">
			<img src="../Image/map_Seoul.jpg">
		</div>
		<div class="simple_banner_wrap banner01">
			<ul>
				<li style="background-image: url('../Image/final1.jpg')"><a
					href="#"></a></li>
				<li style="background-image: url('../Image/final2.jpg');"><a
					href="#"></a></li>
				<li style="background-image: url('../Image/final3.jpg');"><a
					href="#"></a></li>
				<li style="background-image: url('../Image/final4.jpg');"><a
					href="#"></a></li>
				<li style="background-image: url('../Image/final5.jpg');"><a
					href="#"></a></li>
			</ul>
		</div>
		<div id="loginpage">
			<br>
			<%
				if(id==null){
			%>
			<form action="../Login/Login.jsp" method="post">
				<table style="margin-left: 30px;">
					<tr>
						<td>&nbsp;&nbsp;I&nbsp;&nbsp;&nbsp;D&nbsp;&nbsp;</td>
						<td><input type="text" name="userid" id="login_input"></td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;P&nbsp;W&nbsp;&nbsp;</td>
						<td><input type="password" name="userpw" id="login_input"></td>
					</tr>
				</table>
				<br> <input id="loginbutton" type="submit" value="로그인">
			</form>
			<%
				}else{
			%>
			<div id="member_info">
				<div id="info"><%=db.getNick(id) %>
					님
				</div>
				<div id="info2">환영합니다.</div>
			</div>
			<a href="Post/My_view.jsp?page=1"
				style="text-decoration: none; color: black;"><div id="member_wr">내가
					쓴 글</div></a> <a href="Userinfo_view.jsp"
				style="text-decoration: none; color: black;"><div
					id="member_wr2">내정보</div></a> <a href="../index.jsp"
				style="text-decoration: none; color: white;"><div
					id="member_logout">LOGOUT</div></a>
			<%
				}
			%>
		</div>
		<div id="weather">
			<a href="http://www.weather.go.kr/weather/forecast/timeseries.jsp"><img src="../Image/weather.jpg"></a>
		</div>
		<h3>> 최신 게시글 (Latest Post)</h3>
		<div id="notice">
			<%
			String sql = "select * from post_tbl order by num desc limit "+0+",10";
			ResultSet rs = db.executeQuery(sql);
			int r = 1;
			%>
			<table>
				<tr>
					<th id="tbl_th1">글번호</th>
					<th id="tbl_th2">글제목</th>
					<th id="tbl_th3">글쓴이</th>
					<th id="tbl_th1">조회수</th>
				</tr>
				<%
		while(rs.next()){
			String rnum = Integer.toString(rs.getInt("num"));
		%>
				<tr>
					<td id="tbl_td1"> <%= r %></td>
					<td id="tbl_td2"><a href="Post/View.jsp?num=<%= rnum %>">
							<%= rs.getString("title") %></a></td>
					<td id="tbl_td1"> <%= rs.getString("name") %></td>
					<td id="tbl_td1" style="background-color:#f7f7f7;"><%= rs.getInt("good") %></td>
				</tr>
				<%
				r++;
		}
	}catch(Exception e){
		response.sendRedirect("../index.jsp");
	}
		%>
			</table>
		</div>
	</div>
</body>
</html>