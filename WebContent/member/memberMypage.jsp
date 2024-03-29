<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	if(memberDTO == null) {
		request.setAttribute("msg", "권한이 없습니다.");
		request.setAttribute("path", "../index.jsp");
		
		RequestDispatcher view = request.getRequestDispatcher("../common/common_result.jsp");
		view.forward(request, response);
	}

	
%>
	<div class="container">
	  <h2>Member My Page</h2>
	  
	    <div class="form-group">
	      <label for="id">ID:</label>
	      <input type="text" value="<%= memberDTO.getId() %>" readonly="readonly" class="form-control" id="id" placeholder="Enter ID" name="id">
	    </div>
	    
	    <div class="form-group">
	      <label for="pw">Password:</label>
	      <input type="password" value="<%= memberDTO.getPw() %>" readonly="readonly" class="form-control" id="pw" placeholder="Enter Password" name="pw">
	    </div>
	   
	   <div class="form-group">
	      <label for="name">Name:</label>
	      <input type="text" value="<%= memberDTO.getName() %>" readonly="readonly" class="form-control" id="name" placeholder="Enter Name" name="name">
	    </div>
	    
	    <div class="form-group">
	      <label for="email">E-mail:</label>
	      <input type="email" value="<%= memberDTO.getEmail() %>" readonly="readonly" class="form-control" id="email" placeholder="Enter Email" name="email">
	    </div>
	    
	    <div class="form-group">
	      <label for="phone">Phone:</label>
	      <input type="tel" value="<%= memberDTO.getPhone() %>" readonly="readonly" class="form-control" id="phone" placeholder="Enter Phone" name="phone">
	    </div>
	    
	    <div class="form-group">
	      <label for="grade">Grade:</label>
	      <input type="tel" value="<%= memberDTO.getGrade() %>" readonly="readonly" class="form-control" id="grade" placeholder="Enter Grade" name="grade">
	    </div>
	    
	    <a href="./memberUpdateForm.jsp" class="btn btn-info">Update</a>
	    <a href="./memberDeleteResult.jsp" class="btn btn-danger">탈퇴</a>
	</div>

</body>
</html>