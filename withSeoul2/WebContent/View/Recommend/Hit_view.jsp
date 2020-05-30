<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="beans.Javabeans"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>추천명소-조회순</title>
	<link rel="stylesheet" type="text/css" href="../../Css/hit_view.css">
</head>
<body>
<%
	Javabeans db = (Javabeans)session.getAttribute("db");
	boolean flag = true;
	String pagenum = request.getParameter("page");
	String sql = "select * from post_tbl order by good desc";
	if(pagenum == null||db==null){
		flag = false;
		%>
		<script>
			alert('page오류');
			document.location.href="Hit_view.jsp?page=1";
		</script>
		<%
	}
	int startnum=0;
	int endnum=db.getSize(sql);
	int num=Integer.parseInt(pagenum);
	if(num <= 0){
		flag = false;
		%>
		<script>
			alert('페이지의 범위를 벗어났습니다.');
			document.location.href="Hit_view.jsp?page=1";
		</script>
		<%
	}else if(num > endnum/10+1){
		flag = false;
		%>
		<script>
			alert('페이지의 범위를 벗어났습니다.');
			document.location.href="Hit_view.jsp?page=<%= endnum/10+1 %>";
		</script>
		<%
	}
	if(flag){
	sql = "select * from post_tbl order by good desc limit "+(num-1)*10+",10";
	ResultSet rs = db.executeQuery(sql);
%>
	<h2>> 조회순</h2>
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
			<li>추천 명소</li>
			<li><a href="Last_view.jsp?page=1">최신순</a></li>
			<li><a href="Hit_view.jsp?page=1">조회순</a></li>
			<li><a href="Old_view.jsp?page=1&age=0">연령대별</a></li>
		</ul>
	</div>
	<div id="notice_write">
	<table id="notice_tbl">
		<tr>
			<th id="tbl_th1">글번호</th>
			<th id="tbl_th3">글제목</th>
			<th id="tbl_th2">글쓴이</th>
			<th id="tbl_th1" style="border-right:none;">조회수</th>
		</tr>
		<%
		while(rs.next()){
			String rnum = Integer.toString(rs.getInt("num"));
		%>
			<tr>
				<td id="tbl_td1"> <%= rs.getRow()+(num-1)*10 %></td>
				<td id="tbl_td3"><a href="../Post/View.jsp?num=<%= rnum %>"> <%= rs.getString("title") %></a></td>
				<td id="tbl_td2"> <%= rs.getString("name") %></td>
				<td id="tbl_td1" style="border-right: none;"> <%= rs.getInt("good") %></td>
			</tr>
		<%
		}
	}
		%>
	</table>
	</div>
	<div id="footer">
	<table>
		<tr>
			<td>1</td>
			<td><a href="Hit_view.jsp?page=1">&lt;&lt;</a></td>
			<td><a href="Hit_view.jsp?page=<%= num-1 %>">&lt;</a></td>
			<td style="width:90px;"><%= num %> page</td>
			<td><a href="Hit_view.jsp?page=<%= num+1 %>">&gt;</a></td>
			<td><a href="Hit_view.jsp?page=<%= endnum/10+1 %>">&gt;&gt;</a></td>
			<td><%= endnum/10+1 %></td>
		</tr>
	</table>
	</div>
	<div id="sidebar"><img src="../../Image/sidebar2.jpg"></div>
</body>
</html>