package model;

public class Seller {

	private int surrogateSellerId;
	private String sellerId;
	private String sellerName;
	private String sellerAddress;
	private String sellerContactNo;
	private String sellerEmail;
	private String sellerPassword;
	private String sellerNOB;	//	Nature of Business
	private int sellerRating;
	private int sellerCategoryId;
	private double sellerBalance;
	
	public String getSellerContactNo() {
		return sellerContactNo;
	}

	public void setSellerContactNo(String sellerContactNo) {
		this.sellerContactNo = sellerContactNo;
	}

	public String getSellerEmail() {
		return sellerEmail;
	}

	public void setSellerEmail(String sellerEmail) {
		this.sellerEmail = sellerEmail;
	}

	public String getSellerNOB() {
		return sellerNOB;
	}

	public void setSellerNOB(String sellerNOB) {
		this.sellerNOB = sellerNOB;
	}

	public int getSurrogateSellerId() {
		return surrogateSellerId;
	}

	public void setSurrogateSellerId(int surrogateSellerId) {
		this.surrogateSellerId = surrogateSellerId;
	}

	public String getSellerId() {
		return sellerId;
	}

	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}

	public String getSellerName() {
		return sellerName;
	}

	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
	}

	public String getSellerAddress() {
		return sellerAddress;
	}

	public void setSellerAddress(String sellerAddress) {
		this.sellerAddress = sellerAddress;
	}

	public int getSellerRating() {
		return sellerRating;
	}

	public void setSellerRating(int sellerRating) {
		this.sellerRating = sellerRating;
	}

	public int getSellerCategoryId() {
		return sellerCategoryId;
	}

	public void setSellerCategoryId(int sellerCategoryId) {
		this.sellerCategoryId = sellerCategoryId;
	}

	public double getSellerBalance() {
		return sellerBalance;
	}

	public void setSellerBalance(double sellerBalance) {
		this.sellerBalance = sellerBalance;
	}

	public String getSellerPassword() {
		return sellerPassword;
	}

	public void setSellerPassword(String sellerPassword) {
		this.sellerPassword = sellerPassword;
	}
	
}
