package com.shop.dao;

import java.sql.SQLException;
import java.util.List;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import com.shop.pojo.Product;
import com.shop.utils.C3P0Utils;
import com.shop.utils.PageBean;

public class ProductDao {
	/**
	 * 获取热门商品
	 * @return
	 * @throws SQLException 
	 */
	public List<Product> getHotProduct() throws SQLException{
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from product where is_hot = ? limit ?,?";
		List<Product> productList = queryRunner.query(sql,new BeanListHandler<Product>(Product.class),1,1,3);
		return productList;
	}
	/**
	 * 获得最新商品
	 * @return
	 * @throws SQLException
	 */
	public List<Product> getNewProduct() throws SQLException{
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from product order by pdate desc limit ?,?"; 
		List<Product> productList = queryRunner.query(sql,new BeanListHandler<Product>(Product.class),1,12);
		return productList;
	}
	/**
	 * 通过商品id查询商品详细信息
	 * @param id
	 * @return
	 * @throws SQLException 
	 */
	public Product getProductById(String id) throws SQLException {
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from product where pid = ?"; 
		Product product = queryRunner.query(sql,new BeanHandler<Product>(Product.class),id);
		return product;
	}
	/**
	 * 根据分类id查询商品列表
	 * @param cid
	 * @return
	 */
	public List<Product> getProductListByCid(int cid,PageBean pageBean) throws SQLException{
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from product where cid = ? limit ?,?";
		List<Product> productList = queryRunner.query(sql,new BeanListHandler<Product>(Product.class),cid,pageBean.getStart(),pageBean.getRows());
		return productList;
	}
	/**
	 * 
	 * @param cid
	 * @return
	 * @throws SQLException 
	 */
	public int getTotal(int cid) throws SQLException {
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from product where cid = ?";
		List<Product> productList = queryRunner.query(sql,new BeanListHandler<Product>(Product.class),cid);
		return productList.size();
	}
	/**
	 * 以表格形式展示商品信息
	 * @return 
	 * @throws SQLException
	 */
	public List<Product> getProductList(PageBean pageBean) throws SQLException {
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select pid, pname, market_price, shop_price, is_hot, cid from product limit ?,?";
		List<Product> productList = queryRunner.query(sql, new BeanListHandler<Product>(Product.class),pageBean.getStart(),pageBean.getRows());
		return productList;
	}
	/**
	 * 统计全部商品数量
	 * @return
	 * @throws SQLException
	 */
	public int getProductTotal() throws SQLException {
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from product";
		List<Product> productList = queryRunner.query(sql, new BeanListHandler<Product>(Product.class));
		return productList.size();
	}
	/**
	 * 按照商品号选择商品
	 * @param pid
	 * @return
	 * @throws SQLException
	 */
	public List<Product> searchProduct(String pid) throws SQLException {
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from product where pid = ?";
		List<Product> productList = queryRunner.query(sql, new BeanListHandler<Product>(Product.class), pid);
		return productList;
	}
	/**
	 * 可编辑的商品信息
	 * @param product
	 * @return
	 * @throws SQLException
	 */
	public int updateProduct(Product product) throws SQLException {
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "update product set pname = ?, market_price = ?, shop_price = ?, is_hot = ?, pdesc = ? where pid = ?";
		int rs = queryRunner.update(sql, product.getPname(),
				product.getMarket_price(), 
				product.getShop_price(), 
				product.getIs_hot(), 
				product.getPdesc(), 
				product.getPid());
		return rs;
	}
	/**
	 * 删除商品
	 * @param pid
	 * @return
	 * @throws SQLException
	 */
	public int deleteProduct(String pid) throws SQLException {
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "delete from product where pid = ?";
		int rs = queryRunner.update(sql, pid);
		return rs;
	}
	/**
	 * 新增商品信息
	 * @param product
	 * @return
	 * @throws SQLException
	 */
	public int addProduct(Product product) throws SQLException {
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "insert into product values(?,?,?,?,?,?,?,?,?,?)";
		int rs = queryRunner.update(sql, product.getPid(), 
				product.getPname(), 
				product.getMarket_price(), 
				product.getShop_price(), 
				product.getPimage(), 
				product.getPdate(), 
				product.getIs_hot(), 
				product.getPdesc(), 
				product.getPflag(), 
				product.getCid());
		return rs;
	}
	
}
