package com.alux.service;

import java.util.List;

import org.nxf.frame.service.AbstractService;

public class CartService extends AbstractService{

	public CartService(String table_name, String bean_name) {
		super(table_name, bean_name);
		// TODO Auto-generated constructor stub
	}
	
	public List<?> getByUid(Integer uid) {
		try {
			return dao.select("uid="+uid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
