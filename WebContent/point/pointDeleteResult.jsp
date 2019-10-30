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
	
	num = pointDAO.delete(con, num);
	
	con.close();
	
	String msg = "삭제 실패";
	if(num>0){
		msg = "삭제 성공";
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<script type="text/javascript">
	alert('<%= msg %>');
	location.href="./pointList.jsp";
</script>	
</body>
</html>