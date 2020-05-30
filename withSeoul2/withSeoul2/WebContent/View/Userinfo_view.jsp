<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:useBean id="user" class="beans.User" scope="page"/>
<%@ page import="beans.Javabeans"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>내 정보</title>
	<link rel="stylesheet" type="text/css" href="../Css/userinfo_view.css">
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
			<li>내 정보</li>
		</ul>
	</div>
	<%
	boolean flag = true;
	String id = (String)session.getAttribute("id");
	Javabeans db = (Javabeans)session.getAttribute("db");
	if(id == null||db==null){
		flag = false;
		%>
		<script>
			alert('id,db오류');
			document.location.href="../index.jsp";
		</script>
		<%
	}
	
	if(flag){
		user.setUser(db, id);
	%>
		<div id="notice_bar">
		<table>
		<tr><td id="td_1">이름</td><td id="td_2"><%= user.getName() %></td></tr>
		<tr><td id="td_1">전화번호</td><td id="td_2"><%= user.getPhone() %></td></tr>
		<tr><td id="td_1">이메일</td><td id="td_2"><%= user.getMail() %></td></tr>
		<tr><td id="td_1">닉네임</td><td id="td_2"><%= user.getNick() %></td></tr>
		</table>
		</div>
		<div id="footer"><a href="../Withdraw/Withdraw.jsp?id=<%= id %>" 
			style="text-decoration:none; color:white;">회원탈퇴</a></div>
	<%
	}
	%>
	<div id="sidebar"><img src="../Image/sidebar2.jpg"></div>
</body>
</html>