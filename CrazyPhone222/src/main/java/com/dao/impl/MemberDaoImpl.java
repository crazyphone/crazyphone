package com.dao.impl;

import java.sql.Blob;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dao.MemberDao;
import com.model.CarouselBean;
import com.model.MemberBean;
import com.model.OrdersBean;
import com.model.SupervisorBean;




@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	SessionFactory factory;

	public MemberDaoImpl() {
	}

	public int saveMember(MemberBean mb) {
		int n = 0;
		Session session = factory.getCurrentSession();
		session.save(mb);
		n++;
		return n;
	}

	@Override
	public MemberBean checkIdPassword(String userId, String password) {
		MemberBean mb = null;
		String hql = "FROM MemberBean m WHERE m.MemberEmail = :mid and m.MemberPwd = :pwsd";
		Session session = factory.getCurrentSession();
		try {
			mb = (MemberBean) session.createQuery(hql).setParameter("mid", userId).setParameter("pwsd", password)
					.getSingleResult();
		} catch (NoResultException ex) {
			;
		} catch (NonUniqueResultException ex) {
			;
		}

		return mb;
	}
	//google登入
	@Override
	public MemberBean checkIdPassword2(String mail, String name) {
		MemberBean en =null;
		String hql = "FROM MemberBean m WHERE m.MemberEmail = :mid and m.MemberName = :name";
		Session session = factory.getCurrentSession();
		try {
			en = (MemberBean) session.createQuery(hql).setParameter("mid", mail).setParameter("name", name)
					.getSingleResult();
		} catch (NoResultException ex) {
			;
		} catch (NonUniqueResultException ex) {
			;
		}

		return en;
	}
	//管理員登入
	@Override
	public SupervisorBean checkSuperIdPassword(String userId, String password) {
		SupervisorBean sb = null;
		String hql = "FROM SupervisorBean m WHERE m.SupervisorEmail = :mid and m.SupervisorPwd = :pwsd";
		Session session = factory.getCurrentSession();
		try {
			sb = (SupervisorBean) session.createQuery(hql).setParameter("mid", userId).setParameter("pwsd", password)
					.getSingleResult();
		} catch (NoResultException ex) {
			;
		} catch (NonUniqueResultException ex) {
			;
		}

		return sb;
	}
	
	
	
	//修改密碼

	@Override
	public boolean updatePsw(String newPassword,String Email) {
		String hql ="update MemberBean mb SET mb.MemberPwd = :psw where mb.MemberEmail = :mail ";
//		Session session = factory.openSession();
		Session session = factory.getCurrentSession();//為甚麼?????
//		Transaction tx = null;
		try {
//			tx = session.beginTransaction();
			session.createQuery(hql).setParameter("psw", newPassword)
									.setParameter("mail", Email)
									.executeUpdate();
//			tx.commit();
		}catch (Exception e) {
			e.printStackTrace();
//			if(tx != null) tx.rollback();
			return false;
		}
		return true;
	}
	//判斷加入帳號
	@SuppressWarnings("unchecked")
	@Override
	public boolean addMember(MemberBean member) {
		Session session = factory.getCurrentSession();
		String em = member.getMemberEmail();
		boolean exist = false;
		String hql = "FROM MemberBean m WHERE m.MemberEmail = :mid ";
		
			 List<MemberBean> beans = session.createQuery(hql).setParameter("mid", em)
		    .getResultList();
			
		if (beans.size() > 0) {
			exist = true;
		}

		return exist;

	}
	//加入帳號
	@Override
	public void addMember1(MemberBean member) {
		Session session = factory.getCurrentSession();
		session.save(member);
	}

	
	
	//判斷加入google帳號
	@SuppressWarnings("unchecked")
	@Override
	public boolean addGoogleMember(String mail) {
		Session session = factory.getCurrentSession();
		
		boolean exist = false;
		String hql = "FROM MemberBean m WHERE m.MemberEmail = :mid ";
		
			 List<MemberBean> beans = session.createQuery(hql).setParameter("mid", mail)
		    .getResultList();
			
		if (beans.size() > 0) {
			exist = true;
		}

		return exist;
	}
	//加入google帳號
	@Override
	public void addGoogleMember1(String mail, String name,Timestamp ceateDate) {
		Session session = factory.getCurrentSession();
		MemberBean mb =new MemberBean();
		mb.setMemberEmail(mail);
		mb.setMemberName(name);
		mb.setAuthorityID(1);
		mb.setMemberAddress("新北市新莊區福德二街47號");
		mb.setMemberBirth("2017-05-15");
		mb.setMemberPhone("0955884687");
		mb.setMemberstatus("正常");
		mb.setCreateDate(ceateDate);
		session.save(mb);
	}

	@Override
	public MemberBean upMember(String email,String name, String brith, String phone, String add, Blob img) {
		System.out.println(email);
		MemberBean mb = null;
		Session session = factory.getCurrentSession();
	
		String hql ="update MemberBean mb SET mb.MemberName = :na , mb.MemberBirth = :bi , "
				+ " mb.MemberPhone = :ph , mb.MemberAddress = :add , mb.MemberImage = :img "
				+ " where mb.MemberEmail = :mail ";
		
		String hql2 = "FROM MemberBean m WHERE m.MemberEmail = :mid ";
//		Transaction tx = null;
		try {
//			tx = session.beginTransaction();
			session.createQuery(hql).setParameter("na", name)
									.setParameter("bi", brith)
									.setParameter("ph", phone)
									.setParameter("add", add)
									.setParameter("img",img)
									.setParameter("mail", email)
									.executeUpdate();

//			tx.commit();
			
			mb=(MemberBean) session.createQuery(hql2).setParameter("mid", email).getSingleResult();
		}catch (Exception e) {
			e.printStackTrace();
//			if(tx != null) tx.rollback();
			
		}
		
		
		System.out.println("這邊是有抓到mb: "+mb);
		return mb;
	}


	
	@Override
	public MemberBean getMemberByIdaa(int memberId) {
		Session session =factory.getCurrentSession();
		return session.get(MemberBean.class,memberId);
	
	}


	@Override
	@SuppressWarnings("unchecked")
	public List<MemberBean> getAllMembers() {
		String hql = "FROM MemberBean";
		Session session = factory.getCurrentSession();
		List<MemberBean> list = session.createQuery(hql).getResultList();
		return list;
	}

	@Override
	public List<MemberBean> searchMember(String name,String sta) {
		
		String hql = "FROM MemberBean m WHERE m.MemberName like :name and m.Memberstatus = :sta1 ";
		Session session = factory.getCurrentSession();
		
		List<MemberBean> list=null;
		try {
			list=  session.createQuery(hql).setParameter("name", "%"+name+"%").setParameter("sta1",sta)
					.getResultList();
		} catch (NoResultException ex) {
			;
		} catch (NonUniqueResultException ex) {
			;
		}

		return list;
	
	}

	@Override
	public boolean deleteMember(Integer id) {
		Session session = factory.getCurrentSession();
		String hql="delete MemberBean mb where mb.id = :idd";
		
		try {
		session.createQuery(hql).setParameter("idd", id).executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public boolean sealOffMember(Integer id) {
		Session session = factory.getCurrentSession();
		String hql ="update MemberBean mb SET mb.Memberstatus = '封鎖中'  where mb.MemberID = :idd ";
		
		try {
			session.createQuery(hql).setParameter("idd", id).executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public boolean sealOnMember(Integer id) {
		Session session = factory.getCurrentSession();
		String hql ="update MemberBean mb SET mb.Memberstatus = '正常'  where mb.MemberID = :idd ";
		
		try {
			session.createQuery(hql).setParameter("idd", id).executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	//抓全部輪播圖
	@Override
	public List<CarouselBean> getAllCarousels() {
		String hql = "FROM CarouselBean";
		Session session = factory.getCurrentSession();
		List<CarouselBean> list = session.createQuery(hql).getResultList();
		return list;
	}
	//加輪播圖
	@Override
	public boolean addCarousel(CarouselBean carousel) {
		Session session = factory.getCurrentSession();
		
		try {
			session.save(carousel);
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	@Override
	public CarouselBean getCarouselByIdaa(int CarouselId) {
		Session session =factory.getCurrentSession();
		return session.get(CarouselBean.class,CarouselId);
	}
	
	@Override
	public boolean deleteCarousel(Integer id) {
		Session session = factory.getCurrentSession();
		String hql="delete CarouselBean cb where cb.id = :idd";
		
		try {
		session.createQuery(hql).setParameter("idd", id).executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public List<OrdersBean> getAllMemberOrders(Integer id) {
		String hql = "FROM OrdersBean ob where ob.MemberID = :mid ";
		Session session = factory.getCurrentSession();
		List<OrdersBean> list = session.createQuery(hql).setParameter("mid", id).getResultList();
		return list;
	}




}
