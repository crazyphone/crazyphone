package com.model;

import java.sql.Blob;
import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;



@Entity
@Table(name = "Carousel")
public class CarouselBean {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer CarouselID;
	
	String CarouselFileName;
	Blob CarouselImg;
	String CarouselUrl;
	Timestamp CreateDate;
	
	@Transient
	private MultipartFile CImage;

	

	public CarouselBean(Integer carouselID, String carouselFileName, Blob carouselImg, String carouselUrl,
			Timestamp createDate, MultipartFile cImage) {
		super();
		CarouselID = carouselID;
		CarouselFileName = carouselFileName;
		CarouselImg = carouselImg;
		CarouselUrl = carouselUrl;
		CreateDate = createDate;
		CImage = cImage;
	}

	public CarouselBean() {
		super();
	}

	public Integer getCarouselID() {
		return CarouselID;
	}

	public void setCarouselID(Integer carouselID) {
		CarouselID = carouselID;
	}

	public Blob getCarouselImg() {
		return CarouselImg;
	}

	public void setCarouselImg(Blob carouselImg) {
		CarouselImg = carouselImg;
	}

	public String getCarouselUrl() {
		return CarouselUrl;
	}

	public void setCarouselUrl(String carouselUrl) {
		CarouselUrl = carouselUrl;
	}

	public Timestamp getCreateDate() {
		return CreateDate;
	}

	public void setCreateDate(Timestamp createDate) {
		CreateDate = createDate;
	}

	public MultipartFile getCImage() {
		return CImage;
	}

	public void setCImage(MultipartFile cImage) {
		CImage = cImage;
	}
	

	public String getCarouselFileName() {
		return CarouselFileName;
	}

	public void setCarouselFileName(String carouselFileName) {
		CarouselFileName = carouselFileName;
	}

	@Override
	public String toString() {
		return "CarouselBean [CarouselID=" + CarouselID + ", CarouselImg=" + CarouselImg + ", CarouselUrl="
				+ CarouselUrl + ", CreateDate=" + CreateDate + ", CImage=" + CImage + "]";
	}
	
	
}
