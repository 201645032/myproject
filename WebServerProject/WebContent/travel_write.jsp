<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%> <%@ page import = "java.sql.*" %> <%@ page import = "java.*" %>
<%@ page import = "javax.*" %><%@ page import ="com.oreilly.servlet.MultipartRequest"%>
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%!
/*public static String nullcheck(String str) throws Exception{
	if(str == null){
		return "";
	}else{return str;}
}*/
%>
<!DOCTYPE html>

<html>
<head>
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
.result p{color:#024884;}
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
/*게시판 사이즈*/
.modal-dialog.modal-fullsize{ width: 1200px; height: 1200px; margin: 0; margin-left: 240px; padding-top:50px; }
.loginbutton button{
	background-color: transparent !important;
    background-image: none !important;
    border-color: transparent;
    border: none;
    color: #FFFFFF;
}
 /*포트폴리오 사이트 부분 */
 .container_portfolio{padding-top:150px;
background: linear-gradient(to bottom, rgba(254,187,187,1) 0%,rgba(254,144,144,1) 45%,rgba(255,92,92,1) 100%);}
 .sans{padding-left:40px; color:#000000; font-weight:bold;}


    .information{background-color:#2E2E3F; padding-bottom:15px;}
	.information p{color :#000000; font-size :14px;text-align: center;}
	.information a{color :#01004F; font-size : 15px;}
	
    .icons {      
         float: left;
         display: block;
         font-size: 30px;
         color: #555;
         background-color: #FFF711;
         border-radius: 50%;
         text-align: center;
         margin-right: 10px ;
         padding: 20px;
         border:4px solid #2B1A06;
         transition: all 0.3s;
        }
 /* 게시글 출력 이미지 사이즈*/
.item_image{width:600px; height:400px;  display: block; margin: 0px auto; }
/* 게시글 출력 제목 사이즈, 댓글 창 조절*/
.modal-title{font-size:30px; font-weight:bold;}
.comment h3{padding-left:30px;}
.write_comment{padding: 10px; text-align: left; margin-left: 10px;}
/* 좋아요 버튼*/
.likebutton{font-size: 40px; margin-left:450px;
		 color: #FF001D;
         background-color: #FFFFFF;
         border-radius: 50%;
			}
			
/* 제목 영역 글자 크기*/
.modal_write_header textarea{font-size:30px; font-weight: bold; padding-top:10px; }
.modal_write_header textarea::placeholder {
  font-size:30px;
  font-weight: bold;
}
/* 지도 선택 글씨 정렬*/
.select_address{font-weight:bold; padding-left:30px;}
.select_address input{margin-left:30px;}
/* 해쉬태그 선택 글씨 정렬*/
.select_hash{font-weight:bold; padding-left: 30px;}
.modal-hash-select label{color:#002887; padding-left: 30px;}
/* 이미지 업로드 글씨 정렬*/
.upload_text{font-weight:bold; padding-left: 30px;}        
/* 모달 탑라인*/
.top_line{margin-top:130px;   background: linear-gradient(to bottom, rgba(252,236,252,1) 0%,rgba(253,137,215,1) 36%,rgba(253,137,215,1) 44%,rgba(253,137,215,1) 44%,rgba(251,166,225,1) 67%,rgba(255,124,216,1) 100%);}
.top_line h1{font-weight:bold; padding-top:10px;color:#000000; text-align:center;}
    @media (max-width: 360px) {
      .icons { padding: 20px; margin: 10px 0 10px 20px; }
    }      
</style>
</head>
<body>
 <% 
 try{
	 Class.forName("com.mysql.jdbc.Driver");
	 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/testdb_a","root","1234");
	 Statement stmt = conn.createStatement();
	 if(session.getAttribute("_id")==null){%><script type="text/javascript"> alert('로그인 해주세요'); history.go(-1);</script><%} %>
	
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
				       <% ResultSet rs = stmt.executeQuery("select login from users where id = '"+session.getAttribute("_id")+"' ");
				       
				       if(rs.next()){ 
				       String login = rs.getString("login");
				       
				       if(login.equals("1")){
				    	 %>  
        				<li ><a href="logout.jsp">로그아웃</a></li>
        				<li><a href="#">즐겨찾기</a></li>
        				<li><a href="pw_check.jsp">계정수정</a></li>
				       <%}
				       
				       else{
				       %>
        				<li ><a href="login.jsp">로그인</a></li>
        				<li><a href="register.jsp">회원가입</a></li><%}}%>
      					</ul>
				</form>
				</div>
            </div><!-- /.navbar-collapse -->
          </nav>
<!-- 알림 Modal -->
<div class="modal fade" id="alterModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">

      </div>
      <div class="modal-footer">
        <button type="sumbit" class="btn btn-primary">로그인</button></from>
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div> <!-- 모달 콘텐츠 -->
  </div> <!-- 모달 다이얼로그 -->
</div> <!-- 모달 전체 윈도우 --> 
     </div>   
    <!-- // nav bar 부분 끝 -->   

     
<!-- 페이지별 모달 부분 -->
<!-- top read modal -->
<div class="modal fade" id="travel_top_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-fullsize">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">글제목 </h4>
      </div>
      <div class="modal-body">
          <!-- 캐러셀 부분 시작 -->
    <div id="carousel-image-generic" class="carousel slide">
      <!-- Indicators -->
       <ol class="carousel-indicators">
         <li data-target="#carousel-image-generic" data-slide-to="0" class="active"></li>
         <li data-target="#carousel-image-generic" data-slide-to="1"></li>
         <li data-target="#carousel-image-generic" data-slide-to="2"></li>
         <li data-target="#carousel-image-generic" data-slide-to="3"></li>
         <li data-target="#carousel-image-generic" data-slide-to="5"></li>        
       </ol>
     <!-- Carousel items -->
       <div class="carousel-inner">
          <div class="item active">
             <img class = "item_image" src="./imgs/Travel/sample.jpg" alt="Frist slide">
          </div>
          <div class="item">
             <img class = "item_image" src="./imgs/Travel/sample.jpg" alt="Second slide">        
          </div>
          <div class="item">
             <img class = "item_image" src="./imgs/Travel/sample.jpg" alt="Third slide">              
          </div>                     
          <div class="item">
             <img class = "item_image" src="./imgs/Travel/sample.jpg" alt="Third slide">              
          </div>                     
          <div class="item">
             <img class = "item_image" src="./imgs/Travel/sample.jpg" alt="Third slide">              
          </div>                     
       </div>
      <!-- Controls -->
        <a class="left carousel-control" href="#carousel-image-generic" data-slide="prev">        
          <img src="./imgs/left.png" class="control">
        </a>
        <a class="right carousel-control" href="#carousel-image-generic" data-slide="next">
          <img src="./imgs/right.png" class="control">
        </a>
      </div>
    <!--// 캐러셀 부분 끝  -->
    <br>
 	 

      </div>
      <div class="like">
      <button class = "glyphicon glyphicon-heart likebutton"></button>
      </div>
      <hr>
      <div class="comment">
      <h3>댓글</h3>
      <input class = "write_comment" type="text" size="100" placeholder="댓글을 적어주세요"></input>
      <button type="submit" class="btn btn-danger">댓글작성</button>
      </div>
      <div class="modal-footer">
      <div class="comment">
      </div>
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div> <!-- 모달 콘텐츠 -->
  </div> <!-- 모달 다이얼로그 -->
</div> <!-- 모달 전체 윈도우 -->

<!-- write modal -->
  <form action = "upload.jsp" method = "post" enctype = "multipart/form-data">
  <div class ="top_line">
  <h1>게시글 작성</h1>
  <div class="modal-dialog modal-fullsize">
    <div class="modal-content">
      <div class="modal_write_header">
        <textarea rows = "1" name = _title class="form-control" placeholder=제목></textarea>
      </div>
      <div class="modal-body">
      <textarea  rows="10" name = "_info" class="form-control" placeholder="간단한 코멘트를 적어주세요(200자 이내)"></textarea>
      </div>
    <details>
      <summary class ="select_address">지도 설정</summary>
      &nbsp;&nbsp;<span class ="glyphicon glyphicon-road"></span><input type="text" name="_api" size= "80"placeholder="장소명을 입력해주세요 (예:인천대공원, 인하대 서브웨이 등)">
    </details>
	<details>
	  <summary class="select_hash">해쉬태그 선택</summary>
      <div class="modal-hash-select">
  	<div class="form-row align-items-center">
    <div class="col-auto my-1">
      <label class="mr-sm-2" for="inlineFormCustomSelect">분위기1</label>
      <select name = "_hash1" class="custom-select mr-sm-2" id="inlineFormCustomSelect">
        <option value="선택안함" selected>선택안함</option>
        <option value="기분좋은">기분좋은</option>
        <option value="따뜻한">따뜻한</option>
        <option value="감성적인">감성적인</option>
        <option value="자연적인">자연적인</option>
        <option value="차가운">차가운</option>      
      </select>
      <label class="mr-sm-2" for="inlineFormCustomSelect">분위기2</label>
      <select name = "_hash2" class="custom-select mr-sm-2" id="inlineFormCustomSelect">
        <option value="선택안함" selected>선택안함</option>
        <option value="도시적인">도시적인</option>        
        <option value="시골">시골</option>        
        <option value="이국적인">이국적인</option>        
        <option value="세련된">세련된</option>        
        <option value="낯설은">낯설은</option>        
      </select>
      <label class="mr-sm-2" for="inlineFormCustomSelect">날씨</label>
      <select name = "_hash3" class="custom-select mr-sm-2" id="inlineFormCustomSelect">
        <option value="선택안함" selected>선택안함</option>
        <option value="봄">봄</option>
        <option value="여름">여름</option>
        <option value="가을">가을</option>
        <option value="겨울">겨울</option>       
        <option value="언제나 좋은">언제나 좋은</option>       
      </select>
      <label class="mr-sm-2" for="inlineFormCustomSelect">사람</label>
      <select name = "_hash4" class="custom-select mr-sm-2" id="inlineFormCustomSelect">
        <option value="선택안함" selected>선택안함</option>
        <option value="혼자서">혼자서</option>
        <option value="연인과 함께">연인과 함께</option>
        <option value="가족과 함께">가족과 함께</option>
        <option value="친구끼리">친구끼리</option>       
        <option value="단체로">단체로</option>       
      </select>
      </div>

      </details>
	<details>
	  <summary class="upload_text">이미지 업로드(첫 번째 이미지는 대표 이미지입니다.)</summary>
      <div class="modal-image-upload">
      <table cellpadding = "0" cellspacing="0" width="548">
      <tr><td width="1000" algin="left">
      <input type="file" class ="form-control" name="_image1" value="">
      </td></tr>
      <tr><td width="1000" algin="left">
      <input type="file" class ="form-control" name="_image2" value="" >
      </td></tr>
      <tr><td width="1000" algin="left">
      <input type="file" class ="form-control" name="_image3" value="" >
      </td></tr>
      <tr><td width="1000" algin="left">
      <input type="file" class ="form-control" name="_image4" value="" >
      </td></tr>
      <tr><td width="1000" algin="left">
      <input type="file" class ="form-control" name="_image5" value="" >
      </td></tr>                  
      </table>
      </div>
      </details>
      <br>
      <div class="modal-footer">
        
        <button type="submit" class="btn btn-primary">작성하기</button></form>
        <a href="travel.jsp"><button type="button" class="btn btn-default">닫기</button></a>
      
    </div> <!-- 모달 콘텐츠 -->
    <br>
     <div class = "result">

		</div>
  </div> <!-- 모달 다이얼로그 --></div></div>


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