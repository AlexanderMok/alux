package com.alux.service;

import java.util.List;

import org.nxf.frame.dao.DAO;
import org.nxf.frame.service.AbstractService;

import com.alux.bean.User;
import com.alux.bean.UserRole;
import com.alux.dao.UserRoleDAO;

public class UserRoleService extends AbstractService{
	private UserRoleDAO urd;
	
	public UserRoleService(String table_name, String bean_name) {
		super(table_name, bean_name);
		// TODO Auto-generated constructor stub
	}

	public UserRoleService(DAO dao) {
		super(dao);
		urd = (UserRoleDAO) dao;
		// TODO Auto-generated constructor stub
	}

	public List<UserRole> select() {
		// TODO Auto-generated method stub
		List<UserRole> userList = null;
		try {
			userList = urd.select();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return userList;
	}
	
	public List<User> selectAllUser() {
		List<User> userList = null;
		try {
			userList = urd.selectAllUser();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return userList;
	}
}
