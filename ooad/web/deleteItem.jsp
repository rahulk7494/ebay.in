<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scaling=1.0">
	<title>Delete Item</title>
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
      				<a class="navbar-brand active" href="index1">eBay.in</a>
    			</div>

			    <!-- Collect the nav links, forms, and other content for toggling -->
			    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		      		<ul class="nav navbar-nav">
						<li><a href="register.jsp">Register</a></li>
				    	<%-- <li>
				    		<a data-toggle="tab" href="#category">Shop By Category</a> 
			    		</li>
			    		<li>
		    				<a data-toggle="tab" href="#empty">
		    					<span class="glyphicon glyphicon-chevron-up" aria-hidden="true"></span>
	    					</a>
			    		</li> --%>
				   	</ul>
				   	<ul class="nav navbar-nav navbar-right">
				        <li class="dropdown">
				      		<a href="#" class="dropdown-toggle active" data-toggle="dropdown">Item Management <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="addItemPage">Add Item</a></li>
								<li><a href="#">Delete Item</a></li>
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

	<nav>
		<ul class="pager pull-left" style="margin: 0px; padding-left: 20px;">
			<li><a href="index1">Back</a></li>
			<!--  <li><a href="#">Next</a></li> -->
		</ul>
	</nav>

	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<div class="panel panel-primary">
					<div class="panel-heading" style="text-align: center;">
						Delete Item
					</div>
				<form action="deleteItem" method="post" class="form-horizontal">
  					<div class="panel-body">
						<div class="form-group">
   							<label for="id" class="col-sm-2 control-label">Item Id</label>
   							<div class="col-sm-10">
   								<input type="text" class="form-control" id="itemId" name="itemId" placeholder="Item ID" onkeyup="verifyItem()">
   							</div>
 							</div>
					  	<div class="form-group">
						    <label for="name" class="col-sm-2 control-label">Item Name</label>
					    	<div class="col-sm-10">
						    	<input type="text" id="itemName" class="form-control" name="itemName" disabled="disabled">
						    </div>
					  	</div>
				  	</div>
					<div class="panel-footer">
					    <button type="submit" class="btn btn-success">Delete</button>
					</div>
				</form>
				</div>
			</div>
		</div>
	</div>
	<script src="js/jquery-2.1.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	
	<script type="text/javascript">
		
		function ajax(urls, result)
		{
			var xmlhttp;
			if (window.XMLHttpRequest)
	 	 	{
			  	xmlhttp=new XMLHttpRequest();
		  	}
			else
		  	{
			  	xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		  	}
			xmlhttp.onreadystatechange=function()
		  	{
				if (xmlhttp.readyState==4)
		    	{
					var response = xmlhttp.responseText; 
				 	if(response != "")
				 	{
				 		document.getElementById(result).disabled = false;
				 		document.getElementById(result).value = response;
				 	}
				 	else
			 	 		document.getElementById(result).disabled = true;
				}
		  	}
			xmlhttp.open("GET",urls,true);
			xmlhttp.send();
		}
		
		function verifyItem()
		{
			var key = document.getElementById("itemId").value;
			var urls = "ajax/verifyItem.jsp?itemId=" + key;
			
			ajax(urls, "itemName");
		}
	
		function getSubCategory()
		{
			var x = document.getElementById("category").selectedIndex;
		    var y = document.getElementById("category").options;
			var key = y[x].index + 1;
			var urls = "ajax/getSubCategories.jsp?categoryId=" + key
	
			ajax(urls, "subCategory");
		}
	</script>
</body>
</html>