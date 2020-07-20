package com.model;

import java.sql.Blob;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Brand")
public class BrandBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer BrandID;
	private String BrandName;
	private String BrandInfo;
	private String BrandCountry;
	private Blob BrandImage;
	
	@OneToMany(mappedBy = "brandBean", fetch = FetchType.EAGER)
	private Set<ProductBean> products = new HashSet<ProductBean>();

	public BrandBean() {
		super();
	}

	public BrandBean(Integer brandID, String brandName, String brandInfo, String brandCountry, Blob brandImage,
			Set<ProductBean> products) {
		super();
		BrandID = brandID;
		BrandName = brandName;
		BrandInfo = brandInfo;
		BrandCountry = brandCountry;
		BrandImage = brandImage;
		this.products = products;
	}

	public Integer getBrandID() {
		return BrandID;
	}

	public void setBrandID(Integer brandID) {
		BrandID = brandID;
	}

	public String getBrandName() {
		return BrandName;
	}

	public void setBrandName(String brandName) {
		BrandName = brandName;
	}

	public String getBrandInfo() {
		return BrandInfo;
	}

	public void setBrandInfo(String brandInfo) {
		BrandInfo = brandInfo;
	}

	public String getBrandCountry() {
		return BrandCountry;
	}

	public void setBrandCountry(String brandCountry) {
		BrandCountry = brandCountry;
	}

	public Blob getBrandImage() {
		return BrandImage;
	}

	public void setBrandImage(Blob brandImage) {
		BrandImage = brandImage;
	}

	public Set<ProductBean> getProducts() {
		return products;
	}

	public void setProducts(Set<ProductBean> products) {
		this.products = products;
	}

	@Override
	public String toString() {
		return "BrandBean [BrandID=" + BrandID + ", BrandName=" + BrandName + ", BrandInfo=" + BrandInfo
				+ ", BrandCountry=" + BrandCountry + ", BrandImage=" + BrandImage + "]";
	}
	//", products=" + products +
	
	

}