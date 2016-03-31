package com.alux.service;

import java.util.List;

import org.nxf.frame.service.AbstractService;

import com.alux.bean.Item;
import com.alux.dao.ItemAndTypeDAO;

public class ItemService extends AbstractService{
	private List<?> list;

	public ItemService(String table_name, String bean_name) {
		super(table_name, bean_name);
		// TODO Auto-generated constructor stub
	}
	
	public List<?> getByType(int type){
		try {
		 list = dao.select(" itemType="+type);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public Item getById(Integer id) {
		// TODO Auto-generated method stub
		ItemAndTypeDAO iat = new ItemAndTypeDAO();
		Item item = new Item();
		try {
			item = iat.getById(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return item;
	}
}