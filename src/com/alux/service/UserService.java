package com.alux.service;

import java.util.List;

import org.nxf.frame.service.AbstractService;

import com.alux.bean.User;


public class UserService extends AbstractService{

	public UserService(String table_name, String bean_name) {
		super(table_name, bean_name);
		// TODO Auto-generated constructor stub
	}
	
	public User checkLogin(String userName, String password) {
		String str = " userName='"+userName+"' and password='"+password+"'";
		List<?> list = this.select(str);
		
		User user= null;
		
		if(!list.isEmpty()){
			user = (User)list.get(0);
		}
		return user;
	}
}