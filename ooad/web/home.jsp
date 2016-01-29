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
		<nav class="navbar navbar-default navbar-static-top">
  			<div class="container">
    		<!-- Brand and toggle get grouped for better mobile display -->
    			<div class="navbar-header">
     				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" 
      						data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
				        <span class="sr-only">Toggle navigation</span>
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
			      	</button>
      				<a class="navbar-brand active" href="index">eBay.in</a>
    			</div>

			    <!-- Collect the nav links, forms, and other content for toggling -->
			    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		      		<ul class="nav navbar-nav">
						<li><a href="register.jsp">Register</a></li>
				    	<li>
				    		<a data-toggle="tab" href="#category">Shop By Category</a> 
			    		</li>
			    		<li>
		    				<a data-toggle="tab" href="#empty">
		    					<span class="glyphicon glyphicon-chevron-up" aria-hidden="true"></span>
	    					</a>
			    		</li>
				   	</ul>
				   	<ul class="nav navbar-nav navbar-right">
				        <li class="dropdown">
				      		<a href="#" class="dropdown-toggle active" data-toggle="dropdown">Item Management <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="addItemPage">Add Item</a></li>
								<li><a href="deleteItem.jsp">Delete Item</a></li>
							</ul>
						</li>					        
			      	</ul>
			  	  	<div class="tab-content">
				    	<div id="empty" class="tab-pane-fade">
				    	</div>
					    <div id="category" class="tab-pane fade">
					      	<table class="table">
								<tbody>
									<tr>
									<s:iterator>
										<s:if test="categoryId % 3 == 1">
										<td>
											<h4><s:property value="categoryName"/></h4>
											<ul>
											  	<s:iterator value="subCategories">
												  	<li style="list-style-type: none;">
												  		<a href="listItem.jsp?subCategoryId=<s:property value='subCategoryId'/>">
												  			<s:property value="subCategoryName"/>
											  			</a>
										  			</li>
											  	</s:iterator>
										  	</ul>	
									  	</td>
									  	</s:if>
									</s:iterator>
									</tr>
									<tr>	
					  				<s:iterator>
										<s:if test="categoryId % 3 == 2">
										<td>
											<h4><s:property value="categoryName"/></h4>
											<ul>
											  	<s:iterator value="subCategories">
												  	<li style="list-style-type: none;">
												  		<a href="listItem.jsp?subCategoryId=<s:property value='subCategoryId'/>">
												  			<s:property value="subCategoryName"/>
											  			</a>
										  			</li>
											  	</s:iterator>
										  	</ul>	
									  	</td>
										</s:if>
									</s:iterator>
									</tr>
									<tr>
									<s:iterator>
										<s:if test="categoryId % 3 == 0">
											<td>
											<h4><s:property value="categoryName"/></h4>
											<ul>
											  	<s:iterator value="subCategories">
												  	<li style="list-style-type: none;">
												  		<a href="listItem.jsp?subCategoryId=<s:property value='subCategoryId'/>">
												  			<s:property value="subCategoryName"/>
											  			</a>
										  			</li>
											  	</s:iterator>
										  	</ul>	
									  	</td>
										</s:if>
									</s:iterator>
									</tr>
								</tbody>
							</table>
					    </div>
				    </div>
			  	</div><!-- /.navbar-collapse -->
  			</div><!-- /.container -->
		</nav>

<div class="container">
		<div id="carousel" class="carousel slide" data-ride="carousel">
 	 	<!-- Indicators -->
	  	<ol class="carousel-indicators">
		    <li data-target="#carousel" data-slide-to="0" class="active"></li>
		    <li data-target="#carousel" data-slide-to="1"></li>
		    <li data-target="#carousel" data-slide-to="2"></li>
	  	    <li data-target="#carousel" data-slide-to="3"></li>
		    <li data-target="#carousel" data-slide-to="4"></li>
	  	</ol>
		
	  	<!-- Wrapper for slides -->
	  	<div class="carousel-inner" role="listbox">
	    	<div class="item active">
		      	<img src="images/876x402_RPD_LavaIrisV5_270116.jpg" alt="first">
		      	<div class="carousel-caption">
		        	<h3>Item Name</h3>&emsp;<h6>$299</h6>
		        	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
	     	 	</div>
		    </div>
		    <div class="item">
		      	<img src="images/876x402_Fragrance_161115.jpg" alt="second">
		      	<div class="carousel-caption">
		        	<h3>Item Name</h3>&emsp;<h6>$299</h6>
		        	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
	     	 	</div>
		    </div>
	  	    <div class="item">
		      	<img src="images/876x402_KitchenDining_161111.jpg" alt="third">
		      	<div class="carousel-caption">
		        	<h3>Item Name</h3>&emsp;<h6>$299</h6>
		        	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
	     	 	</div>
		    </div>
	  	    <div class="item">
		      	<img src="images/876x402_Television_161115.jpg" alt="fourth">
		      	<div class="carousel-caption">
		        	<h3>Item Name</h3>&emsp;<h6>$299</h6>
		        	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
	     	 	</div>
		    </div>
	  	    <div class="item">
		      	<img src="images/876x402_Laptops_161115.jpg" alt="fifth">
		      	<div class="carousel-caption">
		        	<h3>Item Name</h3>&emsp;<h6>$299</h6>
		        	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
	     	 	</div>
		    </div>
	  	</div>
		
		  <!-- Controls -->
		  <a class="left carousel-control" href="#carousel" role="button" data-slide="prev">
		    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="right carousel-control" href="#carousel" role="button" data-slide="next">
		    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
		</div>
	
</div>

	<script src="js/jquery-2.1.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

</body>
</html>
