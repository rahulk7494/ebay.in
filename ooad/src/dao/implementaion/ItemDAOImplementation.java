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
			
			/*
			 *	File currentDirFile = new File(".");
			 *	String helper = currentDirFile.getAbsolutePath();
			 *	String currentDir = helper.substring(0, helper.length - currentDirFile.getCanonicalPath().length); 
			 *
			 */
			
			BufferedImage bi = ImageIO.read(item.getItemPicture());
			File saveFile = new File(workingDir + item.getItemPictureFileName());
			ImageIO.write(bi, "png", saveFile);
            
            DBConnection cs = new DBConnection();
			PreparedStatement ps1 = cs.connect().prepareStatement("INSERT INTO item(item_id, item_name, item_picture) VALUES (?, ?, ?)");
			ps1.setString(1, item.getItemId());
			ps1.setString(2, item.getItemName());
			ps1.setString(3, item.getItemPictureFileName());
			if(!ps1.execute())
			{
				cs.disconnect();
				
//				System.out.println("First");
				PreparedStatement ps = cs.connect().prepareStatement("SELECT id FROM item WHERE item_id = ?");
				ps.setString(1, item.getItemId());
				ResultSet rs = ps.executeQuery();
				if(rs.next())
					item.setSurrogateItemId(rs.getInt(1));
				cs.disconnect();
				ps.close();
				rs.close();
				
//				System.out.println("Second " + item.getSurrogateItemId());
				ps = cs.connect().prepareStatement("SELECT id FROM seller WHERE seller_id = ?");
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
				
//				System.out.println("Third " + item.getSurrogateItemId() + " " + seller.getSurrogateSellerId());
				ps = cs.connect().prepareStatement("INSERT INTO item_seller VALUES (?, ?)");
				ps.setInt(1, item.getSurrogateItemId());
				ps.setInt(2, seller.getSurrogateSellerId());
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
			
		    DBConnection cs = new DBConnection();
		    String sql =  "DELETE "
						+ "FROM item "
						+ "WHERE item_id = ? and item_name = ?";
			PreparedStatement ps = cs.connect().prepareStatement(sql);
			ps.setString(1, item.getItemId());
			ps.setString(2, item.getItemName());
			if(!ps.execute())
				cs.disconnect();
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
			Seller seller;
		    DBConnection dbConnection = new DBConnection();
		    String sql =  "SELECT * "
						+ "FROM item_info "
						+ "WHERE item_subcat_id = " + subCategoryId;
			PreparedStatement ps = dbConnection.connect().prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				item = new Item();
				seller = new Seller();
				item.setItemId(rs.getString(2));
				item.setItemName(rs.getString(3));
				item.setItemDescription(rs.getString(4));
				item.setItemPrice(rs.getDouble(6));
				seller.setSellerName(rs.getString(7));
				item.setSeller(seller);
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
