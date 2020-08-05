package com.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.OrderDetail;
import com.paypal.api.payments.Amount;
import com.paypal.api.payments.Details;
import com.paypal.api.payments.Item;
import com.paypal.api.payments.ItemList;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.PaymentExecution;
import com.paypal.api.payments.RedirectUrls;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;

@Service
public class PaypalService {

	@Autowired
	private APIContext apiContext;

	public Payment createPayment(
			OrderDetail orderDetail,
			String cancelUrl,
			String successUrl
			) throws PayPalRESTException{
//transaction
		Details details = new Details();
		details.setShipping(orderDetail.getShipping());
		details.setSubtotal(orderDetail.getSubtotal());
		details.setTax(orderDetail.getTax());
	
		 
		Amount amount = new Amount();
		amount.setCurrency("TWD");
		amount.setTotal(orderDetail.getTotal());
		amount.setDetails(details);
		
		Transaction transaction = new Transaction();
		transaction.setDescription(orderDetail.getProductName());
		transaction.setAmount(amount);

		 	ItemList itemList = new ItemList();
		    List<Item> items = new ArrayList<>();
		     
		    Item item = new Item();
		    item.setCurrency("TWD");
		    item.setName(orderDetail.getProductName());
		    item.setPrice(orderDetail.getSubtotal());
		    item.setTax(orderDetail.getTax());
		    item.setQuantity("1");
		     
		    items.add(item);
		    itemList.setItems(items);
		    transaction.setItemList(itemList);
		
		List<Transaction> transactions = new ArrayList<>();
		transactions.add(transaction);
//Payer
		Payer payer = new Payer();
		payer.setPaymentMethod("paypal");
//Payment
		Payment payment = new Payment();
		payment.setIntent("authorize");
		payment.setPayer(payer);  
		payment.setTransactions(transactions);
		

		
		RedirectUrls redirectUrls = new RedirectUrls();
		redirectUrls.setCancelUrl(cancelUrl);
		
		redirectUrls.setReturnUrl(successUrl);

		payment.setRedirectUrls(redirectUrls);
		
		return payment.create(apiContext);
	}

	public Payment executePayment(String paymentId, String payerId) throws PayPalRESTException {
		Payment payment = new Payment();
		payment.setId(paymentId);
		PaymentExecution paymentExecute = new PaymentExecution();
		paymentExecute.setPayerId(payerId);

		return payment.execute(apiContext, paymentExecute);
	}

}
