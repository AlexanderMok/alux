package com.alux.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.nxf.frame.action.Action;

import com.alux.bean.User;
import com.alux.service.UserService;

public class AdminAction extends Action{

	private static final long serialVersionUID = 1L;
	private UserService userService;
	
	public AdminAction(){
		userService = new UserService("tbl_user","com.alux.bean.User");
	}
	
	public void index(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("jsp/admin/admin.jsp").forward(request, response);
		
	}
	
	public void login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//request.getRequestDispatcher("jsp/admin/login.jsp").forward(request, response);
		HttpSession session = request.getSession();
		User currentUser = (User) session.getAttribute("user");
		if(currentUser != null){
			if(currentUser.getRole() == 3 || currentUser.getRole() == 1){
				response.sendRedirect("admin.do");
			}else{
				request.getRequestDispatcher("jsp/admin/login.jsp").forward(request, response);
			}
		}else{
			request.getRequestDispatcher("jsp/admin/login.jsp").forward(request, response);
		}
	}
	
	public void checkLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String verifyCode = request.getParameter("verify");
		String sessionVC = (String)session.getAttribute("VerifyCode");
		System.out.println(verifyCode);
		System.out.println(sessionVC);//这是空的？
		if(!verifyCode.equals(sessionVC)){
			session.setAttribute("vfMsg","验证码错误");
			response.sendRedirect("admin.do?a=login");
			//login(request,response);
			return;
		}
		
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		User user = userService.checkLogin(userName, password);
		
		if(user!=null){
			if (user.getRole()!=3 && user.getRole()!=1){
				session.setAttribute("userMsg", "用户权限不足");
				response.sendRedirect("admin.do?a=login");
			}else{
				session.setAttribute("user", user);
				//response.sendRedirect("jsp/admin/admin.jsp");
				index(request,response);
			}
		}else{
			session.setAttribute("userMsg","用户名错误");
			session.setAttribute("pswMsg","密码错误");
			response.sendRedirect("admin.do?a=login");
		}
		
	}	
}