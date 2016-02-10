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
	<script src="js/jquery-2.1.1.min.js"></script>
</head>
<body>

<%! 
	String log = "";
 %>
<%
	String result = request.getParameter("success");
	
	try {
		DBConnection dbConnection = new DBConnection();
		PreparedStatement ps = dbConnection.connect().prepareStatement("SELECT log_message FROM logs WHERE logs_id = (SELECT MAX(logs_id) FROM logs)");
		ResultSet rs = ps.executeQuery();
		if(rs.next())
			log = rs.getString(1);
		System.out.println("delete Item --------- " + log);
	}
	catch(Exception e) {
		
	}
%>
	<div class="modal fade" id="success" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
<%
	if(result.equals("true")) {	
%>
				<div class="modal-header modal-header-success">
<%
	} else if(result.equals("false")) {	
%>
				<div class="modal-header modal-header-danger">
<%		
	}
%>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h3>
						<i class="glyphicon glyphicon-thumbs-up"></i> <%=log %>
					</h3>
				</div>
			</div>
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
<script type="text/javascript">
		
				$(document).ready(function() {
					
<%
	if(result.equals("true") || result.equals("false")) {	
%>
					$("#success").modal('show');
<%
	} else {
%>		
					$("#success").modal('hide');
<%		
	}
%>
				});
			</script>

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
			<li class="active"><a href="admin">List Categories</a></li>
	        <li><a href="listSubCategoryPage">List Sub-Categories</a></li>
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
				<h4>Categories</h4>
			</div>
			<table class="table table-hover">
	    		<thead>	
	    			<tr class="row text-center">
						<td class="col-md-3"><div class="form-control">Category ID</div></td>
						<td class="col-md-6"><div class="form-control">Category Name</div></td>
						<td class="col-md-3"><div class="form-control">Actions</div></td>
					</tr>
				</thead>
				<tbody>
					<s:iterator>
						<tr class="row">
							<td class="col-md-3">
								<input  type="text" disabled="disabled" 
										class="form-control text-center" 
										value='<s:property value="categoryId"/>'>
							</td>
							<td class="col-md-6">
								<input  type="text" disabled="disabled" 
										class="form-control" 
										value='<s:property value="categoryName"/>'>
							</td>
							<td class="col-md-3 text-center">
								<div class="col-md-6">
									<a  href='editCategory.jsp?categoryId=<s:property value="categoryId"/>&categoryName=<s:property value="categoryName"/>' 
										class="btn btn-primary btn-block" role="button">
											Edit
									</a>
								</div>
								<div class="col-md-6">
									<a  href='deleteCategory.jsp?categoryId=<s:property value="categoryId"/>&categoryName=<s:property value="categoryName"/>' 
										class="btn btn-danger btn-block" role="button">
											Delete
									</a>
								</div>
							</td>
						</tr>
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