<%@page import="com.arc.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.arc.point.PointDAO"%>
<%@page import="com.arc.point.PointDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	PointDTO pointDTO = new PointDTO();
	
	pointDTO.setName(request.getParameter("name"));
	pointDTO.setKor(Integer.parseInt(request.getParameter("kor")));
	pointDTO.setEng(Integer.parseInt(request.getParameter("eng")));
	pointDTO.setMath(Integer.parseInt(request.getParameter("math")));
	pointDTO.setTotal(pointDTO.getKor()+pointDTO.getEng()+pointDTO.getMath());
	pointDTO.setAvg(pointDTO.getTotal()/3.0);
	
	PointDAO pointDAO = new PointDAO();
	Connection con = DBConnector.getConnection();
	int result = pointDAO.insert(con, pointDTO);
	
	con.close();
	
	String message="등록 실패";
	if(result>0){
		message="등록 성공";
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
	<%-- <% if(result>0){ %>
		alert("성공");
	<% } else { %>
		alert("실패");
	<% } %> --%>
	alert('<%= message %>');
	location.href="./pointList.jsp";
</script>	
</body>
</html>