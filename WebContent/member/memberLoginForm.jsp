<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	String id = "";
	
	for(int i=0;i<cookies.length;i++){
		if(cookies[i].getName().equals("id")){ 
			id = cookies[i].getValue();
			break;
		}
	}
	
	/* for(Cookie cookie: cookies){ 
		if(cookie.getName().equals("id")){ 
			id = cookie.getValue();
			break;
		}
	} */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="../layout/nav.jsp" %>
			
<div class="container">
  <h2>Login Form</h2>
  <form action="./memberLoginResult.jsp" method="post">
    <div class="form-group">
      <label for="id">ID:</label>
      <input type="text" value="<%= id %>" class="form-control" id="id" placeholder="Enter ID" name="id">
	</div>
    <div class="form-group">
      <label for="pw">Password:</label>
      <input type="password" class="form-control" id="pw" placeholder="Enter Password" name="pw">
    </div>
    <div class="checkbox">
      <label><input type="checkbox" checked="checked" value="check" name="remember"> Remember me</label>
    </div>
    <button type="submit" class="btn btn-default">Submit</button>
  </form>
</div>
</body>
</html>