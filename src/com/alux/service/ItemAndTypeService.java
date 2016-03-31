package com.alux.service;

import java.util.List;

import org.nxf.frame.dao.DAO;
import org.nxf.frame.service.AbstractService;

import com.alux.dao.ItemAndTypeDAO;

public class ItemAndTypeService extends AbstractService{

	public ItemAndTypeService(DAO dao) {
		super(dao);
		// TODO Auto-generated constructor stub
	}
	
	
	public ItemAndTypeService(String table_name, String bean_name) {
		super(table_name, bean_name);
		// TODO Auto-generated constructor stub
	}


	public List<?> getItemType(){
		ItemAndTypeDAO d = new ItemAndTypeDAO();
		try {
			return d.findAll();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
}