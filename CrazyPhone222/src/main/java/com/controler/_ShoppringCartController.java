package com.controler;
import java.io.IOException;
import java.sql.Timestamp;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.model.OrdersBean;

@Controller
@SessionAttributes("ShoppingCart")
public class _ShoppringCartController {

@RequestMapping("removeCart")
public String removeCart(Model model, SessionStatus status) {
	status.setComplete(); // Clear Cart Items
	return "redirect:/products"; //ProductController
//	return "products2";
  //return "redirect:/index";
}	
	@RequestMapping("showCartContent")
	public String showCartContentAll(Model model, SessionStatus status) {
//		Map<String, Object> map = model.asMap();
//		Set<String> set = map.keySet();
//		for (String key : set) {
//			System.out.println(key + ":" + map.get(key));
//		}
//		System.out.println("redirect:showCartContent");
		return "showCartContent"; 
	}
//	@RequestMapping("/order123")
//	public String OrderListToDB(Model model,SessionStatus status) throws IOException {
//		ApplicationContext ctx=new FileSystemXmlApplicationContext(path);
//		SessionFactory factory=(SessionFactory)ctx.getBean("sessionFactory");
//		Session session=factory.openSession();
//		OrdersBean ob=new OrdersBean();
//			ob.setOrderID(orderID);
//			ob.setMemberID(memberID);
//			ob.setOrderDate(orderDate);
//			ob.setProductId(productId);
//			ob.setProductName(productName);
//			ob.setQuantity(quantity);
//			ob.setDiscountID(discountID);
//			ob.setFinalPrice(finalPrice);
//			ob.setInvoiceNum(invoiceNum);
//			ob.setShippedDate(shippedDate);
//			ob.setShipAddress(shipAddress);
//			ob.setReceiver(receiver);
//			ob.setReceiverPhone(receiverPhone);
//			ob.setGoodsStatus(goodsStatus);
//		session.save(ob);
//		System.out.println("新增一筆orderList記錄成功");
//		return "order1";
//	}
	@RequestMapping("/orderList")
	public String order(Model model,SessionStatus status) {
		
		return "check";
	}
	@RequestMapping("/orderList1")
	public String order1(Model model,SessionStatus status) {
		
		return "check2";
	}
}