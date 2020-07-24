package com.model;
//Hung
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;

public class PKCart {   
	Date creteTime ;
	private Map<Long, PKItemBean> pkcart = new LinkedHashMap< >();
	
	public PKCart() {
		creteTime = new Date();
	}
	
	public String getCreteTime() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss SSS");
		return sdf.format(creteTime);
	}
	public void setCreteTime(Date creteTime) {
		this.creteTime = creteTime;
	}

	public Map<Long, PKItemBean>  getContent() { // ${ShoppingCart.content}
		return pkcart;
	}
	
	public void addToPKCart(long ItemId, PKItemBean  pib) {
		//0724測試中(30-31行)
//		if (pib.getQuantity() <= 0 ) {
//			return;
//		}
		// 如果客戶在伺服器端沒有此項商品的資料，則客戶第一次購買此項商品
		if ( pkcart.get(ItemId) == null ) {
		    pkcart.put(ItemId, pib);
		} else {
	        // 重複啥事都不做
			
		}
	}

	public boolean modifyQty(long ItemId, int newQty) {
		if ( pkcart.get(ItemId) != null ) {
		   PKItemBean  bean = pkcart.get(ItemId);
		   bean.setQuantity(newQty);
	       return true;
		} else {
		   return false;
		}
	}
	// 刪除某項商品
	public int deleteItem(long ItemId) {
		if ( pkcart.get(ItemId) != null ) {
	       pkcart.remove(ItemId);  // Map介面的remove()方法
	       return 1;
		} else {
		   return 0;
		}
	}
	public int getItemNumber(){   // ShoppingCart.itemNumber
		return pkcart.size();
	}
	//計算購物車內所有商品的合計金額(每項商品的單價*數量的總和)
//	public double getSubtotal(){
//		double subTotal = 0 ;
//		Set<Long> set = pkcart.keySet();
//		for(long n : set){
//			OrderItemBean oib = cart.get(n);
//			double price    = oib.getBean().getUnitPrice();
//			double discount = oib.getDiscount();
//			int qty      = oib.getQuantity();
//			subTotal +=  price * discount * qty;
//		}
//		return subTotal;
//	}

	@Override
	public String toString() {
		return "PKCart [creteTime=" + creteTime + ", pkcart=" + pkcart + ", getCreteTime()=" + getCreteTime()
				+ ", getPKContent()=" + getContent() + ", getItemNumber()=" + getItemNumber() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}

}
