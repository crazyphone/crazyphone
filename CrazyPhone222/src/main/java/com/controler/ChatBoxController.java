package com.controler;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ChatBoxController {

   @GetMapping("/webweb")
   public String index(Model model,HttpSession session) {
	   
//		如果沒有登入就跳轉登入畫面
		Object sess = session.getAttribute("LoginOK");
		if(sess == null) {
			return "redirect:/lognin";
		}
	   
      return "websocket";
   }
   
   @GetMapping("/webwebBack")
   public String indexBACK() {
	   
	   
      return "websocketback";
   }
   
   
}