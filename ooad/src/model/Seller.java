package model;

public class Seller {

	private int surrogateSellerId;
	private String sellerId;
	private String sellerName;
	private String sellerAddress;
	
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
	
}
