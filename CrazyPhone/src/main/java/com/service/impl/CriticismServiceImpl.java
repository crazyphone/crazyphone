package com.service.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.CriticismDao;
import com.model.CriticismBean;
import com.service.CriticismService;
@Service
public class CriticismServiceImpl implements CriticismService {
	
	@Autowired
	SessionFactory factory;
	
	@Autowired
	CriticismDao criticismDao;
	
	
	//第一個service實作(用來顯示所有評論)
	//0703測試ok
	@Transactional
	@Override
	public List<CriticismBean> getAllCriticism() {
		return criticismDao.getAllCriticism();
	}

	//第二個service實作(新增評論)
	@Transactional
	@Override
	public void addCriticism(CriticismBean criticism) {
		criticismDao.addCriticism(criticism);
	}
	@Transactional
	@Override
	public CriticismBean getCriticismById(Integer criticismID) {
		return criticismDao.getCriticismById(criticismID);
	}
	//第三個service實作(用criticismID分類並顯示)
	@Transactional
	@Override
	public List<Integer> getAllIds() {
		return criticismDao.getAllIds();
	}
	@Transactional
	@Override
	public List<CriticismBean> getCriticismByProductId(Integer productID) {
		return criticismDao.getCriticismByProductId(productID);
	}
	

//	@Transactional
//	@Override
//	public void addProduct(BookBean product) {
//		productDao.addProduct(product);
//	}
	
	
//	@Transactional
//	@Override
//	public void updateAllStock() {
////		int n=0;
//		List<BookBean> beans = getAllProducts(); 
//		for(BookBean bean:beans) {
////			n++;
////			if(n>5) {throw new RuntimeException("發生異常");
////			}
//			if(bean.getStock() !=null && bean.getStock()<50) {
//				productDao.updateStock(bean.getBookId(), bean.getStock()+50);
//			}
//		}
//	}
//	@Transactional
//	@Override
//	public List<String> getAllCategories() {
//		
//		return productDao.getAllCategories();
//	}
//	@Transactional
//	@Override
//	public List<BookBean> getProductsByCategory(String category) {
//	
//		return productDao.getProductsByCategory(category);
//	}
//	
//	@Transactional
//	@Override
//	public BookBean getProductById(int productId) {
//		return productDao.getProductById(productId);
//	}
//	@Transactional
//	@Override
//	public void addProduct(BookBean product) {
//		productDao.addProduct(product);
//	}
//	@Transactional
//	@Override
//	public CompanyBean getCompanyById(int companyId) {
//		return productDao.getCompanyById(companyId);
//	}
//	@Transactional
//	@Override
//	public List<CompanyBean> getCompanyList() {
//		return productDao.getCompanyList();
//	}



}
