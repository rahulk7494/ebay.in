package dao;

import model.Category;
import java.util.ArrayList;

public interface CategoryDAO {

	public boolean getCategories(ArrayList<Category> categories);
}