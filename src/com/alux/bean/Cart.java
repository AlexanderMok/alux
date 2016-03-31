package com.alux.bean;

public class Cart {
	
	private Integer id;
	private Integer uid;
	private Integer itemId;
	private String itemName;
	private Float price;
	private String buyTime;
	private Integer buyTotal;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public Integer getItemId() {
		return itemId;
	}
	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}	
	public Float getPrice() {
		return price;
	}
	public void setPrice(Float price) {
		this.price = price;
	}
	public String getBuyTime() {
		return buyTime;
	}
	public void setBuyTime(String buyTime) {
		this.buyTime = buyTime;
	}
	public Integer getBuyTotal() {
		return buyTotal;
	}
	public void setBuyTotal(Integer buyTotal) {
		this.buyTotal = buyTotal;
	}
}
