<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scaling=1.0">
	<title>Add Item</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">
</head>
<body>

		<nav class="navbar navbar-inverse navbar-static-top">
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
      				<a class="navbar-brand" href="index">eBay.in</a>
    			</div>

			    <!-- Collect the nav links, forms, and other content for toggling -->
			    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			      	<ul class="nav navbar-nav">
			        	<li><a href="register.html">Register</a></li>
				        <li class="dropdown">
				      		<a href="#" class="dropdown-toggle" data-toggle="dropdown">Shop By Category <b class="caret"></b></a>
							
						</ul>
						<ul class="nav navbar-nav navbar-right">
       						<li class="dropdown">
					      		<a href="#" class="dropdown-toggle active" data-toggle="dropdown">Item Management <b class="caret"></b></a>
								<ul class="dropdown-menu">
									<li><a href="#" class="active">Add Item</a></li>
									<li><a href="deleteItem.jsp">Delete Item</a></li>
								</ul>
							</li>
						</ul>
    			</div><!-- /.navbar-collapse -->
  			</div><!-- /.container -->
		</nav>

	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<div class="panel panel-primary">
					<div class="panel-heading" style="text-align: center;">
						Add Item
					</div>
				<s:form name="itemForm" action="addItem" method="post" namespace="/" enctype="multipart/form-data" class="form-horizontal">
  					<div class="panel-body">
						<div class="form-group">
						    <label for="name" class="col-sm-3 control-label">Seller Id</label>
					    	<div class="col-sm-9">
						    	<input type="text" class="form-control" id="sellerId" name="sellerId" placeholder="Seller ID" onkeyup="verifySeller()">
						    	<span id="err"> </span>
						    </div>
					  	</div>
						<div class="form-group">
						    <label for="name" class="col-sm-3 control-label">Category Name</label>
					    	<div class="col-sm-9">
						    	<select class="form-control" id="category" name="category" onchange="getSubCategory()">
									<s:iterator>
										<option><s:property value="categoryName"/></option>
									</s:iterator>
								</select>
						    </div>
					  	</div>
						<div class="form-group">
						    <label for="name" class="col-sm-3 control-label">Sub-Category Name</label>
					    	<div id="subCategory" class="col-sm-9">
					    		<select class="form-control">
									<option>None</option>
								</select>
						    </div>
					  	</div>
					  	<div class="form-group">
   							<label for="id" class="col-sm-3 control-label">Item Id</label>
   							<div class="col-sm-9">
     								<div class="input-group">
									  	<span class="input-group-addon" id="addon1">SID</span>
									  	<span class="input-group-addon" id="addon2">CatId</span>
									  	<span class="input-group-addon" id="addon3">SubCatID</span>
									  	<input type="text" class="form-control" name="itemId" placeholder="Item ID">
									</div>
	    					</div>
						</div>
					  	<div class="form-group">
						    <label for="name" class="col-sm-3 control-label">Item Name</label>
					    	<div class="col-sm-9">
						    	<input type="text" class="form-control" name="itemName" placeholder="Item Name">
						    </div>
					  	</div>
					  	<div class="form-group">
						    <label for="address" class="col-sm-3 control-label">Description</label>
					    	<div class="col-sm-9">
						          <textarea rows="2" style="width: 100%;" name="itemDescription"></textarea>
						    </div>
						</div>
						<div class="form-group">
						    <label for="name" class="col-sm-3 control-label">Picture</label>
					    	<div class="col-sm-9">
						    	<input type="file" name="itemPicture">
						    </div>
					  	</div>
						<div class="form-group">
						    <label for="name" class="col-sm-3 control-label">Price</label>
					    	<div class="col-sm-9">
						    	<input type="text" class="form-control" name="itemPrice" />
						    </div>
					  	</div>
					  	<div class="form-group">
					  		<label for="name" class="col-sm-3 control-label">Advertising Item</label>
					    	<div class="col-sm-9">
						    	<div class="radio">
						  		 	<label>
								    	<input type="radio" name="optionsRadios" id="optionsRadios2" value="Yes"> Yes
								  	</label>
								  	&emsp;
							  	 	<label>
								    	<input type="radio" name="optionsRadios" id="optionsRadios2" value="No"> No
								  	</label>
							  	</div>
						    </div>
					  	</div>
					</div>
					<div class="panel-footer">
						<div class="row">
							<div class="col-md-12">
								<div class="pull-right">
								    <button type="submit" class="btn btn-success">Submit</button>
								</div>
							</div>
						</div>
					</div>
				</s:form>
				</div>
			</div>
		</div>
	</div>
	<script src="js/jquery-2.1.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

	<script>
		
		
	</script>

	<!-- Fetch the data from db onchange  -->
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
			        document.getElementById(result).innerHTML=xmlhttp.responseText;
			    }
		  	}
			xmlhttp.open("GET",urls,true);
			xmlhttp.send();
		}
		
		function verifySeller()
		{
			var key = document.getElementById("sellerId").value;
			var urls = "ajax/verifySeller.jsp?sellerId=" + key;
			
			ajax(urls, "err");
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