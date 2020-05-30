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
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	if(db == null){
		flag = false;
		%>
		<script>
			alert('db오류');
			document.location.href="../View/main_view.jsp";
		</script>
		<%
	}
	
	//info[0~4] age location title content
	if(title==null||content==null){
		flag=false;
		%>
		<script>
			alert('입력이 되지 않은 정보가 있습니다.');
			window.history.go(-1);
		</script>
		<%
	}else{
		if(flag){
			content = content.replace("\r\n", "<br>");
			db.declareInsert(title, content,(String)session.getAttribute("id"));
			%>
			<script>
				alert('신고접수가 완료되었습니다.');
				document.location.href="../View/main_view.jsp";
			</script>
			<%
		}
	}
		
	%>
</body>
</html>