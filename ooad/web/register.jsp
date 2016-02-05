<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="s" uri="/struts-tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scaling=1.0">
	<title>Register</title>
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


	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<div class="panel panel-primary">
					<div class="panel-heading" style="text-align: center;">
						Register
					</div>
					<form action="register" id="registerForm" method="post" class="form-horizontal">
  						<div class="panel-body">
							<div class="form-group">
    							<label for="id" class="col-sm-3 control-label">Seller Id</label>
    							<div class="col-sm-8">
      								<input type="text" class="form-control" id="sellerId" name="sellerId" placeholder="Seller ID"  onkeyup="verifySeller()">
									<span id="err"> </span>
		    					</div>
  							</div>
						  	<div class="form-group">
							    <label for="name" class="col-sm-3 control-label">Seller Name</label>
						    	<div class="col-sm-8">
							    	<input type="text" class="form-control" id="sellerName" name="sellerName" placeholder="Seller Name">
							    </div>
						  	</div>
						  	<div class="form-group">
							    <label for="address" class="col-sm-3 control-label">Seller Address</label>
						    	<div class="col-sm-8">
							          <textarea rows="5" class="form-control" id="sellerAddress" name="sellerAddress"></textarea>
							    </div>
  							</div>
						</div>
						<div class="panel-footer">
						
						

					    	<div class="row">
								<div class="col-md-12">
								<a href="index.jsp" class="btn btn-large btn-primary pull-left">Prev</a>		
								<a href="index.jsp" class="btn btn-large btn-primary pull-right">Home</a>						
									<div class="pull-right col-md-6">
										<button type="button" id="registerBtn" class="btn btn-success">Register</button>
									</div>
									
									
								</div>
								<div class="col-md-1">
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script src="js/jquery-2.1.1.min.js"></script>
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
					$("#registerBtn").click(function()
						{
							if(!validateText("sellerId") )
							{
								return false;
							}	
							if(!validateText("sellerName"))
							{
								return false;
							}
							if(!validateText("sellerAddress"))
							{
								return false;
							}
							$("form#registerForm").submit();
						});
				}
		);
	</script>
	
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
		
	</script>
</body>
</html>