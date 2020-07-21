package com.service;


import java.sql.Blob;
import java.sql.Timestamp;
import java.util.List;

import com.model.CarouselBean;
import com.model.MemberBean;
import com.model.OrdersBean;
import com.model.SupervisorBean;

public interface MemberService {
	MemberBean checkIdPassword(String userId, String password);
	public MemberBean checkIdPassword2(String mail,String name) ;
	
	public SupervisorBean checkSuperIdPassword(String userId, String password);
	
	public boolean updatePsw(String newPassword,String Email);
	
	public boolean addMember(MemberBean member) ;
	public void addMember1(MemberBean member) ;

	
	public boolean addGoogleMember(String mail) ;
	public void addGoogleMember1(String mail, String name, Timestamp ceateDate);
	
	public MemberBean upMember(String email,String name, String brith, String phone, String add, Blob img);
	
	
	
	MemberBean getMemberbyIdaa(int memberId);
	
	List<MemberBean> getAllMembers();
	
	public List<MemberBean> searchMember(String name,String sta);
	
	public boolean deleteMember(Integer id) ;
	public boolean sealOffMember(Integer id);
	public boolean sealOnMember(Integer id);
	
	List<CarouselBean> getAllCarousels();
	public boolean addCarousel(CarouselBean carousel);
	CarouselBean getCarouselByIdaa(int CarouselId);
	public boolean deleteCarousel(Integer id);
	
	public List<OrdersBean> getAllMemberOrders(Integer id);
}
