package com.controler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.model.OrderDetail;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.ShippingAddress;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.PayPalRESTException;
import com.service.PaypalService;

@Controller
public class PaypalController {

	@Autowired
	PaypalService service;

	@GetMapping("/check")
	public String home() {
		return "check";
	}
	
	@PostMapping(value = "/authorize_payment")
	public String payment(Model model, @RequestParam(value = "product") String product,
			@RequestParam(value = "subtotal") String subtotal, @RequestParam(value = "shipping") String shipping,
			@RequestParam(value = "tax") String tax, @RequestParam(value = "total") String total) {
		OrderDetail orderDetail = new OrderDetail(product, subtotal, shipping, tax, total);
		try {
			Payment payment = service.createPayment(orderDetail, "http://localhost:8080/CrazyPhone22/cancel",
					"http://localhost:8080/CrazyPhone22/review_payment");
			
			
			for (Links link : payment.getLinks()) {
				if (link.getRel().equalsIgnoreCase("approval_url")) {
					
					return "redirect:" + link.getHref();
				}
			}

		} catch (PayPalRESTException e) {

			e.printStackTrace();
		}
		return "redirect:/";
	}

	@GetMapping("/CrazyPhone22/cancel")
	public String cancelPay() {
		return "cancel";
	}


	
	@GetMapping(value ="/review_payment")
	public String successPay(Model model,
							@RequestParam("paymentId") String paymentId,
							@RequestParam("PayerID") String payerId) {
		try {
		
			Payment payment = service.executePayment(paymentId, payerId);
			System.out.println(payment.toJSON());
			if (payment.getState().equals("approved")) {
				
			 PayerInfo payerInfo = payment.getPayer().getPayerInfo();
		     Transaction transaction = payment.getTransactions().get(0);
		     ShippingAddress shippingAddress = transaction.getItemList().getShippingAddress();
		             
		     model.addAttribute("payer", payerInfo);
		     model.addAttribute("transaction", transaction);
		     model.addAttribute("shippingAddress", shippingAddress);
				
				
				return "revieworder";
			}
		} catch (PayPalRESTException e) {
			System.out.println(e.getMessage());
		}
		return "redirect:/";
	}

}
