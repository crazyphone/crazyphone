
package com.dao;

import java.util.List;

import com.model.CriticismBean;

public interface CriticismDao {
//	List<BookBean>  getAllProducts(); 
//	void updateStock(int productId, int newQuantity);
//	
//	List<String>  getAllCategories();
//	List<BookBean>  getProductsByCategory(String category);
	
	
	//第一個DAO(用來顯示所有評論)
	//0703測試ok
	List<CriticismBean> getAllCriticism();
	
	//第二個DAO(新增評論)
	void  addCriticism(CriticismBean criticism);
//	
//	public ProductBean getProductById(int productId);
//	

	CriticismBean getCriticismById(Integer criticismID);

	//第三個DAO(用criticismID分類並顯示)
	List<Integer>  getAllIds();
	List<CriticismBean>  getCriticismByProductId(Integer productID);
	
//	
//	MemberBean  getMemberById(int memberID);
//
//	
	
	}
