package com.shop.controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.pojo.User;
import com.shop.service.UserService;

public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UserService service = new UserService();
		
		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		User user = service.login(username, password);
		if(user == null) {
			request.setAttribute("username", username);
			request.setAttribute("password", password);
			request.getSession().setAttribute("message", "用户名或密码错误！");
			request.getRequestDispatcher("admin/adminLogin.jsp").forward(request, response);
		}
		request.getSession().setAttribute("username", username);
		request.getSession().setAttribute("user", user);
		request.getRequestDispatcher("admin/admin.jsp").forward(request, response);;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
