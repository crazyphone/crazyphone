package com.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Service")
public class ServiceBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer CSID;
	private String Subjects;
	private String CreateDate;
	private String QMessage;
	private String AMessage;
	private String ADate;
	private Integer Statuss;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "MemberBeanID")
	private MemberBean memberBean;

	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "SupervisorBeanID")
	private SupervisorBean supervisorBean;

	public ServiceBean() {
		super();
	
	}

	public ServiceBean(Integer cSID, String subjects, String createDate, String qMessage, String aMessage, String aDate,
			Integer statuss, MemberBean memberBean, SupervisorBean supervisorBean) {
		super();
		CSID = cSID;
		Subjects = subjects;
		CreateDate = createDate;
		QMessage = qMessage;
		AMessage = aMessage;
		ADate = aDate;
		Statuss = statuss;
		this.memberBean = memberBean;
		this.supervisorBean = supervisorBean;
	}

	public Integer getCSID() {
		return CSID;
	}

	public void setCSID(Integer cSID) {
		CSID = cSID;
	}

	public String getSubjects() {
		return Subjects;
	}

	public void setSubjects(String subjects) {
		Subjects = subjects;
	}

	public String getCreateDate() {
		return CreateDate;
	}

	public void setCreateDate(String createDate) {
		CreateDate = createDate;
	}

	public String getQMessage() {
		return QMessage;
	}

	public void setQMessage(String qMessage) {
		QMessage = qMessage;
	}

	public String getAMessage() {
		return AMessage;
	}

	public void setAMessage(String aMessage) {
		AMessage = aMessage;
	}

	public String getADate() {
		return ADate;
	}

	public void setADate(String aDate) {
		ADate = aDate;
	}

	public Integer getStatuss() {
		return Statuss;
	}

	public void setStatuss(Integer statuss) {
		Statuss = statuss;
	}

	public MemberBean getMemberBean() {
		return memberBean;
	}

	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}

	public SupervisorBean getSupervisorBean() {
		return supervisorBean;
	}

	public void setSupervisorBean(SupervisorBean supervisorBean) {
		this.supervisorBean = supervisorBean;
	}

	@Override
	public String toString() {
		return "ServiceBean [CSID=" + CSID + ", Subjects=" + Subjects + ", CreateDate=" + CreateDate + ", QMessage="
				+ QMessage + ", AMessage=" + AMessage + ", ADate=" + ADate + ", Statuss=" + Statuss + ", memberBean="
				+ memberBean + ", supervisorBean=" + supervisorBean + "]";
	}

	
	

	
}
