package com.controler;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ChatBoxController {

   @GetMapping("/webweb")
   public String index() {
	   
	   
      return "websocket";
   }
   
   @GetMapping("/webwebBack")
   public String indexBACK() {
	   
	   
      return "websocketback";
   }
   
   
}