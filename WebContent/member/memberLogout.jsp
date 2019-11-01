<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session.setAttribute("member", null); //session의 memberDTO를 null로~
	//session.removeAttribute("member"); //session key,value 삭제
	session.invalidate(); //session 소멸 : 강제로 시간을 0으로~
	response.sendRedirect("../index.jsp");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>