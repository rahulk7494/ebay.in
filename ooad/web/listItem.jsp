<%@page import="model.Item"%>
<%@page import="java.util.ArrayList"%>
<%@page import="action.ItemAction"%>
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
	<script src="js/jquery-2.1.1.min.js"></script>
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
    			</div>

			    <!-- Collect the nav links, forms, and other content for toggling -->
			    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		      		<ul class="nav navbar-nav">
				    	<li><a href="register.jsp">Register</a></li>
<%-- 				    	<li>
				    		<a data-toggle="tab" href="#category">Shop By Category</a> 
			    		</li>
			    		<li>
		    				<a data-toggle="tab" href="#empty">
		    					<span class="glyphicon glyphicon-chevron-up" aria-hidden="true"></span>
	    					</a>
			    		</li>
 --%>				   	</ul>
				   	<ul class="nav navbar-nav navbar-right">
				        <li class="dropdown">
				      		<a href="#" class="dropdown-toggle active" data-toggle="dropdown">Item Management <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="addItemPage">Add Item</a></li>
								<li><a href="deleteItem.jsp">Delete Item</a></li>
								<li><a href="#" data-toggle="modal" data-target="#myModal">Add Category</a></li>
								<li><a href="#" data-toggle="modal" data-target="#myModal">Delete Category</a></li>
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
	
	<!-- Back Button -->

	<nav>
		<ul class="pager pull-left" style="margin: 0px; padding-left: 20px;">
			<li><a href="index1">Back</a></li>
			<!--  <li><a href="#">Next</a></li> -->
		</ul>
	</nav>


	<%
		int subCategoryId = Integer.parseInt(request.getParameter("subCategoryId"));
		
		ItemAction itemAction = new ItemAction();
		ArrayList<Item> items = itemAction.getItems(subCategoryId);
		
	%>
	<br>
	<br>
	<div class="container">
		<div class="row">
			<s:iterator>
					<form action="" method="post">
						
	<%
			int i = 0;
			for(Item item : items) {
				i ++;
	%>
						<div class="col-sm-6 col-md-4">
							<div class="thumbnail">
								<img alt="image<%=i %>" src="showPicture.jsp?image=<%=item.getItemPictureString() %>" class="img-responsive" width="500px;">
								<div class="caption">
								<table class="table" style="border-width : 0px; border-top-style: none;">
				    				<tr>
				    					<td>ID</td>
				    					<td><strong><%=item.getItemId() %></strong></td>
				    				</tr>
									<tr>
										<td>Name</td>
										<td><strong><%=item.getItemName() %></strong></td>
									</tr>
									<tr>
										<td>Desc</td>
										<td><strong><%=item.getItemDescription() %></strong></td>
									</tr>
									<tr>
										<td>Price</td>
										<td><strong>$ <%=item.getItemPrice() %></strong></td>
									</tr>
									<tr class="success">
										<td class="text-right">
											<a href="#" data-toggle="modal" data-target="#myModal" class="btn btn-success" role="button">Buy Now</a>
										</td>
										<td class="text-right">
											<a href="#" data-toggle="modal" data-target="#myModal" class="btn btn-default" role="button">Add to Cart</a>
										</td>
									</tr>
			    				</table>
			    				<%-- 
			    					<input type="hidden" name="productId" value=""> 
									<h3 style="color: purple;"></h3>
									<div class="thumbnail-height">
										<p class="text-justify"><%=item.getItemDescription() %></p>
									</div>
									<div class="row">
										<div class="col-sm-6">
											<h5></h5>
										</div>
										<div class="col-sm-6">
											<h4 class="pull-right"><strong>$ <%=item.getItemPrice() %>&emsp;</strong></h4>
										</div>
									</div>
									<hr>
									<div class="row">
										<div class="col-md-6">
											<button type="button" class="btn btn-primary btn-block"  data-toggle="modal" data-target="#myModal"  >Add To Cart</button>
										</div>
										<div class="col-md-6">
											<button type="button" class="btn btn-primary btn-block"  data-toggle="modal" data-target="#myModal"  >Buy Now</button>
										</div>
									</div> --%>
								</div>
							</div>
						</div>
						<div class="clearfix visible-md-block"></div>
	<%
			}
	%>				</form>
			</s:iterator>
		</div>
	</div>
	<div class="container"><!-- 
  <h2>Modal Example</h2>
  Trigger the modal with a button
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>
 -->
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
	<script>
function siteUnderConstructionFunction() {
    alert("Site is Under Construction..!");
}
</script>
<script src="js/bootstrap.min.js"></script>   


</body>
</html>