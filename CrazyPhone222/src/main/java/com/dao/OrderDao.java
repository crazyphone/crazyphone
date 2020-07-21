package com.dao;

import java.sql.Connection;
import java.util.List;

import com.model.OrdersBean;

public interface OrderDao {
	void insertOrder(OrdersBean ob);
	void UpdateOrderToDB(OrdersBean ob);
	
	
	void setConnection(Connection con);
	OrdersBean getOrder(int OrderID);
	List<OrdersBean> getAllOrders();
	List<OrdersBean> getMemberOrders(String MemberID);
}
