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

	//加入車拚
	@PostMapping("/addToPKCart")
	public String addToPKCart(Model model, 
		   @RequestParam Integer productID,
		   @RequestParam String productName,
		   @RequestParam Integer UnitPrice,
		   @RequestParam String page) {
		
		PKCart cart = (PKCart)model.getAttribute("PKCart");
		ProductBean bean = service.getProductById(productID);
	
		PKItemBean pib = new PKItemBean(null, null, bean.getSpecBean(), bean);
		cart.addToPKCart(productID, pib);
		System.out.println("After addToCart to ShowPage->" + page);
		return "redirect:/" + page;
	}
	

}
 