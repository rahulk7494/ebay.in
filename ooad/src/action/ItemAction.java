package action;

import java.util.ArrayList;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import dao.ItemDAO;
import dao.implementaion.ItemDAOImplementation;
import model.Item;
import model.ItemDetails;

@SuppressWarnings("serial")
public class ItemAction extends ActionSupport implements ModelDriven<Item>{

	Item item = new Item();
	ArrayList<Item> items = new ArrayList<>();
	
	private double from;
	
	private double to;

	public double getFrom() {
		return from;
	}

	public void setFrom(double from) {
		this.from = from;
	}
	
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
	
	public ItemDetails getItem(String itemId) {
		ItemDAO itemDAO = new ItemDAOImplementation();
		item.setItemId(itemId);
		ItemDetails itemDetails = itemDAO.getItem(item);
		return itemDetails;
	}
	
	public ArrayList<Item> getItems(int subCategory) {
		ItemDAO itemDAO = new ItemDAOImplementation();
		if(itemDAO.getItems(items, subCategory))
			return items;
		return null;
	}

	public ArrayList<Item> getItemsInRange(double from, double to) {
		ItemDAO itemDAO = new ItemDAOImplementation();
		if(itemDAO.getItemsInRange(items, from, to))
		{
			for (Item item : items) {
				System.out.println(item.getItemId() + " --- " + item.getItemPictureString());
			}
			return items;
		}
		return null;
	}
	
	@Override
	public Item getModel() {
		return item;
	}

	public double getTo() {
		return to;
	}

	public void setTo(double to) {
		this.to = to;
	}

	
}
