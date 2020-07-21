package com.service;

import java.util.List;

import com.model.CriticismBean;

public interface CriticismService {
	
	//第一個service(用來顯示所有評論)
	//0703測試ok
	List<CriticismBean> getAllCriticism(); 
	
	
	//第二個service(新增評論)
	void  addCriticism(CriticismBean criticism);


	CriticismBean getCriticismById(Integer criticismID);

	//第三個service(用criticismID分類並顯示)
	List<Integer>  getAllIds();
	List<CriticismBean>  getCriticismByProductId(Integer productID);
//	void updateAllStock();



	
//	List<String>  getAllCategories();
//	List<BookBean>  getProductsByCategory(String category);
//	public  BookBean getProductById(int productId);
//	
//	void  addProduct(BookBean product);
//	CompanyBean  getCompanyById(int companyId);
//	List<CompanyBean>  getCompanyList();
}
