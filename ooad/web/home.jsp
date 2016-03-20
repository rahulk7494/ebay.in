<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dao.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="s" uri="/struts-tags" %>    
    
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scaling=1.0">
	<title>raps.in</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="fa/css/font-awesome.min.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">
	<script src="js/jquery-2.1.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	
	<style type="text/css">
	
		.header {
		    font-size: 12px;
		    padding-top: 5px;
		}
		
		.thumbnail {
		    width: 260px;
		    height: 300px;
		    overflow: hidden; /* contain images within thumbnail boundaries */
		    border: 0; /* removes Bootstrap's default border */
		    box-shadow: 0 12px 12px -10px #c4c4c4;
		    -webkit-box-shadow: 0 17px 22px -20px #c4c4c4;
		    -moz-box-shadow: 0 12px 12px -10px #c4c4c4;
		}
		.thumbnail img { width:100%; height:auto; } /* to keep proportions */
		.thumbnails p { text-align: center; padding: 10px; } /* captions can be styled with an inline element */
		
	</style>
	
	<script type="text/javascript">
	
		$(function(){
		    $("#header").load("header"); 
		    $("#itemCarousel").load("itemCarousel.jsp"); 
	    });	
		
		$(document).on('mouseenter', '[data-toggle="tab"]', function () {
		  	$(this).tab('show');
		});
		
	</script>
</head>
<body>

	<div id="header">
	</div>
	<nav class="nav navbar-default" style="border-bottom: 1px solid #CBCCCA;">
		<div class="container header">
			<ul class="navbar-left header-nav" style="margin-bottom: 5px;">
				<li><a href="#">Sign in</a></li>
				<li><a href="#">Register</a></li>
				<li><a href="#">Deals </a></li>
				<li><a href="#" data-toggle="modal" data-target="#myModal">Sell </a></li>
				<li><a href="#">Track My Order</a></li>
			</ul>
			<ul class="navbar-right header-nav" style="margin-bottom: 5px;">
				<li><a href="#" data-toggle="modal" data-target="#myModal">My eBay </a></li>
				<li><a href="#" data-toggle="modal" data-target="#myModal"> My PaisaPay </a></li>
				<li><a href="#"><i class="fa fa-bell"></i> </a></li>
				<li><a href="#"><i class="fa fa-search"></i></a></li>
				<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
			</ul>
		</div>
	</nav>
	

<div class="row">
	<div class="col-md-1">
	</div>
    <div class="col-md-10">
		<h3 class="text-center">Advertisements</h3>
		<div class="row-fluid" id="itemCarousel">
		</div>
	</div>	
	</div>
    <div class="col-md-1">
	
	</div>

<footer class="site-footer">
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<h2>Contact Address</h2>
				<address>
				    <b>RApS</b><br/>
					#26/c, IIIT Bangalore,Electronic City	<br>
					Bangalore,<br>
					India.
				</address>
			</div>
		</div>
		<div class="bottom-footer">
			<div class="col-md-5">
				<p align="left"><a href="acknowledgement.jsp">Acknowledgement and References</a></p>
			</div>
			<div class="col-md-7">
				<ul class="footer-nav">
					<li><a href="index1">Home</a></li>
					<li><a href="#" data-toggle="modal" data-target="#myModal" >Contact</a></li>
					<!-- <li><a href="#">Blog</a></li>
					<li><a href="#">Link</a></li> -->
				</ul>
			</div>
		</div>
	</div>
</footer>

	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<p>Site Under Construction..!!</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
