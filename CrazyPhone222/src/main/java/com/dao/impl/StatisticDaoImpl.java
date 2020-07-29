package com.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dao.StatisticDao;
@Repository
public class StatisticDaoImpl implements StatisticDao {

	@Autowired
	SessionFactory factory;

	@SuppressWarnings("unchecked")
	@Transactional
	@Override
	public List<Object[]> getBrandOccupy() {
		String hql ="SELECT sum(o.Quantity) , p.brandBean.BrandName FROM OrdersBean o INNER JOIN ProductBean p on p.ProductName =o.ProductName group by p.brandBean.BrandName" ;
		Session session = factory.getCurrentSession();
		
		List<Object[]> results = session.createQuery(hql).getResultList();
		
		for (Object[] result : results) {

			
			
			System.out.println(result[0]);
			System.out.println(result[1]);
	
		}
		return results ; 
	}
	@SuppressWarnings("unchecked")
	@Transactional
	@Override
	public List<Object[]> getRevenue() {
		String hql = "SELECT sum(o.FinalPrice) FROM OrdersBean o group by MONTH(OrderDate)" ;
		Session session = factory.getCurrentSession();
	
		List<Object[]> list = new ArrayList<>();
		list =session.createQuery(hql).getResultList();
		
		System.out.println(list);
		return list;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	@Override
	public List<Object[]> getTopSales() {
		String hql ="SELECT sum(o.Quantity) , p.ProductName, p.brandBean.BrandName FROM OrdersBean o INNER JOIN ProductBean p on p.ProductName =o.ProductName group by MONTH(o.OrderDate),p.ProductName,p.brandBean.BrandName order by sum(o.Quantity) desc " ;
		Session session = factory.getCurrentSession();
	
		List<Object[]> list = new ArrayList<>();
		list =session.createQuery(hql).getResultList();
	for (Object[] result : list) {

			System.out.println(result[0]);
			System.out.println(result[1]);
			System.out.println(result[2]);
		}
		
		return list;
	}
	
	
	

	
	
}
