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
	<link href="css/style.css" rel="stylesheet">
	<link href="owl-carousel/owl.carousel.css" rel="stylesheet">
 	<link href="owl-carousel/owl.theme.css" rel="stylesheet">
	<link href="owl-carousel/owl.transitions.css" rel="stylesheet">
 	<script src="js/jquery-2.1.1.min.js"></script>
	<script src="owl-carousel/owl.carousel.min.js"></script>
	
	<style type="text/css">
	    #owl-demo .item{
	      margin: 3px;
	    }

	    #owl-demo .item img{
	      display: block;
	      width: 100%;
	      height: auto;
	    }
	</style>

	<script type="text/javascript">
	    $(document).ready(function() {
	     
    		var owl = $("#owl-demo");
	    	
	      	owl.owlCarousel({
	     
	          autoPlay: 3000, //Set AutoPlay to 3 seconds
	     
	          /* items : 3,
	          itemsDesktop : [1199,3],
	          itemsDesktopSmall : [979,3] */
	      
		      items : 3, //10 items above 1000px browser width
		      itemsDesktop : [1000,3], //5 items between 1000px and 901px
		      itemsDesktopSmall : [900,3], // betweem 900px and 601px
		      itemsTablet: [600,2], //2 items between 600 and 0
		      itemsMobile : false, // itemsMobile disabled - inherit from itemsTablet option
		      
		      navigation:true,
		      navigationText: [
		        "<i class='icon-chevron-left icon-white'>Previous</i>",
		        "<i class='icon-chevron-right icon-white'>Next</i>"
		        ],
		 
	      });
	     
	      $(".next").click(function(){
	    	    owl.trigger('owl.next');
    	  })
    	  
    	  $(".prev").click(function(){
    	    	owl.trigger('owl.prev');
    	  })
	    });
	</script>
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
      				<a class="navbar-brand active" href="index1">RApS.in</a>
      				<!--  <a class="navbar-brand" href="#">
                <img src="http://placehold.it/150x50&text=Logo" alt="">
            </a> -->
    			</div>

			    <!-- Collect the nav links, forms, and other content for toggling -->
			    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		      		<ul class="nav navbar-nav">
						<li><a href="registerPage1">Register</a></li>
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
								<li><a href="deleteItemPage">Delete Item</a></li>
							</ul>
						</li>
						<li><a href="login.html">Login</a></li>
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
<%
	try {
				   
		DBConnection dbConnection = new DBConnection();
		PreparedStatement ps = dbConnection.connect().prepareStatement("SELECT * FROM item_advertisement");
		ResultSet rs = ps.executeQuery();
%>

<div class="row">
	<div class="col-md-2">
	
	</div>
    <div class="col-md-8">
		<div id="owl-demo" class="owl-carousal">
<%		while(rs.next()) {
%>
	      	<div class="item">
				<div class="thumbnail">
		 		 	<img src="showPicture.jsp?image=<%=rs.getString(4) %>" class="img-responsive">
      				<div class="caption">
						<table class="table" style="border-width : 0px; border-top-style: none;">
	    				<tr>
	    					<td>ID</td>
	    					<td><strong><%=rs.getString(1) %></strong></td>
	    				</tr>
						<tr>
							<td>NAME</td>
							<td><strong><%=rs.getString(2) %></strong></td>
						</tr>
						<tr>
							<td>Price</td>
							<td><strong>$ <%=rs.getDouble(3) %></strong></td>
						</tr>
						<tr class="success">
							<td colspan="2" class="text-right"><a href="#" data-toggle="modal" data-target="#myModal" class="btn btn-primary" role="button">Buy Now</a></td>
	    				</table>
      				</div>
				</div>
		 	</div>
<%		}
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
		</div>
	</div>
    <div class="col-md-2">
	
	</div>
    
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
					<li><a href="home.jsp">Home</a></li>
					<li><a href="" data-toggle="modal" data-target="#myModal" >Contact</a></li>
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
	<script src="js/bootstrap.min.js"></script>

</body>
</html>
