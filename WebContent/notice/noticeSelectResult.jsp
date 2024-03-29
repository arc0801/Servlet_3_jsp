<%@page import="com.arc.notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	NoticeDTO noticeDTO = (NoticeDTO)request.getAttribute("dto");
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
<style type="text/css">
	.contents {
		background-color: lightgray;
		width: 100%;
		height: 200px;
		padding: 20px;
		font-size: 15px;
		margin-bottom: 20px;
	}
</style>
</head>
<body>
<%@ include file="../layout/nav.jsp" %>

	<div class="container">
		<h2>Notice Select Page</h2>
		<br>
	  <table class="table">
	    <thead>
	      <tr class="info"><th>SUBJECT</th><th>NAME</th><th>DATE</th><th>HIT</th></tr>
	    </thead>
	    <tbody>
	      <tr>
	        <td><%= noticeDTO.getTitle() %></td>
	        <td><%= noticeDTO.getWriter() %></td>
	        <td><%= noticeDTO.getReg_date() %></td>
	        <td><%= noticeDTO.getHit() %></td>
	      </tr>
	    </tbody>
	  </table>
	  <div class="contents">
		<%= noticeDTO.getContents() %>
	  </div>
	  <% if(memberDTO != null && memberDTO.getId().equals(noticeDTO.getWriter())) {%>
	  	<a href="./noticeUpdate.jsp?num=<%= noticeDTO.getNum() %>" class="btn btn-info">Update</a>
	 	<a href="./noticeDeleteResult.jsp?num=<%= noticeDTO.getNum() %>" class="btn btn-danger">Delete</a>
	  <% } %>
		<a href="./noticeList.jsp" class="btn btn-primary">List</a>
	</div>
	
</body>
</html>