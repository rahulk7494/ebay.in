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
    			<div class="navbar-header pull-right col-md-7">
     				
      		    <a class="navbar-brand active" href="index1"><img src="images/logo.png" alt="Your Logo"></a>
    			</div>
    			</div>

			   
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
								<img alt="" src="showPicture.jsp?image=<%=item.getItemPictureString() %>" class="img-responsive">
								<!-- <img alt="" src="images/Desert.jpg" class="img-responsive"> -->
								<div class="caption">
									<input type="hidden" name="productId" value="<%=item.getItemId() %>"> 
									<h3 style="color: purple;"><%=item.getItemName() %></h3>
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