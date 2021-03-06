
package com.dao;

import java.util.List;

import com.model.ProductBean;
import com.model.ProductBeanWithImageData;

public interface ProductDao {
	List<ProductBean>  getAllProducts();

	ProductBean getProductById(Integer productID); 
	
	ProductBean getProductPK(Integer productID);
	List<String> getAllCategories();
	List<ProductBean> getProductsByBrand(String brand);
	List<ProductBean> getProductsByPrice(Integer priceL,Integer priceH);
	
	
	public List<ProductBean> searchProduct(String productname);

	List<ProductBeanWithImageData> getBrandName(String brandName);
	
	
	}
