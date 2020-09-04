<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %> <%@ page import = "java.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그아웃</title>
</head>
<body>
<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/testdb_a","root","1234");
	Statement stmt = conn.createStatement();
	stmt.executeUpdate("update users set login = '0' where id = '"+session.getAttribute("_id")+"'");
	session.invalidate();
	response.sendRedirect("main.jsp");
	
}catch(Exception e){
	e.printStackTrace();
}%>
</body>
</html>