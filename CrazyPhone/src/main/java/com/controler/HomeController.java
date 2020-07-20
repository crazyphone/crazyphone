package com.controler;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.model.ProductBean;
import com.service.MemberService;
import com.service.ProductService;

@Controller
public class HomeController {

	@Autowired
	MemberService memberService;

	@Autowired
	ProductService service;
	
	@Autowired
	ServletContext ctx;
	
	
	@RequestMapping(value = "/",method = RequestMethod.GET)
	public String home(Model model,HttpSession session) {
		session.setAttribute("carousels11",memberService.getAllCarousels());
		List<ProductBean> list = service.getAllProducts();
		model.addAttribute("products",list);
		
		return "index";	
	}
	
	@GetMapping("/typo")
	public String typo(Model model) {
		return "typo";
	}
	
	@GetMapping("/contact")
	public String contact(Model model) {
		return "contact";
	}
	
	@GetMapping("/single")
	public String single(Model model) {
		return "test_single2";
	}
	
	@GetMapping("/compare")
	public String compare(Model model) {
		return "compare";
	}
}
