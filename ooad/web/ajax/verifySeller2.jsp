<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dao.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
	String result = "";
	if(!request.getParameter("sellerId").isEmpty())
	{
		String sellerId = request.getParameter("sellerId");
        try {
			DBConnection conn = new DBConnection();
            PreparedStatement ps = conn.connect().prepareStatement("SELECT * FROM users WHERE user_id = ?");
            ps.setString(1, sellerId);
            ResultSet rs = ps.executeQuery();
            if(rs.next())
			{
            	result = "<font color=green>Correct Seller Id </font><input type='hidden' id='res1' value='Valid' >";
            }
            else
            {
            	result = "<font color=red>Invalid Seller Id </font><input type='hidden' id='res1' value='' >";
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