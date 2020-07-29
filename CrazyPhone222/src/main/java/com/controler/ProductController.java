package com.controler;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.util.List;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.model.BrandBean;
import com.model.ProductBean;
import com.model.ProductBeanWithImageData;
import com.service.ProductService;

@Controller
public class ProductController {
	@Autowired
	ProductService service;
	@Autowired
	ServletContext ctx;

	//第一個controller(用來顯示所有評論)
	//0703測試ok

	@GetMapping("/allProducts")
	public ResponseEntity<List<ProductBeanWithImageData>>  allProductsWithImageData(String brandName)  {
		System.out.println(brandName+"--------------------------");
//		List<ProductBeanWithImageData> list = service.getAllProductsWithImageData();
		List<ProductBeanWithImageData> list = service.getBrandName(brandName);
		for (ProductBeanWithImageData productBeanWithImageData : list) {
			System.out.println(productBeanWithImageData+"------------------------");
		}
		ResponseEntity<List<ProductBeanWithImageData>> re = new ResponseEntity<>(list, HttpStatus.OK);
		return re;
	}
	
	//跳轉商品頁
	@GetMapping("/products")
	public String list(Model model, HttpServletRequest req,HttpSession session) {
		
//		如果沒有登入就跳轉登入畫面
		Object sess = session.getAttribute("LoginOK");
		if(sess == null) {
			return "redirect:/lognin";
		}
		
		
		List<ProductBean> beans = service.getAllProducts();
		List<String> brand = service.getAllCategories();
		model.addAttribute("brands", brand);
		model.addAttribute("products", beans);
		return "test_products";
	}
	@GetMapping("/queryByCategory")
	public String getCategoryList(Model model) {
		List<String> list = service.getAllCategories();
		model.addAttribute("categoryList",list);
		return "category";
	}
	
	
	// 透過品牌篩選
		@GetMapping("/productsBrand")
		public String getProductsByBrand(@RequestParam("brandName") String brandName, Model model) {
			List<String> brand = service.getAllCategories();
			List<ProductBean> products = service.getProductsByBrand(brandName);
			model.addAttribute("brands", brand);
			model.addAttribute("products", products);
			return "test_products";
		}
	
		// 單一商品頁
		@GetMapping("/product")
		public String getProductsById(@RequestParam("id") Integer productID, Model model) {
			List<String> brand = service.getAllCategories();
			model.addAttribute("product", service.getProductById(productID));
			model.addAttribute("brands", brand);
			return "test_single2";
		}
	//透過ID顯示圖片
	@GetMapping("/getPicture/{productID}")
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
	
	//透過ID顯示圖片2
	@GetMapping("/getPicture22/{productID}")
	public ResponseEntity<byte[]> getPitcure2(HttpServletRequest req, @PathVariable Integer productID){
		String noImagePath = "\\resources\\images\\NoImage.jpg";
		ResponseEntity<byte[]> re = null;
		ProductBean bean = service.getProductById(productID);
		
		ByteArrayOutputStream baos=null;
		InputStream is = null;
		try {
			Blob blob = bean.getProductImage2();
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
		String filename = bean.getProductFileName2();
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
	//透過ID顯示圖片3
	@GetMapping("/getPicture33/{productID}")
	public ResponseEntity<byte[]> getPitcure3(HttpServletRequest req, @PathVariable Integer productID){
		String noImagePath = "\\resources\\images\\NoImage.jpg";
		ResponseEntity<byte[]> re = null;
		ProductBean bean = service.getProductById(productID);
		
		ByteArrayOutputStream baos=null;
		InputStream is = null;
		try {
			Blob blob = bean.getProductImage3();
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
		String filename = bean.getProductFileName3();
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
	
	// 搜尋
		@PostMapping("/searchProduct")
		public String productSearch(@RequestParam(value = "searchP") String productname, Model model, HttpSession session) {
//				session.removeAttribute("members");
			List<ProductBean> products = service.searchProduct(productname);
			List<String> brand = service.getAllCategories();
			model.addAttribute("brands", brand);
			if (products != null) {
				model.addAttribute("products", products);
				model.addAttribute("searchText", productname);
			} else {
				System.out.println("查無此商品資料");
			}
			return "test_products";
		}

		// 價格篩選
		@PostMapping("/productsPrice")
		public String getProductByPrice(
				@RequestParam(value = "lowestPrice",defaultValue = "0") Integer priceL,
				@RequestParam(value = "highestPrice",defaultValue = "99999") Integer priceH,
				Model model,HttpSession session) {
			
			List<ProductBean> products = service.getProductsByPrice(priceL, priceH);
			List<String> brand = service.getAllCategories();
			model.addAttribute("brands", brand);
			
			if (products != null ) {
				model.addAttribute("products", products);
				if(products.isEmpty()) {
					model.addAttribute("adjustmentText", "很抱歉，沒有篩選到符合條件的商品，您可以調整篩選條件試試看。");
					
				}
			} else {
				model.addAttribute("adjustmentText", "很抱歉，沒有篩選到符合條件的商品，您可以調整篩選條件試試看。");
				System.out.println("查無此商品資料");
				
			}
			return "test_products";
		}
		
	@GetMapping("/pk123" )
	public String pk123( Model model) {
	return "testPK";
}
	
	
	@GetMapping("/abab/{productID}")
	public String getProductID1(HttpServletRequest req, @PathVariable Integer productID,HttpSession session){
		ProductBean pk1 = service.getProductPK(productID);
		session.setAttribute("pk1",pk1);
		return "redirect:/test_products";
	}
	@GetMapping("/abab1/{productID}")
	public String getProductID2(HttpServletRequest req, @PathVariable Integer productID,HttpSession session){
		ProductBean pk2 = service.getProductPK(productID);
		session.setAttribute("pk2",pk2);
		return "redirect:/test_products";
	}
	@GetMapping("/abab2/{productID}")
	public String getProductID3(HttpServletRequest req, @PathVariable Integer productID,HttpSession session){
		ProductBean pk3 = service.getProductPK(productID);
		session.setAttribute("pk3",pk3);
		return "redirect:/test_products";
	}
}
