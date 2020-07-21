package com.controler;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
//Hung
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.model.OrderItemBean;
import com.model.OrdersBean;
import com.model.ProductBean;
import com.model.ShoppingCart;
import com.service.OrderService;
//import com.service.ProductService;
//import com.model.MemberBean;

@Controller
@SessionAttributes({"ShoppingCart"})
public class _CartController {
	//ProductService service;
	@Autowired
	OrderService Ods;
	
	@ModelAttribute("ShoppingCart")
	public ShoppingCart createShopping(Model model) {
		ShoppingCart sc = new ShoppingCart();
		System.out.println("_CartController類別內的@ModelAttribute修飾的方法中,新建ShoppingCart物件=" + sc);
		return sc;
	}

//	@ModelAttribute("memberBean")
//	public MemberBean createMemberBean(Model model) {
//		MemberBean mb = new MemberBean("king", "王小明");
//		return mb;
//	}
	
//	@ModelAttribute("product")
//	public Map<Long, PhoneBean> getAllPhones(Model model) {
//		System.out.println("service.getAllPhones().size()=" + service.getAllPhones().size());
//		return service.getAllPhones();
//	}
	
//	@ModelAttribute
//	public void combineMethod(Model model) {
//		ShoppingCart sc = new ShoppingCart();
//		model.addAttribute("ShoppingCart", sc);
//		System.out.println("在Ch04Controller1類別內的@ModelAttribute修飾的方法中,新建ShoppingCart物件=" + sc);
//		MemberBean mb = new MemberBean("kitty2020", "林曉珍");
//		model.addAttribute("memberBean", mb);
//		model.addAttribute("allBooks", service.getAllBooks());
//		
//	}

	@PostMapping("/addToCart")
	public String addToCart(Model model, 
		   @RequestParam Integer phoneId,
		   @RequestParam String phoneName,
		   @RequestParam Integer phonePrice,
		   @RequestParam Integer qty, 
		   @RequestParam String page) {
		
		ShoppingCart cart = (ShoppingCart)model.getAttribute("ShoppingCart");
		ProductBean bean = new ProductBean(phoneId, phoneName,phonePrice);
		
		OrderItemBean oib = new OrderItemBean(null, bean, qty, 1.0);
		cart.addToCart(phoneId, oib);
		System.out.println("After addToCart to ShowPage->" + page);
		return "redirect:/" + page;
	}
	@PostMapping("/addQtyToCart")
	public String addQtyToCart(Model model, 
		   @RequestParam Integer phoneId,
		   @RequestParam String phoneName,
		   @RequestParam Integer phonePrice,
		   @RequestParam Integer qty, 
		   @RequestParam String page) {
		
		ShoppingCart cart = (ShoppingCart)model.getAttribute("ShoppingCart");
		ProductBean bean = new ProductBean(phoneId, phoneName,phonePrice);
		
		OrderItemBean oib = new OrderItemBean(null, bean, 1, 1.0);//nowqty
		cart.addToCart(phoneId, oib);
		System.out.println("After addQtyToCart to ShowPage->" + page);
		return "redirect:/" + page;
	}
	@PostMapping("/DelQtyToCart")
	public String DelQtyToCart(Model model,
		   @RequestParam Integer phoneId,
		   @RequestParam String phoneName,
		   @RequestParam Integer phonePrice,
		   @RequestParam Integer qty,
		   @RequestParam String page) {
				
		   ShoppingCart cart = (ShoppingCart)model.getAttribute("ShoppingCart");
		   ProductBean bean = new ProductBean(phoneId, phoneName,phonePrice);
		
		   OrderItemBean oib = new OrderItemBean(null, bean, qty, 1.0);//nowqty
		   cart.DelQtyToCart(phoneId, oib);
		
		System.out.println("After DelQtyToCart to ShowPage->" + page);
		return "redirect:/" + page;
	}
	
	@PostMapping("/orderToDB")
	public String orderToDB(Model model,
		   @RequestParam Integer MemberID,
		   @RequestParam String Receiver,
		   @RequestParam String ReceiverPhone,
		   @RequestParam String ShipAddress,
		   @RequestParam String page,
		   @RequestParam Integer productID,
		   @RequestParam String productName,
		   @RequestParam Integer unitPrice,
		   @RequestParam Integer quantity,
		   @RequestParam Integer sum1) {
		System.out.println("long in 0");			
		   SimpleDateFormat sdf  = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss.SSS");
		 //Date current = new Date();
		 //System.out.println(sdFormat.format(current));
		System.out.println("long in 1");
		   Integer OrderID = sdf.hashCode();
		   Timestamp OrderDate = new Timestamp(System.currentTimeMillis());
		System.out.println("Log in 2>"+OrderID+">>"+MemberID+">>"+OrderDate+">>"+ShipAddress+">>"+Receiver+">>"+ReceiverPhone);   		   
		   OrdersBean ob = new OrdersBean(OrderID, MemberID, OrderDate, productID, 
				   productName, quantity, null, sum1, null, null,
				                        ShipAddress, Receiver, ReceiverPhone, null);
		System.out.println("long in 3");   
		   ShoppingCart sc = (ShoppingCart) model.getAttribute("ShoppingCart");
		System.out.println("long in 4");
		   // 取出存放在購物車內的商品，放入Map型態的變數cart，準備將其內的商品一個一個轉換為OrderItemBean，
		   Map<Long, OrderItemBean> content = sc.getContent();
		System.out.println("long in 5");
		   Set<Long> set = content.keySet();
		 //Set<OrderItemBean> items = new LinkedHashSet<>();
		System.out.println("long in 6");
//		   for(Long i : set) {
//			    OrderItemBean ssaoib = content.get(i);
//			    ob.setProductId(ssaoib.getBean().getProductID());
//			    ob.setProductName(ssaoib.getBean().getProductName());
//			    ob.setQuantity(ssaoib.getQuantity());
//			    ob.setDiscountID(1);
//			    ob.setFinalPrice(ssaoib.getBean().getUnitPrice());
//			    ob.setInvoiceNum("");
//			    ob.setShippedDate(OrderDate);
//			    ob.setGoodsStatus("未結帳");
			    
//			    System.out.println("loop 7->"+ssaoib.getBean().getProductID());
//			    System.out.println("loop 7->"+ssaoib.getBean().getProductName());
//			    System.out.println("loop 7->"+ssaoib.getQuantity());
//			    System.out.println("loop 7->"+ssaoib.getBean().getUnitPrice());
//			    System.out.println("foop 7->"+OrderDate);
			    
//			    Ods.UpdateOrderToDB(ob);
			    Ods.insertOrder(ob);
			  //oib.setOrdersBean(ob);
			  //items.add(oib);
//		   }
//		 
		System.out.println("After orderToDB to ShowPage->" + page);
		return  page;
	}
		
}
 