package com.controler;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.InputStream;
import java.sql.Blob;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.model.BrandBean;
import com.model.CriticismBean;
import com.model.MemberBean;
import com.model.ProductBean;
import com.service.CriticismService;
import com.service.MemberService;
import com.service.ProductService;

@Controller
@SessionAttributes({ "LoginOK" })
public class CriticismController {
	@Autowired
	CriticismService service;

	@Autowired
	ProductService pService;
	@Autowired
	MemberService mService;
	@Autowired
	ServletContext ctx;

	// 新增評論1/2
	// 送給瀏覽器空白表單
	@GetMapping("/criticism/add")
	public String getAddNewCriticismForm(@RequestParam Integer productID, Model model) {
		CriticismBean bean = new CriticismBean();
		model.addAttribute("criticismBean", bean);
		model.addAttribute("product", pService.getProductById(productID));
		return "addCriticism";
	}

	// 新增評論2/2
	// 從瀏覽器送出後跳轉回評論清單(criticism)頁面
	@PostMapping("/criticism/add")
	public String processAddNewCriticismForm(@RequestParam Integer productID, @RequestParam Integer memberId,
			@ModelAttribute("criticismBean") CriticismBean bean, BindingResult result, Model model) {

		// 把productID存入CriticismBean的ProductBean
		ProductBean pb = pService.getProductById(productID);
		bean.setProductBean(pb);

		// 把memberID存入CriticismBean的ProductBean
		MemberBean mb = mService.getMemberbyIdaa(memberId);
		bean.setMemberBean(mb);

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
		return "redirect:http://localhost:8080/CrazyPhone222/product?id=" + productID;
	}

	// 顯示圖片
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

	// 用ProductID分類顯示
	@GetMapping("/criticism")
	public String getCriticismByProductId(@RequestParam Integer productID, Model model) {
		List<CriticismBean> beans = service.getCriticismByProductId(productID);
		model.addAttribute("criticism", beans);
		model.addAttribute("productID", productID);
		return "criticism";
	}

	// 刪除評論
	@GetMapping("/dCri/{criticismID}")
	public String deleteCriticism(Model model, @PathVariable Integer criticismID) {
		boolean de = service.dropCriticism(criticismID);
		if (de == false) {
			System.out.println("刪除失敗");
		}
//		return "redirect:/products";
		return "redirect:http://localhost:8080/CrazyPhone222/criticism?productID=3" ;
//		return "criticism";
		

	}

	// 編輯評論
	@GetMapping("/updateCriticism/{criticismID}")
	public String updateCriticism(Model model, @PathVariable Integer criticismID) {
		CriticismBean CB = new CriticismBean();
		CB = service.getCriticismById(criticismID);
		model.addAttribute("CriticismBean", CB);
		return "updateCriticism";
	}
	
	@PostMapping("/updateCriticism/{criticismID}")
	public String processUpdateCriticism(@ModelAttribute("CriticismBean") CriticismBean CB, Model model,
			@PathVariable Integer criticismID) {
		System.out.println(criticismID);
		System.out.println(CB.getScore());
		System.out.println(CB.getTextContent());
		MultipartFile cImage = CB.getCriImage();
		String originalFilename = cImage.getOriginalFilename();
		CB.setCriFileName(originalFilename);
		if (cImage != null && !cImage.isEmpty()) {
			try {
				byte[] b = cImage.getBytes();
				Blob blob = new SerialBlob(b);
				CB.setCriticismImage(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
	
		
		
//		Map<String, String> Berror = new HashMap<String, String>();
//		model.addAttribute("Errorb", Berror);
		service.updateCriticism(CB.getScore(),  CB.getTextContent(),
				criticismID, CB.getCriticismImage());
		
		return "redirect:http://localhost:8080/CrazyPhone222/criticism?productID=3";
//		return "products";
//		return "redirect:/criticism";
	}

//		@ModelAttribute("criticismReport")
//		public String criticismReport(@RequestParam Integer criticiamID,
//				@ModelAttribute("criticismBean") CriticismBean bean, 
//				BindingResult result, Model model) {
//			
//			service.addCriticism(bean);
//			return "redirect:/product2";
//		}

}
