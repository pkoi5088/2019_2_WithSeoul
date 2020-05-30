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
	Javabeans db = null;
	if(session.getAttribute("db")==null){
		db = new Javabeans();
		session.setAttribute("db", db);
	}
	session.removeAttribute("id");
	response.sendRedirect("./View/main_view.jsp");
	%>
</body>
</html>