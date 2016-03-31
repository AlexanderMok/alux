package com.alux.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.nxf.frame.action.Action;
import org.nxf.frame.service.AbstractService;

import com.alux.bean.Item;
import com.alux.bean.Order;
import com.alux.bean.User;
import com.alux.service.CartService;
import com.alux.service.ItemService;
import com.alux.service.OrderService;
import com.alux.service.UserService;

public class OrderAction extends Action {
	private static final long serialVersionUID = 1L;
	private OrderService orderService;
	private UserService userService;
	private ItemService itemService;
	private CartService cartService;

	public OrderAction() {
		orderService = new OrderService("tbl_order", "com.alux.bean.Order");
		userService = new UserService("tbl_user","com.alux.bean.User");
		itemService = new ItemService("tbl_item","com.alux.bean.Item");
		cartService = new CartService("tbl_item_cart","com.alux.bean.Cart");
	}
	//订单列表
	public void orderList(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		List<?> orderList = orderService.getAll();
		request.getSession().setAttribute("orderList", orderList);
		request.getRequestDispatcher("jsp/order/order_list.jsp").forward(
				request, response);
	}
	
	//用户订单列表
	
	public void orderListUser(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		List<?> orderList = orderService.getAllByUser(user.getId());
		request.getSession().setAttribute("orderList", orderList);
		request.getRequestDispatcher("jsp/order/paid.jsp").forward(
				request, response);
	}
	//结算
	public void chkOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("here");
		Integer oid = Integer.parseInt(request.getParameter("id"));
		Order o = (Order) orderService.getOne(oid);
		User u = (User) userService.getOne(o.getUid());
		Item i = (Item) itemService.getOne(o.getGid());
		request.setAttribute("user", u);
		request.setAttribute("item", i);
		request.setAttribute("order", o);
		request.getRequestDispatcher("jsp/order/paid.jsp").forward(request, response);
	}
	
	public void checkOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ids = request.getParameter("ids");
		String[] id = ids.split(",");
		for (String s : id) {
			System.out.println(s);
		}
		Order order = new Order();
		User u = (User) request.getSession().getAttribute("user");
		Integer uid = u.getId();
		order.setUid(uid);
		order.setStatus("");
		order.setTotal(1);
		
		order.setBuyTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));

		for (int i = 0; i < id.length; i++) {
			order.setGid(Integer.parseInt(id[i]));
			orderService.save(order);//提交订单
			cartService.delete(Integer.parseInt(id[i]));//购物车里的商品相应删除
		}
		
		request.getRequestDispatcher("jsp/order/pay.jsp").forward(request, response);
	}
	
	public void status(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Order o = (Order) orderService.getOne(id);
		o.setStatus("1");
		orderService.update(o);
		response.sendRedirect("order.do?a=orderList");
	}
}
