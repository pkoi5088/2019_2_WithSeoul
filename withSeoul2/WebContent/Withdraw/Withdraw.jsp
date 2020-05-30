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
		String id = (String)session.getAttribute("id");
		if(db == null){
			%>
			<script>
				alert('db오류');
				document.location.href("../index.jsp");
			</script>
			<%
		}
		
		if(db.Withdraw(id)){
			%>
			<script>
				alert('회원탈퇴 완료');
				document.location.href("../index.jsp");
			</script>
			<%
		}
	%>
</body>
</html>