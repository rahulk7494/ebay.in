package dao.implementaion;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dao.AdminDAO;
import dao.DBConnection;

public class AdminDAOImplementation implements AdminDAO{

	@Override
	public boolean addCategory(String categoryName) {
		int catId = 0;
		int catSubCatId = 0;
		
		try
		{
			DBConnection cs = new DBConnection();
			PreparedStatement ps1 = cs.connect().prepareStatement("SELECT MAX(category_id) FROM categories");
			    ResultSet rs1 = ps1.executeQuery();
			    while(rs1.next())
			    {
			    	catId = rs1.getInt(1) + 1;
			    }
			    
			    cs.disconnect();
			    ps1.close();
			    rs1.close();
			
		      cs = new DBConnection();
		     ps1 = cs.connect().prepareStatement("INSERT INTO categories (category_id,category_name) VALUES(?,?)");
		     ps1.setInt(1, catId);
		    ps1.setString(2,categoryName);
		    ps1.execute();
		    cs.disconnect();
		    ps1.close();
		    
		    cs = new DBConnection();
			 ps1 = cs.connect().prepareStatement("SELECT MAX(cat_subcat_id) FROM categories_subcategories");
			  rs1 = ps1.executeQuery();
			    while(rs1.next())
			    {
			    catSubCatId = rs1.getInt(1) + 1;
			    }
			    
			    cs.disconnect();
			    ps1.close();
			    rs1.close();
		    
		    
		    cs = new DBConnection();
			 ps1 = cs.connect().prepareStatement("INSERT INTO categories_subcategories (cat_subcat_id,cat_id,subcat_id) VALUES(?,?,?)");
			    ps1.setInt(1,catSubCatId );
			    ps1.setInt(2,catId);
			    ps1.setInt(3,-1);
			    ps1.execute();
			    cs.disconnect();
			    ps1.close();
			    
			    String message = "Category with ID : " + catId + " is Added";
				ps1 = cs.connect().prepareStatement("INSERT INTO logs(log_message) VALUES(?)");
				ps1.setString(1, message);
				ps1.execute();
				cs.disconnect();
				ps1.close();    
			    
		}
		
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
		
		
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean editCategory(int categoryId, String newCategoryName) {
		
		try
		{
		  DBConnection cs = new DBConnection();
		  PreparedStatement ps1 = cs.connect().prepareStatement("UPDATE categories set category_name= ? where category_id = ?");
		    ps1.setString(1,newCategoryName);
		    ps1.setInt(2, categoryId);
		    ps1.executeUpdate();
		    cs.disconnect();
		    ps1.close();
		    
		    String logMessage = "Category with ID : " + categoryId + " is Edited";
			ps1 = cs.connect().prepareStatement("INSERT INTO logs(log_message) VALUES (?)");
			ps1.setString(1, logMessage);
			ps1.execute();
			cs.disconnect();
			ps1.close();
		  }
		
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
		
		
		
		
	}

	@Override
	public boolean deleteCategory(int categoryId) {
		int otherId = 0;
		try
		{ 
		   DBConnection	cs = new DBConnection();
		   PreparedStatement ps1 = cs.connect().prepareStatement("SELECT category_id FROM categories WHERE category_name = ?");
		   ps1.setString(1, "Other");
		   ResultSet rs1 = ps1.executeQuery();
		    while(rs1.next())
		    {
		       otherId = rs1.getInt(1);
		    }
		    
		    cs.disconnect();
		    ps1.close();
		    rs1.close();
		   cs = new DBConnection();
		   ps1 = cs.connect().prepareStatement("UPDATE categories_subcategories SET cat_id = ? WHERE cat_id = ?");
		   ps1.setInt(1, otherId); 
		   ps1.setInt(2,categoryId);
		    ps1.executeUpdate();
		    cs.disconnect();
		    ps1.close();
		    
		    cs = new DBConnection();
			 ps1 = cs.connect().prepareStatement("UPDATE items SET item_cat_id = ? WHERE item_cat_id = ?");
			    ps1.setInt(1,otherId);
			    ps1.setInt(2, categoryId);
			    ps1.executeUpdate();
			    cs.disconnect();
			    ps1.close();
			    
			    cs = new DBConnection();
				 ps1 = cs.connect().prepareStatement("DELETE from categories WHERE category_id = ?");
				    ps1.setInt(1,categoryId);
				    ps1.executeUpdate();
				    cs.disconnect();
				    ps1.close();
		    
		    // Rohit
			
				    String logMessage = "Category with ID : " + categoryId + " is Deleted";
					ps1 = cs.connect().prepareStatement("INSERT INTO logs(log_message) VALUES (?)");
					ps1.setString(1, logMessage);
					ps1.execute();
					cs.disconnect();
					ps1.close();

				    	}
		
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
	}

	@Override
	public boolean addSubCategory(int categoryId, String subcategoryName) {
		
		int subcatId = 0;
		int catSubcatId = 0;
		try
		{ 
		   DBConnection	cs = new DBConnection();
		   PreparedStatement ps1 = cs.connect().prepareStatement("SELECT MAX(subcategory_id) FROM subcategories");
		   ResultSet rs1 = ps1.executeQuery();
		    while(rs1.next())
		    {
		       subcatId = rs1.getInt(1) + 1;
		    }
		    
		    cs.disconnect();
		    ps1.close();
		    rs1.close();
		    
		   cs = new DBConnection();
		   ps1 = cs.connect().prepareStatement("INSERT INTO subcategories (subcategory_id,subcategory_name) VALUES (?,?)");
		   ps1.setInt(1, subcatId); 
		   ps1.setString(2, subcategoryName);
		    ps1.executeUpdate();
		    cs.disconnect();
		    ps1.close();
		    
		      cs = new DBConnection();
			  ps1 = cs.connect().prepareStatement("SELECT MAX(cat_subcat_id) FROM categories_subcategories");
			  rs1 = ps1.executeQuery();
			    while(rs1.next())
			    {
			       catSubcatId = rs1.getInt(1) + 1;
			    }
			    
			    cs.disconnect();
			    ps1.close();
			    rs1.close();
		    
		    cs = new DBConnection();
			 ps1 = cs.connect().prepareStatement("INSERT INTO categories_subcategories (cat_subcat_id,cat_id,subcat_id) VALUES (?,?,?)");
			    ps1.setInt(1,catSubcatId);
			    ps1.setInt(2, categoryId);
			    ps1.setInt(3, subcatId);
			    ps1.execute();
			    cs.disconnect();
			    ps1.close();
		
			    // Rohit
			    
			    String logMessage = "Subcategory "+ subcategoryName+  "with ID : " + subcatId + " "+" is Added";
				ps1 = cs.connect().prepareStatement("INSERT INTO logs(log_message) VALUES (?)");
				ps1.setString(1, logMessage);
				ps1.execute();
				cs.disconnect();
				ps1.close();
		
	}
		
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		
		return true;

}

	@Override
	public boolean deleteSubCategory(int subcategoryId) {
		
		System.out.println("subcategoryId " + subcategoryId);
		int extraId = 0;
		try
		{ 
		   DBConnection	cs = new DBConnection();
		   PreparedStatement ps1 = cs.connect().prepareStatement("SELECT subcategory_id FROM subcategories WHERE subcategory_name = ?");
		   ps1.setString(1, "Extra");
		   ResultSet rs1 = ps1.executeQuery();
		    while(rs1.next())
		    {
		       extraId = rs1.getInt(1);
		    }
		    
		    cs.disconnect();
		    ps1.close();
		    rs1.close();
		    
		    System.out.println("extraId " + extraId);
		    int cat_subcat_id = 0;
		    ps1 = cs.connect().prepareStatement("SELECT cat_subcat_id FROM categories_subcategories WHERE subcat_id = ?");
			   ps1.setInt(1, extraId);
			   rs1 = ps1.executeQuery();
			    while(rs1.next())
			    {
			       cat_subcat_id = rs1.getInt(1);
			    }
			    
			    cs.disconnect();
			    ps1.close();
			    rs1.close();
			    
			    
		    cs = new DBConnection();
			   ps1 = cs.connect().prepareStatement("DELETE FROM cat_subcat_options WHERE cat_subcat_id = ?");
			   ps1.setInt(1, cat_subcat_id);
			   ps1.executeUpdate();   
			    cs.disconnect();
			    ps1.close();
			    rs1.close();
			    
			    cs = new DBConnection();
				   ps1 = cs.connect().prepareStatement("DELETE FROM cat_subcat_brands WHERE cat_subcat_id = ?");
				   ps1.setInt(1, cat_subcat_id);
			       ps1.executeUpdate();
				    cs.disconnect();
				    ps1.close();
				    rs1.close();
				    
				    cs = new DBConnection();
					   ps1 = cs.connect().prepareStatement("DELETE FROM categories_subcategories WHERE subcat_id = ?");
					   ps1.setInt(1, subcategoryId);
					   ps1.executeUpdate();
					    cs.disconnect();
					    ps1.close();
					    rs1.close();
		    
		   cs = new DBConnection();
		   ps1 = cs.connect().prepareStatement("UPDATE items SET item_subcat_id = ? WHERE item_subcat_id = ?");
		   ps1.setInt(1, extraId); 
		   ps1.setInt(2,subcategoryId);
		    ps1.executeUpdate();
		    cs.disconnect();
		    ps1.close();
		    
		     cs = new DBConnection();
				 ps1 = cs.connect().prepareStatement("DELETE from subcategories WHERE subcategory_id = ?");
				    ps1.setInt(1,subcategoryId);
				    ps1.executeUpdate();
				    cs.disconnect();
				    ps1.close();
		    	
				    String logMessage = "SubCategory with ID : " + subcategoryId + " is Deleted";
					ps1 = cs.connect().prepareStatement("INSERT INTO logs(log_message) VALUES (?)");
					ps1.setString(1, logMessage);
					ps1.execute();
					cs.disconnect();
					ps1.close();

		}
		
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
		
		
		
		
	}

	public boolean editSubCategory(int subCategoryId, String newSubCategoryName) {
		try
		{
		  DBConnection cs = new DBConnection();
		  PreparedStatement ps1 = cs.connect().prepareStatement("UPDATE subcategories set subcategory_name= ? where subcategory_id = ?");
		    ps1.setString(1,newSubCategoryName);
		    ps1.setInt(2, subCategoryId);
		    ps1.executeUpdate();
		    cs.disconnect();
		    ps1.close();
		   
		    String logMessage = "SubCategory with ID : " + subCategoryId + " is Edited";
			ps1 = cs.connect().prepareStatement("INSERT INTO logs(log_message) VALUES (?)");
			ps1.setString(1, logMessage);
			ps1.execute();
			cs.disconnect();
			ps1.close();
		  }
		
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
	}
}
