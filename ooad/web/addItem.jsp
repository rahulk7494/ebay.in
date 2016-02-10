<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dao.DBConnection"%>
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
		System.out.println("add Item --------- " + log);
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
		      			<li><a href="registerPage1">Register</a></li>
			    	</ul>
				   	<ul class="nav navbar-nav navbar-right">
				        <li class="dropdown active">
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
					    <div id="shopByCategory" class="tab-pane fade">
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
						Add Item
					</div>
				<s:form name="itemForm" action="addItem" method="post" namespace="/" enctype="multipart/form-data" class="form-horizontal">
  					<div class="panel-body">
						<div class="form-group">
						    <label for="name" class="col-sm-3 control-label">Seller Id</label>
					    	<div class="col-sm-8">
						    	<input type="text" class="form-control" id="sellerId" hidden="" name="seller.sellerId" placeholder="Seller ID" onkeyup="verifySeller()">
						    	<span id="err"> </span>
						    </div>
					  	</div>
						<div class="form-group">
						    <label for="name" class="col-sm-3 control-label">Category Name</label>
					    	<div class="col-sm-8">
						    	<select class="form-control" id="category" name="categoryId" onchange="getSubCategory()">
									<option value='0'>None</option>
									<s:iterator>
										<option value='<s:property value="categoryId"/>'><s:property value="categoryName"/></option>
									</s:iterator>
								</select>
						    </div>
					  	</div>
						<div class="form-group">
						    <label for="name" class="col-sm-3 control-label">Sub-Category Name</label>
					    	<div id="getSubCategory" class="col-sm-8">
					    		<select class="form-control" id="subCategory">
									<option>None</option>
								</select>
						    </div>
					  	</div>
					  	<div class="form-group">
   							<label for="id" class="col-sm-3 control-label">Item Id</label>
   							<div class="col-sm-8">
     								<div class="input-group">
									  	<span class="input-group-addon" id="sId">SID</span>
									  	<span class="input-group-addon" id="catId">CatId</span>
									  	<span class="input-group-addon" id="subCatId">SubCatID</span>
									  	<input type="text" class="form-control" id="itemId" name="itemId" placeholder="Item ID"  onkeyup="verifyItem()">
									</div>
									<span id="err1"></span>
							</div>
						</div>
					  	<div class="form-group">
						    <label for="name" class="col-sm-3 control-label">Item Name</label>
					    	<div class="col-sm-8">
						    	<input type="text" class="form-control" id="itemName" name="itemName" placeholder="Item Name">
						    </div>
					  	</div>
					  	<div class="form-group">
						    <label for="address" class="col-sm-3 control-label">Description</label>
					    	<div class="col-sm-8">
						          <textarea rows="2" class="form-control" id="itemDescription" name="itemDescription"></textarea>
						    </div>
						</div>
						<div class="form-group">
						    <label for="name" class="col-sm-3 control-label">Picture</label>
					    	<div class="col-sm-8">
						    	<input type="file" name="itemPicture" id="itemPicture" >
						    </div>
					  	</div>
						<div class="form-group">
						    <label for="name" class="col-sm-3 control-label">Price</label>
					    	<div class="col-sm-8">
						    	<input type="text" class="form-control" id="itemPrice" name="itemPrice" />
						    </div>
					  	</div>
					  	<div class="form-group">
					  		<label for="name" class="col-sm-3 control-label">Advertising Item</label>
					    	<div class="col-sm-8">
						    	<div class="radio">
						  		 	<label>
								    	<input type="radio" name="itemAdvertisement" id="itemAdvertisement" value="Yes"> Yes
								  	</label>
								  	&emsp;
							  	 	<label>
								    	<input type="radio" name="itemAdvertisement" id="itemAdvertisement" value="No"> No
								  	</label>
							  	</div>
						    </div>
					  	</div>
					</div>
					<div class="panel-footer">
						<div class="row">
							<div class="col-md-11">
								<div class="pull-right">
								    <button type="submit" id="addItemButton" class="btn btn-success">Submit</button>
								</div>
							</div>
							<div class="col-md-1"></div>
						</div>
					</div>
				</s:form>
				</div>
			</div>
		</div>
	</div>
	
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

		<script>
	
		function validateText(id)
		{
			if($("#"+id).val() == null || $("#"+id).val() == "")
			{
				var div = $("#"+id).closest("div");
				div.removeClass("has-success");
				div.addClass("has-error has-feedback");
				$("#glypcn"+id).remove();
				div.append('<span id="glypcn'+id+'" class="glyphicon glyphicon-remove form-control-feedback"></span>');
				return false;
			}
			else
			{
				var div = $("#"+id).closest("div");
				$("#glypcn"+id).remove();
				div.removeClass("has-error");
				div.addClass("has-success has-feedback");
				div.append('<span id="glypcn'+id+'" class="glyphicon glyphicon-ok form-control-feedback"></span>');
				return true;
			}
		}
		
		$(document).ready(
		
				function()
				{
					$("#addItemButton").click(function()
						{
							if(!validateText("sellerId")) {
								return false;
							}
							if(!validateText("res1"))
							{
								return false;		
							}
							if(!validateText("itemId"))	{
								return false;
							}
							if(!validateText("res2"))
							{
								return false;		
							}
							if(!validateText("itemName")) {
								return false;
							}
							if(!validateText("itemDescription")) {
								return false;
							}
							if(!validateText("itemPicture")) {
								return false;
							}
							if(!validateText("itemPrice")) {
								return false;
							}
							if(!validateText("itemAdvertisement")) {
								return false;
							}	
							$("form#itemForm").submit();
						});
				}
		);
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
</body>
</html>