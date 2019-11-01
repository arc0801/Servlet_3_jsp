<%@page import="com.arc.member.MemberDTO"%>
<%@page import="com.arc.notice.NoticeDTO"%>
<%@page import="java.util.ArrayList"%>
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
	
	ArrayList<NoticeDTO> ar = noticeDAO.selectList(con);
	
	con.close();
	
	//쿠키 발행
	//쿠키 생성시 생성자에 키와 벨류 입력
	Cookie cookie = new Cookie("name", "iu");
	
	//쿠키가 적용되는 Path 설정 : 보통 context path 적용
	cookie.setPath(request.getContextPath());
	
	//쿠키의 유효시간
	//단위 초단위
	//설정을 하지않으면 웹브라우저가 종료되면 같이 종료 됨.
	cookie.setMaxAge(3600);
	
	//쿠키를 클라이언트로 전송
	response.addCookie(cookie);
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="../layout/nav.jsp" %>

	<div class="container">
	  <h2>Notice</h2>
	  <table class="table">
	    <thead>
	      <tr class="info"><th>NO</th><th>SUBJECT</th><th>NAME</th><th>DATE</th><th>HIT</th></tr>
	    </thead>
	    <tbody>
	    	<% for(int i=0;i<ar.size();i++){
	    			NoticeDTO noticeDTO = ar.get(i); %>
	      <tr>
	        <td><%= noticeDTO.getNum() %></td>
	        <td><a href="./noticeSelect.jsp?num=<%= noticeDTO.getNum() %>"><%= noticeDTO.getTitle() %></a></td>
	        <td><%= noticeDTO.getWriter() %></td>
	        <td><%= noticeDTO.getReg_date() %></td>
	        <td><%= noticeDTO.getHit() %></td>
	      </tr>
			<% } %>
	    </tbody>
	  </table>
	  
	  <% if(memberDTO != null && memberDTO.getGrade() == 0) { %>
	  	<a href="./noticeWrite.jsp" class="btn btn-info">Write</a>
	  <% } %>
	</div>

</body>
</html>