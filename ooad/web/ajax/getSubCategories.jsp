<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dao.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
	String result = "";
System.out.println("test in ajaxgetsub:"+request.getParameter("categoryId"));
	if(!request.getParameter("categoryId").isEmpty())
	{
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
	
		try {
		
			DBConnection conn = new DBConnection();
			
			String sql =  "SELECT * " 
						+ "FROM subcategories "
						+ "WHERE subcategory_id IN " 
						+ "(SELECT subcat_id "
						+ "FROM categories_subcategories "
						+ "WHERE cat_id = " + categoryId + ")";
		    
			PreparedStatement ps = conn.connect().prepareStatement(sql);
		    ResultSet rs = ps.executeQuery();
		
		    result = "<select class='form-control' id='subCategory' name='subCategoryId' onchange='fillDetails()'>"; 
		    result = result + "<option value='0'>None</option>";
		    
		    while(rs.next())
		    {
		    	result = result + "<option value='" + rs.getInt(1) + "'>" + rs.getString(2) + "</option>";
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