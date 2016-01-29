package dao.implementaion;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import dao.CategoryDAO;
import dao.DBConnection;
import model.Category;
import model.SubCategory;

public class CategoryDAOImplementation implements CategoryDAO {

	public boolean getCategories(ArrayList<Category> categories)
	{
		String tableName = "cat_subcat";
		try
		{
			Category category = new Category();
			SubCategory subCategory = new SubCategory();
			ArrayList<SubCategory> subCategories = new ArrayList<>();
			
			DBConnection cs = new DBConnection();
			PreparedStatement ps = cs.connect().prepareStatement("SELECT * FROM " + tableName);
			ResultSet rs = ps.executeQuery();
			int j = 0;
			if(!rs.wasNull())
			{
				int categoryId = 0;
				int prevCategoryId = 0;
				String categoryName = "";
				String prevCategoryName = "";
				
				int subCategoryId = 0;
				String subCategoryName = "";
				
				while (rs.next()) {
					
					categoryId = rs.getInt(1);
					categoryName = rs.getString(2);
					subCategoryId = rs.getInt(3);
					subCategoryName = rs.getString(4);
					
					if(!prevCategoryName.equals(categoryName)) {
						if(j != 0) {
							
							category = new Category();
							category.setCategoryId(prevCategoryId);
							category.setCategoryName(prevCategoryName);
							category.setSubCategories(subCategories);
							
							categories.add(category);
						}
						subCategories = new ArrayList<>();
						j = 0;
					}
					
					subCategory = new SubCategory();
					subCategory.setSubCategoryId(subCategoryId);
					subCategory.setSubCategoryName(subCategoryName);
					
					subCategories.add(subCategory);
					
					prevCategoryName = categoryName;	
					prevCategoryId = categoryId;
				}
				if(prevCategoryName.equals(categoryName)) {
					if(j != 0) {
						
						category = new Category();
						category.setCategoryId(prevCategoryId);
						category.setCategoryName(prevCategoryName);
						category.setSubCategories(subCategories);
						
						categories.add(category);
					}
					subCategories = new ArrayList<>();
					j = 0;
				}
				cs.disconnect();
				return true;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}
}
