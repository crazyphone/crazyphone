package com.service;

import java.sql.Blob;
import java.util.List;

import com.model.BrandBean;
import com.model.ProductBean;
import com.model.TypeBean;

public interface Supervisorervice {
	public void addbrand(BrandBean brand);

	public boolean dropbrand(Integer brandID);

	public boolean updatabrand(String nBrandName, String nBrandInfo, String nBrandCountry, Blob nBrandImage,
			Integer BrandID);

	public BrandBean getbrandbyid(int brandid);

	public List<BrandBean> getbrandlist();

	public void addproduct(ProductBean product);

	public boolean dropproduct(Integer ProductID);

	public boolean updataproduct(String nProductName, BrandBean nBrandID, TypeBean ntypeID, Blob nProductImage,
			Blob nProductImage2, Blob nProductImage3, String nProductIntro, Integer nUnitPrice, Integer nStockQuantity,
			Integer ProductID);

	public ProductBean getproductbyid(int productID);

	public List<ProductBean> getproductlist();

	public TypeBean gettypebyid(int typeID);

	public List<TypeBean> gettypelist();

}
