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
			for(Item item : items) {
	%>
						<div class="col-sm-6 col-md-4">
							<div class="thumbnail">
								<img alt="" src="images/Desert.jpg" class="img-responsive">
								<div class="caption">
									<input type="hidden" name="productId" value="<%=item.getItemId() %>"> 
									<h3 style="color: purple;"><%=item.getItemName() %></h3>
									<div class="thumbnail-height">
										<p class="text-justify"><%=item.getItemDescription() %></p>
									</div>
									<div class="row">
										<div class="col-sm-6">
											<h5><%=item.getSeller().getSellerName() %></h5>
										</div>
										<div class="col-sm-6">
											<h4 class="pull-right"><strong>$ <%=item.getItemPrice() %>&emsp;</strong></h4>
										</div>
									</div>
									<hr>
									<div class="row">
										<div class="col-md-6">
											<button type="submit" class="btn btn-primary btn-block" >Add To Cart</button>
										</div>
										<div class="col-md-6">
											<button type="button" class="btn btn-default btn-block">Save For Later</button>
										</div>
									</div>
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
</body>
</html>