<%@page import="com.arc.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.arc.member.MemberDTO"%>
<%@page import="com.arc.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	MemberDTO memberDTO = new MemberDTO();
	memberDTO.setId(request.getParameter("id"));
	memberDTO.setPw(request.getParameter("pw"));
	
	MemberDAO memberDAO = new MemberDAO();
	Connection con = DBConnector.getConnection();
	memberDTO = memberDAO.memberLogin(con, memberDTO);
	
	con.close();
	
	if(memberDTO != null){
		session.setAttribute("member", memberDTO);
		response.sendRedirect("../index.jsp");
	}else {
		request.setAttribute("msg", "Login Fail");
		request.setAttribute("path", "../index.jsp");
		
		RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
		view.forward(request, response);
	}
	
	/* if(memberDTO != null){
		request.setAttribute("member", memberDTO);
		
		RequestDispatcher view = request.getRequestDispatcher("../index.jsp");
		view.forward(request, response);
	}else {
		response.sendRedirect("../index.jsp");
	} */
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