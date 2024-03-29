<%@page import="com.arc.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.arc.member.MemberDAO"%>
<%@page import="com.arc.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	MemberDTO memberDTO = new MemberDTO();
	memberDTO.setId(request.getParameter("id"));
	memberDTO.setPw(request.getParameter("pw"));
	memberDTO.setName(request.getParameter("name"));
	memberDTO.setEmail(request.getParameter("email"));
	memberDTO.setPhone(request.getParameter("phone"));
	memberDTO.setGrade(Integer.parseInt(request.getParameter("grade")));
	
	/* MemberDTO sessionDTO = (MemberDTO)session.getAttribute("grade");
	memberDTO.setGrade(sessionDTO.getGrade()); */
	
	MemberDAO memberDAO = new MemberDAO();
	Connection con = DBConnector.getConnection();
	int result = memberDAO.memberUpdate(con, memberDTO);
	
	con.close();
	
	if(result>0){
		request.setAttribute("msg", "Update Success");
		session.setAttribute("member", memberDTO);
	}else {
		request.setAttribute("msg", "Update Fail");
	}
	
	request.setAttribute("path", "../index.jsp");
	
	RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
	view.forward(request, response);
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