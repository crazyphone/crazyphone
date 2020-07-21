package com.controler;

import java.io.ByteArrayOutputStream;
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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.model.BrandBean;
import com.model.ProductBean;
import com.model.TypeBean;
import com.service.Supervisorervice;

@Controller
public class SupervisorController {
	@Autowired
	Supervisorervice supervisorervice;
	@Autowired
	ServletContext ctx;

	// 品牌頁
	@GetMapping("/Brand")
	public String readBjsp(Model model) {
		model.addAttribute("Brands", supervisorervice.getbrandlist());
		return "_L_backBrand";
	}

	// 品牌新增頁
	@GetMapping("/addBrand")
	public String addBjsp(Model model) {
		BrandBean BB = new BrandBean();
		model.addAttribute("BrandBean", BB);
		return "_L_addbrand";
	}

	// 品牌編輯頁
	@GetMapping("/upBrand/{brandID}")
	public String updBjsp(Model model, @PathVariable Integer brandID) {
		BrandBean BB = new BrandBean();
		BB = supervisorervice.getbrandbyid(brandID);
		model.addAttribute("BrandBean", BB);
		return "_L_updbrand";
	}

	// 新增品牌
	@PostMapping("/addBrand")
	public String addBrand(@ModelAttribute("BrandBean") BrandBean BB, Model model) {
		// 上傳圖片
		MultipartFile BImage = BB.getBImage();
		String originalFilename = BImage.getOriginalFilename();
		BB.setBrandFileName(originalFilename);
		if (BImage != null && !BImage.isEmpty()) {
			try {
				byte[] b = BImage.getBytes();
				Blob blob = new SerialBlob(b);
				BB.setBrandImage(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		Map<String, String> Berror = new HashMap<String, String>();
		model.addAttribute("Errorb", Berror);
		if (BB.getBrandName() == null || BB.getBrandName().trim().length() == 0) {
			Berror.put("namespace", "請輸入名稱");
		}
		if (BB.getBrandInfo() == null || BB.getBrandInfo().trim().length() == 0) {
			Berror.put("infospace", "請輸入簡介");
		}
		if (BB.getBrandCountry() == null || BB.getBrandCountry().trim().length() == 0) {
			Berror.put("countryspace", "請輸入地址");
		}
		if (BB.getBrandImage() == null) {
			Berror.put("imgspace", "請上傳Logo");
		}

		if (!Berror.isEmpty()) {
			return "_L_addbrand";

		} else {
			supervisorervice.addbrand(BB);
			return "redirect:/Brand";
		}

	}

	// 編輯品牌
	@PostMapping("/upBrand/{brandID}")
	public String updBrand(@ModelAttribute("BrandBean") BrandBean BB, Model model, @PathVariable Integer brandID) {
		MultipartFile BImage = BB.getBImage();
		String originalFilename = BImage.getOriginalFilename();
		BB.setBrandFileName(originalFilename);
		if (BImage != null && !BImage.isEmpty()) {
			try {
				byte[] b = BImage.getBytes();
				Blob blob = new SerialBlob(b);
				BB.setBrandImage(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		Map<String, String> Berror = new HashMap<String, String>();
		model.addAttribute("Errorb", Berror);
		supervisorervice.updatabrand(BB.getBrandName(), BB.getBrandInfo(), BB.getBrandCountry(), BB.getBrandImage(),
				brandID);
		return "redirect:/Brand";
	}

	// 顯示品牌圖片
	@GetMapping("/getBrandImg/{brandID}")
	public ResponseEntity<byte[]> getBrandImg(HttpServletRequest req, @PathVariable Integer brandID) {
		String noImagePath = "\\resources\\nothing.jpg";
		ResponseEntity<byte[]> re = null;
		BrandBean BB = supervisorervice.getbrandbyid(brandID);
		ByteArrayOutputStream baos = null;
		InputStream is = null;
		try {
			Blob blob = BB.getBrandImage();
			if (blob != null) {
				is = blob.getBinaryStream();
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

		String filename = BB.getBrandFileName();

		String mimeType = null;
		MediaType mediaType = null;
		if (filename != null) {
			mimeType = ctx.getMimeType(filename);
			mediaType = MediaType.valueOf(mimeType);
		} else {
			mimeType = ctx.getMimeType(noImagePath);
			mediaType = MediaType.valueOf(mimeType);
		}
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(mediaType);
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		re = new ResponseEntity<>(b0, headers, HttpStatus.OK);
		return re;
	}

	// 品牌刪除
	@GetMapping("/deb/{brandID}")
	public String deletebrand(@PathVariable Integer brandID) {
		boolean de = supervisorervice.dropbrand(brandID);
		if (de == false) {
			System.out.println("刪除失敗");
		}
		return "redirect:/Brand";
	}

	// 商品頁
	@GetMapping("/Product")
	public String readPjsp(Model model) {
		model.addAttribute("Products", supervisorervice.getproductlist());
		return "_L_backProduct";
	}

	// 商品新增頁
	@GetMapping("/addProduct")
	public String addPjsp(Model model) {
		ProductBean PB = new ProductBean();
		model.addAttribute("ProductBean", PB);
		return "_L_addproduct";
	}
     
	//商品刪除
	@GetMapping("/peb/{productID}")
	public String deleteproduct(Model model, @PathVariable Integer productID) {
		boolean de = supervisorervice.dropproduct(productID);
		if (de == false) {
			System.out.println("刪除失敗");
		}
		return "redirect:/Product";
	}

	// 商品品牌選單
	@ModelAttribute("BrandMap")
	public Map<Integer, String> getBrandList() {
		Map<Integer, String> brandMap = new HashMap<>();
		List<BrandBean> list = supervisorervice.getbrandlist();
		for (BrandBean BB : list) {
			brandMap.put(BB.getBrandID(), BB.getBrandName());
		}
		return brandMap;
	}

	// 商品類型選單
	@ModelAttribute("TypeMap")
	public Map<Integer, String> getTypeList() {
		Map<Integer, String> typeMap = new HashMap<>();
		List<TypeBean> list = supervisorervice.gettypelist();
		for (TypeBean TB : list) {
			typeMap.put(TB.getTypeID(), TB.getTypeName());
		}
		return typeMap;
	}

	// 新增商品
	@PostMapping("/addProduct")
	public String addProduct(@ModelAttribute("ProductBean") ProductBean PB, Model model) {
		// 上傳圖片1
		MultipartFile PImage = PB.getPImage();
		String originalFilename = PImage.getOriginalFilename();
		PB.setProductFileName(originalFilename);
		if (PImage != null && !PImage.isEmpty()) {
			try {
				byte[] b = PImage.getBytes();
				Blob blob = new SerialBlob(b);
				PB.setProductImage(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		// 上傳圖片2
		MultipartFile PImage2 = PB.getPImage();
		String originalFilename2 = PImage2.getOriginalFilename();
		PB.setProductFileName2(originalFilename2);
		if (PImage2 != null && !PImage2.isEmpty()) {
			try {
				byte[] b = PImage2.getBytes();
				Blob blob = new SerialBlob(b);
				PB.setProductImage2(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		// 上傳圖片3
		MultipartFile PImage3 = PB.getPImage();
		String originalFilename3 = PImage3.getOriginalFilename();
		PB.setProductFileName2(originalFilename3);
		if (PImage3 != null && !PImage3.isEmpty()) {
			try {
				byte[] b = PImage3.getBytes();
				Blob blob = new SerialBlob(b);
				PB.setProductImage3(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		Map<String, String> Perror = new HashMap<String, String>();
		model.addAttribute("Errorp", Perror);
		if (PB.getProductName() == null || PB.getProductName().trim().length() == 0) {
			Perror.put("namespace", "請輸入名稱");
		}
		if (PB.getBrandBeanID() == -1) {
			Perror.put("nochoosep", "請選擇品牌");
		}
		if (PB.getTypeBeanID() == -1) {
			Perror.put("nochooset", "請選擇類型");
		}
		if (PB.getProductIntro() == null || PB.getProductIntro().trim().length() == 0) {
			Perror.put("introspace", "請輸入資訊");
		}
		if (PB.getUnitPrice() == null || PB.getUnitPrice() == 0) {
			Perror.put("pricespace", "請輸入金額");
		}
		if (PB.getUnitPrice() != null && PB.getUnitPrice() <= 3000) {
			Perror.put("pricespace", "金額不能小於3000");
		}
		if (PB.getStockQuantity() == null || PB.getStockQuantity() == 0) {
			Perror.put("sqspace", "請輸入庫存");
		}
		if (PB.getStockQuantity() != null && PB.getStockQuantity() <= 50) {
			Perror.put("sqspace", "庫存不能小於50");
		}
		if (PB.getProductImage() == null) {
			Perror.put("pimgspace", "請上傳圖片");
		}
		if (PB.getProductImage2() == null) {
			Perror.put("pimgspace2", "請上傳圖片");
		}
		if (PB.getProductImage3() == null) {
			Perror.put("pimgspace3", "請上傳圖片");
		}
		if (!Perror.isEmpty()) {
			return "_L_addproduct";

		} else {
			supervisorervice.addproduct(PB);
			return "redirect:/Product";
		}

	}

	// 顯示品牌圖片
	@GetMapping("/getproductimg/{productID}")
	public ResponseEntity<byte[]> getProductImg(HttpServletRequest req, @PathVariable Integer productID) {
		String noImagePath = "\\resources\\nothing.jpg";
		ResponseEntity<byte[]> re = null;
		ProductBean PB = supervisorervice.getproductbyid(productID);
		ByteArrayOutputStream baos = null;
		InputStream is = null;
		try {
			Blob blob = PB.getProductImage();
			if (blob != null) {
				is = blob.getBinaryStream();
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

		String filename = PB.getProductFileName();

		String mimeType = null;
		MediaType mediaType = null;
		if (filename != null) {
			mimeType = ctx.getMimeType(filename);
			mediaType = MediaType.valueOf(mimeType);
		} else {
			mimeType = ctx.getMimeType(noImagePath);
			mediaType = MediaType.valueOf(mimeType);
		}
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(mediaType);
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		re = new ResponseEntity<>(b0, headers, HttpStatus.OK);
		return re;
	}

	// 顯示品牌圖片2
	@GetMapping("/getproductimg2/{productID}")
	public ResponseEntity<byte[]> getProductImg2(HttpServletRequest req, @PathVariable Integer productID) {
		String noImagePath = "\\resources\\nothing.jpg";
		ResponseEntity<byte[]> re = null;
		ProductBean PB = supervisorervice.getproductbyid(productID);
		ByteArrayOutputStream baos = null;
		InputStream is = null;
		try {
			Blob blob = PB.getProductImage2();
			if (blob != null) {
				is = blob.getBinaryStream();
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

		String filename = PB.getProductFileName2();

		String mimeType = null;
		MediaType mediaType = null;
		if (filename != null) {
			mimeType = ctx.getMimeType(filename);
			mediaType = MediaType.valueOf(mimeType);
		} else {
			mimeType = ctx.getMimeType(noImagePath);
			mediaType = MediaType.valueOf(mimeType);
		}
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(mediaType);
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		re = new ResponseEntity<>(b0, headers, HttpStatus.OK);
		return re;
	}

	// 顯示品牌圖片3
	@GetMapping("/getproductimg3/{productID}")
	public ResponseEntity<byte[]> getProductImg3(HttpServletRequest req, @PathVariable Integer productID) {
		String noImagePath = "\\resources\\nothing.jpg";
		ResponseEntity<byte[]> re = null;
		ProductBean PB = supervisorervice.getproductbyid(productID);
		ByteArrayOutputStream baos = null;
		InputStream is = null;
		try {
			Blob blob = PB.getProductImage3();
			if (blob != null) {
				is = blob.getBinaryStream();
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

		String filename = PB.getProductFileName3();

		String mimeType = null;
		MediaType mediaType = null;
		if (filename != null) {
			mimeType = ctx.getMimeType(filename);
			mediaType = MediaType.valueOf(mimeType);
		} else {
			mimeType = ctx.getMimeType(noImagePath);
			mediaType = MediaType.valueOf(mimeType);
		}
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(mediaType);
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		re = new ResponseEntity<>(b0, headers, HttpStatus.OK);
		return re;
	}
}
