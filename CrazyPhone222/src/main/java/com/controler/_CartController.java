package com.controler;
import java.util.List;
//Hung
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.model.ProductBean;
import com.model.ShoppingCart;
import com.model.OrderItemBean;
//import com.service.ProductService;
//import com.model.MemberBean;

@Controller
@SessionAttributes({"ShoppingCart"})
public class _CartController {
	//ProductService service;

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

}
 