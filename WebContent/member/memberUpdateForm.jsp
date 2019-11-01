<%@page import="com.arc.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.arc.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
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
<%
	MemberDAO memberDAO = new MemberDAO();
	Connection con = DBConnector.getConnection();
	memberDTO = memberDAO.memberLogin(con, memberDTO);
%>

	<div class="container">
	  <h2>Member Update Form</h2>
	  <form action="./memberUpdateResult.jsp" method="post">
	  
	    <div class="form-group">
	      <label for="id">ID:</label>
	      <input type="text" value="<%= memberDTO.getId() %>" readonly="readonly" class="form-control" id="id" name="id">
	    </div>
	    
	    <div class="form-group">
	      <label for="pw">Password:</label>
	      <input type="password" required="required" class="form-control" id="pw" placeholder="Enter Password" name="pw">
	    </div>
	   
	   <div class="form-group">
	      <label for="name">Name:</label>
	      <input type="text" value="<%= memberDTO.getName() %>" required="required" class="form-control" id="name" placeholder="Enter Name" name="name">
	    </div>
	    
	    <div class="form-group">
	      <label for="email">E-mail:</label>
	      <input type="email" value="<%= memberDTO.getEmail() %>" required="required" class="form-control" id="email" placeholder="Enter Email" name="email">
	    </div>
	    
	    <div class="form-group">
	      <label for="phone">Phone:</label>
	      <input type="tel" value="<%= memberDTO.getPhone() %>" required="required" class="form-control" id="phone" placeholder="Enter Phone" name="phone">
	    </div>
	    
	    <div class="form-group">
	      <label for="grade">Grade:</label>
	      <input type="text" value="<%= memberDTO.getGrade() %>" readonly="readonly" class="form-control" id="grade" name="grade">
	    </div>
	    
	     <button class="btn btn-info">Update</button>
	    </form>
	</div>
	
</body>
</html>