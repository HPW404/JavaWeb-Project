package com.shop.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.pojo.Product;
import com.shop.service.ProductService;
import com.shop.utils.PageBean;

public class ProductFindAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductService service = new ProductService();
		// 获取当前页码
		String currentPageStr = request.getParameter("currentPage");
		if(currentPageStr == null) {
			currentPageStr = "1";
		}
		int currentPage = Integer.parseInt(currentPageStr);
		// 获取商品总数
		int total = service.getProductTotal();
		// 封装分页
		PageBean pageBean = new PageBean();
		pageBean.setCurrentPage(currentPage);
		pageBean.setRows(8);// 每页显示8条记录
		pageBean.setTotal(total);
		// 调用服务
		List<Product> productList = service.getProductList(pageBean);
		request.setAttribute("productList", productList);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pages", pageBean.getPages());
		request.getRequestDispatcher("admin/productList.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
