package com.shop.controller.admin;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.pojo.Product;
import com.shop.service.ProductService;
import com.shop.utils.DateStrUtils;

public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductService productService = new ProductService();
	private ProductFindAllServlet productFindAllServlet = new ProductFindAllServlet();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String pid = request.getParameter("pid");
		String pname = request.getParameter("pname");
		double market_price = Double.parseDouble(request.getParameter("market_price"));
		double shop_price = Double.parseDouble(request.getParameter("shop_price"));
		// 上传图片
		String pimage = request.getParameter("pimage");
		String pimageRoute = "products/" + pimage;
		String pdateStr = request.getParameter("pdate");
		// 日期转换
		Date pdate = DateStrUtils.stringToDate("yyyy-MM-dd", pdateStr);
		int is_hot = Integer.parseInt(request.getParameter("is_hot"));
		String pdesc = request.getParameter("pdesc");
		int pflag = 0;
		int cid = Integer.parseInt(request.getParameter("cid"));
		
		Product product = new Product();
		
		product.setPid(pid);
		product.setPname(pname);
		product.setMarket_price(market_price);
		product.setShop_price(shop_price);
		product.setPimage(pimageRoute);
		product.setPdate(pdate);
		product.setIs_hot(is_hot);
		product.setPdesc(pdesc);
		product.setPflag(pflag);
		product.setCid(cid);
		
		int rs = productService.addProduct(product);
		if(rs > 0) {
			request.setAttribute("message", "添加成功！");
			productFindAllServlet.doGet(request, response);
		} else {
			request.setAttribute("message", "添加失败！");
			request.getRequestDispatcher("admin/addProduct.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
