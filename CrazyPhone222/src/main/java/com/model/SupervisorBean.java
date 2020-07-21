package com.model;

import java.sql.Blob;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
@Entity
@Table(name="Supervisor")
public class SupervisorBean {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer SupervisorID;

	private String SupervisorName;
	private String SupervisorImage;
	private String SupervisorAccount;
	private String SupervisorPwd;
	private Timestamp CreateDate;
	private Timestamp ModifiedDate;
	private String SupervisorEmail;
	Integer AuthorityID;

	
	@OneToMany(mappedBy = "supervisorBean")
	private Set<ServiceBean> Services= new HashSet<>();
	
	public SupervisorBean() {
		super();
	}

	
	public SupervisorBean(Integer supervisorID, String supervisorName, String supervisorImage, String supervisorAccount,
			String supervisorPwd, Timestamp createDate, Timestamp modifiedDate, String supervisorEmail,
			Integer authorityID, Set<ServiceBean> services) {
		super();
		SupervisorID = supervisorID;
		SupervisorName = supervisorName;
		SupervisorImage = supervisorImage;
		SupervisorAccount = supervisorAccount;
		SupervisorPwd = supervisorPwd;
		CreateDate = createDate;
		ModifiedDate = modifiedDate;
		SupervisorEmail = supervisorEmail;
		AuthorityID = authorityID;
		Services = services;
	}


	public Integer getSupervisorID() {
		return SupervisorID;
	}



	public void setSupervisorID(Integer supervisorID) {
		SupervisorID = supervisorID;
	}







	public String getSupervisorName() {
		return SupervisorName;
	}







	public void setSupervisorName(String supervisorName) {
		SupervisorName = supervisorName;
	}







	public String getSupervisorImage() {
		return SupervisorImage;
	}







	public void setSupervisorImage(String supervisorImage) {
		SupervisorImage = supervisorImage;
	}







	public Integer getAuthorityID() {
		return AuthorityID;
	}







	public void setAuthorityID(Integer authorityID) {
		AuthorityID = authorityID;
	}







	public String getSupervisorAccount() {
		return SupervisorAccount;
	}

	public void setSupervisorAccount(String supervisorAccount) {
		SupervisorAccount = supervisorAccount;
	}

	public String getSupervisorPwd() {
		return SupervisorPwd;
	}

	public void setSupervisorPwd(String supervisorPwd) {
		SupervisorPwd = supervisorPwd;
	}

	public Timestamp getCreateDate() {
		return CreateDate;
	}

	public void setCreateDate(Timestamp createDate) {
		CreateDate = createDate;
	}

	public Timestamp getModifiedDate() {
		return ModifiedDate;
	}

	public void setModifiedDate(Timestamp modifiedDate) {
		ModifiedDate = modifiedDate;
	}

	public String getSupervisorEmail() {
		return SupervisorEmail;
	}

	public void setSupervisorEmail(String supervisorEmail) {
		SupervisorEmail = supervisorEmail;
	}


	public Set<ServiceBean> getServices() {
		return Services;
	}

	public void setServices(Set<ServiceBean> services) {
		Services = services;
	}


	@Override
	public String toString() {
		return "SupervisorBean [SupervisorID=" + SupervisorID + ", SupervisorName=" + SupervisorName
				+ ", SupervisorImage=" + SupervisorImage + ", SupervisorAccount=" + SupervisorAccount
				+ ", SupervisorPwd=" + SupervisorPwd + ", CreateDate=" + CreateDate + ", ModifiedDate=" + ModifiedDate
				+ ", SupervisorEmail=" + SupervisorEmail + ", AuthorityID=" + AuthorityID + ", Services=" + Services
				+ "]";
	}


	
	
	
	
	
}
