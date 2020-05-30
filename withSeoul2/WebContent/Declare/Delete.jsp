<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="beans.Javabeans" %>
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
	String num = request.getParameter("num");
	
	if(num==null){
		flag = false;
		%>
		<script>
			alert('num오류');
			document.location.href="../View/main_view.jsp";
		</script>
		<%
	}else if(db == null){
		flag = false;
		%>
		<script>
			alert('db오류');
			document.location.href("../index.jsp");
		</script>
		<%
	}
	
	if(flag){
		db.postDelete("delete from declare_tbl where num = "+num);
		%>
		<script>
			alert('신고글이 삭제되었습니다.');
			document.location.href="../View/main_view.jsp";
		</script>
		<%
	}
	%>
</body>
</html>