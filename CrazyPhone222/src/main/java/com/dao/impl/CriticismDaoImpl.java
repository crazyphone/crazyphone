package com.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dao.CriticismDao;
import com.model.CriticismBean;
import com.model.ProductBean;
import com.service.CriticismService;
import com.service.impl.ProductServiceImpl;

@Repository
public class CriticismDaoImpl implements CriticismDao {

	@Autowired
	SessionFactory factory;

	//第一個DAO實作(用來顯示所有評論)
	//0703測試ok
	@SuppressWarnings("unchecked")
	@Override
	public List<CriticismBean> getAllCriticism() {
		String hql = "FROM CriticismBean";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).getResultList();
	}
	
	//第二個DAO實作(新增評論)
	@Override
	public void addCriticism(CriticismBean criticism) {
		Session session = factory.getCurrentSession();
	
		session.save(criticism);
	}

	@Override
	public CriticismBean getCriticismById(Integer criticismID) {
		Session session = factory.getCurrentSession();	
		return session.get(CriticismBean.class, criticismID);
	}
	
	//第三個DAO實作(用criticismID分類並顯示)
	@SuppressWarnings("unchecked")
	@Override
	public List<Integer> getAllIds() {
		String hql = "SELECT DISTINCT c.ProductID FROM CriticismBean c";
		Session session = factory.getCurrentSession();		
		return session.createQuery(hql).getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CriticismBean> getCriticismByProductId(Integer productID) {
		String hql = "FROM CriticismBean WHERE ProductID = :ids";
		Session session = factory.getCurrentSession();	
		
		return session.createQuery(hql)
				.setParameter("ids", productID)
				.getResultList();
	}


	

//	@Override
//	public MemberBean getMemberById(int memberID) {
//		Session session = factory.getCurrentSession();	
//		return session.get(MemberBean.class, memberID);
//	}
//	
//
//	

	

}
