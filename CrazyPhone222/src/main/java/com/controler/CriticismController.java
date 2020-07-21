package com.controler;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.InputStream;
import java.sql.Blob;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.model.CriticismBean;
import com.model.ProductBean;
import com.service.CriticismService;
import com.service.ProductService;

@Controller
public class CriticismController {
	@Autowired
	CriticismService service;

	@Autowired
	ProductService pService;
	@Autowired
	ServletContext ctx;

	// 第一個controller(用來顯示所有評論)
	// 0703測試ok
//
//	@GetMapping("/criticism")
//	public String list(Model model, HttpServletRequest req) {
//		List<CriticismBean> beans = service.getAllCriticism();
//		model.addAttribute("criticism", beans);
//		return "criticism";
//	}

	// 第二個controller(新增評論)(有兩支)
	// 0706測試ok
	// 2.1.送給瀏覽器空白表單
	@GetMapping("/criticism/add")
	public String getAddNewCriticismForm(@RequestParam Integer productID, Model model) {
		CriticismBean bean = new CriticismBean();
		model.addAttribute("criticismBean", bean);
		model.addAttribute("product", pService.getProductById(productID));
		return "addCriticism";
	}

	// 2.2.從瀏覽器送出後跳轉回評論清單(criticism)頁面
	@PostMapping("/criticism/add")
	public String processAddNewCriticismForm(@RequestParam Integer productID,
			@ModelAttribute("criticismBean") CriticismBean bean, BindingResult result, Model model) {

		//把productID存入CriticismBean的ProductBean
		ProductBean pb = pService.getProductById(productID);
		bean.setProductBean(pb);
		
		model.addAttribute("product", pService.getProductById(productID));
		MultipartFile addCriticismImage = bean.getAddCriticismImage();
		String originalFilename = addCriticismImage.getOriginalFilename();
		bean.setCriFileName(originalFilename);

		if (addCriticismImage != null && !addCriticismImage.isEmpty()) {
			try {
				byte[] b = addCriticismImage.getBytes();
				Blob blob = new SerialBlob(b);
				bean.setCriticismImage(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException();
			}
		}
		service.addCriticism(bean);

		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
		String rootDirectory = ctx.getRealPath("/");
		try {
			File imageFolder = new File(rootDirectory, "images2");
			if (!imageFolder.exists())
				imageFolder.mkdirs();
			File file = new File(imageFolder, bean.getCriticismID() + ext);
			addCriticismImage.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}

//		return "redirect:/criticism";
//		return "redirect:/criticism/product2";
		return "redirect:http://localhost:8080/CrazyPhone222/id?productID="+productID;
	}
	


	// 第2.2個controller(顯示圖片)
	// 無法顯示??路徑重複,已除錯成功
	// 7/7測試ok
	@GetMapping("/getPicture2/{criticismID}")
	public ResponseEntity<byte[]> getPitcure(HttpServletRequest req, @PathVariable Integer criticismID) {
		String noImagePath = "\\resources\\images\\NoImage.jpg";
		ResponseEntity<byte[]> re = null;
		CriticismBean bean = service.getCriticismById(criticismID);

		ByteArrayOutputStream baos = null;
		InputStream is = null;
		try {
			Blob blob = bean.getCriticismImage();
			if (blob != null) {
				is = blob.getBinaryStream();
			} else {
				;
			}

			if (is == null) {
				is = ctx.getResourceAsStream(noImagePath);
			}
			baos = new ByteArrayOutputStream();
			int len = 0;
			byte[] b = new byte[819200];
			while ((len = is.read(b)) != -1) {
				baos.write(b, 0, len);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		byte[] b0 = baos.toByteArray();
		String filename = bean.getCriFileName();
		String mimeType = null;
		MediaType mediaType = null;
		if (filename != null) {
			mimeType = ctx.getMimeType(filename);
		} else {
			mimeType = ctx.getMimeType(noImagePath);
		}
		mediaType = MediaType.valueOf(mimeType);

		HttpHeaders headers = new HttpHeaders();// 回應標頭
		headers.setContentType(mediaType);
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		re = new ResponseEntity<>(b0, headers, HttpStatus.OK);

		return re;
	}


	// 第三個controller(用criticismID分類並顯示)
	// 7/8測試ok
	@GetMapping("/getProductIds")
	public String getProductIds(Model model) {
		List<Integer> list = service.getAllIds();
		model.addAttribute("productIds", list);
		return "types/productIds";
	}
//原本的
//	@GetMapping("/criticism/{productID}")
//	public String getCriticismByProductId(@PathVariable Integer productID, Model model) {
//		List<CriticismBean> beans = service.getCriticismByProductId(productID);
//		model.addAttribute("criticism", beans);
//		return "criticism";
//	}

	//try
	@GetMapping("/criticism")
		public String getCriticismByProductId(@RequestParam Integer productID, Model model) {
		List<CriticismBean> beans = service.getCriticismByProductId(productID);
		model.addAttribute("criticism", beans);
		model.addAttribute("productID",productID);
		return "criticism";
	}
//	@GetMapping("/criticism")
//	public String list(Model model, HttpServletRequest req) {
//		List<CriticismBean> beans = service.getAllCriticism();
//		model.addAttribute("criticism", beans);
//		return "criticism";
//	}
	
	
	
//	}
//	@GetMapping("/product")
//	public String getProductsById(@RequestParam Integer id, Model model) {
//		model.addAttribute("product", service.getProductById(id));
//		return "product";
//	}
//	
//	@GetMapping("/products/add")
//	public String getAddNewProductForm(Model model) {
//		BookBean bb = new BookBean();
//		model.addAttribute("bookBean", bb);
//		return "addProduct";
//	}
//	@PostMapping("/products/add")
//	public String processAddNewProductForm(@ModelAttribute("bookBean") BookBean bb) {
//		service.addProduct(bb);
//		return "redirect:/products";
//	}
//	
//	@ModelAttribute("companyList")
//	public Map<Integer, String> getCompanyList(){
//		Map<Integer, String> map = new HashMap<>();
//		List<CompanyBean> list = service.getCompanyList();
//		for (CompanyBean cb : list) {
//			map.put(cb.getId(),cb.getName());
//		}
//		return map;
//	}

//	@ModelAttribute("categoryList")
//	public List<String> getCategoryList(){
//		return service.getAllCategories();
//	}
//	

}
