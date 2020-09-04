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
    <!-- nav bar �κ� -->
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
				       <!-- JSP�� �α��ο��ο� ���� �޴� ����� �ٲ���� -->
				       <%if(rs.next()){ 
				       String login = rs.getString("login");
				       
				       if(login.equals("1")){
				    	 %>  
        				<li ><a href="logout.jsp">�α׾ƿ�</a></li>
        				<li><a href="#">���ã��</a></li>
        				<li><a href="pw_check.jsp">��������</a></li>
				       <%}}
				       
				       else{
				       %>
        				<li ><a href="login.jsp">�α���</a></li>
        				<li><a href="register.jsp">ȸ������</a></li><%}%>
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
        
        <h4 class="modal-title" id="myModalLabel">�α��� </h4>
      </div>
      <div class="modal-body">
    <div class="input-group">
        <span class="input-group-addon"> <span class="glyphicon glyphicon-user"> </span> </span>
        <input type="text" class="form-control" placeholder="���̵�">
    </div> 
     <br>
    <div class="input-group">
        <span class="input-group-addon">  <span class="glyphicon glyphicon-lock"></span> </span>
        <input type="password" class="form-control" placeholder="�� ȣ">
    </div>
      
      </div>
      <div class="modal-footer">
      	<form action = "" method = "get">
        <button type="sumbit" class="btn btn-primary">�α���</button></from>
        <button type="button" class="btn btn-default" data-dismiss="modal">�ݱ�</button>
      </div>
    </div> <!-- ��� ������ -->
  </div> <!-- ��� ���̾�α� -->
</div> <!-- ��� ��ü ������ --> 
  

     </div>   
    <!-- // nav bar �κ� �� -->
    
     </div>   
       <div id="about"></div>
      <header class="content1">  <!-- about start-->
        <div class="container">
          <br><br><br><br><br>
          <h1><small>Traveler provide the best information about travel and food </small></h1><br>
          <p>Traveler�� ����ڵ��� �ְ��� ����, ���� ������ �Բ� �����ϴ� �÷����Դϴ�.</p>
        </div><!-- end .container -->
      </header>
      
      <div class="how_about">
             <!-- ���ڵ�� --><hr>
               <h2>  Why Traveler? </h2><hr>
               <br><br><h3><i>'�츮�� ���� ������ �ٳ�Դٰ� �������� ���� ���� ���踸�� ������ �ƴϴ�.'     </i>     (�迵�� ������_'����������' �߿���)</h3><br><br>
<p>�迵�� �۰��� ������ '������ ����'������ �ΰ��� ���� ������ �� ������ ������ ������ �ϼ��ȴٰ� ����մϴ�.<br>
ù ��°�� �츮�� ���� ���� ���� ������ '���� ����'�̰� �� ��°��' ��(ު)����' Ȥ�� 'Ż����'�̶�� �ϴ� �����Դϴ�.<br>
������  �������� ö���� '�ǿ��� �پ߸�'�� ������ ���� �ٸ� ����� ��������� ���� �ڽ��� ���� ������ ä��� �����Դϴ�.<br>
���� ��� �츮�� ����� �� ���Ŀ� ���� ����Ʈ���̳� TV�� ���� ���� ���α׷��� ��û�ϴ� ���Դϴ�.<br>
�ٸ� ����� ���� ������ ���� �� �������� ���� ȯ���� ���� �ǰ� ���߿� �װ��� ���ԵǸ� ���� ��������� ������ ���� ǳ���� ��������� �Ǵ� ������<br>
�̿Ͱ��� ���� �������迡 �������� ���������� ��� �� ������ ��� �ݺ��ٺ��� �ᱹ �ϳ��� ��������� �ϼ��ȴٰ� �۰��� ����մϴ�.<br><br></p><hr>
<br><br><h3><i>Traveler��  '��(ު)���� ' �� ������ ���� �÷����Դϴ�.</i></h3><br><br>
<br> <p>������ ��ǥ���� Ű������ '��ҿ� ����'�� ���� ������ ����ڵ��� ���Ӿ��� �����ϸ� ���ΰ� ������
'��������'�� �ǰ� �ᱹ ������ ��������� �Բ� �ϼ��ϰ� �˴ϴ�.<br>
 Traveler�� ���� ��õ������ �����ϰ� ������ ���� ������ Ȯ���Ͽ� ������ ��� ������� �Բ�
��������� �ϼ��ϴ� ������ �޲ٰ� �ֽ��ϴ�.<br>
�������� Traveler���� �ְ��� ���������� ���� ������ ������ �� �ֽ��ϴ�.</p><br><br><br><hr>
</div>
      <div class = "information"><!-- ���� ���� -->
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