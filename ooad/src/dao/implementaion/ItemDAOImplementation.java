package dao.implementaion;

import java.awt.image.BufferedImage;
import java.io.File;
import java.sql.PreparedStatement;

import javax.imageio.ImageIO;

import dao.DBConnection;
import dao.ItemDAO;
import model.Item;

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
			PreparedStatement ps = cs.connect().prepareStatement("INSERT INTO item(id, name, picture) VALUES (?, ?, ?)");
			ps.setString(1, item.getItemId());
			ps.setString(2, item.getItemName());
			ps.setString(3, item.getItemPictureFileName());
			if(!ps.execute())
				cs.disconnect();
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
						+ "WHERE id = ? and name = ?";
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

}
