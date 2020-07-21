package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.MemberDao;
import com.dao.OrderDao;
import com.dao.OrderItemDao;
import com.model.OrdersBean;
import com.service.OrderService;
@Service
public class OrderServiceImpl implements OrderService {
//	private SessionFactory factory;
	@Autowired
	private OrderItemDao oidao;
	@Autowired
	private OrderDao odao;
	@Autowired
	private MemberDao mdao;

	public OrderServiceImpl() {
//		factory = HibernateUtils.getSessionFactory();
//		oidao = new OrderItemDaoImpl_Hibernate();
//		odao = new OrderDaoImpl_Hibernate();
//		mdao = new MemberDaoImpl_Hibernate();
	}
	
	@Transactional
	@Override
	public void UpdateOrderToDB(OrdersBean ob) {
		odao.UpdateOrderToDB(ob);
	}

/*	
	@Transactional
	@Override
	// 這是一個交易
	public void persistOrder(OrdersBean ob) {
//		Session session = factory.getCurrentSession();
//		Transaction tx = null;
//		try {
//			tx = session.beginTransaction();
			// 檢查並更新會員的未付款餘額
			mdao.updateUnpaidOrderAmount(ob);
			// 檢查每筆訂單明細所訂購之商品的庫存數量是否足夠
			checkStock(ob);
			// 儲存該筆訂單
			odao.insertOrder(ob);
//			tx.commit();
//		} catch (Exception e) {
//			if (tx != null)
//				tx.rollback();
//			System.out.println("發生異常，交易回滾.....,原因: " + e.getMessage());
//			throw new RuntimeException(e);
//		}
	}
*/
/*	
	public void checkStock(OrdersBean ob) {
		Set<OrderItemBean> items = ob.getItems();
		for (OrderItemBean oib : items) {
			oidao.updateProductStock(oib);
		}
	}
*/
	public OrderDao getOdao() {
		return odao;
	}
	public void setOdao(OrderDao odao) {
		this.odao = odao;
	}
	
//	@Override
//	// 本方法為過渡版本
//	public OrderBean getOrder(int orderNo) {
//		OrderBean bean = null;
//		Session session = factory.getCurrentSession();
//		Transaction tx = null;
//		try {
//			tx = session.beginTransaction();
//			bean = odao.getOrder(orderNo);
//			tx.commit();
//		} catch (Exception e) {
//			if (tx != null)
//				tx.rollback();
//			throw new RuntimeException(e);
//		}
//		return bean;
//	}
	
	@Transactional
    @Override
    // 本方法將由控制 Lazy Loading 的過濾器之doFilter()方法間接呼叫，所以不可以在此方法內執行與交易
    // 有關的方法
    public OrdersBean getOrder(int orderNo) {
      OrdersBean  bean = null;
      //Session session = factory.getCurrentSession();
      //Transaction tx = null;
      //try {
          //tx = session.beginTransaction();
          bean = odao.getOrder(orderNo);
          //tx.commit();
      //} catch (Exception e) {
          //if (tx != null) tx.rollback();
          //throw new RuntimeException(e);
      //} 
      return bean;
    }
	
    @Transactional
	@Override
	public List<OrdersBean> getAllOrders() {
		List<OrdersBean> list = null;
//		Session session = factory.getCurrentSession();
//		Transaction tx = null;
//		try {
//			tx = session.beginTransaction();
			list = odao.getAllOrders();
//			tx.commit();
//		} catch (Exception e) {
//			if (tx != null)
//				tx.rollback();
//			throw new RuntimeException(e);
//		}
		return list;
	}
  
	@Transactional
	@Override
	public List<OrdersBean> getMemberOrders(String memberId) {
		List<OrdersBean> list = null;
//		Session session = factory.getCurrentSession();
//		Transaction tx = null;
//		try {
//			tx = session.beginTransaction();
			list = odao.getMemberOrders(memberId);
//			tx.commit();
//		} catch (Exception e) {
//			if (tx != null)
//				tx.rollback();
//			throw new RuntimeException(e);
//		}
		return list;
	}
	@Transactional
	@Override
	public void persistOrder(OrdersBean ob) {
		// TODO Auto-generated method stub
		
	}
	@Transactional
	@Override
	public void insertOrder(OrdersBean ob) {
		odao.insertOrder(ob);
		
	}
}
