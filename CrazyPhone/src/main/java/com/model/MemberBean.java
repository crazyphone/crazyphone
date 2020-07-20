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
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;


@Entity
@Table(name="Member")
public class MemberBean {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	Integer MemberID;

	String MemberName;
	Blob MemberImage;
	String MemberPhone;
	String MemberEmail;
	String MemberAddress;
	String MemberBirth;
	String MemberPwd;
	Timestamp CreateDate;
	String MemberFileName;
	String Memberstatus;
	Integer AuthorityID;
	
	@Transient
	private MultipartFile MImage;
	
	@OneToMany(mappedBy = "memberBean")
	private Set<CriticismBean> criticisms = new HashSet<>();
	
	
	@OneToMany(mappedBy = "memberBean")
	private Set<ServiceBean> Services= new HashSet<>();
	
	
	@OneToMany(mappedBy = "memberBean")
	private Set<ModifiedBean> Modifieds= new HashSet<>();

	public MemberBean() {
		super();
	}

	
	


	public MemberBean(Integer memberID, String memberName, Blob memberImage, String memberPhone, String memberEmail,
			String memberAddress, String memberBirth, String memberPwd, Timestamp createDate, String memberFileName,
			String memberstatus, Integer authorityID, MultipartFile mImage, Set<CriticismBean> criticisms,
			Set<ServiceBean> services, Set<ModifiedBean> modifieds) {
		super();
		MemberID = memberID;
		MemberName = memberName;
		MemberImage = memberImage;
		MemberPhone = memberPhone;
		MemberEmail = memberEmail;
		MemberAddress = memberAddress;
		MemberBirth = memberBirth;
		MemberPwd = memberPwd;
		CreateDate = createDate;
		MemberFileName = memberFileName;
		Memberstatus = memberstatus;
		AuthorityID = authorityID;
		MImage = mImage;
		this.criticisms = criticisms;
		Services = services;
		Modifieds = modifieds;
	}





	public Integer getMemberID() {
		return MemberID;
	}



	public void setMemberID(Integer memberID) {
		MemberID = memberID;
	}



	public String getMemberName() {
		return MemberName;
	}



	public void setMemberName(String memberName) {
		MemberName = memberName;
	}

	public Blob getMemberImage() {
		return MemberImage;
	}



	public void setMemberImage(Blob memberImage) {
		MemberImage = memberImage;
	}



	public String getMemberPhone() {
		return MemberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		MemberPhone = memberPhone;
	}

	public String getMemberEmail() {
		return MemberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		MemberEmail = memberEmail;
	}

	public String getMemberAddress() {
		return MemberAddress;
	}

	public void setMemberAddress(String memberAddress) {
		MemberAddress = memberAddress;
	}

	public String getMemberBirth() {
		return MemberBirth;
	}

	public void setMemberBirth(String memberBirth) {
		MemberBirth = memberBirth;
	}

	public String getMemberPwd() {
		return MemberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		MemberPwd = memberPwd;
	}

	public Timestamp getCreateDate() {
		return CreateDate;
	}

	public void setCreateDate(Timestamp createDate) {
		CreateDate = createDate;
	}

	public String getMemberFileName() {
		return MemberFileName;
	}

	public void setMemberFileName(String memberFileName) {
		MemberFileName = memberFileName;
	}

	public Integer getAuthorityID() {
		return AuthorityID;
	}

	public void setAuthorityID(Integer authorityID) {
		AuthorityID = authorityID;
	}

	public Set<CriticismBean> getCriticisms() {
		return criticisms;
	}

	public void setCriticisms(Set<CriticismBean> criticisms) {
		this.criticisms = criticisms;
	}

	public Set<ServiceBean> getServices() {
		return Services;
	}

	public void setServices(Set<ServiceBean> services) {
		Services = services;
	}

	public Set<ModifiedBean> getModifieds() {
		return Modifieds;
	}

	public void setModifieds(Set<ModifiedBean> modifieds) {
		Modifieds = modifieds;
	}

	public MultipartFile getMImage() {
		return MImage;
	}

	public void setMImage(MultipartFile mImage) {
		MImage = mImage;
	}


	public String getMemberstatus() {
		return Memberstatus;
	}


	public void setMemberstatus(String memberstatus) {
		Memberstatus = memberstatus;
	}
	
}
