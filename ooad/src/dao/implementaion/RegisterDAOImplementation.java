package dao.implementaion;

import java.sql.PreparedStatement;
import dao.DBConnection;
import dao.RegisterDAO;
import model.Seller;

public class RegisterDAOImplementation implements RegisterDAO {

	public boolean registerSeller(Seller seller) {
	
		DBConnection cs = new DBConnection();
		
		try {
			
			PreparedStatement ps = cs.connect().prepareStatement("INSERT INTO seller (id, name, address) VALUES (?, ?, ?)");
			ps.setString(1, seller.getSellerId());
			ps.setString(2, seller.getSellerName());
			ps.setString(3, seller.getSellerAddress());
			ps.execute();
		}
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		cs.disconnect();
		return true;
	}
}
