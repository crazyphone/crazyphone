package com.model;

import javax.persistence.OneToOne;

//Hung
//本類別封裝單筆訂單資料
public class PKItemBean {
	Integer seqno;

	Integer quantity;
	Double discount = 1.0;

	@OneToOne(mappedBy = "pkItemBean")
	SpecBean specBean;
	
	@OneToOne(mappedBy = "pkItemBean")
	ProductBean productBean;
	public SpecBean getSpecBean() {
		return specBean;
	}

	public void setSpecBean(SpecBean specBean) {
		this.specBean = specBean;
	}

	public ProductBean getProductBean() {
		return productBean;
	}

	public void setProductBean(ProductBean productBean) {
		this.productBean = productBean;
	}


		
	public Integer getSeqno() {
		return seqno;
	}
	public void setSeqno(Integer seqno) {
		this.seqno = seqno;
	}

	public PKItemBean(Integer seqno, Integer quantity, SpecBean specBean, ProductBean productBean) {
		super();
		this.seqno = seqno;
		this.quantity = quantity;
		this.specBean = specBean;
		this.productBean = productBean;
	}

	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Double getDiscount() {
		return discount;
	}
	public void setDiscount(Double discount) {
		this.discount = discount;
	}

	@Override
	public String toString() {
		return "PKItemBean [seqno=" + seqno + ", quantity=" + quantity + ", discount=" + discount + ", specBean="
				+ specBean + ", productBean=" + productBean.getProductName() + "]";
	}
	

}