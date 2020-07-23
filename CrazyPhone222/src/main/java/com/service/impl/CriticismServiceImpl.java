package com.service.impl;

import java.sql.Blob;
import java.sql.Timestamp;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.CriticismDao;
import com.model.CriticismBean;
import com.model.MemberBean;
import com.model.ProductBean;
import com.service.CriticismService;
@Service
public class CriticismServiceImpl implements CriticismService {
	
	@Autowired
	SessionFactory factory;
	
	@Autowired
	CriticismDao criticismDao;
	
	//新增評論
	@Transactional
	@Override
	public void addCriticism(CriticismBean criticism) {
		criticismDao.addCriticism(criticism);
	}
	@Transactional
	@Override
	public CriticismBean getCriticismById(Integer criticismID) {
		return criticismDao.getCriticismById(criticismID);
	}
	//用productID分類並顯示
	@Transactional
	@Override
	public List<CriticismBean> getCriticismByProductId(Integer productID) {
		return criticismDao.getCriticismByProductId(productID);
	}
	
	//刪除
	@Transactional
	@Override
	public boolean dropCriticism(Integer criticismID) {
		return criticismDao.deleteCriticism(criticismID);
	}
	
	//編輯
	@Transactional
	@Override
	public boolean updateCriticism(Integer score, String textContent,
			Integer criticismID,Blob criticismImage) {
		return criticismDao.updateCriticism(score,  textContent,criticismID,criticismImage);
	}


}
