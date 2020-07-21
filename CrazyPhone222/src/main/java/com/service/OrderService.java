package com.service;

import java.util.List;

import com.model.OrdersBean;

public interface OrderService {
	void persistOrder(OrdersBean ob);

	public void UpdateOrderToDB(OrdersBean ob) ;
	
	OrdersBean getOrder(int orderNo);

	List<OrdersBean> getAllOrders();

	List<OrdersBean> getMemberOrders(String memberId);
	
	void insertOrder(OrdersBean ob);
}
