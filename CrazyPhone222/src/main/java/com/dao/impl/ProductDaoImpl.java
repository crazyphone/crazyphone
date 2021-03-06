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
import com.model.ProductBean;
import com.model.ProductBeanWithImageData;

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
		String hql = "SELECT DISTINCT p.brandBean.BrandName FROM ProductBean p";
		Session session = factory.getCurrentSession();
		List<String> list = new ArrayList<>();
		list = session.createQuery(hql).getResultList();
		return list;
	}

	
	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> searchProduct(String productname) {
		String hql = "FROM ProductBean p WHERE p.brandBean.BrandName like :brandname or p.ProductName like :productname";
		Session session = factory.getCurrentSession();
		List<ProductBean> list = null;
		try {
			list = session.createQuery(hql).setParameter("brandname", "%" + productname + "%")
					.setParameter("productname", "%" + productname + "%").getResultList();
		} catch (NoResultException ex) {
			;
		} catch (NonUniqueResultException ex) {
			;
		}
		return list;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getProductsByBrand(String brand) {
		String hql = "FROM ProductBean pb WHERE pb.brandBean.BrandName = :category";
		Session session = factory.getCurrentSession();
		List<ProductBean> list = new ArrayList<>();
		list = session.createQuery(hql).setParameter("category", brand).getResultList();
		return list;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getProductsByPrice(Integer priceL, Integer priceH) {
		String hql = null;
		Session session = factory.getCurrentSession();
		List<ProductBean> list = new ArrayList<>();
		if (priceL.equals(priceH)) {
			hql = "FROM ProductBean pb WHERE pb.UnitPrice = :priceL ORDER BY pb.UnitPrice DESC";
			list = session.createQuery(hql).setParameter("priceL", priceL).getResultList();
		} else {
			hql = "FROM ProductBean pb WHERE pb.UnitPrice >= :priceL "
					+ " AND pb.UnitPrice < :priceH ORDER BY pb.UnitPrice DESC";
			list = session.createQuery(hql).setParameter("priceL", priceL).setParameter("priceH", priceH)
					.getResultList();
		}

		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBeanWithImageData> getBrandName(String brandName) {
		List<ProductBeanWithImageData> listTarget = new ArrayList<ProductBeanWithImageData>();
		String hql = "FROM ProductBean p WHERE p.brandBean.BrandName = :brandName ";
		Session session  = factory.getCurrentSession();
		List<ProductBean> list = session.createQuery(hql)
										.setParameter("brandName", brandName)
										.getResultList();
		for (ProductBean productBean : list) {
			System.out.println(productBean.getProductName()+"-----------------");
			ProductBeanWithImageData p = new ProductBeanWithImageData();
			//p.setBean(productBean);
			p.setProductIntro(productBean.getProductIntro());
			p.setProductName(productBean.getProductName());
			p.setStockQuantity(productBean.getStockQuantity());
			p.setUnitPrice(productBean.getUnitPrice());
			p.setImageData(productBean.getProductFileName());
			p.setProductID(productBean.getProductID());
			listTarget.add(p);
		}
		return listTarget;
	}
}
