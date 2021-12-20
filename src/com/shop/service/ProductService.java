package com.shop.service;

import java.sql.SQLException;
import java.util.List;
import com.shop.dao.ProductDao;
import com.shop.pojo.Product;
import com.shop.utils.PageBean;

public class ProductService {
	
	ProductDao productDao = new ProductDao();
	/**
	 * 获得热门商品
	 * @return
	 */
	public List<Product> getHotProduct(){
		try {
			return productDao.getHotProduct();
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * 获得最新商品
	 * @return
	 */
	public List<Product> getNewProduct(){
		try {
			return productDao.getNewProduct();
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * 通过id查询商品
	 * @param id
	 * @return
	 */
	public Product getProductById(String id) {
		try {
			return productDao.getProductById(id);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 根据分类id查询商品列表
	 * @param cid
	 * @return
	 */
	public List<Product> getProductListByCid(int cid,PageBean pageBean){
		try {
			return productDao.getProductListByCid(cid,pageBean);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * 
	 * @param cid
	 * @return
	 * @throws SQLException 
	 */
	public int getTotal(int cid) {
		try {
			return productDao.getTotal(cid);
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}
	/**
	 * 以表格形式展示商品信息
	 * @return
	 * @throws SQLException
	 */
	public List<Product> getProductList(PageBean pageBean) {
		try {
			return productDao.getProductList(pageBean);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * 统计全部商品数量
	 * @return
	 * @throws SQLException
	 */
	public int getProductTotal() {
		try {
			return productDao.getProductTotal();
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}
	/**
	 * 按照商品号选择商品
	 * @param pid
	 * @return
	 * @throws SQLException
	 */
	public List<Product> searchProduct(String pid) {
		try {
			return productDao.searchProduct(pid);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * 可编辑的商品信息
	 * @param product
	 * @return
	 * @throws SQLException
	 */
	public int updateProduct(Product product) {
		try {
			return productDao.updateProduct(product);
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}
	/**
	 * 删除商品
	 * @param pid
	 * @return
	 * @throws SQLException
	 */
	public int deleteProduct(String pid) {
		try {
			return productDao.deleteProduct(pid);
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}
	/**
	 * 新增商品信息
	 * @param product
	 * @return
	 * @throws SQLException
	 */
	public int addProduct(Product product) {
		try {
			return productDao.addProduct(product);
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
}
