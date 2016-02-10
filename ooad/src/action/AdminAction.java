package action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import dao.AdminDAO;
import dao.implementaion.AdminDAOImplementation;
import model.Category;

public class AdminAction extends ActionSupport implements ModelDriven<Category> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Category category = new Category();
	private String subCategoryName;
	private int subCategoryId;
	
	
	public String getSubCategoryName() {
		return subCategoryName;
	}

	public void setSubCategoryName(String subCategoryName) {
		this.subCategoryName = subCategoryName;
	}

	public String execute() {
		AdminDAO adminDAO = new AdminDAOImplementation();
		if(adminDAO.addCategory(category.getCategoryName())) {
			return SUCCESS;
		}
		return ERROR;
	}
	
	public String addSubCategory() {
		AdminDAO adminDAO = new AdminDAOImplementation();
		System.out.println(this.getSubCategoryName());
		if(adminDAO.addSubCategory(category.getCategoryId(), this.getSubCategoryName())) {
			return SUCCESS;
		}
		return ERROR;
	}
	
	public String editCategory() {
		AdminDAO adminDAO = new AdminDAOImplementation();
		System.out.println(category.getCategoryId() + " ---- " + category.getCategoryName());
		if(adminDAO.editCategory(category.getCategoryId(), category.getCategoryName())) {
			return SUCCESS;
		}
		return ERROR;
	}
	
	public String editSubCategory() {
		AdminDAO adminDAO = new AdminDAOImplementation();
		System.out.println(this.getSubCategoryId() + " ---- " + this.getSubCategoryName());
		if(adminDAO.editSubCategory(this.getSubCategoryId(), this.getSubCategoryName())) {
			return SUCCESS;
		}
		return ERROR;
	}
	
	public String deleteCategory() {
		AdminDAO adminDAO = new AdminDAOImplementation();
		if(adminDAO.deleteCategory(category.getCategoryId())) {
			return SUCCESS;
		}
		return ERROR;
	}
	
	public String deleteSubCategory() {
		AdminDAO adminDAO = new AdminDAOImplementation();
		if(adminDAO.deleteSubCategory(this.getSubCategoryId())) {
			return SUCCESS;
		}
		return ERROR;
	}
	
	@Override
	public Category getModel() {
		return category;
	}

	public int getSubCategoryId() {
		return subCategoryId;
	}

	public void setSubCategoryId(int subCategoryId) {
		this.subCategoryId = subCategoryId;
	}

}
