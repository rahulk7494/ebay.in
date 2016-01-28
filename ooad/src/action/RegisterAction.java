package action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import dao.RegisterDAO;
import dao.implementaion.RegisterDAOImplementation;
import model.Seller;

@SuppressWarnings("serial")
public class RegisterAction extends ActionSupport implements ModelDriven<Seller> {

	private Seller seller = new Seller();
	
	public String execute() {
		
		RegisterDAO registerDAO = new RegisterDAOImplementation();
		if(registerDAO.registerSeller(seller))
			return SUCCESS;
		return ERROR;
	}
	
	@Override
	public Seller getModel() {
		return seller;
	}
}
