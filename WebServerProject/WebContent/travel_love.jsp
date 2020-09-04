<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   <%@ page import = "java.sql.*" %> <%@ page import = "java.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
String a_code = request.getParameter("code");
int code = Integer.parseInt(a_code);
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/testdb_a","root","1234");
Statement stmt = conn.createStatement();
Statement stmt2 = conn.createStatement();
Statement stmt3 = conn.createStatement();
ResultSet rs;

stmt.executeUpdate("insert into t_love values('"+session.getAttribute("_id")+"',"+code+")");
stmt2.executeUpdate("update travel set love = love+1 where code = "+code+"");
rs = stmt3.executeQuery("select id from travel where id = '"+session.getAttribute("_id")+"'");
if(rs.next()){
	String id = rs.getString(1);
	if(id.equals(session.getAttribute("_id"))){%><script type="text/javascript"> alert('좋아요는 한번만 누를 수 있습니다!.'); history.go(-1);</script><%} %>
<%}

stmt.close();stmt2.close();
response.sendRedirect("travelboard.jsp?code="+a_code);
%>
</body>
</html>