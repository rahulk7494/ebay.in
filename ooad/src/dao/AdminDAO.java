package dao;

public interface AdminDAO {

	public boolean addCategory(String categoryName);

	public boolean editCategory(int categoryId, String newCategoryName);
	
	public boolean deleteCategory(int categoryId);
	
	public boolean addSubCategory(int categoryId, String subcategoryName);
	
	public boolean deleteSubCategory(int subcategoryId);
	
	public boolean editSubCategory(int subCategoryId, String newSubCategoryName);
}
