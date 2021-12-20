package com.shop.controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.pojo.Product;
import com.shop.service.ProductService;

public class EditProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductService productService = new ProductService();
	private ProductFindAllServlet productFindAllServlet = new ProductFindAllServlet();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String pid = request.getParameter("pid");
		String pname = request.getParameter("pname");
		double market_price = Double.parseDouble(request.getParameter("market_price"));
		double shop_price = Double.parseDouble(request.getParameter("shop_price"));
		int is_hot = Integer.parseInt(request.getParameter("is_hot"));
		String pdesc = request.getParameter("pdesc");
		
		Product product = new Product();
		
		product.setPid(pid);
		product.setPname(pname);
		product.setMarket_price(market_price);
		product.setShop_price(shop_price);
		product.setIs_hot(is_hot);
		product.setPdesc(pdesc);
		int rs = productService.updateProduct(product);
		if(rs > 0) {
			response.setContentType("text/html;charset=utf-8"); 
			response.getWriter().println("<script>alert('修改成功！')</script>");
			productFindAllServlet.doGet(request, response);
		} else {
			response.setContentType("text/html;charset=utf-8"); 
			response.getWriter().println("<script>alert('修改失败！')</script>");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
