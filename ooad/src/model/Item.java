package model;

import java.io.File;
import java.util.Date;
import java.util.List;

public class Item {

	private int surrogateItemId;
	private String itemId;
	private String itemName;
	private String itemDescription;
	private double itemPrice;
	private File itemPicture;
	private String itemPictureContentType;
	private String itemPictureString;
	private String itemAdvertisement;
	private int categoryId;
	private int subCategoryId;
	private Seller seller;
	
	private double itemDiscount;
	private int itemQuantityAvailable;
	private int itemSold;
	private String itemWarrantyPeriod;
	private String itemColor;
	private String itemCondition;
	private String itemWeight;
	private String itemBrand;
	private Date itemExpiryDate;
	private List<AttributeList> attributeList;
	
	private int surrogateAdvtDetailId;
	private double itemAdvtCost;
	private Date itemAdvtFrom;
	private Date itemAdvtTo;
	
	private String sellerID;

	public double getItemDiscount() {
		return itemDiscount;
	}

	public void setItemDiscount(double itemDiscount) {
		this.itemDiscount = itemDiscount;
	}

	public int getItemQuantityAvailable() {
		return itemQuantityAvailable;
	}

	public void setItemQuantityAvailable(int itemQuantityAvailable) {
		this.itemQuantityAvailable = itemQuantityAvailable;
	}

	public int getItemSold() {
		return itemSold;
	}

	public void setItemSold(int itemSold) {
		this.itemSold = itemSold;
	}

	public String getItemWarrantyPeriod() {
		return itemWarrantyPeriod;
	}

	public void setItemWarrantyPeriod(String itemWarrantyPeriod) {
		this.itemWarrantyPeriod = itemWarrantyPeriod;
	}

	public String getItemColor() {
		return itemColor;
	}

	public void setItemColor(String itemColor) {
		this.itemColor = itemColor;
	}

	public String getItemCondition() {
		return itemCondition;
	}

	public void setItemCondition(String itemCondition) {
		this.itemCondition = itemCondition;
	}

	public String getItemWeight() {
		return itemWeight;
	}

	public void setItemWeight(String itemWeight) {
		this.itemWeight = itemWeight;
	}

	public String getItemBrand() {
		return itemBrand;
	}

	public void setItemBrand(String itemBrand) {
		this.itemBrand = itemBrand;
	}

	public Date getItemExpiryDate() {
		return itemExpiryDate;
	}

	public void setItemExpiryDate(Date itemExpiryDate) {
		this.itemExpiryDate = itemExpiryDate;
	}
	
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

	/*public String getItemPictureFileName() {
		return itemPictureFileName;
	}

	public void setItemPictureFileName(String itemPictureFileName) {
		this.itemPictureFileName = itemPictureFileName;
	}
*/
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

	public String getItemPictureString() {
		return itemPictureString;
	}

	public void setItemPictureString(String itemPictureString) {
		this.itemPictureString = itemPictureString;
	}

	public String getItemAdvertisement() {
		return itemAdvertisement;
	}

	public void setItemAdvertisement(String itemAdvertisement) {
		this.itemAdvertisement = itemAdvertisement;
	}

	public String getSellerID() {
		return sellerID;
	}

	public void setSellerID(String sellerID) {
		this.sellerID = sellerID;
	}

	public List<AttributeList> getAttributeList() {
		return attributeList;
	}

	public void setAttributeList(List<AttributeList> attributeList) {
		this.attributeList = attributeList;
	}
	
	public int getSurrogateAdvtDetailId() {
		return surrogateAdvtDetailId;
	}

	public void setSurrogateAdvtDetailId(int surrogateAdvtDetailId) {
		this.surrogateAdvtDetailId = surrogateAdvtDetailId;
	}

	public double getItemAdvtCost() {
		return itemAdvtCost;
	}

	public void setItemAdvtCost(double itemAdvtCost) {
		this.itemAdvtCost = itemAdvtCost;
	}

	public Date getItemAdvtFrom() {
		return itemAdvtFrom;
	}

	public void setItemAdvtFrom(Date itemAdvtFrom) {
		this.itemAdvtFrom = itemAdvtFrom;
	}

	public Date getItemAdvtTo() {
		return itemAdvtTo;
	}

	public void setItemAdvtTo(Date itemAdvtTo) {
		this.itemAdvtTo = itemAdvtTo;
	}

}
