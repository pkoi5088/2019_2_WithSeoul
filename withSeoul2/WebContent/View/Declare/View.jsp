<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="beans.Javabeans"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>고객센터-신고글보기</title>
	<link rel="stylesheet" type="text/css" href="../../Css/view_declare.css">
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
			<li>고객센터</li>
			<li><a href="../Declare/List_view.jsp?page=1">신고하기</a></li>
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
		String sql = "select * from declare_tbl where num = " + num;
		ResultSet rs = db.executeQuery(sql);
		rs.next();
	%>
	<h2>> 신고글 보기</h2>
	<div id="notice_tbl">
	<table>
		<tr><td id="td1">제목</td><td id="td2"><%= rs.getString("title") %></td></tr>
		<tr style="height: 390px;"><td id="td1">내용</td><td id="td2" rowspan="6"><%= rs.getString("content") %></td></tr>
	</table>
	</div>
	<%
		if(session.getAttribute("id")!=null&&rs.getString("id").equals((String)session.getAttribute("id"))){
			%>
			<a href="../../Declare/Delete.jsp?num=<%= rs.getString("num") %>">삭제</a>
			<%
		}
	}
	%>
	<div id="sidebar"><img src="../../Image/sidebar3.jpg"></div>
</body>
</html>