package com.service.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.ProductDao;
import com.model.ProductBean;
import com.model.ProductBeanWithImageData;
import com.service.ProductService;
@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	SessionFactory factory;
	
	@Autowired
	ProductDao productDao;
	
	@Transactional
	@Override
	public List<ProductBean> getAllProducts() {
		return productDao.getAllProducts();
	}
	@Transactional
	@Override
	public ProductBean getProductById(Integer productID) {
		
		return productDao.getProductById(productID);
	}
	@Transactional
	@Override
	public ProductBean getProductPK(Integer productID) {
		
		return productDao.getProductPK(productID);
	}
	
	@Transactional
	@Override
	public List<String> getAllCategories() {
		return productDao.getAllCategories();
	}
	
	
	@Transactional
	@Override
	public List<ProductBean> searchProduct(String productname) {
		return productDao.searchProduct(productname);
	}
	@Transactional
	@Override
	public List<ProductBean> getProductsByBrand(String brand) {
		return productDao.getProductsByBrand(brand);
	}
	@Transactional
	@Override
	public List<ProductBean> getProductsByPrice(Integer priceL, Integer priceH) {
		
		if(priceL<=priceH) {
			return productDao.getProductsByPrice(priceL, priceH);
		}
		else {
			return null;
		}
	}
	@Transactional
	@Override
	public List<ProductBeanWithImageData> getBrandName(String brandName) {
		return productDao.getBrandName(brandName);
	}
}
