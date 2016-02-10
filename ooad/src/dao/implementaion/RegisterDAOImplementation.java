package dao.implementaion;

import java.sql.PreparedStatement;
import dao.DBConnection;
import dao.RegisterDAO;
import model.Seller;

public class RegisterDAOImplementation implements RegisterDAO {

	public boolean registerSeller(Seller seller) {
	
		DBConnection cs = new DBConnection();
		
		try {
			
			PreparedStatement ps = cs.connect().prepareStatement("INSERT INTO users(user_id, user_fname) VALUES (?, ?)");
			ps.setString(1, seller.getSellerId());
			ps.setString(2, seller.getSellerName());
			ps.execute();
			
			String message = "User with ID : " + seller.getSellerId() + " is registered";
			ps = cs.connect().prepareStatement("INSERT INTO logs(log_message) VALUES(?)");
			ps.setString(1, message);
			ps.execute();
			cs.disconnect();
			ps.close();
			
		}
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		cs.disconnect();
		return true;
	}
}
