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
Statement stmt4 = conn.createStatement();
Statement stmt5 = conn.createStatement();
Statement stmt6 = conn.createStatement();
Statement stmt7 = conn.createStatement();
Statement stmt8 = conn.createStatement();
Statement stmt9 = conn.createStatement();

stmt3.executeUpdate("delete from travel where code ="+code+"");
stmt4.executeUpdate("delete from imageaddr where imagecode ="+code+"");
stmt5.executeUpdate("delete from travelcomments where code ="+code+"");

ResultSet rs = stmt6.executeQuery("select code from travel where code>"+code+"");
while(rs.next()){
	int newcode = rs.getInt(1);
	stmt.executeUpdate("update travel set code = code-1 where code ="+newcode+"");
}
rs.close();

ResultSet rs2; 
rs2 = stmt2.executeQuery("select imagecode from imageaddr where imagecode>"+code+"");
while(rs2.next()){
	int newcode2 = rs2.getInt(1);
	stmt6.executeUpdate("update imageaddr set imagecode = imagecode -1 where imagecode = "+newcode2+"");
	stmt7.executeUpdate("update travel set imagecode = imagecode -1 where imagecode = "+newcode2+"");
	stmt8.executeUpdate("update travelcomments set code = code-1 where code = "+newcode2+"");
	stmt9.executeUpdate("update t_love set code = code-1 where code = "+newcode2+"");
}
rs2.close();
stmt.close();stmt2.close();stmt3.close();stmt4.close();stmt5.close();stmt6.close();stmt7.close();stmt8.close();
response.sendRedirect("travel.jsp");
%>
</body>
</html>