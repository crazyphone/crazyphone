package com.service.impl;

import java.sql.Blob;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.SupervisorDao;
import com.model.BrandBean;
import com.model.ProductBean;
import com.model.TypeBean;
import com.service.Supervisorervice;

@Service
public class SupervisorerviceImpl implements Supervisorervice {

	@Autowired
	SupervisorDao dao;
	@Autowired
	SessionFactory Factory;

	@Transactional
	@Override
	public void addbrand(BrandBean brand) {
		dao.insertbrand(brand);
	}

	@Transactional
	@Override
	public boolean dropbrand(Integer brandID) {
		return dao.deletebrand(brandID);
	}

	@Transactional
	@Override
	public boolean updatabrand(String nBrandName, String nBrandInfo, String nBrandCountry, Blob nBrandImage,
			Integer BrandID) {
		return dao.updatabrand(nBrandName, nBrandInfo, nBrandCountry, nBrandImage, BrandID);
	}

	@Transactional
	@Override
	public BrandBean getbrandbyid(int brandid) {
		return dao.getbrandbyid(brandid);
	}

	@Transactional
	@Override
	public List<BrandBean> getbrandlist() {
		return dao.getbrandlist();
	}

	@Transactional
	@Override
	public void addproduct(ProductBean product) {
		dao.insertproduct(product);
	}

	@Transactional
	@Override
	public boolean dropproduct(Integer ProductID) {
		return dao.deleteproduct(ProductID);
	}

	@Transactional
	@Override
	public boolean updataproduct(String nProductName, BrandBean nBrandID, TypeBean ntypeID, Blob nProductImage,
			Blob nProductImage2, Blob nProductImage3, String nProductIntro, Integer nUnitPrice, Integer nStockQuantity,
			Integer ProductID) {
		return dao.updataproduct(nProductName, nBrandID, ntypeID, nProductImage, nProductImage2, nProductImage3,
				nProductIntro, nUnitPrice, nStockQuantity, ProductID);
	}

	@Transactional
	@Override
	public ProductBean getproductbyid(int productID) {
		return dao.getproductbyid(productID);
	}

	@Transactional
	@Override
	public List<ProductBean> getproductlist() {
		return dao.getproductlist();
	}

	@Transactional
	@Override
	public TypeBean gettypebyid(int typeID) {
		return dao.gettypebyid(typeID);
	}

	@Transactional
	@Override
	public List<TypeBean> gettypelist() {
		return dao.gettypelist();
	}

	@Transactional
	@Override
	public List<ProductBean> getallpid() {
		return dao.getallproductid();
	}

}
