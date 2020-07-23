package com.service;

import java.sql.Blob;
import java.sql.Timestamp;
import java.util.List;

import com.model.CriticismBean;
import com.model.MemberBean;
import com.model.ProductBean;

public interface CriticismService {

	// 沒用到
//	List<CriticismBean> getAllCriticism(); 

	// 新增評論
	void addCriticism(CriticismBean criticism);

	CriticismBean getCriticismById(Integer criticismID);

	// 沒用到
//	List<Integer> getAllIds();
	
	// 用productID分類顯示
	List<CriticismBean> getCriticismByProductId(Integer productID);

	//刪除
	boolean dropCriticism(Integer criticismID);

	//編輯(更新)
	public boolean updateCriticism(Integer score,  String textContent, Integer criticismID, Blob criticismImage);
	
}
