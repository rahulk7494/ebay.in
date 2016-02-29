package dao;

import java.util.ArrayList;

import model.Item;

public interface ItemDAO {

	public boolean addItem(Item item);
	
	public boolean deleteItem(Item item);
	
	public boolean getItems(ArrayList<Item> items, int subCategory);
	
	public boolean getItemsInRange(ArrayList<Item> items, double from, double to);
}
