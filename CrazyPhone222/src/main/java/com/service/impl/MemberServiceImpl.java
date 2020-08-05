package com.service.impl;

import java.sql.Blob;
import java.sql.Timestamp;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.MemberDao;
import com.model.CarouselBean;
import com.model.MemberBean;
import com.model.OrdersBean;
import com.model.SupervisorBean;
import com.service.MemberService;

@Service

public class MemberServiceImpl implements MemberService{
	@Autowired
	MemberDao dao;
	
	
	@Autowired
	SessionFactory factory;
	
	
	@Transactional
	@Override
	public MemberBean checkIdPassword(String userId, String password) {
		MemberBean mb=null;
		mb=dao.checkIdPassword(userId, password);
		return mb;
	}
	
	@Transactional
	@Override
	public SupervisorBean checkSuperIdPassword(String userId, String password) {
		SupervisorBean sb=null;
		sb=dao.checkSuperIdPassword(userId,password);
		return sb;
		
	}

	@Transactional
	@Override
	public boolean updatePsw(String newPassword, String Email) {
		return dao.updatePsw(newPassword, Email);
		
	}
	
	@Transactional
	@Override
	public boolean addMember(MemberBean member) {
		return dao.addMember(member);
	}
	
	@Transactional
	@Override
	public void addMember1(MemberBean member) {
		dao.addMember1(member);
		
	}
	@Transactional
	@Override
	public boolean addGoogleMember(String mail) {
		return dao.addGoogleMember(mail);
	}
	@Transactional
	@Override
	public void addGoogleMember1(String mail, String name, Timestamp ceateDate) {
		dao.addGoogleMember1(mail, name,ceateDate);
	}
	@Transactional
	@Override
	public MemberBean checkIdPassword2(String mail, String name) {
		
		return dao.checkIdPassword2(mail,name);
	}
	@Transactional
	@Override
	public MemberBean upMember(String email, String name, String brith, String phone, String add, Blob img) {
		MemberBean mb=null;
		mb=dao.upMember(email,name,brith,phone,add,img);
		return mb;
	}
	@Transactional
	@Override
	public MemberBean getMemberbyIdaa(int memberId) {
		
		return dao.getMemberByIdaa(memberId);
	}
	@Transactional
	@Override
	public List<MemberBean> getAllMembers() {
		
		return dao.getAllMembers();
	}
	@Transactional
	@Override
	public List<MemberBean> searchMember(String name,String sta) {
		return dao.searchMember(name,sta);
	}
	@Transactional
	@Override
	public boolean deleteMember(Integer id) {
		
		return dao.deleteMember(id);
	}
	@Transactional
	@Override
	public boolean sealOffMember(Integer id) {
		
		return dao.sealOffMember(id);
	}
	@Transactional
	@Override
	public boolean sealOnMember(Integer id) {
		
		return dao.sealOnMember(id);
	}
	@Transactional
	@Override
	public List<CarouselBean> getAllCarousels() {
		
		return dao.getAllCarousels();
	}
	@Transactional
	@Override
	public boolean addCarousel(CarouselBean carousel) {
		
		return dao.addCarousel(carousel);
	}
	@Transactional
	@Override
	public CarouselBean getCarouselByIdaa(int CarouselId) {
		
		return dao.getCarouselByIdaa(CarouselId);
	}
	@Transactional
	@Override
	public boolean deleteCarousel(Integer id) {
		
		return dao.deleteCarousel(id);
	}
	@Transactional
	@Override
	public List<OrdersBean> getAllMemberOrders(Integer id) {
		
		return dao.getAllMemberOrders(id);
	}
	@Transactional
	@Override
	public List<OrdersBean> getAllOrders() {
		
		return dao.getAllOrders();
	}
	@Transactional
	@Override
	public List<OrdersBean> searchOrders(String id, String phone, String sta) {
		
		return dao.searchOrders(id,phone,sta);
	}
	@Transactional
	@Override
	public boolean ororor1(Integer id) {
		
		return dao.ororor1(id);
	}
	@Transactional
	@Override
	public boolean ororor2(Integer id) {
		return dao.ororor2(id);
	}
	@Transactional
	@Override
	public boolean ororor3(Integer id) {
		return dao.ororor3(id);
	}
	@Transactional
	@Override
	public boolean checkSealoffIdPassword(String mail, String pwd) {
		
		return dao.checkSealoffIdPassword(mail,pwd);
	}

}
