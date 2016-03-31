package com.alux.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.nxf.frame.action.Action;

import com.alux.bean.User;
import com.alux.bean.UserRole;
import com.alux.dao.UserRoleDAO;
import com.alux.service.RoleService;
import com.alux.service.UserRoleService;
import com.alux.service.UserService;


public class UserAction extends Action{

	private static final long serialVersionUID = 1L;
	
	private RoleService roleService;
	private UserService userService;

	public UserAction() {
		setDir("jsp/user");
		userService = new UserService("tbl_user", "com.alux.bean.User");
		roleService = new RoleService("tbl_user_role", "com.alux.bean.Role");
	}
	
	
	public void login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		User currentUser = (User) session.getAttribute("user");
		/*if(currentUser != null){
			if(currentUser.getRole() == 3){
				response.sendRedirect("item.do");
			}else{
				request.getRequestDispatcher("jsp/user/user_login.jsp").forward(request, response);
			}
		}else{
			request.getRequestDispatcher("jsp/user/user_login.jsp").forward(request, response);
		}*/
		
		request.getRequestDispatcher("jsp/user/user_login.jsp").forward(request, response);
		
	}
	public void checkLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		String verifyCode = request.getParameter("verify");
		String sessionVC = (String) session.getAttribute("VerifyCode");
		System.out.println(sessionVC);
		System.out.println(verifyCode);
		if (!verifyCode.equals(sessionVC)) {
			session.setAttribute("vfMsg", "验证码错误");
			response.sendRedirect("user.do?a=login");
			return;
		}
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");

		User user = userService.checkLogin(userName, password);
		if (user != null) {
			if(user.getRole()!=1 && user.getRole()!=3){
				session.setAttribute("user", user);
				response.sendRedirect("index.jsp");
			}else{
				session.setAttribute("errMsg", "您不是买家");
				response.sendRedirect("user.do?a=login");
			}
			
		} else {
			session.setAttribute("errMsg", "用户名密码错误");
			response.sendRedirect("user.do?a=login");
		}
	}
	
	public void listAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserRoleDAO dao = new UserRoleDAO();
		UserRoleService urs = new UserRoleService(dao);
		List<User> userList = urs.selectAllUser();
		request.getSession().setAttribute("userList", userList);
		request.getRequestDispatcher("jsp/user/user_list.jsp").forward(request, response);
	}


	@Override
	public void save(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		//注册新用户
		User user = new User();
		user.setUserName(request.getParameter("userName"));
		user.setPassword(request.getParameter("password"));
		user.setRole(Integer.parseInt(request.getParameter("role")));
		user.setRoleName(request.getParameter("roleName"));
		user.setTel(request.getParameter("tel"));
		user.setEmail(request.getParameter("email"));
		user.setAddress(request.getParameter("address"));
		userService.save(user);
		response.sendRedirect("user.do?a=login");
	}
	public void saveNew(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		//管理员增加新用户
		request.getRequestDispatcher("jsp/user/user_reg.jsp").forward(request, response);
		
	}
	public void saveNewU(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		//管理员增加新用户
		User user = new User();
		user.setUserName(request.getParameter("userName"));
		user.setPassword(request.getParameter("password"));
		user.setRole(Integer.parseInt(request.getParameter("role")));
		user.setRoleName(request.getParameter("roleName"));
		user.setTel(request.getParameter("tel"));
		user.setEmail(request.getParameter("email"));
		user.setAddress(request.getParameter("address"));
		userService.save(user);
		response.sendRedirect("user.do?a=listAll");
	}
	
	public void del(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		Integer id = Integer.parseInt(request.getParameter("id"));
		userService.delete(id);
		response.sendRedirect("user.do?a=listAll");
		
	}
	
	@Override
	public void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		if(id.equals(null)){
			listAll(request,response);
		}
		User user = (User) userService.getOne(Integer.parseInt(id));
		request.setAttribute("user", user);
		request.getRequestDispatcher("jsp/user/user_update.jsp").forward(request, response);
	}
	
	public void updateU(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		user.setUserName(request.getParameter("userName"));
		user.setPassword(request.getParameter("password"));
		user.setRole(Integer.parseInt(request.getParameter("role")));
		user.setRoleName(request.getParameter("roleName"));
		user.setTel(request.getParameter("tel"));
		user.setEmail(request.getParameter("email"));
		user.setAddress(request.getParameter("address"));
		userService.save(user);
		userService.update(user);
		response.sendRedirect("user.do?a=listAll");
	}
	
	public void exit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession().removeAttribute("user");
		response.sendRedirect("item.do?a=itemList");
	}
}