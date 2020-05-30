<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="beans.Javabeans"%>
<%@ page import="beans.Location" %>
<%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>지역별 명소</title>
	<link rel="stylesheet" type="text/css" href="../Css/location_view.css">
</head>
<body>
	<%
	Location l = new Location();
	Javabeans db = (Javabeans)session.getAttribute("db");
		boolean flag = true;
		String t = "";
		String pagenum = request.getParameter("page");
		String location = request.getParameter("location");
		String id = (String) session.getAttribute("id");
		if (pagenum == null || location == null || db==null) {
			flag = false;
	%>
	<script>
			alert('page오류');
			document.location.href="./main_view.jsp";
		</script>
	<%
		}
		
		int nloc = Integer.parseInt(location);
		switch(nloc){
		case 0:
			t = "강남구";
			break;
		case 1:
			t = "강동구";
			break;
		case 2:
			t = "강북구";
			break;
		case 3:
			t = "강서구";
			break;
		case 4:
			t = "관악구";
			break;
		case 5:
			t = "광진구";
			break;
		case 6:
			t = "구로구";
			break;
		case 7:
			t = "금천구";
			break;
		case 8:
			t = "노원구";
			break;
		case 9:
			t = "도봉구";
			break;
		case 10:
			t = "동대문구";
			break;
		case 11:
			t = "동작구";
			break;
		case 12:
			t = "마포구";
			break;
		case 13:
			t = "서대문구";
			break;
		case 14:
			t = "서초구";
			break;
		case 15:
			t = "성동구";
			break;
		case 16:
			t = "성북구";
			break;
		case 17:
			t = "송파구";
			break;
		case 18:
			t = "양천구";
			break;
		case 19:
			t = "영등포구";
			break;
		case 20:
			t = "용산구";
			break;
		case 21:
			t = "은평구";
			break;
		case 22:
			t = "종로구";
			break;
		case 23:
			t = "중구";
			break;
		case 24:
			t = "중랑구";
			break;
		}
		
		String sql = "select * from post_tbl where location = '" + t + "'";
		int startnum = 0;
		int endnum = db.getSize(sql);
		int num = Integer.parseInt(pagenum);
		if (num <= 0) {
			flag = false;
	%>
	<script>
			alert('페이지의 범위를 벗어났습니다.');
			document.location.href="My_view.jsp?page=1&location=<%= location %>";
		</script>
	<%
		} else if (num > endnum / 10 + 1) {
			flag = false;
	%>
	<script>
			alert('페이지의 범위를 벗어났습니다.');
			document.location.href="My_view.jsp?page=<%=endnum / 10 + 1%>&location=<%= location %>";
	</script>
	<%
		}
		if (flag) {
			int locnum=Integer.parseInt(request.getParameter("location"));
			sql = "select * from post_tbl where location = '" + t + "' limit " + (num - 1) * 10 + ",10";
			ResultSet rs = db.executeQuery(sql);
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
			<li><a href="./Theme_view.jsp?page=1&theme=tour"><div id="div_li">테마로 찾기</div></a>
				<ul>
					<li><a href="./Theme_view.jsp?page=1&theme=tour">관광지/유적지</a></li>
					<li><a href="./Theme_view.jsp?page=1&theme=landmark">랜드마크</a></li>
					<li><a href="./Theme_view.jsp?page=1&theme=art">문화/예술</a></li>
					<li><a href="./Theme_view.jsp?page=1&theme=sports">스포츠</a></li>
				</ul>
			</li>
			<li><a href="Location_view.jsp?page=1&location=0"><div id="div_li">지역별 명소</div></a></li>
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
	</div>
	<div class="leftbar">
		<ul>
			<li>지역별 명소</li>
		</ul>
	<div id="location_tbl">
	<table>
		<tr><td><a href="Location_view.jsp?page=1&location=0">강남구</a></td>
		<td><a href="Location_view.jsp?page=1&location=1">강동구</a></td></tr>
		<tr><td><a href="Location_view.jsp?page=1&location=2">강북구</a></td>
		<td><a href="Location_view.jsp?page=1&location=3">강서구</a></td></tr>
		<tr><td><a href="Location_view.jsp?page=1&location=4">관악구</a></td>
		<td><a href="Location_view.jsp?page=1&location=5">광진구</a></td></tr>
		<tr><td><a href="Location_view.jsp?page=1&location=6">구로구</a></td>
		<td><a href="Location_view.jsp?page=1&location=7">금천구</a></td></tr>
		<tr><td><a href="Location_view.jsp?page=1&location=8">노원구</a></td>
		<td><a href="Location_view.jsp?page=1&location=9">도봉구</a></td></tr>
		<tr><td><a href="Location_view.jsp?page=1&location=10">동대문구</a></td>
		<td><a href="Location_view.jsp?page=1&location=11">동작구</a></td></tr>
		<tr><td><a href="Location_view.jsp?page=1&location=12">마포구</a></td>
		<td><a href="Location_view.jsp?page=1&location=13">서대문구</a></td></tr>
		<tr><td><a href="Location_view.jsp?page=1&location=14">서초구</a></td>
		<td><a href="Location_view.jsp?page=1&location=15">성동구</a></td></tr>
		<tr><td><a href="Location_view.jsp?page=1&location=16">성북구</a></td>
		<td><a href="Location_view.jsp?page=1&location=17">송파구</a></td></tr>
		<tr><td><a href="Location_view.jsp?page=1&location=18">양천구</a></td>
		<td><a href="Location_view.jsp?page=1&location=19">영등포구</a></td></tr>
		<tr><td><a href="Location_view.jsp?page=1&location=20">용산구</a></td>
		<td><a href="Location_view.jsp?page=1&location=21">은평구</a></td></tr>
		<tr><td><a href="Location_view.jsp?page=1&location=22">종로구</a></td>
		<td><a href="Location_view.jsp?page=1&location=23">중구</a></td></tr>
		<tr><td><a href="Location_view.jsp?page=1&location=24">중랑구</a></td><td> </td></tr>
	</table>
	</div>
	</div>
	<h2>> <%= t %></h2>
	<div id="notice_write">
		<table id="notice_tbl">
			<tr>
				<th id="tbl_th1">글번호</th>
				<th id="tbl_th3">글제목</th>
				<th id="tbl_th2">글쓴이</th>
				<th id="tbl_th1">조회수</th>
			</tr>
			<%
				while (rs.next()) {
						String rnum = Integer.toString(rs.getInt("num"));
			%>
			<tr>
				<td id="tbl_td1"><%=rs.getRow() + (num - 1) * 10%></td>
				<td id="tbl_td3"><a href="./Post/View.jsp?num=<%=rnum%>"> <%=rs.getString("title")%></a></td>
				<td id="tbl_td2"><%=rs.getString("name")%></td>
				<td id="tbl_td1"><%=rs.getInt("good")%></td>
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
				<td><a href="Location_view.jsp?page=1&location=<%= nloc %>">&lt;&lt;</a></td>
				<td><a href="Location_view.jsp?page=<%=num - 1%>&location=<%= nloc %>">&lt;</a></td>
				<td style="width:90px;"><%=num%> page</td>
				<td><a href="Location_view.jsp?page=<%=num + 1%>&location=<%= nloc %>">&gt;</a></td>
				<td><a href="Location_view.jsp?page=<%=endnum / 10 + 1%>&location=<%= nloc %>">&gt;&gt;</a></td>
				<td><%=endnum / 10 + 1%></td>
			</tr>
		</table>
	</div>
	<div id="sidebar"><img src="../Image/sidebar4.jpg"></div>
</body>
</html>