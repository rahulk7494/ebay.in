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
 	<script src="js/jquery-2.1.1.min.js"></script>
</head>
<body>

		<nav class="navbar navbar-inverse navbar-static-top">
  			<div class="container">
    		<!-- Brand and toggle get grouped for better mobile display -->
    			<div class="navbar-header">
     				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" 
      						data-target="#navbar-collapse-1" aria-expanded="false">
				        <span class="sr-only">Toggle navigation</span>
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
			      	</button>
      				<a class="navbar-brand active" href="index1">RApS.in</a>
      			</div>

			    <!-- Collect the nav links, forms, and other content for toggling -->
			    <div class="collapse navbar-collapse" id="navbar-collapse-1">
				   	<ul class="nav navbar-nav navbar-right">
				        <li><a href="index1">Logout</a></li>				        
			      	</ul>
			  	</div><!-- /.navbar-collapse -->
  			</div><!-- /.container -->
		</nav>

<div class="row">
	<div class="col-md-2" style="padding-left: 20px;">
		<ul class="nav nav-pills nav-stacked text-center">
			<li><a href="admin">List Categories</a></li>
	        <li><a href="listSubCategoryPage">List Sub-Categories</a></li>
	        <li><a href="addCategory.jsp">Add Category</a></li>
	        <li><a href="addSubCategoryPage">Add Sub-Category</a></li>
	        <li class="active"><a href="editCategoryPage">Edit Category</a></li>
	        <li><a href="editSubCategoryPage">Edit Sub-Category</a></li>
	   	    <li><a href="deleteCategoryPage">Remove Category</a></li>
	   	    <li><a href="deleteSubCategoryPage">Remove Sub-Category</a></li>
	   	</ul>
	</div>
    <div class="col-md-10">
		<div class="row">
			<div class="col-md-10">
				<div class="well text-center">
					<h4>Edit Category</h4>
				</div>
<%
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
%>

				<form class="form-horizontal" action="editCategory" method="post">
				
<%		if(categoryId != 0)
		{
			String categoryName = request.getParameter("categoryName");
%>
					<div class="form-group">
						<label class="col-sm-3 control-label">Category ID</label>
						<div class="col-sm-9">
							<input type="hidden" class="form-control" name="categoryId" value='<%=categoryId %>'>
							<input disabled="disabled" type="text" class="form-control" name="catId" value='<%=categoryId %>'>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">Category Name</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" disabled="disabled" name="oldCategoryName" value='<%=categoryName %>'>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">New Category Name</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="categoryName">
						</div>
					</div>
				
<%
		}
		else {
%>				
					<div class="form-group">
						<label for="categoryId" class="col-sm-3 control-label">Old Category Name</label>
						<div class="col-sm-9">
							<select class="form-control" name="categoryId">
								<option value='0'>None</option>
								<s:iterator>
									<option value='<s:property value="categoryId"/>'><s:property value="categoryName"/></option>
								</s:iterator>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="categoryName" class="col-sm-3 control-label">New Category Name</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" name="categoryName">
						</div>
					</div>
			
<%
		}
%>					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" id="submitButton" class="btn btn-primary">Save</button>
						</div>
					</div>
				</form>
			</div>
			<div class="col-md-2">
			</div>
			
		</div>
	</div>
</div>

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
			var urls = "ajax/verifySeller2.jsp?sellerId=" + key;
			
			ajax(urls, "err");
			
			document.getElementById("sId").innerHTML = key;
		}
	
		function verifyItem()
		{
			var key = document.getElementById("itemId").value;
			var urls = "ajax/verifyItem2.jsp?itemId=" + key;
			
			ajax(urls, "err1");
			
			/* document.getElementById("sId").innerHTML = key; */
		}
		
		function getSubCategory()
		{
		/*
			var x = document.getElementById("category").selectedIndex;
		    var y = document.getElementById("category").options;
			var key = y[x].index + 1;
		*/	
			var e = document.getElementById("category");
			var key = e.options[e.selectedIndex].value;
			
			var urls = "ajax/getSubCategories.jsp?categoryId=" + key
			
			ajax(urls, "getSubCategory");
			
			document.getElementById("catId").innerHTML = key;
		
			document.getElementById("subCategory").options[0].selected = 'selected';
			fillDetails();
		}
		
		function fillDetails()
		{
			var e = document.getElementById("subCategory");
			var key = e.options[e.selectedIndex].value;
			document.getElementById("subCatId").innerHTML = key;
			
		}
		
	</script>	

<script src="js/bootstrap.min.js"></script>

</body>
</html>