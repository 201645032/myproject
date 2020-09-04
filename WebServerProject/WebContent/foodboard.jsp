<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <%@ page import = "java.sql.*" %> <%@ page import = "java.*" %>
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
    .comment_read{padding-left : 10px; padding-bottom:10px; padding-top:-5px; margin-top:-5px; background:#E0F3FA;}
    .comment_read p{font-weight:bold; border-width:0px;}
    .comment_read input{border-width:0px; background:#E0F3FA;}
    
 nav {
		background: linear-gradient(to bottom, rgba(125,126,125,1) 0%,rgba(14,14,14,1) 76%);
     }
.nav a{
        font-size: 35px !important;
      }
.write3{padding:170px;}
.modal-dialog.modal-fullsize{ width: 1200px; height: 1000px; margin: 0;}
.container_portfolio{margin-top:-20px;wedth:100%; height:100%; background: linear-gradient(to bottom, rgba(254,187,187,1) 0%,rgba(254,144,144,1) 45%,rgba(255,92,92,1) 100%);}
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

    .information{background-color:#2E2E3F; padding-bottom:15px; margin-top:30px;}
	.information p{color :#000000; font-size :14px;text-align: center;}
	.information a{color :#01004F; font-size : 15px;}
	
	 /* 게시글 출력 이미지 사이즈*/
.item_image{width:600px; height:400px;  display: block; margin: 0px auto; }
/* 게시글 출력 제목 사이즈, 댓글 창 조절*/
.modal-title{font-size:30px; font-weight:bold;}
.comment h3{padding-left:30px;}
.write_comment{padding: 10px; text-align: left; margin-left: 10px}
.allhash{font-weight: bold; font-size:25px; color:#706959;}
/* 좋아요 버튼*/
.likebutton{font-size: 40px; margin-left:550px;
		 color: #FF001D;
         background-color: #FFFFFF;
         border-radius: 50%;
			}
.likecount{text-align:center; font-weight:bold;}

/*카카오 지도*/
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
.map_wrap{padding-left:200px;}
.bg_white{padding-left:200px;}
.blackline{color:#000000;}

</style>
</head>
<body>
<%try{
	request.setCharacterEncoding("utf-8");
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/testdb_a","root","1234");
Statement stmt = conn.createStatement();
Statement stmt3 = conn.createStatement();

String s_code = request.getParameter("code");
int code = Integer.parseInt(s_code);


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
          
<%try{
ResultSet rs5, rs6;
String name =""; String id="";
String api=""; String info=""; String hash1="";
String hash2=""; String hash3=""; String hash4="";
String img1=""; String img2=""; String img3=""; String img4=""; String img5="";
int a_code = 0;



	rs5 = stmt.executeQuery("select code,name,id,api,info,hash1,hash2,hash3,hash4 from food where code="+code+"");
	
	if(rs5.next()){
		a_code = rs5.getInt(1);
		name = rs5.getString(2);
		id = rs5.getString(3);
		api = rs5.getString(4);
		info = rs5.getString(5);
		hash1 = rs5.getString(6);
		hash2 = rs5.getString(7);
		hash3 = rs5.getString(8);
		hash4 = rs5.getString(9);
	}
	rs6 = stmt.executeQuery("select * from foodimageaddr where imagecode="+code+"");
	if(rs6.next()){
		img1 = rs6.getString(2);
		img2 = rs6.getString(3);
		img3 = rs6.getString(4);
		img4 = rs6.getString(5);
		img5 = rs6.getString(6);
		if(img2==null){img2="sample.jpg";};if(img3==null){img3="sample.jpg";};
		if(img4==null){img4="sample.jpg";};if(img5==null){img5="sample.jpg";};
	}

%></div></div>
<div class="container_portfolio">
  <div class ="write3">          
  <div class="modal-dialog modal-fullsize" >
 <div id="food_write_modal<%=code%>" class= "carousel slide">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel"><%=name %> </h4>
      </div>
      <div class="modal-body">
          <!-- 캐러셀 부분 시작 -->
    <div id="carousel-image3-generic" class="carousel slide">
      <!-- Indicators -->
       <ol class="carousel-indicators">
         <li data-target="#carousel-image-generic" data-slide-to="0" class="active"></li>
         <li data-target="#carousel-image-generic" data-slide-to="1"></li>
         <li data-target="#carousel-image-generic" data-slide-to="2"></li>
         <li data-target="#carousel-image-generic" data-slide-to="3"></li>
         <li data-target="#carousel-image-generic" data-slide-to="4"></li>        
       </ol>
     <!-- Carousel items -->
       <div class="carousel-inner">
          <div class="item active">
             <img class = "item_image" src="./imgs/Food/<%=img1 %>" alt="Frist slide">
          </div>
          <div class="item">
             <img class = "item_image" src="./imgs/Food/<%=img2 %>" alt="Second slide">        
          </div>
          <div class="item">
             <img class = "item_image" src="./imgs/Food/<%=img3 %>" alt="Third slide">              
          </div>                     
          <div class="item">
             <img class = "item_image" src="./imgs/Food/<%=img4 %>" alt="Third slide">              
          </div>                     
          <div class="item">
             <img class = "item_image" src="./imgs/Food/<%=img5 %>" alt="Third slide">              
          </div>                     
       </div>
      <!-- Controls -->
        <a class="left carousel-control" href="#food_write_modal<%=code%>" data-slide="prev">        
          <img src="./imgs/left.png" class="control">
        </a>
        <a class="right carousel-control" href="#food_write_modal<%=code%>" data-slide="next">
          <img src="./imgs/right.png" class="control">
        </a>
      </div>
    <!--// 캐러셀 부분 끝  -->
    <br>
	<p><%=info %></p><br>
	<h4 class = "allhash">#<%=hash1 %> #<%=hash2 %> #<%=hash3 %> #<%=hash4 %></h4>    
      </div>

      
      <hr class="blackline">
      <div class="map_wrap">
    <div id="map" style="width:80%;height:80%;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white" style="width:20%;height:70%;">
        <div class="option">
            <div>
                <form onsubmit="searchPlaces(); return false;">
                    키워드 : <input type="text" value="<%=api %>" id="keyword" size="15"> 
                    <button type="submit">검색하기</button> 
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>
      
          <div class="like">
      <%
      ResultSet like = stmt3.executeQuery("select love from food where code = "+code+"");
      int likecount = 0;
      if(like.next()){
    	  likecount = like.getInt(1);
      }
      like.close(); stmt3.close();
      %>
      <a href = "food_love.jsp?code=<%=code %>"><button class = "glyphicon glyphicon-heart likebutton"></button></a>
      <p class = "likecount"><%=likecount %></p>
      </div>  
      
      <hr>
      <div class="comment">
      <h3>댓글</h3>
      <form action = "uploadfoodcomment.jsp?code=<%=code %>" method ="post" accept-charset="utf-8">
      <input class = "write_comment" type="text" size="120" name = "_comment" placeholder="댓글을 적어주세요"></input>
      <input type="submit" class ="btn btn-danger" value="댓글작성"></input></form>
      </div><br>
      <div class = comment_read>
      <%try{
      ResultSet rs7, rs8;
      rs7 = stmt.executeQuery("select max(commentcode) from foodcomments where code = "+code+"");
      if(rs7.next()){
    	  int c_count = rs7.getInt(1);
    	  for(int i = 1; i<=c_count; i++){
    		  rs8 = stmt.executeQuery("select id,commentInfo from foodcomments where code="+code+" and commentcode="+i+"");
    		  if(rs8.next()){
    			String userid = rs8.getString(1);  
    		    String comment = rs8.getString(2);
    		  %>
    		  <br><div class = comment_read>
    		  <p>작성자:<%=userid %></p>
    		  <input type="text" size = "50" value ="<%=comment %>" style="border:none" readonly /> </div>
    		  
    	  <% }}
      }}catch(Exception e){
    		e.printStackTrace();}
      %></div>
      <div class="modal-footer">
      <%ResultSet rs8 = stmt.executeQuery("select id from food where code = "+code+"");
      if(rs8.next()){
    	  String w_id = rs8.getString(1);
    	  if(w_id.equals(session.getAttribute("_id"))){
    		  %>
    		  <a href="food_mod_write.jsp?code=<%=code %>"><button type="button" class="btn btn-primary">수정</button></a>
    		  <a href="food_remove_write.jsp?code=<%=code %>"><button type="button" class="btn btn-primary">삭제</button></a>
    		  
    	  <% }else%>
    	  <a href="food.jsp"><button type="button" class="btn btn-primary">닫기</button></a>
      <% }%>
      </div>
    </div> <!-- 모달 콘텐츠 -->
  </div> <!-- 모달 다이얼로그 -->
</div> </div><!-- 모달 전체 윈도우 -->
      <div class = "information"><!-- 과제 설명 --><br><br><br><br>
      <br><p>This website is tesksite of <a href="https://cms.itc.ac.kr/site/inhatc/main.do"> InhaTC</a></p>
      	  <p>Any question, send mail to gook3427@naver.com or call 010-3798-4018 plz 
      </div>
  </div>

<%}catch(Exception e){
	e.printStackTrace();} %>        
          
<% }catch(Exception e){
	e.printStackTrace();}%>
	
</body>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="./js/bootstrap.min.js"></script>
    
    
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=efbaa195453fb217e3201923181e0d90&libraries=services"></script>
<script>
// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
</script>
</html>