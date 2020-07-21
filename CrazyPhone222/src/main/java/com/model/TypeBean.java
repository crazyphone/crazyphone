package com.model;

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
@Table(name = "Type")
public class TypeBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer TypeID;
	String TypeName;
	
	@OneToMany(mappedBy="typeBean", fetch = FetchType.EAGER) 
	private Set<ProductBean> products = new HashSet<>();

	public TypeBean() {
		super();
	}

	public TypeBean(Integer typeID, String typeName, Set<ProductBean> products) {
		super();
		TypeID = typeID;
		TypeName = typeName;
		this.products = products;
	}

	public Integer getTypeID() {
		return TypeID;
	}

	public void setTypeID(Integer typeID) {
		TypeID = typeID;
	}

	public String getTypeName() {
		return TypeName;
	}

	public void setTypeName(String typeName) {
		TypeName = typeName;
	}

	public Set<ProductBean> getProducts() {
		return products;
	}

	public void setProducts(Set<ProductBean> products) {
		this.products = products;
	}

	@Override
	public String toString() {
		return "TypeBean [TypeID=" + TypeID + ", TypeName=" + TypeName + "]";
	}

	
	//+ ", products=" + products 
	

}
