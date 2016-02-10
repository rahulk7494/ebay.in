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
 	
 	<script type="text/javascript"></script>
 	
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
	        <li class="active"><a href="#">List Sub-Categories</a></li>
	        <li><a href="addCategory.jsp">Add Category</a></li>
	        <li><a href="addSubCategoryPage">Add Sub-Category</a></li>
	        <li><a href="editCategoryPage">Edit Category</a></li>
	        <li><a href="editSubCategoryPage">Edit Sub-Category</a></li>
	   	    <li><a href="deleteCategoryPage">Remove Category</a></li>
	   	    <li><a href="deleteSubCategoryPage">Remove Sub-Category</a></li>
	   	</ul>
	</div>
    <div class="col-md-10">
		<div class="row">
		<div class="col-md-11">
			<div class="well text-center">
				<h4>Sub - Categories</h4>
			</div>
			<table class="table table-hover">
	    		<thead>	
	    			<tr class="row text-center">
						<td class="col-md-2"><div class="form-control">Category ID</div></td>
						<td class="col-md-2"><div class="form-control">Sub-Category ID</div></td>
						<td class="col-md-5"><div class="form-control">Sub-Category Name</div></td>
						<td class="col-md-3"><div class="form-control">Actions</div></td>
					</tr>
				</thead>
				<tbody>
					<s:iterator>
						<s:iterator value="subCategories">
						<s:if test='(!(subCategoryName.equals("Extra")))'>
						<tr class="row">
							<td class="col-md-2">
								<input  type="text" disabled="disabled" 
										class="form-control text-center" 
										data-toggle="tooltip" data-placement="top" 
										title='<s:property value="categoryName"/>'
										value='<s:property value="categoryId"/>'>
							</td>
							<td class="col-md-2">
								<input  type="text" disabled="disabled" 
										class="form-control text-center" 
										value='<s:property value="subCategoryId"/>'>
							</td>
							<td class="col-md-5">
								<input  type="text" disabled="disabled" 
										class="form-control" 
										value='&emsp;<s:property value="subCategoryName"/>'>
							</td>
							<td class="col-md-3 text-center">
								<div class="col-md-6">
									<a  href='editSubCategory.jsp?subCategoryId=<s:property value="subCategoryId"/>&subCategoryName=<s:property value="subCategoryName"/>' 
										class="btn btn-primary btn-block" role="button">
											Edit
									</a>
								</div>
								<div class="col-md-6">
									<a  href='deleteSubCategory.jsp?subCategoryId=<s:property value="subCategoryId"/>&subCategoryName=<s:property value="subCategoryName"/>' 
										class="btn btn-danger btn-block" role="button">
											Delete
									</a>
								</div>
							</td>
						</tr>
						</s:if>
						</s:iterator>
					</s:iterator>
				</tbody>
	    	</table>
		</div>
	</div>
	</div>
</div>

<script src="js/bootstrap.min.js"></script>

</body>
</html>