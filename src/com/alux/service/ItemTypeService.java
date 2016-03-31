package com.alux.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.nxf.frame.service.AbstractService;

import com.alux.bean.ItemType;
import com.alux.dao.ItemTypeDAO;

public class ItemTypeService extends AbstractService {
	List<ItemType> newList = new ArrayList<ItemType>();
	List<?> oldList = null;

	public ItemTypeService(String table_name, String bean_name) {
		super(table_name, bean_name);
		// TODO Auto-generated constructor stub
	}
	
	public List<ItemType> parseCategory() {
		try {
			oldList = dao.select("");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		parse(0, "");
		return newList;
	}

	private void parse(int pid, String s) {
		for (int i = 0; i < oldList.size(); i++) {
			ItemType c = (ItemType) oldList.get(i);
			if (c.getPid() == pid) {
				c.setTypeName(s + c.getTypeName());
				newList.add(c);
				parse(c.getId(), s + "&nbsp;&nbsp;");
			}
		}
	}
	
	public int getMaxId() throws SQLException{
		ItemTypeDAO itemTypeDao = new ItemTypeDAO();
		return itemTypeDao .getMaxId();
	}
}