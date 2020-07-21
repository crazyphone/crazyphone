package com.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dao.ProductDao;
import com.model.BrandBean;
import com.model.CriticismBean;
import com.model.MemberBean;
import com.model.ProductBean;

@Repository
public class ProductDaoImpl implements ProductDao {

	@Autowired
	SessionFactory factory;

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getAllProducts() {
		String hql = "FROM ProductBean";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).getResultList();
	}

	@Override
	public ProductBean getProductById(Integer productID) {
		Session session = factory.getCurrentSession();	
		return session.get(ProductBean.class, productID);
	}

	@Override
	public ProductBean getProductPK(Integer productID) {
		Session session =factory.getCurrentSession();
		
		return session.get(ProductBean.class,productID);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getAllCategories() {
		String hql = "SELECT DISTINCT p.brandBean FROM ProductBean p";
		Session session = factory.getCurrentSession();
		List<String> list = new ArrayList<>();
		list = session.createQuery(hql)
					  .getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getProductsByCategory(BrandBean category) {
		String hql = "FROM ProductBean pb WHERE pb.brandBean = :category";
		Session session = factory.getCurrentSession();
		List<ProductBean> list = new ArrayList<>();
		list = session.createQuery(hql)
					  .setParameter("category", category)
					  .getResultList();
		return list;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> searchProduct(String productname) {
		String hql = "FROM ProductBean p WHERE p.brandBean.BrandName like :brandname or p.ProductName like :productname";
		Session session = factory.getCurrentSession();
		List<ProductBean> list=null;
		try {
			list=  session.createQuery(hql)
					.setParameter("brandname", "%"+productname+"%")
					.setParameter("productname", "%"+productname+"%")
					.getResultList();
		} catch (NoResultException ex) {
			;
		} catch (NonUniqueResultException ex) {
			;
		}
		return list;
	}

}
