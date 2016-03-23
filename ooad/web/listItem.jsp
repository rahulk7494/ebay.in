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
	<link href="fa/css/font-awesome.min.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">
	<script src="js/jquery-2.1.1.min.js"></script>
	<script type="text/javascript">
	
		$(function(){
		    $("#header").load("header"); 
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
				    					<td>
				    						<strong><%=item.getItemId() %></strong></td>
				    				</tr>
									<tr>
										<td>Name</td>
										<td><strong><a href="item.jsp?itemId=<%=item.getItemId() %>"><%=item.getItemName() %></a></strong></td>
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