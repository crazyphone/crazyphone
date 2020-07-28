package com.model;

public class ProductBeanWithImageData{
	
		ProductBean bean;
		String imageData;
		private Integer ProductID;
		private String ProductName;
		private String ProductIntro;
		private Integer StockQuantity;
		private Integer UnitPrice;
		public ProductBeanWithImageData() {
		}
		public ProductBeanWithImageData(ProductBean bean, String iamgeData) {
			this.bean = bean;
			this.imageData = iamgeData;
		}
		public ProductBean getBean() {
			return bean;
		}
		public void setBean(ProductBean bean) {
			this.bean = bean;
		}
		public String getImageData() {
			return imageData;
		}
		public void setImageData(String imageData) {
			this.imageData = imageData;
		}
		@Override
		public String toString() {
			StringBuilder builder = new StringBuilder();
			builder.append("ProductBeanWithImageData [bean=");
			builder.append(bean);
			builder.append(", imageData=");
			builder.append(imageData);
			builder.append("]");
			return builder.toString();
		}
		public String getProductName() {
			return ProductName;
		}
		public void setProductName(String productName) {
			ProductName = productName;
		}
		public String getProductIntro() {
			return ProductIntro;
		}
		public void setProductIntro(String productIntro) {
			ProductIntro = productIntro;
		}
		public Integer getStockQuantity() {
			return StockQuantity;
		}
		public void setStockQuantity(Integer stockQuantity) {
			StockQuantity = stockQuantity;
		}
		public Integer getUnitPrice() {
			return UnitPrice;
		}
		public void setUnitPrice(Integer unitPrice) {
			UnitPrice = unitPrice;
		}
		public Integer getProductID() {
			return ProductID;
		}
		public void setProductID(Integer productID) {
			ProductID = productID;
		}
		
		
		
}