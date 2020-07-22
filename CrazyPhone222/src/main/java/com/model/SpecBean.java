package com.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="Spec")
public class SpecBean {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)

	private Integer SpecID;
	private String OS;
	private String Processor;
	private String DisplaySize;
	private String DisplayResolution;
	private String FrontCamera;
	private String RearCamera;
	private String RAM;
	private String Storage;
	private String BatteryCapacity;
	
	@OneToOne
	@JoinColumn(name = "ProductID")
	ProductBean productBean;

	public SpecBean() {
		super();
	}

	public SpecBean(Integer specID, String oS, String processor, String displaySize, String displayResolution,
			String frontCamera, String rearCamera, String rAM, String storage, String batteryCapacity,
			ProductBean productBean) {
		super();
		SpecID = specID;
		OS = oS;
		Processor = processor;
		DisplaySize = displaySize;
		DisplayResolution = displayResolution;
		FrontCamera = frontCamera;
		RearCamera = rearCamera;
		RAM = rAM;
		Storage = storage;
		BatteryCapacity = batteryCapacity;
		this.productBean = productBean;
	}

	public Integer getSpecID() {
		return SpecID;
	}

	public void setSpecID(Integer specID) {
		SpecID = specID;
	}

	public String getOS() {
		return OS;
	}

	public void setOS(String oS) {
		OS = oS;
	}

	public String getProcessor() {
		return Processor;
	}

	public void setProcessor(String processor) {
		Processor = processor;
	}

	public String getDisplaySize() {
		return DisplaySize;
	}

	public void setDisplaySize(String displaySize) {
		DisplaySize = displaySize;
	}

	public String getDisplayResolution() {
		return DisplayResolution;
	}

	public void setDisplayResolution(String displayResolution) {
		DisplayResolution = displayResolution;
	}

	public String getFrontCamera() {
		return FrontCamera;
	}

	public void setFrontCamera(String frontCamera) {
		FrontCamera = frontCamera;
	}

	public String getRearCamera() {
		return RearCamera;
	}

	public void setRearCamera(String rearCamera) {
		RearCamera = rearCamera;
	}

	public String getRAM() {
		return RAM;
	}

	public void setRAM(String rAM) {
		RAM = rAM;
	}

	public String getStorage() {
		return Storage;
	}

	public void setStorage(String storage) {
		Storage = storage;
	}

	public String getBatteryCapacity() {
		return BatteryCapacity;
	}

	public void setBatteryCapacity(String batteryCapacity) {
		BatteryCapacity = batteryCapacity;
	}

	public ProductBean getProductBean() {
		return productBean;
	}

	public void setProductBean(ProductBean productBean) {
		this.productBean = productBean;
	}

	@Override
	public String toString() {
		return "SpecBean [SpecID=" + SpecID + ", OS=" + OS + ", Processor=" + Processor + ", DisplaySize=" + DisplaySize
				+ ", DisplayResolution=" + DisplayResolution + ", FrontCamera=" + FrontCamera + ", RearCamera="
				+ RearCamera + ", RAM=" + RAM + ", Storage=" + Storage + ", BatteryCapacity=" + BatteryCapacity
				 + "]";
	}
	

}
