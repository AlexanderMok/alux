package com.alux.action;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.nxf.frame.action.Action;
import org.nxf.frame.service.IService;

import com.alux.bean.Cart;
import com.alux.bean.Item;
import com.alux.bean.ItemType;
import com.alux.bean.User;
import com.alux.service.CartService;
import com.alux.service.ItemAndTypeService;
import com.alux.service.ItemService;
import com.alux.service.ItemTypeService;

public class ItemAction extends Action {
	private static final long serialVersionUID = 1L;

	private ItemTypeService itemTypeService;

	private ItemService itemService;

	private ArrayList<Cart> al = null;

	private CartService cartService;

	private ItemAndTypeService itemAndTypeService;

	private List<FileItem> fileItem;

	public ItemAction() {
		this.setDir("jsp/item");
		cartService = new CartService("tbl_item_cart", "com.alux.bean.Cart");
		itemService = new ItemService("tbl_item", "com.alux.bean.Item");
		itemTypeService = new ItemTypeService("tbl_item_type",
				"com.alux.bean.ItemType");

	}

	public void index(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		itemList(request, response);
	}

	// �����Ʒ
	public void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<?> typeList = itemTypeService.parseCategory();
		request.getSession().setAttribute("typeList", typeList);
		request.getRequestDispatcher("jsp/item/addItem.jsp").forward(request,
				response);
	}

	public void del(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		if (id.equals("")) {
			response.sendRedirect("item.do?a=itemListAd");
		}
		itemService.delete(Integer.parseInt(id));
		response.sendRedirect("item.do?a=itemListAd");
	}

	public void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		if (id.equals("")) {
			response.sendRedirect("item.do?a=itemListAd");
		}
		List<?> typeList = itemTypeService.parseCategory();
		request.getSession().setAttribute("typeList", typeList);
		Item item = (Item) itemService.getOne(Integer.parseInt(id));
		request.setAttribute("item", item);
		request.getRequestDispatcher("jsp/item/item_update.jsp").forward(
				request, response);
	}

	// �����Ʒ�ϴ�ͼƬ
	public void upload(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if (!isMultipart) {
			return;
		}
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(1024);// set cache
		String path = request.getServletContext().getRealPath("/upload");// upload
																			// path
		factory.setRepository(new File(path));// set upload path

		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setHeaderEncoding("utf-8");// parse encoding
		Item item = new Item();

		fileItem = upload.parseRequest(request);// parse request
		// ��ȡ����

		Iterator<FileItem> itr = fileItem.iterator();
		while (itr.hasNext()) {
			FileItem context = itr.next();
			// to see if isUploadField
			if (context.isFormField()) {
				processFormFile(context, item);
			} else {
				processUploadFile(context, item, path);
			}
		}
		itemService.save(item);
		response.sendRedirect("item.do?a=itemListAdmin");
	}

	private void processFormFile(FileItem context, Item item) throws Exception {
		String fieldName = context.getFieldName();
		String field = new String(context.getString().getBytes("ISO-8859-1"),
				"UTF-8");
		switch (fieldName) {
		case "itemName":
			item.setItemName(field);
			break;
		case "itemType":
			System.out.println(field);
			item.setItemType(Integer.parseInt(field));
			break;
		case "count":
			item.setCount(Integer.parseInt(field));
			break;
		case "price":
			item.setPrice(Float.parseFloat(field));
			break;
		case "itemDesc":
			item.setItemDesc(field);
			break;
		}
	}

	private void processUploadFile(FileItem context, Item item, String path)
			throws Exception {
		String fileName = context.getName();// ����ļ���
		Integer start = fileName.indexOf(".");
		String extend = fileName.substring(start);
		Date inputTime = new Date();

		String itemPic = "upload/"
				+ new SimpleDateFormat("yyyyMMddHHmmss").format(inputTime)
				+ extend;
		item.setItemPic(itemPic);

		File desc = new File(path,
				new SimpleDateFormat("yyyyMMddHHmmss").format(inputTime)
						+ extend);
		context.write(desc);
	}

	// �̳���ҳ��Ʒ�б�
	public void itemList(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		List<?> itemList = itemService.getAll();
		request.getSession().setAttribute("itemList", itemList);
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	public void show(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		Item item = new Item();
		item = itemService.getById(Integer.parseInt(id));
		request.setAttribute("item", item);
		request.getRequestDispatcher("jsp/item/itemDetail.jsp").forward(
				request, response);
	}

	// ��̨��Ʒ�б�
	public void itemListAdmin(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		List<?> itemList = itemService.getAll();
		request.getSession().setAttribute("itemList", itemList);
		request.getRequestDispatcher("jsp/item/itemList.jsp").forward(request,
				response);
	}

	public void itemListAd(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("jsp/item/itemList.jsp").forward(request,
				response);
	}

	public void itemListOrder(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		List<?> itemList = itemService.getAll();
		request.getSession().setAttribute("itemList", itemList);
		request.getRequestDispatcher("item.do?a=itemListOr").forward(request,
				response);
	}

	public void itemListOr(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("jsp/item/itemListOrder.jsp").forward(
				request, response);
	}

	// ��Ʒ�����б�

	public void typeList(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		List<?> list = this.itemService.getByType(Integer.parseInt(id));
		request.setAttribute("list", list);
		request.getRequestDispatcher("jsp/item/itemList.jsp").forward(request,
				response);
	}

	// �����Ʒ����
	public void addType(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		List<?> typeList = itemTypeService.parseCategory();
		request.getSession().setAttribute("typeList", typeList);
		request.getRequestDispatcher("jsp/item/addItemType.jsp").forward(request, response);
		String first = request.getParameter("first");
		String second = request.getParameter("second");
		String third = request.getParameter("third");
		Integer	maxId = itemTypeService.getMaxId();
		List<?> list = itemTypeService.getAll();
		Map<Integer, String> l1 = new HashMap<Integer, String>();
		Map<Integer, String> l2 = new HashMap<Integer, String>();
		Map<Integer, String> l3 = new HashMap<Integer, String>();
		int pid = 0;
		int pid2 = 0;
		for (Object o : list) {
			ItemType gt = (ItemType) o;
			if (gt.getPid() == 0) {
				l1.put(gt.getId(), gt.getTypeName());
			}
		}
		Set set = l1.keySet();
		for (Object o : list) {
			ItemType gt = (ItemType) o;
			for (Object key : set) {
				if (gt.getPid() == key) {
					l2.put(gt.getId(), gt.getTypeName());
				}
				if (l1.get(key).equals(first) ){
					pid = (int) key;
				}
			}
		}
		Set set2 = l2.keySet();
		for (Object o : list) {
			ItemType gt = (ItemType) o;
			for (Object key : set2) {
				if (gt.getPid() == key) {
					l3.put(gt.getId(), gt.getTypeName());
				}
				if (l2.get(key) .equals(second)) {
					pid2 = (int) key;
				}
			}
		}
	
		if (!l1.containsValue(first)) {
			ItemType g1 = new ItemType();
			g1.setTypeName(first);
			g1.setPid(0);
			itemTypeService.save(g1);
			ItemType g2 = new ItemType();
			g2.setPid(maxId + 1);
			g2.setTypeName(second);
			itemTypeService.save(g2);
			ItemType g3 = new ItemType();
			g3.setPid(maxId + 2);
			g3.setTypeName(third);
			itemTypeService.save(g3);
		}
		if (l1.containsValue(first)&&!l2.containsValue(second)) {
				ItemType g2 = new ItemType();
				g2.setPid(pid);
				g2.setTypeName(second);
				itemTypeService.save(g2);
				ItemType g3 = new ItemType();
				g3.setPid(list.size() + 1);
				g3.setTypeName(third);
				itemTypeService.save(g3);
			}
		if (l1.containsValue(first) && l2.containsValue(second)&&!l3.containsValue(third)) {
				ItemType g3 = new ItemType();
				g3.setPid(pid2);
				g3.setTypeName(third);
				itemTypeService.save(g3);
		}
		typeList(request,response);
	}

	// ���ﳵ
	public void addCart(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// ��ȡsession
		HttpSession session = request.getSession();
		// ��ȡ�ѵ�¼���û�
		User currentUser = (User) session.getAttribute("user");

		// �����û�е�¼��������¼����
		if (currentUser == null) {
			response.sendRedirect("user.do?a=login");
			return;
		}
		// ����һ���洢�����ﳵ��Ʒ��
		Cart cart = new Cart();
		cart.setUid(currentUser.getId());
		// ��ȡҳ�洫�ݹ�������Ʒid
		int itemId = Integer.parseInt(request.getParameter("id"));
		cart.setItemId(itemId);
		cart.setBuyTotal(1);// ��������
		// ��ӹ���ʱ�䣬�ǻ�ȡ��ϵͳʱ��
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		cart.setBuyTime(sdf.format(new Date()));

		// ��ȡ��Ʒ���Ʋ��浽���ﳵ��������
		cart.setItemName(request.getParameter("itemName"));

		// ��Ϊ���ﳵ��Ŷ����Ʒ����ʹ�ü�����,ȥ��ȡsession��������ݡ�
		al = (ArrayList<Cart>) session.getAttribute("shopcart");

		// ���session����û�����ݵ�ʱ��ʹ���һ���µĹ��ﳵ����
		if (al == null) {
			al = new ArrayList<Cart>();
		}
		// ����Ʒ��ӵ����ﳵ��������
		al.add(cart);
		// �ѹ��ﳵ������ӵ�session
		session.setAttribute("shopcart", al);
		// ������Ʒ��ӵ����ݿ�Ĺ��ﳵ������
		cartService.save(cart);
		// ��ת���鿴���ﳵģ��
		response.sendRedirect("item.do?a=showCart");
	}

	public void showCart(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// ��ȡ��½�û���Ϣ
		User u = (User) request.getSession().getAttribute("user");
		// ���û��½����ת����½ҳ��
		if (u == null) {
			response.sendRedirect("user.do?a=login");
			return;
		}
		Integer id = u.getId();// ��ȡ�û�id

		// �����ѵ�¼���û�idȥ�������ݿ⹺�ﳵ��
		ArrayList<Cart> list = (ArrayList<Cart>) cartService.getByUid(id);
		// �ѹ��ﳵ��ӵ�session����
		request.getSession().setAttribute("shopcart", list);

		request.getRequestDispatcher("jsp/item/itemCart.jsp").forward(request,
				response);
	}

	public void deleteCart(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Integer id = Integer.parseInt(request.getParameter("id"));
		cartService.delete(id);
		response.sendRedirect("item.do?a=showCart");
	}

}