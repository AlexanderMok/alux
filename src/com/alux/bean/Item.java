package com.alux.bean;

public class Item {
	private Integer id;
	private String itemName;
	private Integer itemType;
	private String typeName;
	private Integer count;
	private Float price;
	private String itemPic;// picture
	private String itemDesc;

	public Item() {
	}
	

	public Item(Integer count, Integer id, String itemDesc, String itemName,
			String itemPic, Integer itemType, Float price, String typeName) {
		super();
		this.count = count;
		this.id = id;
		this.itemDesc = itemDesc;
		this.itemName = itemName;
		this.itemPic = itemPic;
		this.itemType = itemType;
		this.price = price;
		this.typeName = typeName;
	}


	public Integer getCount() {
		return count;
	}

	public Integer getId() {
		return id;
	}

	public String getItemDesc() {
		return itemDesc;
	}

	public String getItemName() {
		return itemName;
	}

	public String getItemPic() {
		return itemPic;
	}

	public Integer getItemType() {
		return itemType;
	}

	public Float getPrice() {
		return price;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public void setItemDesc(String itemDesc) {
		this.itemDesc = itemDesc;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public void setItemPic(String itemPic) {
		this.itemPic = itemPic;
	}

	public void setItemType(Integer itemType) {
		this.itemType = itemType;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
}
