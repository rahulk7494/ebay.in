package action;

import java.util.ArrayList;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import model.Category;
import dao.CategoryDAO;
import dao.implementaion.CategoryDAOImplementation;

@SuppressWarnings("serial")
public class LoadAction extends ActionSupport implements ModelDriven<ArrayList<Category>> {

	private ArrayList<Category> categories = new ArrayList<>();
//	private TreeMap<String, ArrayList<String>> category = new TreeMap<>();
	
	public String execute() {
		CategoryDAO cs = new CategoryDAOImplementation();
		if(cs.getCategories(categories)) {
			return SUCCESS;
		}
		return ERROR;
	}
	
	@Override
	public ArrayList<Category> getModel() {
		return categories;
	}
}
