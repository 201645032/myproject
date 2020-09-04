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
	background: linear-gradient(to bottom, rgba(184,198,223,1) 0%,rgba(109,136,183,1) 100%)
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
      /* 아이콘 부분 */
    .service {margin: 40px 0;}
    .service a { display: block;}
    .icons {      
         float: left;
         display: block;
         font-size: 30px;
         color: #555;
         background-color: #FFF711;
         border-radius: 50%;
         text-align: center;
         margin-right: 15px ;
         padding: 20px;
         border:4px solid #2B1A06;
         transition: all 0.3s;
        }  
    .row-service a:hover .icons  { background-color:#555;}
    .row-service a:hover .icons  { background-color:#D89552;}
    .row-service a:hover .icontxt h4 { color: #555; }
    .row-service a .icontxt h4 { color: #000000; }
    .row-service a .icontxt p { color: #000000; }
    .information{background-color:#2E2E3F; padding-bottom:15px}
	.information p{color :#000000; font-size :14px;text-align: center;}
	.information a{color :#01004F; font-size : 15px;}
    @media (min-width: 768px) {
      .icons { margin: 0 auto; position: relative; left: 30%;}
      .icontxt h4 { text-align: center;}
    }

    @media (max-width: 360px) {
      .icontxt p { display: none; }
      .icontxt {line-height:10px; padding: 0; margin: 0;}
      .icontxt h4 { display: none; }
      .icons { padding: 20px; margin: 10px 0 10px 20px; }
      .book img { width: 50%; height: auto;}
      .control { display: none;} 
    }
</style>
  </head>
  
    
  
<body>
<%
try{
	String c_id = request.getParameter("cid");
	String c_pw = request.getParameter("cpw");
	String c_nickname = request.getParameter("cnickname");
	String c_mail = request.getParameter("cmail");
	String c_tel = request.getParameter("ctel");
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/testdb_a","root","1234");
	Statement stmt = conn.createStatement();%>
	
	
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
              <a class="navbar-brand navbar-left" href="maintest.html"><img src="./imgs/p_logo.png" alt="Traveler"> </a>
            </div>
           
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-center navbar-ex1-collapse">
              <ul class="nav navbar-nav">
                <li><a href="maintest.html" >HOME </a></li>  
                <li><a href="about.html">ABOUT </a></li>  
                <li><a href="travel.html">TRAVEL </a></li>  
                <li><a href="food.html">FOOD </a></li>          
              </ul>
			     <form class="navbar-form navbar-right" role="search">
  				<div class="form-group">
   				 <input type="text" size = "40" class="form-control span1" placeholder="Search food and travel information">
  				</div>
  				<button type="submit" class="btn btn-danger">Search</button>
				</form>
				
            </div>
			<div class ="Login">
				<form action ="" class = "loginbutton" method="post">
				<button type = "button" class ="btn btn-default btn sm dropdown-toggle"" data-toggle="dropdown"><img src ="./imgs/loginicon.png" class="l_login"><span class="caret"></span></button>
				       <ul class="dropdown-menu" role="menu">
				       <!-- JSP로 로그인여부에 따라 메뉴 모양을 바꿔야함 -->
        				<li ><a href="#loginModal" data-toggle="modal">로그인</a></li>
        				<li><a href="#register_modal" data-toggle="modal">회원가입</a></li>
        				<li><a href="#">즐겨찾기</a></li>
        				<li><a href="#">계정설정</a></li>
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
  
<!-- register modal -->
<div class="modal fade" id="register_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">회원가입 </h4>
      </div>
      <div class="modal-body">
      <div class="input-group">
    
        <span class="input-group-addon"> <span class="glyphicon glyphicon-user"> </span> </span>
        <input type="text" size="10" id = "new_id" class="form-control" placeholder="아이디는 8글자 이상입니다.">
    </div> <p id = "result_id"></p> <!-- 나중에 스크립트릿으로 조건문 넣어서 옆에 br을 출력하거나 p태그를 출력하도록 하자 --><br>
    <div class="input-group">
        <span class="input-group-addon">  <span class="glyphicon glyphicon-lock"></span> </span>
        <input type="password" class="form-control" id = "new_pw" placeholder="비밀번호는 영문,숫자,특수문자를 혼합 8자리이상.">
    </div><p id = "result_pw"></p> <br>
        <div class="input-group">
        <span class="input-group-addon">  <span class="glyphicon glyphicon-tags"></span> </span>
        <input type="text" class="form-control" id = "new_nickname" placeholder="닉네임을 입력해주세요">
    </div>        <br>
        <div class="input-group">
        <span class="input-group-addon">  <span class="glyphicon glyphicon-envelope"></span> </span>
        <input type="text" class="form-control" id = "new_mail" placeholder="이메일을 입력해주세요">
    </div>  <p id = "result_mail"></p>     <br>
        <div class="input-group">
        <span class="input-group-addon">  <span class="glyphicon glyphicon-phone-alt"></span> </span>
        <input type="text" class="form-control" id = "new_tel" placeholder="전화번호를 입력해주세요">
    </div>       <br>    
      
      </div>
      <div class="modal-footer">
      	
        <button type="button" onclick = "register()" class="btn btn-primary">가입하기</button></form>
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div> <!-- 모달 콘텐츠 -->
  </div> <!-- 모달 다이얼로그 -->
</div> <!-- 모달 전체 윈도우 --> 
     </div>   
    <!-- // nav bar 부분 끝 -->
    
    
    
    
    
    
    <!-- 캐러셀 부분 시작 -->
    <div id="carousel-generic" class="carousel slide">
      <!-- Indicators -->
       <ol class="carousel-indicators">
         <li data-target="#carousel-generic" data-slide-to="0" class="active"></li>
         <li data-target="#carousel-generic" data-slide-to="1"></li>
         <li data-target="#carousel-generic" data-slide-to="2"></li>        
       </ol>
     <!-- Carousel items -->
       <div class="carousel-inner">
          <div class="item active">
          	 <a  href = "about.html">
             <img src="./imgs/1.jpg" alt="First slide">
             </a>
          </div>
          <div class="item">
          	  <a  href = "travel.html">
             <img src="./imgs/2.jpg" alt="Second slide"></a>        
          </div>
          <div class="item">
          	 <a  href = "">	
             <img src="./imgs/3.jpg" alt="Third slide"></a>               
          </div>                     
       </div>
      <!-- Controls -->
        <a class="left carousel-control" href="#carousel-generic" data-slide="prev">        
          <img src="./imgs/left.png" class="control">
        </a>
        <a class="right carousel-control" href="#carousel-generic" data-slide="next">
          <img src="./imgs/right.png" class="control">
        </a>
      </div>
    <!--// 캐러셀 부분 끝  -->
    <!-- 아이콘 부분 시작 -->
     <div class="container">
        <div class="row-service">
            <div class="col-xs-6 col-md-3">  
                <div class="row">
                    <div class="col-xs-4 col-md-12"> <span class="glyphicon glyphicon-search icons"> </span></div>
                    <div class="col-xs-8 col-md-12 icontxt">
                      <h4>Quick &amp; Accurate information</h4>
                      <p>You can quickly search the best food and travel information of INCHEON </p>
                    </div>
                </div>                 
             </div>         
              <div class="col-xs-6 col-md-3"> 
                <div class="row"><!-- 그리드 안에 그리디를 넣어주므로써 아이콘과 텍스트를 분리 -->
                    <div class="col-xs-4 col-md-12"> <span class="glyphicon glyphicon-phone icons"> </span></div>
                    <div class="col-xs-8 col-md-12 icontxt">
                       <h4>Fully responsive</h4>
                       <p>Our site responds to all devices</p>
                    </div>
                </div>                                         
              </div>
              <div class="col-xs-6 col-md-3"> 
                <div class="row">
                    <div class="col-xs-4 col-md-12"><span class="glyphicon glyphicon-picture icons"> </span></div>
                    <div class="col-xs-8 col-md-12 icontxt">
                       <h4>Image-Centric System</h4>
                       <p>All our posts are image posting</p>
                    </div>
                </div> 
              </div>
              <div class="col-xs-6 col-md-3"> 
                <div class="row">
                 <!-- a 태그를 넣어주면 클릭형으로 사용 가ㅡㅇ -->
                  <div class="col-xs-4 col-md-12"><span class="glyphicon glyphicon-user icons"> </span></div>
                  <div class="col-xs-8 col-md-12 icontxt">
                     <h4>For customer</h4>
                     <p>Register now! You can manage the information you like efficiently</p><br><br><br>
                  </div>
                </div>                 
             </div>
          </div>
      </div> <!-- 아이콘 끝-->
      
      

      
      
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
  <script type="text/javascript">
	function register(){
		var id = document.getElementById('new_id').value;
		var pw = document.getElementById('new_pw').value;
		var nickname = document.getElementById('new_nickname').value;
		var mail = document.getElementById('new_mail').value;
		var tel = document.getElementById('new_tel').value;
		var rid = document.getElementById('result_id');
		var rpw = document.getElementById('result_pw');
		
		
		var pattern1 = /[0-9]/; var pattern2 = /[a-zA-Z]/; var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/;
		if(id.length<8){rid.innerHTML='아이디 규칙이 틀렸습니다.';} else {rid.innerHTML="";}
		if(!pattern1.test(pw) || !pattern2.test(pw) || !pattern3.test(pw) || pw.length < 8){rpw.textContent='패스워드 규칙이 틀렸습니다.';}
		else {rpw.innerHTML=""}
		
		
	}
  </script>

    <% }catch(Exception e){
	e.printStackTrace();
}%>
</body>
</html>