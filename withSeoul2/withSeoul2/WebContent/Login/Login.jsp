<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
		//Login.jsp from main_view
		String id = request.getParameter("userid");
		String password = request.getParameter("userpw");
		if(db == null){
			%>
			<script>
				alert('db오류');
				document.location.href("../index.jsp");
			</script>
			<%
		}
		
		if(db.check(id, password)){
			session.setAttribute("id", id);
			%>
			<script>
				document.location.href("../View/main_view.jsp");
			</script>
			<%
		}else{
			%>
			<script>
				alert('등록된 아이디 또는 비밀번호가 존재하지 않습니다.');
				window.history.go(-1);
			</script>
			<%
		}
	%>
</body>
</html>