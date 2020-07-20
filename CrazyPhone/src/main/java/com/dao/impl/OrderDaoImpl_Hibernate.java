package com.dao.impl;

import java.sql.Connection;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dao.OrderDao;
import com.model.OrdersBean;

@Repository
public class OrderDaoImpl_Hibernate implements OrderDao {
	private String MemberID=null;
	@Autowired
	private SessionFactory factory;
	int orderID=0;
	public OrderDaoImpl_Hibernate() {
	}
	@Override
	public void insertOrder(OrdersBean ob) {
		Session session=factory.getCurrentSession();
		session.save(ob);
	}
	public OrdersBean getOrder(int orderID) {
		OrdersBean ob=null;
		Session session=factory.getCurrentSession();
		ob=session.get(OrdersBean.class, orderID);
		return ob;
	}
	public String getMemberId() {
		return MemberID;
	}
	public void setMemberId(String MemberId) {
		this.MemberID=MemberID;
	}
	public void setConnection(Connection con) {
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OrdersBean> getAllOrders() {
		List<OrdersBean> list = null;
		String hql = "FROM OrdersBean";
		Session session = factory.getCurrentSession();

		list = session.createQuery(hql).getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OrdersBean> getMemberOrders(String MemberId) {
		List<OrdersBean> list = null;
        Session session = factory.getCurrentSession();
        String hql = "FROM OrdersBean ob WHERE ob.MemberId = :mid";
        list = session.createQuery(hql)
        			  .setParameter("mid", MemberId)
        			  .getResultList();
        return list;
	}
}