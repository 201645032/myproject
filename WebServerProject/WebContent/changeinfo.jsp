<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
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
.register1{
margin-top:150px;margin-left:300px; text-algin:center; color:#000000; font-weight:bold; width:50%;
}
.registerform{width:50%;}
</style>
  </head>
  
    
  
<body>
<%
try{
	String c_pw = request.getParameter("new_pw");
	String c_nickname = request.getParameter("new_nickname");
	String c_mail = request.getParameter("new_mail");
	String c_tel = request.getParameter("new_tel");
	int r_pw = 0, r_nickname = 0, r_mail = 0, r_tel = 0;
	String p_pw,p_nickname,p_mail,p_tel;
	String dbid="";
	
	if(c_pw == null){c_pw ="";}if(c_nickname == null){c_nickname ="";}
	if(c_mail == null){c_mail ="";}if(c_tel == null){c_tel ="";}
	

	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/testdb_a","root","1234");
	Statement stmt = conn.createStatement();

	 
	//비밀번호 체크 
	if((!c_pw.matches("[0-9|a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힝]*"))&&(c_pw.length()>8)){r_pw=1; p_pw="OK";}else{r_pw=0; p_pw="패스워드 규칙에 맞지 않습니다.";} 
	if(c_nickname.length()==0){r_nickname = 0; p_nickname="닉네임이 입력되지 않았습니다.";}else{r_nickname=1; p_nickname="OK";}
	if(c_mail.length()==0){r_mail = 0; p_mail="메일주소가 입력되지 않았습니다.";}else{r_mail=1; p_mail="OK";}
	if(c_tel.length()==0){r_tel = 0; p_tel="전화번호가 입력되지 않았습니다.";}else{r_tel=1; p_tel="OK";}
	
	if(r_pw==1&&r_nickname==1&&r_mail==1&&r_tel==1){
		stmt.executeUpdate("update users set PW = '"+c_pw+"', nickname = '"+c_nickname+"', email = '"+c_mail+"', tel = '"+c_tel+"' where id = '"+session.getAttribute("_id")+"'");
		response.sendRedirect("logout.jsp");
	}
	
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
			     <form class="navbar-form navbar-right" accept-charset="utf-8" role="search" action = "serach.jsp" method="post">
  				<div class="form-group">
   				 <input type="text" size = "40" name = "serach" class="form-control span1" placeholder="Search food and travel information">
  				</div>
  				<button type="submit" class="btn btn-danger">Search</button>
				</form>
				
            </div>
			<div class ="Login">
				<form action ="" class = "loginbutton" method="post">
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
         <form action= "changeinfo.jsp" method = "post">
		<div class = "register1"><h1>개인정보 수정</h1>
    	<div class = "regiterform">
    <div class="input-group">
        <span class="input-group-addon">  <span class="glyphicon glyphicon-lock"></span> </span>
        <input type="password" class="form-control" name = "new_pw" value="<%=c_pw %>" placeholder="비밀번호는 영문,숫자,특수문자를 혼합 8자리이상.">
    </div><p><%=p_pw %></p> 
        <div class="input-group">
        <span class="input-group-addon">  <span class="glyphicon glyphicon-tags"></span> </span>
        <input type="text" class="form-control" name = "new_nickname" value ="<%=c_nickname %>" placeholder="닉네임을 입력해주세요">
    </div> <p><%=p_nickname %></p>       
        <div class="input-group">
        <span class="input-group-addon">  <span class="glyphicon glyphicon-envelope"></span> </span>
        <input type="text" class="form-control" name = "new_mail" value = "<%=c_mail %>" placeholder="이메일을 입력해주세요">
    </div>  <p><%=p_mail %></p>     
        <div class="input-group">
        <span class="input-group-addon">  <span class="glyphicon glyphicon-phone-alt"></span> </span>
        <input type="text" class="form-control" name = "new_tel" value = "<%=c_tel %>" placeholder="전화번호를 입력해주세요">
    </div><p><%=p_tel %></p> <br><p>**개인정보 변경 후에는 다시 로그인 해야 합니다**</p>          
      
      
      <div class="modal-footer">
      	
        <button type="submit" class="btn btn-primary">수정하기</button></form>
        <a href="main.jsp"><button type="button" class="btn btn-default">취소</button></a>
      </div>
      </div>
      </div>

     
      
      

      
      
      <div class = "information"><!-- 과제 설명 -->
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