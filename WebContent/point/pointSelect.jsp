<%@page import="com.arc.point.PointDTO"%>
<%@page import="com.arc.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.arc.point.PointDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	PointDAO pointDAO = new PointDAO();
	Connection con = DBConnector.getConnection();
	int num = Integer.parseInt(request.getParameter("num"));
	
	PointDTO pointDTO = pointDAO.selectOne(con, num);
	
	con.close();
	
	if(pointDTO == null){
		response.sendRedirect("./pointList.jsp"); //정보 안가져가도 될 때
	}else {
		RequestDispatcher view = request.getRequestDispatcher("./pointSelectResult.jsp");
		view.forward(request, response); //정보 살려서 보내고 싶을 때
	}
%>
