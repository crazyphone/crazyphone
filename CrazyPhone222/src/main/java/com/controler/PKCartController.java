package com.controler;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
	@Autowired
	ServletContext ctx;
	
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
		
		@GetMapping("/getPictureForPK/{productID}")
		public ResponseEntity<byte[]> getPitcure(HttpServletRequest req, @PathVariable Integer productID){
			String noImagePath = "\\resources\\images\\NoImage.jpg";
			ResponseEntity<byte[]> re = null;
			ProductBean bean = service.getProductById(productID);
			
			ByteArrayOutputStream baos=null;
			InputStream is = null;
			try {
				Blob blob = bean.getProductImage();
				if(blob !=null) {
					is = blob.getBinaryStream();
				}else {
					;
				}
				
				if (is == null){
					is = ctx.getResourceAsStream(noImagePath);
				}
				baos = new ByteArrayOutputStream();
				int len = 0;
				byte[] b = new byte[819200];
				while ((len = is.read(b)) != -1) {
					baos.write(b,0,len);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			byte[] b0 = baos.toByteArray();
			String filename = bean.getProductFileName();
			String mimeType = null;
			MediaType mediaType = null;
			if (filename != null) {
				mimeType = ctx.getMimeType(filename);
			}else {
				mimeType = ctx.getMimeType(noImagePath);
			}
			mediaType = MediaType.valueOf(mimeType);
			
			HttpHeaders headers = new HttpHeaders();//回應標頭
			headers.setContentType(mediaType);
			headers.setCacheControl(CacheControl.noCache().getHeaderValue());
			re = new ResponseEntity<>(b0, headers, HttpStatus.OK);
			
			return re;
		}
	}



 