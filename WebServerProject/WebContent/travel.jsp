<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%> <%@ page import = "java.sql.*" %> <%@ page import = "java.*" %>
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
    .thumbnail{width:250px; height:350px;position: relative;}
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
/*게시판 사이즈*/
.modal-dialog.modal-fullsize{ width: 1000px; height: 1000px; margin: 0;}
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


    .information{background-color:#2E2E3F; padding-bottom:15px}
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
.write_comment{padding: 10px; text-align: left; margin-left: 10px}
.allhash{font-weight: bold; font-size:25px; color:#706959;}
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
        

    @media (max-width: 360px) {
      .icons { padding: 20px; margin: 10px 0 10px 20px; }
    }      
</style>
</head>

<body>
 <%
 int top_count; int[] top = new int[5]; int allcount = 0;
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/testdb_a","root","1234");
	Statement stmt = conn.createStatement();
	Statement stmt3 = conn.createStatement();
	Statement stmt4 = conn.createStatement();
	Statement stmt5 = conn.createStatement();
	Statement stmt6 = conn.createStatement();
	Statement stmt7 = conn.createStatement();
	Statement stmt8 = conn.createStatement();
	
	ResultSet rs2 = stmt.executeQuery("select count(code) from travel");
	while(rs2.next()){
		allcount = rs2.getInt(1);
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
				       <%ResultSet rs = stmt.executeQuery("select login from users where id = '"+session.getAttribute("_id")+"' ");
				       if(rs.next()){ 
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
     <!-- 헤더 -->

     <div id="travel">
         <div class="container_portfolio" >
            <h2 class="sans">사용자 여행지 TOP5</h2>
              <div id="carousel-generic" class="carousel2 slide">
              <div class="carousel-inner">
                <div class="item active">
                   <div class="row"> <!-- 슬라이드 one --> 
                   		<div class="col-xs-1 col-md-1"><p></div>
        <%
		ResultSet rs4 = stmt3.executeQuery("select distinct code from travel where love limit 5");    
     	for(int i = 0; i<5; i++){
     		if(rs4.next()){
     			int topcode = rs4.getInt(1);	
        			ResultSet rs5 = stmt4.executeQuery("select name,hash1,hash2,hash3,hash4 from travel where code="+topcode+"");
        			if(rs5.next()){
        				String title = rs5.getString(1);String hash1 = rs5.getString(2);
        				String hash2 = rs5.getString(3);String hash3 = rs5.getString(4);
        				String hash4 = rs5.getString(5);
     					
        				ResultSet rs6 = stmt5.executeQuery("select image1 from imageaddr where imagecode="+topcode+" ");
        				if(rs6.next()){
        					String image1 = rs6.getString(1);
        					
        				
        			%>
                        <div class="col-xs-2 col-md-2">
                         <div class="thumbnail">
                            <a href="travelboard.jsp?code=<%=topcode %>" data-backdrop="static" data-keyboard="false">
                            <img src="./imgs/Travel/<%=image1 %>" alt="..."></a>
                            <div class="caption">
                              <h4><b><%=title %></b></h4>
                              <p>#<%=hash1 %> #<%=hash2%> #<%=hash3%> #<%=hash4%></p>
                            </div>
                           </div></div><%}}}} %>
                           </div></div></div></div><hr>
            <h2 class="sans">추운 겨울 가볼만한 곳</h2>
              <div id="carousel-generic" class="carousel2 slide">
              <div class="carousel-inner">
                <div class="item active">
                   <div class="row"> <!-- 슬라이드 one --> 
                   		<div class="col-xs-1 col-md-1"><p></div>
                   		<%try{
                   		ResultSet w1 = stmt6.executeQuery("select distinct code from travel where hash3 = '겨울' limit 5");
                   		for(int i=0; i<5; i++){
                   			if(w1.next()){
                   				int w_code = w1.getInt(1);
                   				ResultSet w2 = stmt7.executeQuery("select name,hash1,hash2,hash3,hash4 from travel where code="+w_code+"");
                   				if(w2.next()){
                				String title = w2.getString(1);String hash1 = w2.getString(2);
                				String hash2 = w2.getString(3);String hash3 = w2.getString(4);
                				String hash4 = w2.getString(5);
                				
                				ResultSet w3 = stmt8.executeQuery("select image1 from imageaddr where imagecode="+w_code+" ");
                				if(w3.next()){
                					String image1 = w3.getString(1);
                   		
                   		%>
                        <div class="col-xs-2 col-md-2">
                         <div class="thumbnail">
                            <a  href="travelboard.jsp?code=<%=w_code %>">
                            <img src="./imgs/Travel/<%=image1 %>" alt="..."></a>
                            <div class="caption">
                              <h4><b><%=title %></b></h4>
                              <p>#<%=hash1 %>#<%=hash2%> #<%=hash3%> #<%=hash4%></p>
                            </div>
                          </div>
                        </div><%}}}}}catch(Exception e){
                        	e.printStackTrace();} %>
                           </div></div></div></div><hr>

                    
            <h2 class="sans">전체 게시글</h2>
              <div id="carousel-generic" class="carousel2 slide">
              <div class="carousel-inner">
                <div class="item active">
                   <div class="row"> <!-- 슬라이드 one --> 
                   		<div class="col-xs-1 col-md-1"><p></div>
               <%
                    String[] t_image = new String[allcount];
                    String[] t_title = new String[allcount];
                    String[] t_hash1 = new String[allcount];String[] t_hash2 = new String[allcount];
                    String[] t_hash3 = new String[allcount];String[] t_hash4 = new String[allcount];
               		ResultSet rs3;
					for(int i = 1; i<allcount; i++){
						  
						rs2 = stmt.executeQuery("select image1 from imageaddr where imagecode="+i+" ");
						if(rs2.next()){
							t_image[i] = rs2.getString(1);
							
						}
						rs3 = stmt.executeQuery("select name,hash1,hash2,hash3,hash4 from travel where code="+i+"");
						if(rs3.next()){
							t_title[i] = rs3.getString(1);
							t_hash1[i] = rs3.getString(2);t_hash2[i] = rs3.getString(3);t_hash3[i] = rs3.getString(4);
							t_hash4[i] = rs3.getString(5);
						}
							%>		
                        <div class="col-xs-2 col-md-2">
                         <div class="thumbnail">
                            <a href="travelboard.jsp?code=<%=i%>" data-backdrop="static" data-keyboard="false">
                            <img src="./imgs/Travel/<%=t_image[i] %>" alt="..."></a>
                            <div class="caption">
                              <h4><b><%=t_title[i]%></b></h4>
                              <p>#<%=t_hash1[i] %> #<%=t_hash2[i]%> #<%=t_hash3[i]%> #<%=t_hash4[i]%></p>
                            </div>
                           </div></div><%}%>
                           
                           </div></div></div></div><hr>
     

 
 
 <div class ="write" style="position: fixed; bottom:5px; right:5px;">
 <a href="travel_write.jsp"><span class="glyphicon glyphicon-pencil icons"> </span></a>
 </div>

     
     
      <div class = "information"><!-- 과제 설명 -->
      <br><p>This website is tesksite of <a href="https://cms.itc.ac.kr/site/inhatc/main.do"> InhaTC</a></p>
      	  <p>Any question, send mail to gook3427@naver.com or call 010-3798-4018 plz</p>
      </div>
  </div>
        <% }catch(Exception e){
	e.printStackTrace();}%>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="./js/bootstrap.min.js"></script>
        <script>
      $('.carousel').carousel()
    </script>
    <script>

    </script>
</body>
</html>