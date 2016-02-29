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
            PreparedStatement ps = conn.connect().prepareStatement("SELECT * FROM items WHERE item_id = ?");
            ps.setString(1, itemId);
            ResultSet rs = ps.executeQuery();
            if(rs.next())
			{
            	result = "<font color=red>Item Id already taken </font><input type='hidden' id='res2' value='' >";
       		}
            else
            {
            	result = "<font color=green>Item Id available </font><input type='hidden' id='res2' value='Valid' >";
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