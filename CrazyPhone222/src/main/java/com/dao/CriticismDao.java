
package com.dao;

import java.sql.Blob;
import java.sql.Timestamp;
import java.util.List;

import com.model.CriticismBean;
import com.model.MemberBean;
import com.model.ProductBean;

public interface CriticismDao {

	//新增評論
	void  addCriticism(CriticismBean criticism);

	CriticismBean getCriticismById(Integer criticismID);

	//用productID分類並顯示
	List<CriticismBean>  getCriticismByProductId(Integer productID);
	
	public boolean deleteCriticism(Integer criticismID);

	public boolean updateCriticism(Integer score,String textContent,  Integer criticismID,Blob criticismImage);

	}
