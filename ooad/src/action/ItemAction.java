package action;

import java.util.ArrayList;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import dao.ItemDAO;
import dao.implementaion.ItemDAOImplementation;
import model.Item;

@SuppressWarnings("serial")
public class ItemAction extends ActionSupport implements ModelDriven<Item>{

	Item item = new Item();
	ArrayList<Item> items = new ArrayList<>();
	
	public String execute() {
		
		ItemDAO itemDAO = new ItemDAOImplementation();
		if(itemDAO.addItem(item))
			return SUCCESS;
		return ERROR;
	}
	
	public String delete() {
		ItemDAO itemDAO = new ItemDAOImplementation();
		if(itemDAO.deleteItem(item))
			return SUCCESS;
		return ERROR;
	}
	
	public ArrayList<Item> getItems(int subCategory) {
		ItemDAO itemDAO = new ItemDAOImplementation();
		if(itemDAO.getItems(items, subCategory))
			return items;
		return null;
	}
	
	@Override
	public Item getModel() {
		return item;
	}

	
}
