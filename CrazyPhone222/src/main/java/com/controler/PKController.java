package com.controler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.model.PKCart;
import com.model.PKItemBean;
//import com.service.ProductService;
//import com.model.MemberBean;
import com.model.ProductBean;
import com.service.ProductService;

@Controller
@SessionAttributes({"PKCart"})
public class PKController {
	//ProductService service;
	@Autowired
	ProductService service;
	
	@ModelAttribute("PKCart")
	public PKCart createPK(Model model) {
		PKCart pc = new PKCart();
		return pc;
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

	@PostMapping("/addToPKCart")
	public String addToPKCart(Model model, 
//		   @RequestParam Blob productImage,
		   @RequestParam Integer productID,
		   @RequestParam String productName,
		   @RequestParam Integer UnitPrice,
		   @RequestParam String page) {
		
		PKCart cart = (PKCart)model.getAttribute("PKCart");
		ProductBean bean = service.getProductById(productID);
	
		PKItemBean pib = new PKItemBean(null, null, bean.getSpecBean(), bean);
//		model.addAttribute("pkItemBean", pib);
		cart.addToPKCart(productID, pib);
		System.out.println("After addToCart to ShowPage->" + page);
		return "redirect:/" + page;
	}
	

}
 