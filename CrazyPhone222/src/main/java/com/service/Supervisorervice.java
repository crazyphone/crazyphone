package com.service;

import java.sql.Blob;
import java.util.List;

import com.model.BrandBean;
import com.model.ProductBean;
import com.model.SpecBean;
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

	public boolean updataproduct(String nProductName, Integer nBrandID, Integer ntypeID, Blob nProductImage,
			Blob nProductImage2, Blob nProductImage3, String nProductIntro, Integer nUnitPrice, Integer nStockQuantity,
			Integer ProductID);

	public ProductBean getproductbyid(int productID);

	public List<ProductBean> getproductlist();

	public TypeBean gettypebyid(int typeID);

	public List<TypeBean> gettypelist();

	public List<Integer> getallpid();
	
	public void addspec(SpecBean spec);

	public boolean upspec(String nOS, String nProcessor, String nDisplaySize, String nDisplayResolution,
			String nFrontCamera, String nRearCamera, String nRAM, String nStorage, String nBatteryCapacity,
			Integer ProductID);

	public boolean dropspec(Integer ProductID);

}
