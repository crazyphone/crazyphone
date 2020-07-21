package com.dao;

import java.sql.Blob;
import java.util.ArrayList;
import java.util.List;

import com.model.BrandBean;
import com.model.ProductBean;
import com.model.TypeBean;

public interface SupervisorDao {
	public void insertbrand(BrandBean brand);

	public boolean updatabrand(String nBrandName, String nBrandInfo, String nBrandCountry, Blob nBrandImage,
			Integer BrandID);

	public boolean deletebrand(Integer BrandID);

	public BrandBean getbrandbyid(int brandid);

	public List<BrandBean> getbrandlist();

	public void insertproduct(ProductBean product);

	public boolean updataproduct(String nProductName, BrandBean nBrandID, TypeBean ntypeID, Blob nProductImage,
			Blob nProductImage2, Blob nProductImage3, String nProductIntro, Integer nUnitPrice, Integer nStockQuantity,
			Integer ProductID);

	public boolean deleteproduct(Integer ProductID);

	public ProductBean getproductbyid(int productID);

	public List<ProductBean> getproductlist();

	public TypeBean gettypebyid(int typeID);

	public List<TypeBean> gettypelist();
	
	public List<ProductBean> getallproductid();
}
