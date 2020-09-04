<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%> <%@ page import = "java.sql.*" %> <%@ page import = "java.*" %>
<%@ page import = "javax.*" %><%@ page import ="com.oreilly.servlet.MultipartRequest"%>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
try{
//String saveFolder = "/imgs";
String savePath = "C:/Users/USER/Desktop/정찬영/개인프로젝트/WebServerProject/WebContent/imgs/Travel";
//ServletContext context = getServletContext();

int sizeLimit = 1024*1024*5;
DefaultFileRenamePolicy Policy = new DefaultFileRenamePolicy();
MultipartRequest multi= new MultipartRequest(request, savePath, sizeLimit,"euc-kr",Policy);

String[] image = new String[10]; 
String title = multi.getParameter("_title");
String api = multi.getParameter("_api");
String info = multi.getParameter("_info");
		
String hash1 = multi.getParameter("_hash1");
String hash2 = multi.getParameter("_hash2");
String hash3 = multi.getParameter("_hash3");
String hash4 = multi.getParameter("_hash4");

image[1] = multi.getFilesystemName("_image1"); //request.getParameter("_image1");
image[2] = multi.getFilesystemName("_image2"); //request.getParameter("_image2");
image[3] = multi.getFilesystemName("_image3"); //request.getParameter("_image3");
image[4] = multi.getFilesystemName("_image4"); //request.getParameter("_image4");
image[5] = multi.getFilesystemName("_image5"); //request.getParameter("_image5");

int c_title = 0, c_api = 0, c_info = 0, c_hash1 = 0, c_hash2 = 0, c_hash3 = 0, c_hash4 = 0, c_image1 = 0, c_imagecheck = 0; 
String p_title = "", p_api = "", p_info = "", p_hash = "", p_image = "";
if(title == null){c_title=0; p_title="제목을 입력해주세요";}else{c_title = 1;}
if(info == null){c_info=0; p_info="내용을 입력해주세요";}else{c_info = 1;}
if(api == null){c_api=0; p_api="지도 키워드를 입력해주세요";}else{c_api = 1;}
if(hash1 == "선택안함"){c_hash1=0; p_hash="해쉬태그를 입력해주세요";}else{c_hash1 = 1;}
if(hash2 == "선택안함"){c_hash2=0;}else{c_hash2 = 1;} if(hash3 == "선택안함"){c_hash3=0;}else{c_hash3 = 1;}
if(hash4 == "선택안함"){c_hash4=0;}else{c_hash4 = 1;} if(image[1] == null){c_image1 = 0;} else{c_image1 = 1; c_imagecheck++;}
if(image[2] != null){c_imagecheck++;}if(image[3] != null){c_imagecheck++;}if(image[4] != null){c_imagecheck++;}if(image[5] != null){c_imagecheck++;}

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/testdb_a","root","1234");
Statement stmt = conn.createStatement();
if(c_title ==1 && c_info == 1 && c_api == 1 && c_hash1 == 1 && c_hash2 == 1 && c_hash3 == 1 && c_hash4 == 1 && c_image1==1){

ResultSet rs = stmt.executeQuery("select max(code) from travel");
try{
 if(rs.next()){
	int code = rs.getInt(1);
	code++;
	stmt.executeUpdate("insert into travel values("+code+",'"+title+"','"+session.getAttribute("_id")+"','"+api+"','"+info+"','"+hash1+"','"+hash2+"','"+hash3+"','"+hash4+"',0,"+code+")");
	stmt.executeUpdate("insert into imageaddr(imagecode) values("+code+")");
	for(int j = 1; j<=c_imagecheck; j++){
		stmt.executeUpdate("update imageAddr set image"+j+"='"+image[j]+"' where imagecode="+code+"");	
	}
}
 response.sendRedirect("travel.jsp");
}catch(Exception e){e.printStackTrace();}}
else{%><script type="text/javascript"> alert('입력오류에러입니다.'); history.go(-1);</script><%} %>


        <% }catch(Exception e){
	e.printStackTrace();	
}%>  
</body>
</html>