package com.dao.impl;

import java.sql.Blob;
import java.sql.Timestamp;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dao.CriticismDao;
import com.model.CriticismBean;
import com.model.MemberBean;
import com.model.ProductBean;
import com.service.CriticismService;
import com.service.impl.ProductServiceImpl;

@Repository
public class CriticismDaoImpl implements CriticismDao {

	@Autowired
	SessionFactory factory;

	//新增評論
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
	
	//用roductID分類並顯示
	@SuppressWarnings("unchecked")
	@Override
	public List<CriticismBean> getCriticismByProductId(Integer productID) {
//		String hql = "FROM CriticismBean WHERE ProductID ORDER BY criticismID DESC= :ids";
		String hql = "FROM CriticismBean WHERE ProductID = :ids";
		Session session = factory.getCurrentSession();	
		return session.createQuery(hql)
				.setParameter("ids", productID)
				.getResultList();
	}
	
	//刪除
	@Override
	public boolean deleteCriticism(Integer criticismID) {
		Session session = factory.getCurrentSession();
		String hql = "delete CriticismBean CB where CB.CriticismID = :cId";
		try {
			session.createQuery(hql).setParameter("cId", criticismID).executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
		
	}

	//編輯
	@Override
	public boolean updateCriticism(Integer score, String textContent, Integer criticismID,Blob criticismImage) {
//		String hql = "update CriticismBean CB SET CB.Score = :CS ,  CB SET CB.CreateDate = :CCD "
//				+ ",CB SET CB.TextContent = :CT ," + "CB SET CB.CriticismImage = :CCI ,CB SET CB.ProductID = :CPID ,"
//				+ "CB SET CB.MemberID = :CMID ,CB SET CB.CriticismID = :CCID ";
		System.out.println("dao"+score);
		System.out.println("dao"+textContent);
		System.out.println(criticismID);
		String hql = "update CriticismBean CB SET CB.Score = :CS  , CB.TextContent = :CT, CB.CriticismImage = :img  "
				+ " where CB.CriticismID = :IDD ";
		Session session = factory.getCurrentSession();
		try {
//			session.createQuery(hql).setParameter("CS", score).setParameter("CCD", createDate)
//					.setParameter("CT", textContent).setParameter("CCI", criticismImage).setParameter("CPID", productBean)
//					.setParameter("CMID", memberBean).setParameter("CCID", criticismID).executeUpdate();
			session.createQuery(hql).setParameter("CS", score).setParameter("CT", textContent).setParameter("IDD", criticismID)
									.setParameter("img", criticismImage).executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}


}
