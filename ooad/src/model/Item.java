package model;

import java.io.File;

public class Item {

	private String itemId;
	private String itemName;
	private File itemPicture;
	private String categoryName;
	private String subCategoryName;
	private String itemPictureContentType;
	private String itemPictureFileName;
	
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

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getSubCategoryName() {
		return subCategoryName;
	}

	public void setSubCategoryName(String subCategoryName) {
		this.subCategoryName = subCategoryName;
	}
}
