package com.shop.dao;

import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;

import com.shop.pojo.Order;
import com.shop.pojo.OrderItem;
import com.shop.pojo.Product;
import com.shop.pojo.User;
import com.shop.utils.C3P0Utils;
import com.shop.utils.PageBean;

public class OrderDao {
	/**
	 * 保存订单信息
	 * @param order
	 * @throws SQLException
	 */
	public void saveOrder(User user, Order order) throws SQLException {
		QueryRunner runner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "insert into orders values(?,?,?,?,?,?,?,?)";
		runner.update(sql,order.getOid(),order.getOrdertime(),order.getTotal(),order.getState(),
				order.getAddress(),order.getName(),order.getTelephone(),order.getUser().getUid());
	}
	/**
	 * 保存订单内容
	 * @param item
	 * @throws SQLException
	 */
	public void saveItem(OrderItem item) throws SQLException {
		QueryRunner runner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "insert into orderitem values(?,?,?,?,?)";
		runner.update(sql,item.getItemid(),item.getCount(),item.getSubtotal(),item.getProduct().getPid(),item.getOrder().getOid());
	}
	/**
	 * 获取订单
	 * @param uid
	 * @return
	 * @throws SQLException
	 * @throws IllegalAccessException
	 * @throws InvocationTargetException
	 */
	public List<Order> getOrderList(String uid) throws SQLException, IllegalAccessException, InvocationTargetException {
		QueryRunner runner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from orders where uid = ?";
		List<Order> orderList = runner.query(sql,new BeanListHandler<Order>(Order.class),uid);
		for (Order order : orderList) {
			sql = "select * from orderitem o ,product p where o.pid=p.pid and o.oid=?";
			List<Map<String, Object>> olist = runner.query(sql, new MapListHandler(),order.getOid());
			for(Map<String,Object> map:olist) {
				OrderItem item = new OrderItem();
				BeanUtils.populate(item, map);
				Product product = new Product();
				BeanUtils.populate(product, map);
				item.setOrder(order);
				item.setProduct(product);
				order.getOrderItems().add(item);
			}
		}
		return orderList;
	}
	/**
	 * 获取订单信息
	 * @return
	 * @throws SQLException
	 */
	public List<Order> getOrder(PageBean pageBean) throws SQLException {
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from orders limit ?, ?";
		List<Order> orderList = queryRunner.query(sql, new BeanListHandler<Order>(Order.class), pageBean.getStart(), pageBean.getRows());
		return orderList;
	}
	/**
	 * 获取订单内容
	 * @return
	 * @throws SQLException
	 */
	public List<OrderItem> getOrderItem(PageBean pageBean) throws SQLException {
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from orderitem limit ?, ?";
		List<OrderItem> orderItemList = queryRunner.query(sql, new BeanListHandler<OrderItem>(OrderItem.class), pageBean.getStart(), pageBean.getRows());
		return orderItemList;
	}
	/**
	 * 统计订单信息总数
	 * @return
	 * @throws SQLException
	 */
	public int getOrderTotal() throws SQLException {
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from orders";
		List<Order> orderList = queryRunner.query(sql, new BeanListHandler<Order>(Order.class));
		return orderList.size();
	}
	/**
	 * 统计订单内容总数
	 * @return
	 * @throws SQLException
	 */
	public int getOrderItemTotal() throws SQLException {
		QueryRunner queryRunner = new QueryRunner(C3P0Utils.getDataSource());
		String sql = "select * from orderitem";
		List<OrderItem> orderItemList = queryRunner.query(sql, new BeanListHandler<OrderItem>(OrderItem.class));
		return orderItemList.size();
	}

}
