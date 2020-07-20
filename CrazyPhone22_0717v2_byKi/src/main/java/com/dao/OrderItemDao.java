package com.dao;

import java.sql.Connection;

import com.model.OrderItemBean;

public interface OrderItemDao {
	double findItemAmout(OrderItemBean oib);
	int updateProductStock(OrderItemBean ob);
	void setConnection(Connection conn);
}
