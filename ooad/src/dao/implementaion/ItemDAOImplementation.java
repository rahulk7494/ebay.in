package dao.implementaion;

import java.awt.image.BufferedImage;
import java.io.File;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.imageio.ImageIO;

import dao.DBConnection;
import dao.ItemDAO;
import model.Item;
import model.Seller;

public class ItemDAOImplementation implements ItemDAO {

	@Override
	public boolean addItem(Item item) {
		try {
			
			String workingDir = System.getProperty("user.dir");		// get current working directory
			System.out.println(workingDir);
			System.out.println(item.getItemPictureString());
			
			/*
			 *	File currentDirFile = new File(".");
			 *	String helper = currentDirFile.getAbsolutePath();
			 *	String currentDir = helper.substring(0, helper.length - currentDirFile.getCanonicalPath().length); 
			 *
			 */
		
			String fileName = "";
			DBConnection cs = new DBConnection();
			PreparedStatement ps1 = cs.connect().prepareStatement("SELECT MAX(item_images_id) FROM item_images");
			ResultSet rs1 = ps1.executeQuery();
			
			if(rs1.next()) {
				fileName = (rs1.getInt(1) + 1) + "";
			}
			
			cs.disconnect();
			ps1.close();
			rs1.close();
			
			BufferedImage bi = ImageIO.read(item.getItemPicture());
			File saveFile = new File(workingDir + fileName + ".png");
			ImageIO.write(bi, "png", saveFile);
			
			item.setItemPictureString("eclipse" + fileName + ".png");
			
			System.out.println("new " + item.getItemPictureString());
			
            cs = new DBConnection();
			ps1 = cs.connect().prepareStatement("INSERT INTO items(item_id, item_name, item_cat_id, item_subcat_id, item_price,item_desc) VALUES (?, ?,?,?,?,?)");
			ps1.setString(1, item.getItemId());
			ps1.setString(2, item.getItemName());
			ps1.setInt(3, item.getCategoryId());
			ps1.setInt(4, item.getSubCategoryId());
			ps1.setDouble(5,item.getItemPrice());
			ps1.setString(6,item.getItemDescription());
			System.out.println("Rohit:"+item.getCategoryId()+" "+item.getSubCategoryId());
			if(!ps1.execute())
			{
				cs.disconnect();
				
				System.out.println("First");
				PreparedStatement ps = cs.connect().prepareStatement("SELECT items_id FROM items WHERE item_id = ?");
				ps.setString(1, item.getItemId());
				ResultSet rs = ps.executeQuery();
				if(rs.next())
					item.setSurrogateItemId(rs.getInt(1));
				cs.disconnect();
				ps.close();
				rs.close();
				
				System.out.println("First first");
				ps = cs.connect().prepareStatement("INSERT INTO item_images(item_id, item_image) VALUES(?, ?)");
				ps.setInt(1, item.getSurrogateItemId());
				ps.setString(2, item.getItemPictureString());
				ps.execute();
				cs.disconnect();
				ps.close();
				
				System.out.println("Second " + item.getSurrogateItemId());
				ps = cs.connect().prepareStatement("SELECT users_id FROM users WHERE user_id = ?");
				ps.setString(1, item.getSeller().getSellerId());
				rs = ps.executeQuery();
				Seller seller = new Seller();
				if(rs.next())
				{
					seller.setSurrogateSellerId(rs.getInt(1));
				}
				cs.disconnect();
				ps.close();
				rs.close();
				
				System.out.println("Third " + item.getSurrogateItemId() + " " + seller.getSurrogateSellerId());
				ps = cs.connect().prepareStatement("INSERT INTO item_sellers(item_id, seller_id) VALUES (?, ?)");
				ps.setInt(1, item.getSurrogateItemId());
				ps.setInt(2, seller.getSurrogateSellerId());
				ps.execute();
				cs.disconnect();
				ps.close();
				
				System.out.println("Fourth " + item.getSurrogateItemId() + " " + seller.getSurrogateSellerId());
				String logMessage = "Item with ID : " + item.getSurrogateItemId() + " is added";
				ps = cs.connect().prepareStatement("INSERT INTO logs(log_message) VALUES (?)");
				ps.setString(1, logMessage);
				ps.execute();
				cs.disconnect();
				ps.close();
			}
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
	}

	@Override
	public boolean deleteItem(Item item) {
		try {
			
			int surrogateItemId = 0;
			
		    DBConnection cs = new DBConnection();
			PreparedStatement ps = cs.connect().prepareStatement("SELECT items_id FROM items WHERE item_id = ?");
			ps.setString(1, item.getItemId());
			ResultSet rs = ps.executeQuery();
			if(rs.next())
				surrogateItemId = rs.getInt(1);
			
			ps = cs.connect().prepareStatement("DELETE FROM item_sellers WHERE item_id = ?");
			ps.setInt(1, surrogateItemId);
			ps.execute();
			cs.disconnect();
			ps.close();
			
			System.out.println("Hello");
		    String sql =  "DELETE "
						+ "FROM items "
						+ "WHERE items_id = ?";
		    ps = cs.connect().prepareStatement(sql);
			ps.setInt(1, surrogateItemId);
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
//				seller.setSellerName(rs.getString(7));
//				item.setSeller(seller);
				
				String sql1 = "SELECT item_image FROM item_images WHERE item_id = ?";
				DBConnection dbConnection2 = new DBConnection();
				PreparedStatement ps1 = dbConnection2.connect().prepareStatement(sql1);
				ps1.setInt(1, item.getSurrogateItemId());
				ResultSet rs1 = ps1.executeQuery();
				while(rs1.next()) {
					item.setItemPictureString(rs1.getString(1));
					System.out.println("---------" + item.getItemPictureString());
				}
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

}
