package dao.implementaion;

import java.awt.image.BufferedImage;
import java.io.File;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.imageio.ImageIO;

import dao.DBConnection;
import dao.ItemDAO;
import model.AttributeList;
import model.Category;
import model.Item;
import model.ItemDetails;
import model.Seller;
import model.SubCategory;
//import model.Seller;

public class ItemDAOImplementation implements ItemDAO {

	@Override
	public ItemDetails getItem(Item item) {
		
		ItemDetails itemDetails = new ItemDetails();
		itemDetails.setSeller(new Seller());
		itemDetails.setCategory(new Category());
		itemDetails.setSubCategory(new SubCategory());
		try {
			
			DBConnection dbConnection = new DBConnection();
		    String sql = "SELECT i.*, c.*, s.* "
			    		+ "FROM items i, categories c, subcategories s "
			    		+ "WHERE i.item_cat_id = c.category_id "
			    		+ "AND i.item_subcat_id = s.subcategory_id "
			    		+ "AND i.item_id = '" + item.getItemId() + "'";
			    
		    PreparedStatement ps = dbConnection.connect().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				item.setSurrogateItemId(rs.getInt("items_id"));
				item.setItemId(rs.getString("item_id"));
				item.setItemName(rs.getString("item_name"));
				item.setItemDescription(rs.getString("item_desc"));
				item.setItemPrice(rs.getDouble("item_price"));
				item.setItemPictureString(rs.getString("item_picture"));
				item.setCategoryId(rs.getInt("item_cat_id"));
				item.setSubCategoryId(rs.getInt("item_subcat_id"));
				item.setItemDiscount(rs.getDouble("item_discount"));
				item.setItemQuantityAvailable(rs.getInt("item_quantity_available"));
				item.setItemSold(rs.getInt("item_sold"));
				item.setItemWarrantyPeriod(rs.getString("item_warranty_period"));
				item.setItemColor(rs.getString("item_color"));
				item.setItemCondition(rs.getString("item_condition"));
				item.setItemWeight(rs.getString("item_weight"));
				item.setItemBrand(rs.getString("item_brand"));
				item.setItemExpiryDate(rs.getDate("item_expiry_date"));
				
				itemDetails.getSeller().setSurrogateSellerId(rs.getInt("item_seller_id"));
				itemDetails.setItem(item);
				itemDetails.getCategory().setCategoryId(rs.getInt("category_id"));
				itemDetails.getCategory().setCategoryName(rs.getString("category_name"));
				itemDetails.getSubCategory().setSubCategoryId(rs.getInt("subcategory_id"));
				itemDetails.getSubCategory().setSubCategoryName(rs.getString("subcategory_name"));
				
				
			}
			ps.close();
			rs.close();
			dbConnection.disconnect();
			
		    dbConnection = new DBConnection();
		    sql = "SELECT a.attribute_key, a.attribute_value "
	    		+ "FROM items i,  attributes a "
	    		+ "WHERE i.items_id = a.attribute_item_id "
	    		+ "AND i.item_id = '" + item.getItemId() + "'";
			    
		    ps = dbConnection.connect().prepareStatement(sql);
			rs = ps.executeQuery();
			itemDetails.setAttributeLists(new ArrayList<>());
			while(rs.next())
			{
				itemDetails.getAttributeLists()
					.add(new AttributeList(
							rs.getString("attribute_key"), 
							rs.getString("attribute_value")));
			}
		
			ps.close();
			rs.close();
			dbConnection.disconnect();
			
			dbConnection = new DBConnection();
		    sql = "SELECT s.*, u.user_id "
	    		+ "FROM sellers s, users u "
	    		+ "WHERE s.seller_id = u.users_id "
	    		+ "AND s.seller_id = " + itemDetails.getSeller().getSurrogateSellerId();	// + " "
//		    	+ "OR s.seller_category_id = " + itemDetails.getCategory().getCategoryId();
    		
		    System.out.println(sql);
		    ps = dbConnection.connect().prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next())
			{
				itemDetails.getSeller().setSellerId(rs.getString("user_id"));
				itemDetails.getSeller().setSellerName(rs.getString("seller_name"));
				itemDetails.getSeller().setSellerContactNo(rs.getString("seller_contact_no"));
				itemDetails.getSeller().setSellerEmail(rs.getString("seller_email"));
				itemDetails.getSeller().setSellerNOB(rs.getString("seller_nature_of_business"));
				itemDetails.getSeller().setSellerRating(rs.getInt("seller_rating"));
			}
		
			ps.close();
			rs.close();
			dbConnection.disconnect();
		}
		catch(Exception e) {
			System.out.println("SQL Error");
			e.printStackTrace();
			return null;	//false;
		}
		return itemDetails;	//true;
	}
	
	@Override
	public boolean deleteItem(Item item) {
		try {
			
//			int surrogateItemId = 0;
			
		    DBConnection cs = new DBConnection();
			PreparedStatement ps;	// = cs.connect().prepareStatement("SELECT items_id FROM items WHERE item_id = ?");
//			ps.setString(1, item.getItemId());
//			ResultSet rs;	// = ps.executeQuery();
//			if(rs.next())
//				surrogateItemId = rs.getInt(1);
			/*
			ps = cs.connect().prepareStatement("DELETE FROM item_sellers WHERE item_id = ?");
			ps.setInt(1, surrogateItemId);
			ps.execute();
			cs.disconnect();
			ps.close();*/
			
			System.out.println("Hello");
		    String sql =  "DELETE "
						+ "FROM items "
						+ "WHERE item_id = ?";
//						+ "WHERE items_id = ?";
		    ps = cs.connect().prepareStatement(sql);
			ps.setString(1, item.getItemId());	//surrogateItemId);
			ps.execute();
			cs.disconnect();
			ps.close();

			String message = "Item with ID : " + item.getItemId() + " is deleted";
			ps = cs.connect().prepareStatement("INSERT INTO logs(log_message) VALUES(?)");
			ps.setString(1, message);
			ps.execute();
			cs.disconnect();
			ps.close();
		}
		catch(Exception e) {
			System.out.println("SQL Error");
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public boolean getItems(ArrayList<Item> items, int subCategoryId) {
		try {
			
			Item item;
//			Seller seller;
		    DBConnection dbConnection = new DBConnection();
		    String sql =  "SELECT * "
						+ "FROM items "
						+ "WHERE item_subcat_id = " + subCategoryId;
			PreparedStatement ps = dbConnection.connect().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				item = new Item();
//				seller = new Seller();
				item.setSurrogateItemId(rs.getInt(1));
				item.setItemId(rs.getString(2));
				item.setItemName(rs.getString(3));
				item.setItemDescription(rs.getString(4));
				item.setItemPrice(rs.getDouble(5));
				item.setItemPictureString(rs.getString(6));
				System.out.println("---------" + item.getItemPictureString());
				
//				seller.setSellerName(rs.getString(7));
//				item.setSeller(seller);
				
				/*String sql1 = "SELECT item_image FROM item_images WHERE item_id = ?";
				DBConnection dbConnection2 = new DBConnection();
				PreparedStatement ps1 = dbConnection2.connect().prepareStatement(sql1);
				ps1.setInt(1, item.getSurrogateItemId());
				ResultSet rs1 = ps1.executeQuery();
				while(rs1.next()) {
					item.setItemPictureString(rs1.getString(1));
					System.out.println("---------" + item.getItemPictureString());
				}*/
				items.add(item);
			}
			
			dbConnection.disconnect();
		}
		catch(Exception e) {
			System.out.println("SQL Error");
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public boolean getItemsInRange(ArrayList<Item> items, double from, double to) {
		try {
			
			Item item;
		    DBConnection dbConnection = new DBConnection();
		    String sql =  "SELECT * "
						+ "FROM items "
						+ "WHERE item_price >= " + from + " "
						+ "AND item_price <= " + to;
						
			PreparedStatement ps = dbConnection.connect().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				item = new Item();
				item.setItemId(rs.getString(2));
				item.setSellerID(rs.getString(10));
				item.setItemPrice(rs.getDouble(5));
				item.setItemPictureString(rs.getString(6));
				if(rs.getInt(7) == 1)
					item.setItemAdvertisement("YES");
				else
					item.setItemAdvertisement("NO");
				items.add(item);
			}
			
			dbConnection.disconnect();
		}
		catch(Exception e) {
			System.out.println("SQL Error");
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@SuppressWarnings("deprecation")
	@Override
	public boolean addItem(ItemDetails itemDetails) {
		try {
			
			String workingDir = System.getProperty("user.dir");		// get current working directory
			System.out.println(workingDir);
			Item item = itemDetails.getItem();
			System.out.println(item.getItemPictureString());
			/*
			 *	File currentDirFile = new File(".");
			 *	String helper = currentDirFile.getAbsolutePath();
			 *	String currentDir = helper.substring(0, helper.length - currentDirFile.getCanonicalPath().length); 
			 *
			 */
		
			DBConnection cs = new DBConnection();
			PreparedStatement ps1;	// = cs.connect().prepareStatement("SELECT MAX(item_images_id) FROM item_images");
			ResultSet rs1;	// = ps1.executeQuery();
			/*
			if(rs1.next()) {
				fileName = (rs1.getInt(1) + 1) + "";
			}
			
			cs.disconnect();
			ps1.close();
			rs1.close();
			*/
			BufferedImage bi = ImageIO.read(item.getItemPicture());
			File saveFile = new File(workingDir + item.getItemId() + ".png");
			ImageIO.write(bi, "png", saveFile);
			
			item.setItemPictureString("eclipse" + item.getItemId() + ".png");
			
			System.out.println("new " + item.getItemPictureString());
			
			ps1 = cs.connect().prepareStatement("SELECT users_id FROM users WHERE user_id = ?");
			ps1.setString(1, itemDetails.getSeller().getSellerId());
			rs1 = ps1.executeQuery();
			if(rs1.next())
			{
				itemDetails.getSeller().setSurrogateSellerId(rs1.getInt(1));
			}
			cs.disconnect();
			ps1.close();
			rs1.close();
			
			
            cs = new DBConnection();
            String sql = "INSERT INTO items"
        			+ "(item_id, item_name, item_cat_id, item_subcat_id, "
        			+ "item_price, item_desc, item_adv, item_picture, "
        			+ "item_seller_id, item_discount, item_quantity_available, "
        			+ "item_warranty_period"
        			+ ", item_color, item_condition, item_weight, item_brand"
        			+ ") VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?"
        			+ ", ?, ?, ?, ?)";
            ps1 = cs.connect().prepareStatement(sql);
			ps1.setString(1, item.getItemId());
			ps1.setString(2, item.getItemName());
			ps1.setInt(3, item.getCategoryId());
			ps1.setInt(4, item.getSubCategoryId());
			ps1.setDouble(5,item.getItemPrice());
			ps1.setString(6,item.getItemDescription());
			ps1.setString(8, item.getItemPictureString());
			ps1.setInt(9, itemDetails.getSeller().getSurrogateSellerId());
			ps1.setDouble(10, item.getItemDiscount());
			ps1.setInt(11, item.getItemQuantityAvailable());
			ps1.setString(12, item.getItemWarrantyPeriod());
			ps1.setString(13, item.getItemColor());
			ps1.setString(14, item.getItemCondition());
			ps1.setString(15, item.getItemWeight());
			ps1.setString(16, item.getItemBrand());
//			int year = item.getItemExpiryDate().getYear();
//			int month = item.getItemExpiryDate().getMonth();
//			int day = item.getItemExpiryDate().getDay();
//			
//			Date date = new Date(year, month, day);
//			ps1.setDate(17, date);

			if(item.getItemAdvertisement().equals("Yes")){
				boolean b=true;
				ps1.setBoolean(7,b);
			}
			
			else if(item.getItemAdvertisement().equals("No")){
				boolean b=false;
				ps1.setBoolean(7,b);
			}
			
			//System.out.println("Rohit:"+item.getCategoryId()+" "+item.getSubCategoryId());

			ps1.execute();
			
			/*if(!ps1.execute())
			{
				cs.disconnect();
				*/
				System.out.println("First");
				PreparedStatement ps = cs.connect().prepareStatement("SELECT items_id FROM items WHERE item_id = ?");
				ps.setString(1, item.getItemId());
				ResultSet rs = ps.executeQuery();
				if(rs.next())
					item.setSurrogateItemId(rs.getInt(1));
				cs.disconnect();
				ps.close();
				rs.close();
				
				sql = "";
				System.out.println("First first");
				if(itemDetails.getAttributeLists() != null) {
					for (AttributeList attributeList : itemDetails.getAttributeLists()) {
						sql = "INSERT INTO attributes(attribute_item_id, attribute_key, attribute_value) "
								+ "VALUES (" + item.getSurrogateItemId() + ", "
										+ "'" + attributeList.getAttributeKey() + "', "
										+ "'" + attributeList.getAttributeValue() + "');";
						ps = cs.connect().prepareStatement(sql);
						ps.execute();
						cs.disconnect();
						ps.close();
						
						System.out.println(attributeList.getAttributeKey() + " => " + attributeList.getAttributeValue());
						System.out.println(sql);
					}
				}
				
				/*
				System.out.println("Second " + item.getSurrogateItemId());
				
				Seller seller = itemDetails.getSeller();
				System.out.println("Third " + item.getSurrogateItemId() + " " + seller.getSurrogateSellerId());
				ps = cs.connect().prepareStatement("INSERT INTO sellers(item_id, seller_id) VALUES (?, ?)");
				ps.setInt(1, item.getSurrogateItemId());
				ps.setInt(2, seller.getSurrogateSellerId());
				ps.execute();
				cs.disconnect();
				ps.close();
			*/
				//System.out.println("Fourth " + item.getSurrogateItemId() + " " + itemDetails.getSeller().getSellerId());
				String logMessage = "Item with ID : " + item.getSurrogateItemId() + " is added";
				ps1 = cs.connect().prepareStatement("INSERT INTO logs(log_message) VALUES (?)");
				ps1.setString(1, logMessage);
				ps1.execute();
				cs.disconnect();
				ps1.close();
//			}
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
	}

}
