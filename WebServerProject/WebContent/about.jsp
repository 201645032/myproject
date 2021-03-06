<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%><%@ page import = "java.sql.*" %> <%@ page import = "java.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Traveler - The most convenient travel information search site</title>
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
.modal-content{color:#000000;}
.loginbutton button{
	background-color: transparent !important;
    background-image: none !important;
    border-color: transparent;
    border: none;
    color: #FFFFFF;
}
    header { color: #fff; text-align: center; padding: 40px 0;}
    header small { color: #fff; font-size: 35px;}
    header p { color: #ffffff; font-size: 20px;}      
    .content1 {
      background:url(./imgs/slide1_bg.jpg)  no-repeat center top fixed;
     background-size:cover; }

    .information{background-color:#2E2E3F; padding-bottom:15px}
	.information p{color :#000000; font-size :14px;text-align: center;}
	.information a{color :#01004F; font-size : 15px;}
	.how_about{background: linear-gradient(to bottom, rgba(80,0,255,1) 0%,rgba(219,15,107,1) 99%,rgba(219,15,107,1) 99%,rgba(219,15,107,1) 100%,rgba(138,187,215,1) 100%,rgba(6,109,171,1) 100%);
margin-top:-20px;}
	.how_about h2{font-size: 50px;text-align:center;}.how_about h3{text-align:center;}.how_about p{text-align:center; font-size:20px;}
</style>
</head>

<body>
 <%
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/testdb_a","root","1234");
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("select login from users where id = '"+session.getAttribute("_id")+"' ");
	

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
				       <%if(rs.next()){ 
				       String login = rs.getString("login");
				       
				       if(login.equals("1")){
				    	 %>  
        				<li ><a href="logout.jsp">로그아웃</a></li>
        				<li><a href="#">즐겨찾기</a></li>
        				<li><a href="pw_check.jsp">계정수정</a></li>
				       <%}}
				       
				       else{
				       %>
        				<li ><a href="login.jsp">로그인</a></li>
        				<li><a href="register.jsp">회원가입</a></li><%}%>
      					</ul>
				</form>
				</div>
            </div><!-- /.navbar-collapse -->
          </nav>
<!-- Login Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        
        <h4 class="modal-title" id="myModalLabel">로그인 </h4>
      </div>
      <div class="modal-body">
    <div class="input-group">
        <span class="input-group-addon"> <span class="glyphicon glyphicon-user"> </span> </span>
        <input type="text" class="form-control" placeholder="아이디">
    </div> 
     <br>
    <div class="input-group">
        <span class="input-group-addon">  <span class="glyphicon glyphicon-lock"></span> </span>
        <input type="password" class="form-control" placeholder="암 호">
    </div>
      
      </div>
      <div class="modal-footer">
      	<form action = "" method = "get">
        <button type="sumbit" class="btn btn-primary">로그인</button></from>
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div> <!-- 모달 콘텐츠 -->
  </div> <!-- 모달 다이얼로그 -->
</div> <!-- 모달 전체 윈도우 --> 
  

     </div>   
    <!-- // nav bar 부분 끝 -->
    
     </div>   
       <div id="about"></div>
      <header class="content1">  <!-- about start-->
        <div class="container">
          <br><br><br><br><br>
          <h1><small>Traveler provide the best information about travel and food </small></h1><br>
          <p>Traveler는 사용자들이 최고의 여행, 음식 정보를 함께 공유하는 플랫폼입니다.</p>
        </div><!-- end .container -->
      </header>
      
      <div class="how_about">
             <!-- 어코디언 --><hr>
               <h2>  Why Traveler? </h2><hr>
               <br><br><h3><i>'우리는 흔히 여행을 다녀왔다고 말하지만 직접 느낀 경험만이 여행은 아니다.'     </i>     (김영하 에세이_'여행의이유' 중에서)</h3><br><br>
<p>김영하 작가의 에세이 '여행의 이유'에서는 인간의 여행 경험은 두 가지의 경험이 합쳐져 완성된다고 얘기합니다.<br>
첫 번째는 우리가 직접 가서 보고 느끼는 '직접 경험'이고 두 번째는' 비(非)여행' 혹은 '탈여행'이라고 하는 경험입니다.<br>
비여행은  프랑스의 철학자 '피에르 바야르'가 정의한 용어로 다른 사람의 여행경험을 통해 자신의 여행 경험을 채우는 행위입니다.<br>
예를 들면 우리가 편안한 집 소파에 누워 스마트폰이나 TV를 통해 여행 프로그램을 시청하는 것입니다.<br>
다른 사람의 여행 경험을 통해 그 여행지에 대한 환상을 갖게 되고 나중에 그곳에 가게되면 나의 직접경험과 합쳐져 더욱 풍족한 여행경험이 되는 것이죠<br>
이와같이 나의 직접경험에 누군가의 간접경험을 얹고 이 행위가 계속 반복다보면 결국 하나의 여행경험이 완성된다고 작가는 얘기합니다.<br><br></p><hr>
<br><br><h3><i>Traveler는  '비(非)여행 ' 에 초점을 맞춘 플랫폼입니다.</i></h3><br><br>
<br> <p>여행의 대표적인 키워드인 '장소와 음식'에 대한 정보를 사용자들은 끊임없이 공유하며 서로가 서로의
'간접경험'이 되고 결국 진정한 여행경험을 함께 완성하게 됩니다.<br>
 Traveler는 현재 인천지역만 서비스하고 있지만 점차 범위를 확장하여 세상의 모든 사람들이 함께
여행경험을 완성하는 세상을 꿈꾸고 있습니다.<br>
여러분은 Traveler에서 최고의 여행경험들을 쉽고 빠르게 얻으실 수 있습니다.</p><br><br><br><hr>
</div>
      <div class = "information"><!-- 과제 설명 -->
      <br><p>This website is tesksite of <a href="https://cms.itc.ac.kr/site/inhatc/main.do"> InhaTC</a></p>
      	  <p>Any question, send mail to gook3427@naver.com or call 010-3798-4018 plz 
      </div>     

      </div> 
        <% }catch(Exception e){
	e.printStackTrace();
}%>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="./js/bootstrap.min.js"></script>
</body>
</html>