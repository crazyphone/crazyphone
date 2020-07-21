package com.model;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Orders")
public class OrdersBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer OrderID;
	private Integer MemberID;
	private Timestamp OrderDate;
	private Integer ProductId;
	private String ProductName;
	private Integer Quantity;
	private Integer DiscountID;
	private Integer FinalPrice;
	private String InvoiceNum;
	private Timestamp ShippedDate;
	private String ShipAddress;
	private String Receiver;
	private String ReceiverPhone;
	private String GoodsStatus;
	
	public OrdersBean() {
		super();
		
	}
	public OrdersBean(Integer orderID, Integer memberID, Timestamp orderDate, Integer productId, String productName,
			Integer quantity, Integer discountID, Integer finalPrice, String invoiceNum, Timestamp shippedDate,
			String shipAddress, String receiver, String receiverPhone, String goodsStatus) {
		super();
		OrderID = orderID;
		MemberID = memberID;
		OrderDate = orderDate;
		ProductId = productId;
		ProductName = productName;
		Quantity = quantity;
		DiscountID = discountID;
		FinalPrice = finalPrice;
		InvoiceNum = invoiceNum;
		ShippedDate = shippedDate;
		ShipAddress = shipAddress;
		Receiver = receiver;
		ReceiverPhone = receiverPhone;
		GoodsStatus = goodsStatus;
	}
	public Integer getOrderID() {
		return OrderID;
	}
	public void setOrderID(Integer orderID) {
		OrderID = orderID;
	}
	public Integer getMemberID() {
		return MemberID;
	}
	public void setMemberID(Integer memberID) {
		MemberID = memberID;
	}
	public Timestamp getOrderDate() {
		return OrderDate;
	}
	public void setOrderDate(Timestamp orderDate) {
		OrderDate = orderDate;
	}
	public Integer getProductId() {
		return ProductId;
	}
	public void setProductId(Integer productId) {
		ProductId = productId;
	}
	public String getProductName() {
		return ProductName;
	}
	public void setProductName(String productName) {
		ProductName = productName;
	}
	public Integer getQuantity() {
		return Quantity;
	}
	public void setQuantity(Integer quantity) {
		Quantity = quantity;
	}
	public Integer getDiscountID() {
		return DiscountID;
	}
	public void setDiscountID(Integer discountID) {
		DiscountID = discountID;
	}
	public Integer getFinalPrice() {
		return FinalPrice;
	}
	public void setFinalPrice(Integer finalPrice) {
		FinalPrice = finalPrice;
	}
	public String getInvoiceNum() {
		return InvoiceNum;
	}
	public void setInvoiceNum(String invoiceNum) {
		InvoiceNum = invoiceNum;
	}
	public Timestamp getShippedDate() {
		return ShippedDate;
	}
	public void setShippedDate(Timestamp shippedDate) {
		ShippedDate = shippedDate;
	}
	public String getShipAddress() {
		return ShipAddress;
	}
	public void setShipAddress(String shipAddress) {
		ShipAddress = shipAddress;
	}
	public String getReceiver() {
		return Receiver;
	}
	public void setReceiver(String receiver) {
		Receiver = receiver;
	}
	public String getReceiverPhone() {
		return ReceiverPhone;
	}
	public void setReceiverPhone(String receiverPhone) {
		ReceiverPhone = receiverPhone;
	}
	public String getGoodsStatus() {
		return GoodsStatus;
	}
	public void setGoodsStatus(String goodsStatus) {
		GoodsStatus = goodsStatus;
	}
	@Override
	public String toString() {
		return "OrdersBean [OrderID=" + OrderID + ", MemberID=" + MemberID + ", OrderDate=" + OrderDate + ", ProductId="
				+ ProductId + ", ProductName=" + ProductName + ", Quantity=" + Quantity + ", DiscountID=" + DiscountID
				+ ", FinalPrice=" + FinalPrice + ", InvoiceNum=" + InvoiceNum + ", ShippedDate=" + ShippedDate
				+ ", ShipAddress=" + ShipAddress + ", Receiver=" + Receiver + ", ReceiverPhone=" + ReceiverPhone
				+ ", GoodsStatus=" + GoodsStatus + "]";
	}
	

}