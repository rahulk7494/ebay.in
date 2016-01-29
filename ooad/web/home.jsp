<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="s" uri="/struts-tags" %>    
    
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scaling=1.0">
	<title>ebay.in</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-inverse navbar-static-top" style="margin-bottom: 0px;">
		<div class="container">
   			<div class="navbar-header">
   				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" 
   						data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
			        <span class="sr-only">Toggle navigation</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
		      	</button>
   				<a class="navbar-brand active" href="#">eBay.in</a>
   			</div>
		    <!-- Collect the nav links, forms, and other content for toggling -->
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		      	<ul class="nav navbar-nav">
		        	<li><a href="register.html">Register</a></li>
			        <li class="dropdown">
			      		<a href="#" class="dropdown-toggle" data-toggle="dropdown">Shop By Category <b class="caret"></b></a>
						
					</li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
			        <li class="dropdowm">
			        	<a href="#" class="dropdown-toggle" data-toggle="dropdown">Item Management <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="addItemPage">Add Item</a></li>
							<li><a href="deleteItem.jsp">Delete Item</a></li>
						</ul>	
		        	</li>
		      	</ul>
   			</div><!-- /.navbar-collapse -->
		</div><!-- /.container -->
	</nav>

	<div class="container">
		<table class="table">
			<tbody>
				<tr>
				<s:iterator>
					<td>
						<s:if test="categoryId < 4">
						<h3><a href="#"><s:property value="categoryName"/></a></h3>
						<ul>
						  	<s:iterator value="subCategories">
							  	<li><s:property value="subCategoryName"/></li>
						  	</s:iterator>
					  	</ul>	
						</s:if>
				  	</td>
		  			<td>
						<s:if test="categoryId >= 4 && categoryId < 7">
						<h3><a href="#"><s:property value="categoryName"/></a></h3>
						<ul>
						  	<s:iterator value="subCategories">
							  	<li><s:property value="subCategoryName"/></li>
						  	</s:iterator>
					  	</ul>	
						</s:if>
				  	</td>
					<td>
						<s:if test="categoryId >= 7">
						<h3><a href="#"><s:property value="categoryName"/></a></h3>
						<ul>
						  	<s:iterator value="subCategories">
							  	<li><s:property value="subCategoryName"/></li>
						  	</s:iterator>
					  	</ul>	
						</s:if>
				  	</td>
				</s:iterator>
				</tr>
			</tbody>
		</table>
	</div>

	<footer class="site-footer">
		<div class="container">
			<div class="row">
				<div class="col-md-5">
					<h2>Contact Address</h2>
					<address>
						#999, Street of place,	<br>
						City of place,<br>
						Country.
					</address>
				</div>
			</div>
			<div class="bottom-footer">
				<div class="col-md-5">
					<p>Copyright Information</p>
				</div>
				<div class="col-md-7">
					<ul class="footer-nav">
						<li><a href="#">Home</a></li>
						<li><a href="#">Contact</a></li>
						<li><a href="#">Blog</a></li>
						<li><a href="#">Link</a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>
	<script src="js/jquery-2.1.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

</body>
</html>
