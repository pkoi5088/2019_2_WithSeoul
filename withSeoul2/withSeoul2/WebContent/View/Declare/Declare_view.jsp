<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<title>고객센터-신고하기</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../../Css/declare_view.css"> 
</head>
<body>
	<%
		String id = (String) session.getAttribute("id");
		if (id==null) {
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
			<li>고객센터</li>
			<li><a href="../Declare/List_view.jsp?page=1">신고하기</a></li>
		</ul>
	</div>
	<div id="rightbar">
		<h2>신고하기</h2>
		<form action="../../Declare/Insert.jsp" method="post">
			<table id="declare_tbl">
			<tr><td id="input1">제목 </td><td id="input3"><input id="input2" type="text" name="title" size="30" maxlength="30" style="height: 25px;"></td></tr>
			<tr><td id="input1">글 내 용</td><td id="input3"><textarea id="input2" name="content" cols="30" rows="10"></textarea></td></tr>
			</table>
			<div id="admit_button">
			<input id="button" type="submit" value="등록하기">
			<a href="../main_view.jsp"><input id="button" type="button" value="취소하기"></a>
			</div>
		</form>
	</div>
	<div id="sidebar"><img src="../../Image/sidebar1.jpg"></div>
</body>
</html>