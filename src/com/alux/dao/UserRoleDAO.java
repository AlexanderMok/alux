package com.alux.dao;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.nxf.frame.dao.DAO;

import com.alux.bean.User;
import com.alux.bean.UserRole;

public class UserRoleDAO extends DAO {
	private Statement st;
	private ResultSet rs;

	public List<UserRole> select() throws Exception {
		String sql = "select tbl_user.id,tbl_user.userName,tbl_user.password,tbl_user_role.id,tbl_user_role.roleName from tbl_user inner join tbl_user_role on tbl_user.role=tbl_user_role.id";
		List<UserRole> list = new ArrayList<UserRole>();
		st = this.getConn().createStatement();
		rs = st.executeQuery(sql);

		while (rs.next()) {
			UserRole useRole = new UserRole();
			useRole.getUser().setUserName(rs.getString("userName"));
			useRole.getUser().setPassword(rs.getString("password"));
			useRole.getRole().setRoleName(rs.getString("roleName"));
			list.add(useRole);
		}
		rs.close();
		st.close();
		return list;
	}

	public List<User> selectAllUser() throws Exception {
		String sql = "select tbl_user.id,tbl_user.userName,tbl_user.password,tbl_user_role.id,tbl_user_role.roleName,tbl_user.tel,tbl_user.email,tbl_user.address from tbl_user inner join tbl_user_role on tbl_user.role=tbl_user_role.id where userName != 'admin'";
		List<User> userList = new ArrayList<User>();
		st = this.getConn().createStatement();
		rs = st.executeQuery(sql);
		while (rs.next()) {
			User user = new User();
			user.setId(rs.getInt(1));
			user.setUserName(rs.getString("userName"));
			user.setPassword(rs.getString("password"));
			user.setRoleName(rs.getString("roleName"));
			user.setEmail(rs.getString("email"));
			user.setTel(rs.getString("tel"));
			user.setAddress(rs.getString("address"));
			userList.add(user);
		}
		st.close();
		rs.close();
		return userList;

	}
}