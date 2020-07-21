package com.model;

import java.sql.Blob;
import java.sql.Timestamp;


import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "Criticism")
public class CriticismBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer CriticismID;

	
	Timestamp CreateDate;
	Integer Score;
	String TextContent;
	Blob CriticismImage;
	Integer Likes;
	Integer Unlike;
	Integer Parent;
	Integer Report;
	String CriticismStatus;
	String  CriFileName;
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "ProductID")
	ProductBean productBean;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "MemberID")
	MemberBean memberBean;

	public CriticismBean() {
		super();
	}
	//加
	@Transient 
	private MultipartFile addCriticismImage;
	
	//加
	public MultipartFile getAddCriticismImage() {
		return addCriticismImage;
	}
	//加
	public void setAddCriticismImage(MultipartFile addCriticismImage) {
		this.addCriticismImage = addCriticismImage;
	}


	public CriticismBean(Integer criticismID, Timestamp createDate, Integer score, String textContent,
			Blob criticismImage, Integer likes, Integer unlike, Integer parent, Integer report, String criticismStatus,
			String criFileName, ProductBean productBean, MemberBean memberBean) {
		super();
		CriticismID = criticismID;
		CreateDate = createDate;
		Score = score;
		TextContent = textContent;
		CriticismImage = criticismImage;
		Likes = likes;
		Unlike = unlike;
		Parent = parent;
		Report = report;
		CriticismStatus = criticismStatus;
		CriFileName = criFileName;
		this.productBean = productBean;
		this.memberBean = memberBean;
	}



	public Integer getCriticismID() {
		return CriticismID;
	}

	public void setCriticismID(Integer criticismID) {
		CriticismID = criticismID;
	}

	public Timestamp getCreateDate() {
		return CreateDate;
	}

	public void setCreateDate(Timestamp createDate) {
		CreateDate = createDate;
	}

	public Integer getScore() {
		return Score;
	}

	public void setScore(Integer score) {
		Score = score;
	}

	public String getTextContent() {
		return TextContent;
	}

	public void setTextContent(String textContent) {
		TextContent = textContent;
	}

	public Blob getCriticismImage() {
		return CriticismImage;
	}

	public void setCriticismImage(Blob criticismImage) {
		CriticismImage = criticismImage;
	}

	public Integer getLikes() {
		return Likes;
	}

	public void setLikes(Integer likes) {
		Likes = likes;
	}

	public Integer getUnlike() {
		return Unlike;
	}

	public void setUnlike(Integer unlike) {
		Unlike = unlike;
	}

	public Integer getParent() {
		return Parent;
	}

	public void setParent(Integer parent) {
		Parent = parent;
	}

	public Integer getReport() {
		return Report;
	}

	public void setReport(Integer report) {
		Report = report;
	}

	public String getCriticismStatus() {
		return CriticismStatus;
	}

	public void setCriticismStatus(String criticismStatus) {
		CriticismStatus = criticismStatus;
	}

	public ProductBean getProductBean() {
		return productBean;
	}

	public void setProductBean(ProductBean productBean) {
		this.productBean = productBean;
	}

	public MemberBean getMemberBean() {
		return memberBean;
	}

	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}

	public String getCriFileName() {
		return CriFileName;
	}



	public void setCriFileName(String criFileName) {
		CriFileName = criFileName;
	}


	@Override
	public String toString() {
		return "CriticismBean [CriticismID=" + CriticismID + ", CreateDate=" + CreateDate + ", Score=" + Score
				+ ", TextContent=" + TextContent + ", CriticismImage=" + CriticismImage + ", Likes=" + Likes
				+ ", Unlike=" + Unlike + ", Parent=" + Parent + ", Report=" + Report + ", CriticismStatus="
				+ CriticismStatus + ", memberBean=" + memberBean + "]";
	}
	//+ ", productBean=" + productBean
	

	
	
}
