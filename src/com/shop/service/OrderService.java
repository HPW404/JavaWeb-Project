package com.shop.service;

import java.sql.SQLException;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import com.shop.dao.OrderDao;
import com.shop.pojo.Order;
import com.shop.pojo.OrderItem;
import com.shop.pojo.User;
import com.shop.utils.MailUtils;
import com.shop.utils.PageBean;

public class OrderService {
	
	OrderDao orderDao = new OrderDao();
	
	public void saveOrder(User user, Order order) {
		try {
			orderDao.saveOrder(user, order);
			for(OrderItem item:order.getOrderItems()) {
				orderDao.saveItem(item);
			}
			// 邮件标题
			String subject = "订单发货通知";
			// 邮件内容
			String text = "你的订单已发货！";
			MailUtils.sendMail("1569962464@qq.com", user.getEmail(), subject, text);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
	}

	public List<Order> getOrderList(String uid) {
		try {
			return orderDao.getOrderList(uid);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public List<Order> getOrder(PageBean pageBean) {
		try {
			return orderDao.getOrder(pageBean);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public List<OrderItem> getOrderItem(PageBean pageBean) {
		try {
			return orderDao.getOrderItem(pageBean);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public int getOrderTotal() {
		try {
			return orderDao.getOrderTotal();
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	public int getOrderItemTotal() {
		try {
			return orderDao.getOrderItemTotal();
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}
	}
	
}
