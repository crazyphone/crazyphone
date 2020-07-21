
package com.dao;

import java.util.List;

import com.model.BrandBean;
import com.model.CriticismBean;
import com.model.ProductBean;

public interface ProductDao {
	List<ProductBean>  getAllProducts();

	ProductBean getProductById(Integer productID); 
	
	ProductBean getProductPK(Integer productID);
	List<String> getAllCategories();
	List<ProductBean> getProductsByCategory(BrandBean category);
	
	
	public List<ProductBean> searchProduct(String productname);
	
	
	}
