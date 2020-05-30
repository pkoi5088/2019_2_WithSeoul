<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="beans.Javabeans" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>webprogramming_project</title>
</head>
<body>
	<%
	Javabeans db = (Javabeans)session.getAttribute("db");
	boolean flag = true;
	String[] theme = request.getParameterValues("theme");
	String[] info = new String[5];
	info[0] = request.getParameter("age");
	info[1] = request.getParameter("location");
	info[2] = request.getParameter("title");
	info[3] = request.getParameter("content");
	info[4] = request.getParameter("selected");
	
	if(db == null){
		flag = false;
		%>
		<script>
			alert('db오류');
			document.location.href("../index.jsp");
		</script>
		<%
	}
	
	//info[0~4] age location title content
	if(theme==null||info[0]==null||info[1]==null||info[2]==null||info[3]==null||info[4]==null){
		flag=false;
		%>
		<script>
			alert('입력이 되지 않은 정보가 있습니다.');
			window.history.go(-1);
		</script>
		<%
	}else{
		if(flag){
			info[3] = info[3].replace("\r\n", "<br>");
			db.postInsert(theme, info, (String)session.getAttribute("id"));
			%>
			<script>
				alert('게시글이 작성되었습니다.');
				document.location.href="../View/main_view.jsp";
			</script>
			<%
		}else{
			%>
			<script>
				alert('게시글 작성 오류');
				document.location.href="../View/main_view.jsp";
			</script>
			<%
		}
	}
		
	%>
</body>
</html>