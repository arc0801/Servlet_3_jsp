<%@page import="com.arc.notice.NoticeDTO"%>
<%@page import="com.arc.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.arc.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	NoticeDAO noticeDAO = new NoticeDAO();
	Connection con = DBConnector.getConnection();
	int num = Integer.parseInt(request.getParameter("num"));

	NoticeDTO noticeDTO = noticeDAO.selectOne(con, num);
	
	con.close();
	
	if(noticeDTO == null){
		String msg = "해당글이 존재하지 않습니다.";
		request.setAttribute("msg", msg);
		request.setAttribute("path", "./noticeList.jsp");
		
		RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
		view.forward(request, response);	
	}else {
		request.setAttribute("dto", noticeDTO);
		
		RequestDispatcher view = request.getRequestDispatcher("./noticeSelectResult.jsp");
		view.forward(request, response);
	}



%>