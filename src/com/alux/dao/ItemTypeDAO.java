package com.alux.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.nxf.frame.dao.DAO;

public class ItemTypeDAO extends DAO{
	private Statement st;
	private ResultSet rs;
	public int getMaxId() throws SQLException{
		String sql = "select max(id) from tbl_item_type";
		Integer maxId = 0;
		st = this.getConn().createStatement();
		rs = st.executeQuery(sql);
		while(rs.next()){
			maxId = rs.getInt(1);
		}
		return maxId;
	}
}