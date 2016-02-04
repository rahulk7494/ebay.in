<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dao.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
	String result = "";
	if(!request.getParameter("itemId").isEmpty())
	{
		String itemId = request.getParameter("itemId");
        try {
			DBConnection conn = new DBConnection();
            PreparedStatement ps = conn.connect().prepareStatement("SELECT item_name FROM items WHERE item_id = ?");
            ps.setString(1, itemId);
            ResultSet rs = ps.executeQuery();
            if(rs.next())
			{
            	result = rs.getString(1);
            	/*
            	result = "<font color=green>Correct ItemId</font>";
           		result += "<div class='form-group'>"
            				+ "<label for='name' class='col-sm-2 control-label'>Item Name</label>"
            				+ "<div class='col-sm-10'>"
					    		+ "<input type='text' class='form-control' name='itemName'> value='" + rs.getString(1) + "'"
					    	+ "</div>"
				    	+ "</div>";*/
			}
            else
            {
            	result = "";
            }
            rs.close();
            ps.close();
            conn.disconnect();
        }
	    catch(Exception e){
	        e.printStackTrace();
	    	result = "";
	    }
        out.println(result);
	}
	else
		out.println("");
%>