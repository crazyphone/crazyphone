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
	public void UpdateOrderToDB(OrdersBean ob) {
		System.out.println("loop 8.0");
		Session session=factory.getCurrentSession();
		//OrdersBean uob = ob;		
		//String hql ="update OrdersBean ob";
		String hql ="update OrdersBean uob SET uob.ProductId = :pd , uob.ProductName = :pn ,"
				+ " uob.Quantity = :qty , uob.DiscountID = :dic , uob.FinalPrice = :fp ,"
				+ " uob.InvoiceNum = :in , uob.ShippedDate = :sda , uob.GoodsStatus = :gs ,"
				+ " uob.OrderID = :oi , uob.getMemberID = :mi , uob.OrderDate = :od ,"
				+ " uob.ShipAddress = :sad , uob.Receiver = :rc , uob.ReceiverPhone = :rcp";
		System.out.println("loop 8.1->"+hql);
		try {
		//	session.createQuery(hql).executeUpdate();
			session.createQuery(hql).setParameter("pd", ob.getProductId())
									.setParameter("pn", ob.getProductName())
									.setParameter("qty",ob.getQuantity())
									.setParameter("dic",ob.getDiscountID())
									.setParameter("fp", ob.getFinalPrice())
									.setParameter("in", ob.getInvoiceNum())
									.setParameter("sda",ob.getShippedDate())
									.setParameter("gs", ob.getGoodsStatus())
									.setParameter("oi", ob.getOrderID())
									.setParameter("mi", ob.getMemberID())
									.setParameter("od", ob.getOrderDate())
									.setParameter("sad",ob.getShipAddress())
									.setParameter("rc", ob.getReceiver())
									.setParameter("rcp",ob.getReceiverPhone())
									.executeUpdate();
		
		}catch (Exception e) {
			System.out.println("loop 8.2-> Error SQL");
			e.printStackTrace();
		}
	
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
		this.MemberID=MemberId;
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