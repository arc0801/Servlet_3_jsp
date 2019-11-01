<%@page import="com.arc.member.MemberDTO"%>
<%@page import="com.arc.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.arc.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
	
	MemberDAO memberDAO = new MemberDAO();
	Connection con = DBConnector.getConnection();
	//String id = request.getParameter("id"); <- 주소창에 아이디 노출되니 쓰지마라!!
	String id = memberDTO.getId();
	
	int result = memberDAO.memberDelete(con, id);
	
	con.close();
	
	if(result>0){
		session.invalidate();
		request.setAttribute("msg", "Delete Success");
	}else {
		request.setAttribute("msg", "Delete Fail");
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