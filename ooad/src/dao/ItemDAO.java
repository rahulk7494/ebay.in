package dao;

import model.Item;

public interface ItemDAO {

	public boolean addItem(Item item);
	
	public boolean deleteItem(Item item);
}
