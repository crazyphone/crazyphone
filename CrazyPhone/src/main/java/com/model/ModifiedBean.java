package com.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;



@Entity
@Table(name="Modified")
public class ModifiedBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer ModifiedID;

	private Date  ModifiedDate;
	private String Item;
	private String Detail;
	
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "MemberID")
	private MemberBean memberBean;
	
	public ModifiedBean() {
		super();
		
	}

	public ModifiedBean(Integer modifiedID, Date modifiedDate, String item, String detail, MemberBean memberBean) {
		super();
		ModifiedID = modifiedID;
		ModifiedDate = modifiedDate;
		Item = item;
		Detail = detail;
		this.memberBean = memberBean;
	}

	public Integer getModifiedID() {
		return ModifiedID;
	}

	public void setModifiedID(Integer modifiedID) {
		ModifiedID = modifiedID;
	}

	public Date getModifiedDate() {
		return ModifiedDate;
	}

	public void setModifiedDate(Date modifiedDate) {
		ModifiedDate = modifiedDate;
	}

	public String getItem() {
		return Item;
	}

	public void setItem(String item) {
		Item = item;
	}

	public String getDetail() {
		return Detail;
	}

	public void setDetail(String detail) {
		Detail = detail;
	}

	public MemberBean getMemberBean() {
		return memberBean;
	}

	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "ModifiedBean [ModifiedID=" + ModifiedID + ", ModifiedDate=" + ModifiedDate + ", Item=" + Item
				+ ", Detail=" + Detail + ", memberBean=" + memberBean + "]";
	}

	

	


	
}