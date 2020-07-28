package com.service;

import java.util.List;

import com.model.BrandBean;
import com.model.ProductBean;
import com.model.ProductBeanWithImageData;

public interface ProductService {
	List<String> getAllCategories();

	List<ProductBean> getAllProducts();

	ProductBean getProductById(Integer productID);

	ProductBean getProductPK(Integer productID);

	public List<ProductBean> searchProduct(String productname);
	List<ProductBean>  getProductsByBrand(String brand);
	List<ProductBean> getProductsByPrice(Integer priceL,Integer priceH);

	List<ProductBeanWithImageData> getBrandName(String brandName);
	
}
