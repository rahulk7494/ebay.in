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
			int i = 0;
			int j = 0;
			if(!rs.wasNull())
			{
				String categoryName = "";
				String subCategoryName = "";
				String prevCategoryName = "";
				while (rs.next()) {
					
					categoryName = rs.getString(1);
					subCategoryName = rs.getString(2);
					
					if(!prevCategoryName.equals(categoryName)) {
						if(j != 0) {
							
							category = new Category();
							category.setCategoryId(++i);
							category.setCategoryName(prevCategoryName);
							category.setSubCategories(subCategories);
							
							categories.add(category);
						}
						subCategories = new ArrayList<>();
						j = 0;
					}
					
					subCategory = new SubCategory();
					subCategory.setSubCategoryId(++j);
					subCategory.setSubCategoryName(subCategoryName);
					
					subCategories.add(subCategory);
					
					prevCategoryName = categoryName;	
				}
				if(prevCategoryName.equals(categoryName)) {
					if(j != 0) {
						
						category = new Category();
						category.setCategoryId(++i);
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
