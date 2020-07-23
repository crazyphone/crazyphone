package com.controler;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.model.PKCart;
import com.model.PKItemBean;
import com.model.ProductBean;
import com.service.ProductService;

@Controller
@SessionAttributes("PKCart")
public class PKCartController {
	
	@Autowired
	ProductService service;
	
	@RequestMapping("removePKCart")
	public String removePKCart(Model model, SessionStatus status) {
		status.setComplete(); // Clear Cart Items
		return "redirect:/products2";

	}	
		@RequestMapping("showPKCartContent")
		public String showPKCartContentAll(Model model, SessionStatus status,HttpSession session) {
			                      
			
//			如果沒有登入就跳轉登入畫面
			Object sess = session.getAttribute("LoginOK");
			if(sess == null) {
				return "redirect:/lognin";
			}
			
			
			PKCart cart = (PKCart)model.getAttribute("PKCart");
			Map<Long, PKItemBean> pkcart = cart.getContent();
			Set<Long> set=pkcart.keySet();
			for(Long x:set) {
				PKItemBean bean=pkcart.get(x);
				System.out.println(bean);
			}

			System.out.println("redirect:showCartContent");
			return "showPKCartContent";     
		}
	}



 