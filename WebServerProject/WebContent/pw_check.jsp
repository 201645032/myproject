<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %> <%@ page import = "java.*" %>
<!DOCTYPE html>
<html lang="ko-kr">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title> Traveler - The most convenient travel information search site </title>

    <!-- Bootstrap -->
    <link href="./css/nomalize.css" rel="stylesheet" type="text/css">
    <link href="./css/bootstrap.min.css" rel="stylesheet" type = "text/css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
body{
	padding-top:90px;
	background: linear-gradient(to bottom, rgba(203,96,179,1) 0%,rgba(193,70,161,1) 50%,rgba(168,0,119,1) 51%,rgba(219,54,164,1) 100%);
	}
.container-fluid{padding:0;}
 nav {
		background: linear-gradient(to bottom, rgba(125,126,125,1) 0%,rgba(14,14,14,1) 76%);
     }
.nav a{
        font-size: 35px !important;
      }
.formgroup{margin-right: 0px}
.dropdown-menu{	padding-left: 0px;
	margin-left:1300px;
	margin-top:-40px;}
.loginbutton{
	padding-top: -30px;
	padding-left: 1150px;
	margin-left:0px;
	margin-top:-50px;
}
.l_login{
width:50px;
hight:50px;
}
.loginbutton button{
	background-color: transparent !important;
    background-image: none !important;
    border-color: transparent;
    border: none;
    color: #FFFFFF;
}
      .control { position: inherit; top: 50%; z-index: 5; display: inline-block; right: 50%;} 
      @media (max-width: 320px)  {
        .navbar-brand img { width: 80%; height: auto; margin-top:-100px}  
      }
      @media (max-width: 980px) {
        .navbar-nav li { margin:0 10px;}
      }
      /* 모달 부분*/
      .modal-content{color:#000000;}
.login1{
margin-top:150px;margin-left:300px; text-algin:center; color:#000000; font-weight:bold;
}
.loginform{width:50%;}
</style>
  </head>
  
    
  
<body>
<%
try{
	String pw = request.getParameter("_pw");
	String p="";
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/testdb_a","root","1234");
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("select pw from users where id = '"+session.getAttribute("_id")+"'and pw = '"+pw+"'");
	if(rs.next()){
		 String userpw = rs.getString("PW");
		 
		 if(pw.equals(userpw)){
			 response.sendRedirect("changeinfo.jsp");
		 }
		
	}
	else{p = "비밀번호가 일치하지 않습니다.";}
	 
	
	%>
	
	
  <div class="container-fluid">
    <!-- nav bar 부분 -->
    <div class="container">
          <nav class="navbar navbar-default navbar-fixed-top" role="navigation" id="navbar-scroll">
            <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand navbar-left" href="main.jsp"><img src="./imgs/p_logo.png" alt="Traveler"> </a>
            </div>
           
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-center navbar-ex1-collapse">
              <ul class="nav navbar-nav">
                <li><a href="main.jsp" >HOME </a></li>  
                <li><a href="about.jsp">ABOUT </a></li>  
                <li><a href="travel.jsp">TRAVEL </a></li>  
                <li><a href="food.jsp">FOOD </a></li>          
              </ul>
			     <form class="navbar-form navbar-right" role="search">
  				<div class="form-group">
   				 <input type="text" size = "40" class="form-control span1" placeholder="Search food and travel information">
  				</div>
  				<button type="submit" class="btn btn-danger">Search</button>
				</form>
				
            </div>
			<div class ="Login">
				<form action ="login.jsp" class = "loginbutton" method="post">
				<button type = "button" class ="btn btn-default btn sm dropdown-toggle"" data-toggle="dropdown"><img src ="./imgs/loginicon.png" class="l_login"><span class="caret"></span></button>
				       <ul class="dropdown-menu" role="menu">
				       <!-- JSP로 로그인여부에 따라 메뉴 모양을 바꿔야함 -->
        				<li ><a href="logout.jsp">로그아웃</a></li>
        				<li><a href="#">즐겨찾기</a></li>
        				<li><a href="pw_check.jsp">계정수정</a></li>
      					</ul>
				</form>
				</div>
            </div><!-- /.navbar-collapse -->
          </nav>
          
          
         <form action= "pw_check.jsp" method = "post">
        <div class = "login1"><h1>비밀번호 확인(<%=session.getAttribute("_id")%> 회원님) </h1>
     <div class = "loginform">
     <br>
    <div class="input-group">
        <span class="input-group-addon">  <span class="glyphicon glyphicon-lock"></span> </span>
        <input type="password" name = "_pw" class="form-control" placeholder="비밀번호를 입력해주세요"><br>
        
    </div> 
    <p><%=p %></p>    
      <div class="modal-footer">
        <button type="sumbit" class="btn btn-primary">확인</button></from>
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
</div>
 </div>    
      
      

      
      <div class = "space">
      <br><br><br><br><br><br><br><br><br><br><br><br>
      
      <div class = "information"><!-- 과제 설명 --><hr>
      <br><p>This website is tesksite of <a href="https://cms.itc.ac.kr/site/inhatc/main.do"> InhaTC</a></p>
      	  <p>Any question, send mail to gook3427@naver.com or call 010-3798-4018 plz 
      </div>
  </div> 
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="./js/bootstrap.min.js"></script>
    <script>
      $('.carousel').carousel() 
    </script>



    <% }catch(Exception e){
	e.printStackTrace();
}%>
</body>
</html>