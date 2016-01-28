<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dao.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
	String result = "";
	if(!request.getParameter("categoryId").isEmpty())
	{
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
	
		try {
		
			DBConnection conn = new DBConnection();
			
			String sql =  "SELECT subcategory_name " 
						+ "FROM item_subcategories "
						+ "WHERE subcategory_id IN " 
						+ "(SELECT item_subcat "
						+ "FROM item_options "
						+ "WHERE item_cat = " + categoryId + ")";
		    
			PreparedStatement ps = conn.connect().prepareStatement(sql);
		    ResultSet rs = ps.executeQuery();
		
		    result = "<select class='form-control'>";
		    while(rs.next())
		    {
		    	result = result + "<option>"+rs.getString(1)+"</option>";
		    }
			result = result + "</select>";
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