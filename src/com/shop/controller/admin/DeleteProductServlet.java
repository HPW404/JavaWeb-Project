package com.shop.controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.service.ProductService;

public class DeleteProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductService productService = new ProductService();
	private ProductFindAllServlet productFindAllServlet = new ProductFindAllServlet();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pid = request.getParameter("pid");
		int rs = productService.deleteProduct(pid);
		if(rs > 0) {
			request.setAttribute("message", "删除成功！");
			productFindAllServlet.doGet(request, response);
		} else {
			request.setAttribute("message", "删除失败！");
			productFindAllServlet.doGet(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
