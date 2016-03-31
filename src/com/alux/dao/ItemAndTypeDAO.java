package com.alux.dao;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.nxf.frame.dao.DAO;

import com.alux.bean.Item;
import com.alux.bean.ItemAndType;
import com.alux.bean.ItemType;

public class ItemAndTypeDAO extends DAO {
	private Statement st;
	private ResultSet rs;

	public List<ItemAndType> findAll() throws Exception {
		String sql = "select tbl_item.id,tbl_item.itemName,tbl_item.price,tbl_item.count,"
				+ "tbl_item.itemPic,tbl_item.itemDesc,tbl_item_type.pid,tbl_item_type.typeName "
				+ "from tbl_item INNER JOIN tbl_item_type on tbl_item.itemType=tbl_item_type.id";
		List<ItemAndType> list = new ArrayList<ItemAndType>();
		st = this.getConn().createStatement();
		rs = st.executeQuery(sql);

		while (rs.next()) {
			ItemAndType iat = new ItemAndType();
			Item i = new Item();
			i.setId(rs.getInt("id"));
			i.setItemName(rs.getString("itemName"));
			i.setPrice(rs.getFloat("price"));
			i.setCount(rs.getInt("count"));
			i.setItemPic(rs.getString("itemPic"));
			i.setItemDesc(rs.getString("itemDesc"));
			iat.setItem(i);
			ItemType it = new ItemType();
			it.setPid(rs.getInt("pid"));
			it.setTypeName(rs.getString("typeName"));
			iat.setItemType(it);
			list.add(iat);
		}
		rs.close();
		st.close();
		return list;
	}

	public Item getById(Integer id) throws Exception {
		String sql = "select * from tbl_item where id=" + id;
		st = this.getConn().createStatement();
		rs = st.executeQuery(sql);
		Item i = new Item();
		while (rs.next()) {
			i.setId(rs.getInt("id"));
			i.setItemName(rs.getString("itemName"));
			i.setPrice(rs.getFloat("price"));
			i.setCount(rs.getInt("count"));
			i.setItemPic(rs.getString("itemPic"));
			i.setItemDesc(rs.getString("itemDesc"));
		}
		return i;
	}

	/*
	 * private void save(Item item) throws Exception{ String sql =
	 * "update tbl_item set itemName="+item.getItemName()
	 * +",price="+item.getPrice()+",count="+item.getCount()
	 * +",itemPic="+item.getItemPic()+",itemDesc="+item.getItemDesc(); st =
	 * this.getConn().createStatement(); st.executeUpdate(sql); st.close(); }
	 */
}