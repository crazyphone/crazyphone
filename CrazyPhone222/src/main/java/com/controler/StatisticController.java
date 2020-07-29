package com.controler;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.dao.StatisticDao;

@Controller
public class StatisticController {
	@Autowired
	StatisticDao stadao;
	
	@GetMapping("/statistic")
	   public String StatisticController(Model model) {
		   
		
		List<Object[]> revenueList = stadao.getRevenue();
		model.addAttribute("revenue",revenueList);
		System.out.println(revenueList.get(0));
		
		List<Object[]> brandList = stadao.getBrandOccupy();
		model.addAttribute("bb",brandList);
		
		
		
		List<Object[]> topList = stadao.getTopSales();
		model.addAttribute("toplist",topList);
		
	      return "backStatistic";
	   }
	
	
	
	
	
}

