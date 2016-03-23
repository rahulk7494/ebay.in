package dao.implementaion;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dao.DBConnection;
import dao.RegisterDAO;
import model.Seller;

public class RegisterDAOImplementation implements RegisterDAO {

	@SuppressWarnings("resource")
	public boolean registerSeller(Seller seller) {
	
		DBConnection cs = new DBConnection();
		
		try {
			
			boolean flag = false;
			
			String sql = "SELECT * FROM users WHERE user_email = ?"; 
			PreparedStatement ps  = cs.connect().prepareStatement(sql);
			ps.setString(1, seller.getSellerEmail());
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				flag = true;
			}
			ps.close();
			rs.close();
			cs.disconnect();
			
			if(flag == true) {
			
				sql = "UPDATE users SET user_type = 2 WHERE user_email = ?";
				ps =  cs.connect().prepareStatement(sql);
				ps.setString(1, seller.getSellerEmail());
				ps.execute();
				ps.close();
				cs.disconnect();
			}
			else {
				
				sql ="INSERT INTO users(user_id, user_name, user_email, user_password, user_type) VALUES (?, ?, ?, ?, ?)";
				ps  = cs.connect().prepareStatement(sql);
				ps.setString(1, seller.getSellerId());
				ps.setString(2, seller.getSellerName());
				ps.setString(3, seller.getSellerEmail());
				ps.setString(4, seller.getSellerPassword());
				ps.setInt(5, 2);
				ps.execute();
				ps.close();
				cs.disconnect();
			}
			
			sql = "SELECT users_id FROM users WHERE user_email = ?";
			ps = cs.connect().prepareStatement(sql);
			ps.setString(1, seller.getSellerEmail());
			rs = ps.executeQuery();
			if(rs.next()) {
				seller.setSurrogateSellerId(rs.getInt(1));
			}
			ps.close();
			rs.close();
			cs.disconnect();
			
			sql = "INSERT INTO sellers(seller_id, seller_name, "
						+ "seller_address, seller_contact_no, seller_email, "
						+ "seller_nature_of_business, seller_category_id) "
						+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
			
			System.out.println(sql);
			ps = cs.connect().prepareStatement(sql);
			ps.setInt(1, seller.getSurrogateSellerId());
			ps.setString(2, seller.getSellerName());
			ps.setString(3, seller.getSellerAddress());
			ps.setString(4, seller.getSellerContactNo());
			ps.setString(5, seller.getSellerEmail());
			ps.setString(6, seller.getSellerNOB());
			ps.setInt(7, seller.getSellerCategoryId());
			ps.execute();
		
			String message = "Seller with ID : " + seller.getSellerEmail() + " is registered";
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
