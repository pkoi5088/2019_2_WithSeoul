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
		// 0~5 : Name ID PassWord phone E-Mail NickName
		String[] info = new String[6];
		info[0] = request.getParameter("register_name");
		info[1] = request.getParameter("register_id");
		info[2] = request.getParameter("register_pw");
		info[3] = request.getParameter("register_phone");
		info[4] = request.getParameter("register_mail");
		info[5] = request.getParameter("register_nick");
		
		if(db == null){
			flag = false;
			%>
			<script>
				alert('db오류');
				document.location.href("../index.jsp");
			</script>
			<%
		}
		
		for(int i = 0;i<6;i++){
			if(info[i].equals("")){
				flag = false;
				%>
				<script>
					alert('회원정보를 다시 입력해주세요.');
					window.history.go(-1);
				</script>
				<%
			}
		}
		
		if(flag&&db.checkId(info[1])){
			flag = false;
			%>
			<script>
				alert('이미 존재하는 아이디입니다.');
				window.history.go(-1);
			</script>
			<%
		}
		
		if(flag){
			db.register(info);
			%>
			<script>
				alert('회원가입 완료');
				document.location.href="../index.jsp";
			</script>
			<%
		}else{
			%>
			<script>
				alert('회원가입 오류.');
				window.history.go(-1);
			</script>
			<%
		}
	%>
</body>
</html>