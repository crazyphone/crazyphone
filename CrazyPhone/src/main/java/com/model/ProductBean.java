package com.model;

import java.sql.Blob;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "Product")
public class ProductBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer ProductID;

	private String ProductName;

	private Blob ProductImage;
	private String ProductIntro;
	private Integer UnitPrice;
	private Timestamp ReleasedDate;
	private Integer StockQuantity;
	private String  ProductFileName;
	private Blob ProductImage2;
	private Blob ProductImage3;
	private String  ProductFileName2;
	private String  ProductFileName3;
	
	@Transient
	private MultipartFile PImage;
	
	@OneToMany(mappedBy = "productBean", fetch = FetchType.EAGER)
	private Set<CriticismBean> criticisms = new HashSet<>();
	
	
	@ManyToOne
	@JoinColumn(name = "TypeID")
	private TypeBean typeBean;
	
	
	@ManyToOne
	@JoinColumn(name = "BrandID")
	private BrandBean brandBean;
	
	
	
	@OneToOne(mappedBy = "productBean", fetch = FetchType.EAGER)
	SpecBean specBean;

	@Transient
	@OneToOne(cascade = CascadeType.ALL)
	PKItemBean pkItemBean;

	public ProductBean() {
		super();
		// TODO Auto-generated constructor stub
	}



	public ProductBean(Integer productID, String productName, Blob productImage, String productIntro, Integer unitPrice,
			Timestamp releasedDate, Integer stockQuantity, String productFileName, Blob productImage2,
			Blob productImage3, String productFileName2, String productFileName3, MultipartFile pImage,
			Set<CriticismBean> criticisms, TypeBean typeBean, BrandBean brandBean, SpecBean specBean) {
		super();
		ProductID = productID;
		ProductName = productName;
		ProductImage = productImage;
		ProductIntro = productIntro;
		UnitPrice = unitPrice;
		ReleasedDate = releasedDate;
		StockQuantity = stockQuantity;
		ProductFileName = productFileName;
		ProductImage2 = productImage2;
		ProductImage3 = productImage3;
		ProductFileName2 = productFileName2;
		ProductFileName3 = productFileName3;
		PImage = pImage;
		this.criticisms = criticisms;
		this.typeBean = typeBean;
		this.brandBean = brandBean;
		this.specBean = specBean;
	}



	public Integer getProductID() {
		return ProductID;
	}



	public void setProductID(Integer productID) {
		ProductID = productID;
	}



	public String getProductName() {
		return ProductName;
	}



	public void setProductName(String productName) {
		ProductName = productName;
	}



	public Blob getProductImage() {
		return ProductImage;
	}



	public void setProductImage(Blob productImage) {
		ProductImage = productImage;
	}



	public String getProductIntro() {
		return ProductIntro;
	}



	public void setProductIntro(String productIntro) {
		ProductIntro = productIntro;
	}



	public Integer getUnitPrice() {
		return UnitPrice;
	}



	public void setUnitPrice(Integer unitPrice) {
		UnitPrice = unitPrice;
	}



	public Timestamp getReleasedDate() {
		return ReleasedDate;
	}



	public void setReleasedDate(Timestamp releasedDate) {
		ReleasedDate = releasedDate;
	}



	public Integer getStockQuantity() {
		return StockQuantity;
	}



	public void setStockQuantity(Integer stockQuantity) {
		StockQuantity = stockQuantity;
	}



	public String getProductFileName() {
		return ProductFileName;
	}



	public void setProductFileName(String productFileName) {
		ProductFileName = productFileName;
	}



	public Blob getProductImage2() {
		return ProductImage2;
	}



	public void setProductImage2(Blob productImage2) {
		ProductImage2 = productImage2;
	}



	public Blob getProductImage3() {
		return ProductImage3;
	}



	public void setProductImage3(Blob productImage3) {
		ProductImage3 = productImage3;
	}



	public String getProductFileName2() {
		return ProductFileName2;
	}



	public void setProductFileName2(String productFileName2) {
		ProductFileName2 = productFileName2;
	}



	public String getProductFileName3() {
		return ProductFileName3;
	}



	public void setProductFileName3(String productFileName3) {
		ProductFileName3 = productFileName3;
	}



	public MultipartFile getPImage() {
		return PImage;
	}



	public void setPImage(MultipartFile pImage) {
		PImage = pImage;
	}



	public Set<CriticismBean> getCriticisms() {
		return criticisms;
	}



	public void setCriticisms(Set<CriticismBean> criticisms) {
		this.criticisms = criticisms;
	}



	public TypeBean getTypeBean() {
		return typeBean;
	}



	public void setTypeBean(TypeBean typeBean) {
		this.typeBean = typeBean;
	}



	public BrandBean getBrandBean() {
		return brandBean;
	}



	public void setBrandBean(BrandBean brandBean) {
		this.brandBean = brandBean;
	}



	public SpecBean getSpecBean() {
		return specBean;
	}



	public void setSpecBean(SpecBean specBean) {
		this.specBean = specBean;
	}


	//Hung
		public ProductBean(Integer productID, String productName, Integer unitPrice) {
			super();
			this.ProductID = productID;
			this.ProductName = productName;
			this.UnitPrice = unitPrice;
		}
	
	
	

	@Override
	public String toString() {
		return "ProductBean [ProductID=" + ProductID + ", ProductName=" + ProductName + ", ProductImage=" + ProductImage
				+ ", ProductIntro=" + ProductIntro + ", UnitPrice=" + UnitPrice + ", ReleasedDate=" + ReleasedDate
				+ ", StockQuantity=" + StockQuantity + ", ProductFileName=" + ProductFileName + ", ProductImage2="
				+ ProductImage2 + ", ProductImage3=" + ProductImage3 + ", ProductFileName2=" + ProductFileName2
				+ ", ProductFileName3=" + ProductFileName3 + ", PImage=" + PImage + ", criticisms=" + criticisms
				+ ", typeBean=" + typeBean + ", brandBean=" + brandBean + ", specBean=" + specBean + "]";
	}
	
	
	

}
