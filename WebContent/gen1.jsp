<%@page import="com.project.*" %>
<%@page import="java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<title>Colored  an Admin Panel Category Flat Bootstrap Responsive Website Template | Inputs :: w3layouts</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Colored Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- bootstrap-css -->
<link rel="stylesheet" href="css/bootstrap.css">
<!-- //bootstrap-css -->
<!-- Custom CSS -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<!-- font CSS -->
<link href='//fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
<!-- font-awesome icons -->
<link rel="stylesheet" href="css/font.css" type="text/css"/>
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
<script src="js/jquery2.0.3.min.js"></script>
<script src="js/modernizr.js"></script>
<script src="js/jquery.cookie.js"></script>
<script src="js/screenfull.js"></script>
		<script>
		$(function () {
			$('#supported').text('Supported/allowed: ' + !!screenfull.enabled);

			if (!screenfull.enabled) {
				return false;
			}

			

			$('#toggle').click(function () {
				screenfull.toggle($('#container')[0]);
			});	
		});
		</script>
		
</head>
<body class="dashboard-page">

	<nav class="main-menu">
		<ul>
			<li>
				<a href="menu.html">
					<i class="fa fa-home nav_icon"></i>
					<span class="nav-text">
					Home
					</span>
				</a>
			</li>
			<li>
				<a href="add.html">
					<i class="fa fa-cogs" aria-hidden="true"></i>
					<span class="nav-text">
					Add Question
					</span>
				</a>
			</li>
			<li>
				<a href="view.jsp">
					<i class="fa fa-cogs" aria-hidden="true"></i>
					<span class="nav-text">
					View Question
					</span>
				</a>
			</li>
			<li class="has-subnav">
				<a href="javascript:;">
				<i class="fa fa-check-square-o nav_icon"></i>
				<span class="nav-text">
					Generate Question Paper
				</span>
				<i class="icon-angle-right"></i><i class="icon-angle-down"></i>
				</a>
				<ul>
					<li>
					<a class="subnav-text" href="gen1.jsp">
					30 Marks
					</a>
					</li>
					<li>
					<a class="subnav-text" href="gen2.jsp">
					75 Marks
					</a>
					</li>
				</ul>
			</li>
						
			
			
		</ul>
		<ul class="logout">
			<li>
			<a href="login.html">
			<i class="icon-off nav-icon"></i>
			<span class="nav-text">
			Logout
			</span>
			</a>
			</li>
		</ul>
	</nav>
	<section class="wrapper scrollable">
		<nav class="user-menu">
			<a href="javascript:;" class="main-menu-access">
			<i class="icon-proton-logo"></i>
			<i class="icon-reorder"></i>
			</a>
		</nav>
		<section class="title-bar">
			<div class="logo">
				<h1><a href="index.html"><img src="images/logo.png" alt="" /></a></h1>
			</div>
			<div>
			<h1 style="color:#00bcd4;">Question Paper Generation</h1>
			</div>
			
			<div class="clearfix"> </div>
		</section>
		<div class="main-grid">
			<div class="agile-grids">	
				
				<div class="grids">
					
					
					
					<div class="panel panel-widget forms-panel">
						<div class="forms">
							<div class=" form-grids form-grids-right">
								<div class="widget-shadow " data-example-id="basic-forms"> 
									<div class="form-title">
										
									</div>
									<div class="form-body">
										<form class="form-horizontal" action="next.jsp"> 
											<div class="form-group"> 
												<label for="inputEmail3" class="col-sm-2 control-label">Subject</label> 
												<div class="col-sm-9"> 
													<input type="text" name="subject" class="form-control" id="inputEmail3" placeholder="Data Structure, DBMS , Operating System"> 
												</div> 
											</div>
											<div class="form-group"> 
												<label for="inputEmail3" class="col-sm-2 control-label">Chapter no.</label> 
												<div class="col-sm-9"> 
													<input type="text" name="chap1" class="form-control" id="inputEmail3" placeholder="Enter no of chapter 1"> 
												</div> 
											</div>
											<div class="form-group"> 
												<label for="inputEmail3" class="col-sm-2 control-label">Chapter no.</label> 
												<div class="col-sm-9"> 
													<input type="text" name="chap2" class="form-control" id="inputEmail3" placeholder="Enter no of chapter 2"> 
												</div> 
											</div>
											<div class="form-group"> 
												<label for="inputEmail3" class="col-sm-2 control-label">Date</label> 
												<div class="col-sm-9"> 
													<input type="date" name="date" class="form-control" id="inputEmail3" placeholder="date"> 
												</div> 
											</div>  
											<div class="form-group"> 
												<label for="inputEmail3" class="col-sm-2 control-label">Test no.</label> 
												<div class="col-sm-9"> 
													<input type="text" name="num" class="form-control" id="inputEmail3" placeholder="I,II"> 
												</div> 
											</div>  
											<div class="form-group"> 
												<label for="inputEmail3" class="col-sm-2 control-label">Time</label> 
												<div class="col-sm-9"> 
													<input type="text" name="time" class="form-control" id="inputEmail3" placeholder="ex.10am to 1am"> 
												</div> 
											</div>  
									
			                                   <div class="col-sm-offset-2"> 
												<button type="submit" class="btn btn-default w3ls-button">Generate</a></button> 
											</div> 
										</form> 
									</div>
								</div>
							</div>
						</div>	
					</div>
			</div>
		</div>
		
		
		
		
		<!-- footer -->
		
		<!-- //footer -->
	</section>
	<style>
        body{
         background-image:url('pic.jpg');
         background-repeat:no-repeat;
          background-attachment:fixed;
           background-size:100%  100%
         }
       
        </style>
	<script src="js/bootstrap.js"></script>
	<script src="js/proton.js"></script>

</body>
</html>