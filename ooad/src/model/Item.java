package model;

import java.io.File;

public class Item {

	private int surrogateItemId;
	private String itemId;
	private String itemName;
	private String itemDescription;
	private File itemPicture;
	private Seller seller;
	private int categoryId;
	private int subCategoryId;
	private String itemPictureContentType;
	private String itemPictureFileName;
	private double itemPrice;
	
	public String getItemId() {
		return itemId;
	}

	public void setItemId(String itemId) {
		this.itemId = itemId;
	}
	
	public String getItemName() {
		return itemName;
	}
	
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	
	public File getItemPicture() {
		return itemPicture;
	}
	
	public void setItemPicture(File itemPicture) {
		this.itemPicture = itemPicture;
	}

	public String getItemPictureContentType() {
		return itemPictureContentType;
	}

	public void setItemPictureContentType(String itemPictureContentType) {
		this.itemPictureContentType = itemPictureContentType;
	}

	public String getItemPictureFileName() {
		return itemPictureFileName;
	}

	public void setItemPictureFileName(String itemPictureFileName) {
		this.itemPictureFileName = itemPictureFileName;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public int getSubCategoryId() {
		return subCategoryId;
	}

	public void setSubCategoryId(int subCategoryId) {
		this.subCategoryId = subCategoryId;
	}

	public String getItemDescription() {
		return itemDescription;
	}

	public void setItemDescription(String itemDescription) {
		this.itemDescription = itemDescription;
	}

	public double getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(double itemPrice) {
		this.itemPrice = itemPrice;
	}

	public int getSurrogateItemId() {
		return surrogateItemId;
	}

	public void setSurrogateItemId(int surrogateItemId) {
		this.surrogateItemId = surrogateItemId;
	}

	public Seller getSeller() {
		return seller;
	}

	public void setSeller(Seller seller) {
		this.seller = seller;
	}
}
