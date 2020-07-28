package com.dao.impl;

import java.sql.Blob;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dao.SupervisorDao;
import com.model.BrandBean;
import com.model.ProductBean;
import com.model.SpecBean;
import com.model.TypeBean;

@Repository
public class SupervisorDaoImpl implements SupervisorDao {
	@Autowired
	SessionFactory factory;

	@Override
	public void insertbrand(BrandBean brand) {
		Session session = factory.getCurrentSession();
		session.save(brand);
	}

	@Override
	public boolean updatabrand(String nBrandName, String nBrandInfo, String nBrandCountry, Blob nBrandImage,
			Integer BrandID) {
		String hql = "update BrandBean BB SET BB.BrandName = :BN , BB.BrandInfo = :BIn , BB.BrandCountry = :BC , BB.BrandImage = :BIm  where BB.BrandID = :BI ";
		Session session = factory.getCurrentSession();
		try {
			session.createQuery(hql).setParameter("BN", nBrandName).setParameter("BIn", nBrandInfo)
					.setParameter("BC", nBrandCountry).setParameter("BIm", nBrandImage).setParameter("BI", BrandID)
					.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public boolean deletebrand(Integer BrandID) {
		Session session = factory.getCurrentSession();
		String hql = "delete BrandBean BB where BB.id = :Bid";
		try {
			session.createQuery(hql).setParameter("Bid", BrandID).executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public BrandBean getbrandbyid(int brandid) {
		Session session = factory.getCurrentSession();
		return session.get(BrandBean.class, brandid);
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<BrandBean> getbrandlist() {
		String hql = "FROM BrandBean";
		Session session = factory.getCurrentSession();
		List<BrandBean> brandlist = session.createQuery(hql).getResultList();
		return brandlist;
	}

	@Override
	public void insertproduct(ProductBean product) {
		Session session = factory.getCurrentSession();
		session.save(product);
	}

	@Override
	public boolean updataproduct(String nProductName, BrandBean nBrandID, TypeBean ntypeID, Blob nProductImage,
			Blob nProductImage2, Blob nProductImage3, String nProductIntro, Integer nUnitPrice, Integer nStockQuantity,
			Integer ProductID) {
		System.out.println(ProductID);
		Integer BID = nBrandID.getBrandID();
		Integer TID = ntypeID.getTypeID();
		
		String hql = "update ProductBean PB SET PB.ProductName = :PN , PB.brandBean.BrandID = :BI , PB.typeBean.TypeID =  :TI , PB.ProductImage = :PI1,PB.ProductImage2 = :PI2 , PB.ProductImage3 = :PI3 , PB.ProductIntro = :PIn , PB.UnitPrice = :UP , PB.StockQuantity = :SQ where PB.ProductID = :PI ";
		Session session = factory.getCurrentSession();
		try {
			session.createQuery(hql)
			        .setParameter("PN", nProductName)
			        .setParameter("BI", BID)
					.setParameter("TI", TID)
					.setParameter("PI1", nProductImage)
					.setParameter("PI2", nProductImage2)
					.setParameter("PI3", nProductImage3)
					.setParameter("PIn", nProductIntro)
					.setParameter("UP", nUnitPrice)
 				    .setParameter("SQ", nStockQuantity)
					.setParameter("PI", ProductID)
					.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public boolean deleteproduct(Integer ProductID) {
		Session session = factory.getCurrentSession();
		String hql = "delete ProductBean PB where PB.id = :Pid";
		try {
			session.createQuery(hql).setParameter("Pid", ProductID).executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public ProductBean getproductbyid(int productID) {
		Session session = factory.getCurrentSession();
		return session.get(ProductBean.class, productID);
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<ProductBean> getproductlist() {
		String hql = "FROM ProductBean";
		Session session = factory.getCurrentSession();
		List<ProductBean> productlist = session.createQuery(hql).getResultList();
		return productlist;
	}

	@Override
	public TypeBean gettypebyid(int typeID) {
		Session session = factory.getCurrentSession();
		return session.get(TypeBean.class, typeID);
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<TypeBean> gettypelist() {
		String hql = "FROM TypeBean";
		Session session = factory.getCurrentSession();
		List<TypeBean> typelist = session.createQuery(hql).getResultList();
		return typelist;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<Integer> getallproductid() {
		String hql = "select ProductID from ProductBean";
		Session session = factory.getCurrentSession();
		List<Integer> pidlist = session.createQuery(hql).getResultList();
		return pidlist;
	}

	@Override
	public void insertspec(SpecBean spec) {
		Session session = factory.getCurrentSession();
		session.save(spec);
	}

	@Override
	public boolean updataspec(String nOS, String nProcessor, String nDisplaySize, String nDisplayResolution,
			String nFrontCamera, String nRearCamera, String nRAM, String nStorage, String nBatteryCapacity,
			Integer ProductID) {
		String hql = "update SpecBean SB SET SB.OS = :OS ,SB.Processor= :SP ,SB.DisplaySize= :DS ,SB.DisplayResolution= :DR ,SB.FrontCamera= :FC ,SB.RearCamera= :RC ,SB.RAM= :RM ,SB.Storage= :SS ,SB.BatteryCapacity= :BC where SB.productBean.ProductID = :PI";
		Session session = factory.getCurrentSession();
		try {
			session.createQuery(hql).setParameter("OS", nOS).setParameter("SP", nProcessor)
					.setParameter("DS", nDisplaySize).setParameter("DR", nDisplayResolution)
					.setParameter("FC", nFrontCamera).setParameter("RC", nRearCamera).setParameter("RM", nRAM)
					.setParameter("SS", nStorage).setParameter("BC", nBatteryCapacity).setParameter("PI", ProductID)
					.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	public boolean deletepspec(Integer ProductID) {
		System.out.println(ProductID);
		Session session = factory.getCurrentSession();
		String hql = "delete SpecBean SB where SB.productBean.ProductID = :SPid";
		String hql2 = "delete ProductBean PB where PB.id = :Pid";
		try {
			session.createQuery(hql).setParameter("SPid", ProductID).executeUpdate();
			session.createQuery(hql2).setParameter("Pid", ProductID).executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<SpecBean> getSpeclist() {
		String hql = "FROM SpecBean";
		Session session = factory.getCurrentSession();
		List<SpecBean> Speclist = session.createQuery(hql).getResultList();
		return Speclist;
	}

	@Override
	public SpecBean getspecbyid(int productID) {
		System.out.println(productID);
		Session session = factory.getCurrentSession();
		String hql = "FROM SpecBean m WHERE m.productBean.ProductID = :mid ";
		SpecBean Speclist = (SpecBean)session.createQuery(hql).setParameter("mid", productID).getSingleResult();
		return Speclist;
	}

}
