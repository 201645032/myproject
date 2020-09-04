<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*" %> <%@ page import = "java.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
 <% 
 
 try{
	 request.setCharacterEncoding("utf-8");
	 String s_code = request.getParameter("code");
	 String comment = request.getParameter("_comment");
	 
	 int code = Integer.parseInt(s_code);
	 Class.forName("com.mysql.jdbc.Driver");
	 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/testdb_a","root","1234");
	 Statement stmt = conn.createStatement();
	 ResultSet rs;
	 if(session.getAttribute("_id")==null){%><script type="text/javascript"> alert('로그인 해주세요'); history.go(-1);</script><%} 
	  else{
		  
	 rs = stmt.executeQuery("select max(commentcode) from foodcomments");
	 if(rs.next()){
			int c_code = rs.getInt(1);	
			c_code++;
	 	
	 	stmt.executeUpdate("insert into foodcomments values("+c_code+","+code+",'"+session.getAttribute("_id")+"','"+comment+"')");
	 }
	 %>
	 
	  <script>alert('댓글작성완료');</script><%response.sendRedirect("foodboard.jsp?code="+s_code);%>
	  
	  
	 <%}%>
	 
	 
	 <% }catch(Exception e){
	e.printStackTrace();	
}%>   
	
</body>
</html>