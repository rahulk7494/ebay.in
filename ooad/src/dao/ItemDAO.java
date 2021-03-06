package dao;

import java.util.ArrayList;

import model.Item;
import model.ItemDetails;

public interface ItemDAO {

	public boolean addItem(ItemDetails itemDetails);
	
	public boolean deleteItem(Item item);
	
	public ItemDetails getItem(Item item);
	
	public boolean getItems(ArrayList<Item> items, int subCategory);
	
	public boolean getItemsInRange(ArrayList<Item> items, double from, double to);
}
