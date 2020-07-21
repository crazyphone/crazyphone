package com.controler;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.GeneralSecurityException;
import java.sql.Blob;
import java.sql.Timestamp;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.Mail.sendmail2;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.model.CarouselBean;
import com.model.MemberBean;
import com.model.SupervisorBean;
import com.service.MemberService;




@Controller
public class MemberController {
	@Autowired
	MemberService memberService;
	@Autowired
	ServletContext ctx;
	
//	//回首頁
//	@RequestMapping("/home")
//	public String bHome(Model model) {
//
//		return "index";
//	}
	//首頁跳轉聯絡我們
	@RequestMapping("/contact")
	public String contact(Model model) {

		return "contact";
	}
	//(聯絡我們)寄信
	@RequestMapping(value = "/contact",method =RequestMethod.POST)
	public void contactMail(@RequestParam(value="name") String name
			   ,@RequestParam(value="mail") String mail
			   ,@RequestParam(value="title") String title
			   ,@RequestParam(value="message") String message
			   ,Model model) {
		model.addAttribute("msg", "ok");
		
		sendmail2.send2(name, mail, title, message);
		
		
	
	}

	// 首頁跳轉登入頁面
	@RequestMapping("/lognin")
	public String lognin(Model model) {
		MemberBean mb = new MemberBean();
		model.addAttribute("MemberBean", mb);
		return "_1signIn";
	}



	// 接收登入資訊
	@SuppressWarnings("unused")
	@RequestMapping(value = "/processlognin",method =RequestMethod.POST)
	public String processlognin(@RequestParam(value="uname") String name
			,@RequestParam(value="psw") String psw,Model model,HttpSession session) {
		

		
		Map<String, String> errorMsgMap = new HashMap<String, String>();
		
		model.addAttribute("ErrorMsgKey",errorMsgMap);
		
		if (name == null || name.trim().length() == 0) {
			errorMsgMap.put("AccountEmptyError", "帳號欄必須輸入");
		}
		
		
		if (psw == null || psw.trim().length() == 0) {
			errorMsgMap.put("PasswordEmptyError", "密碼欄必須輸入");
		}
		
		if (!errorMsgMap.isEmpty()) {
		
			return "_1signIn";
			
		}else {
			MemberBean mb=null;
		
			try {
				// 呼叫 loginService物件的 checkIDPassword()，傳入userid與password兩個參數
				mb = memberService.checkIdPassword(name,psw);
			
				if (mb != null) {
					// OK, 登入成功, 將mb物件放入Session範圍內，識別字串為"LoginOK"
					session.setAttribute("LoginOK", mb);
					
				} else {
					// NG, 登入失敗, userid與密碼的組合錯誤，放相關的錯誤訊息到 errorMsgMap 之內
					errorMsgMap.put("LoginError", "該帳號不存在或密碼錯誤");
					
				}
			} catch (RuntimeException ex) {
				errorMsgMap.put("LoginError", ex.getMessage());
			}
			
			
			if (errorMsgMap.isEmpty()) {
				return "redirect:/";
			} else {
				return "_1signIn";
			}
		}
		
	}
	// 1.登入跳轉到忘記密碼
	@RequestMapping("/_2forgetPsw")
	public String forgetPsw() {
		return "_2forgetPsw";
	}
	//2.(忘記密碼)寄信
	@RequestMapping(value = "/forget",method =RequestMethod.POST)
	public String forget(@RequestParam(value="mail") String mail,Model model,HttpSession session) throws Exception {
		sendmail2.send("55", mail, "66", "77", "66");
		session.setAttribute("fg", mail);
		
		return "_3code";
		
	}
	//3.接收驗證碼
	@RequestMapping(value = "/code123")
	public String code(@RequestParam(value="code") String code,Model model,HttpSession session) throws Exception {

		return "_4update";
	}
	//4.修改密碼
	@RequestMapping(value = "/updatePwd111",method =RequestMethod.POST)
	public String updatePwd(@RequestParam(value="newPwd") String newPwd,HttpSession session,Model model) {
		String fgg=(String) session.getAttribute("fg");
		System.out.println("帳號Email="+fgg);
		System.out.println("新密碼為="+newPwd);
		
		boolean t = memberService.updatePsw(newPwd,fgg);
		System.out.println(t);
		
		session.removeAttribute("fg");
		
		model.addAttribute("str","修改密碼");
		
		return "_53Seconds";
		
	}
	
	
	//google登入
	@RequestMapping(value = "/googleVerify", method = RequestMethod.POST)
	public String verifyToken(String idtokenstr,HttpServletRequest request) {
		
		HttpSession session=request.getSession();
		
		if(session.getAttribute("LoginOK") != null) {
			session.removeAttribute("LoginOK");
		}
		
		System.out.println(idtokenstr+"這邊是尾巴");
		GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(
				new NetHttpTransport(), JacksonFactory.getDefaultInstance())
				.setAudience(Collections.singletonList("110794926966-tvl8m24boaqav34ifoh4fe3fh3egsusg.apps.googleusercontent.com")).build();
		GoogleIdToken idToken = null;
		String userId=null;
		String email=null;
		String name=null;
		MemberBean en=null;
		try {
			idToken = verifier.verify(idtokenstr);
		} catch (GeneralSecurityException e) {
			System.out.println("驗證時出現GeneralSecurityException異常");
		} catch (IOException e) {
			System.out.println("驗證時出現IOException異常");
		}
		if (idToken != null) {
			System.out.println("驗證成功.");
			Payload payload = idToken.getPayload();
			userId = payload.getSubject();
//			System.out.println("User ID: " + userId);
			email = payload.getEmail();
//			boolean emailVerified = Boolean.valueOf(payload.getEmailVerified());
			name = (String) payload.get("name");
//			String pictureUrl = (String) payload.get("picture");
//			String locale = (String) payload.get("locale");
//			String familyName = (String) payload.get("family_name");
//			String givenName = (String) payload.get("given_name");
		} else {
			System.out.println("Invalid ID token.");
		}
		System.out.println("這是使用者的email:"+ email);
		System.out.println("這是使用者的name:"+name);
		
//		Timestamp CreateDate = new Timestamp(System.currentTimeMillis());
//		mb.setCreateDate(CreateDate);
//
//		mb.setAuthorityID(1);
		boolean abab = memberService.addGoogleMember(email);
		if(abab == false) {
			Timestamp CreateDate = new Timestamp(System.currentTimeMillis());
			memberService.addGoogleMember1(email, name,CreateDate);
		}
		
		
		en=memberService.checkIdPassword2(email , name);
		
		if (en != null) {
			session.setAttribute("LoginOK", en);
		} else {
			System.out.println("找不到google帳號");
		}
		
		System.out.println(session.getAttribute("LoginOK"));
		
		
		
		return "redirect:/";
	}
	
	//登出
	@RequestMapping("/lognout")
	public String lognout(Model model,HttpSession session) {
		session.removeAttribute("LoginOK");
		session.removeAttribute("LoginSuperOK");
	
		System.out.println("登出了");
		return "redirect:/";
	}
	
	//會員跳轉基本資料
	@RequestMapping("/up1")
	public String up1(Model model,HttpSession session) {
		MemberBean mb = new MemberBean();
		model.addAttribute("MemberBean", mb);
		return "members";
	}
	
	//會員修改資料
	@RequestMapping(value ="/up1", method = RequestMethod.POST)
	public String upMember(@ModelAttribute("MemberBean") MemberBean mb1,Model model,HttpSession session) {
		
//		System.out.println(mb1.getMemberEmail());
//		System.out.println(mb1.getMemberName());
//		System.out.println(mb1.getMemberBirth());
//		System.out.println(mb1.getMemberPhone());
//		System.out.println(mb1.getMemberAddress());
		// 圖片存到Blob欄位
		MultipartFile MImage = mb1.getMImage();
		String originalFilename = MImage.getOriginalFilename();
		System.out.println(originalFilename);
		mb1.setMemberFileName(originalFilename);
		// 建立Blob物件，交由 Hibernate 寫入資料庫
		if (MImage != null && !MImage.isEmpty()) {
			try {
				byte[] b = MImage.getBytes();
				Blob blob = new SerialBlob(b);
				mb1.setMemberImage(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		
		MemberBean ord = (MemberBean) session.getAttribute("LoginOK");
		String mmm = ord.getMemberEmail();
		System.out.println(mmm);
		 MemberBean t = memberService.upMember(mmm,mb1.getMemberName(),mb1.getMemberBirth()
											,mb1.getMemberPhone(),mb1.getMemberAddress(),mb1.getMemberImage());
		System.out.println(t);
		session.removeAttribute("LoginOK");
		System.out.println("刪除LoginOK了");
		session.setAttribute("LoginOK", t);
		System.out.println("加入LoginOK了"+t);
		
		model.addAttribute("str","修改基本資料");
		
		return "_53Seconds";
	}
	
	//取圖片顯示
	@GetMapping("/getmemImg/{memberID}")
	public ResponseEntity<byte[]> getMemberImg(HttpServletRequest req,@PathVariable Integer memberID) {

		String noImagePath="\\resources\\nouse.png";
		ResponseEntity<byte[]> re =null;
		MemberBean bean =memberService.getMemberbyIdaa(memberID);
		//做位元組陣列
		ByteArrayOutputStream baos = null;
		InputStream is =null;
		try {
			Blob blob=bean.getMemberImage();
			if(blob != null ) {
			   is =blob.getBinaryStream();
			}
		   
			//如果沒有圖片就用路徑預設
			if(is == null ) {
				is=ctx.getResourceAsStream(noImagePath);
			}
			
			baos = new ByteArrayOutputStream();
			int len =0;
			byte[] b=new byte[819200];
			while((len = is.read(b))!= -1) {
				baos.write(b,0,len);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		byte[] b0 =baos.toByteArray();
		
		String filename =bean.getMemberFileName();
		
		String mimeType =null;
		MediaType mediaType=null;
		if(filename != null ) {
			mimeType =ctx.getMimeType(filename);
			mediaType = MediaType.valueOf(mimeType);
		}else {
			mimeType =ctx.getMimeType(noImagePath);
			mediaType = MediaType.valueOf(mimeType);
		}
		
		
		HttpHeaders headers =new HttpHeaders();
		
		headers.setContentType(mediaType);
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		re = new ResponseEntity<>(b0,headers,HttpStatus.OK);
		
		return re;
	}
	//取圖片顯示(輪播圖)
	@GetMapping("/getcarImg/{carouselID}")
	public ResponseEntity<byte[]> getCarouselImg(HttpServletRequest req,@PathVariable Integer carouselID) {

		String noImagePath="\\resources\\nouse.png";
		ResponseEntity<byte[]> re =null;
		CarouselBean bean =memberService.getCarouselByIdaa(carouselID);
		//做位元組陣列
		ByteArrayOutputStream baos = null;
		InputStream is =null;
		try {
			Blob blob=bean.getCarouselImg();
			if(blob != null ) {
			   is =blob.getBinaryStream();
			}
		   
			//如果沒有圖片就用路徑預設
			if(is == null ) {
				is=ctx.getResourceAsStream(noImagePath);
			}
			
			baos = new ByteArrayOutputStream();
			int len =0;
			byte[] b=new byte[819200];
			while((len = is.read(b))!= -1) {
				baos.write(b,0,len);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		byte[] b0 =baos.toByteArray();
		
		String filename =bean.getCarouselFileName();
		
		String mimeType =null;
		MediaType mediaType=null;
		if(filename != null ) {
			mimeType =ctx.getMimeType(filename);
			mediaType = MediaType.valueOf(mimeType);
		}else {
			mimeType =ctx.getMimeType(noImagePath);
			mediaType = MediaType.valueOf(mimeType);
		}
		
		
		HttpHeaders headers =new HttpHeaders();
		
		headers.setContentType(mediaType);
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		re = new ResponseEntity<>(b0,headers,HttpStatus.OK);
		
		return re;
	}
	
	//首頁跳轉管理員登入
	@GetMapping("/super")
	public String superLognin(Model model) {
		SupervisorBean sb = new SupervisorBean();
		model.addAttribute("SupervisorBean", sb);
		return "_1signIn2";
	}
	//接收管理員登入資訊
	@RequestMapping(value = "/super",method =RequestMethod.POST)
	public String superLognin2(@RequestParam(value="uname") String name
			,@RequestParam(value="psw") String psw,Model model,HttpSession session) {
		Map<String, String> errorSuperMap = new HashMap<String, String>();
		
		model.addAttribute("ErrorSuperKey",errorSuperMap);
		
		if (name == null || name.trim().length() == 0) {
			errorSuperMap.put("AccountEmptyError", "帳號欄必須輸入");
		}
		
		
		if (psw == null || psw.trim().length() == 0) {
			errorSuperMap.put("PasswordEmptyError", "密碼欄必須輸入");
		}
		
		if (!errorSuperMap.isEmpty()) {
		
			return "_1signIn2";
			
		}else {
			SupervisorBean sb=null;
		
			try {
				// 呼叫 loginService物件的 checkIDPassword()，傳入userid與password兩個參數
				sb = memberService.checkSuperIdPassword(name,psw);
			
				if (sb != null) {
					session.setAttribute("LoginSuperOK", sb);
					
				} else {
					errorSuperMap.put("LoginSuperError", "該帳號不存在或密碼錯誤");
					
				}
			} catch (RuntimeException ex) {
				errorSuperMap.put("LoginSuperError", ex.getMessage());
			}
			
			
			if (errorSuperMap.isEmpty()) {
				return "redirect:/";
			} else {
				return "_1signIn2";
			}
		}
		
	}
	//搜尋會員資料
	@RequestMapping(value = "/searchMember",method =RequestMethod.POST)
	public String processlognin1(@RequestParam(value="search1") String search
			,@RequestParam(value="status1") String status1
			,Model model,HttpSession session) {
//		session.removeAttribute("members");
		
		
		
		
		List<MemberBean> mb=(List) memberService.searchMember(search,status1);
		if(mb != null) {
			model.addAttribute("members",mb);
		}else {
			System.out.println("查無此會員資料");
		}
		
		
				return "backMembers";
	}
	
	//後台刪除會員
	@GetMapping("/debu/{memberID}")
	public String deleteMember(Model model,@PathVariable Integer memberID) {
		
		
		boolean de1 = memberService.deleteMember(memberID);
		if(de1 == false) {
			System.out.println("刪除失敗");
		}
			return "redirect:/test";
	
	}
	//後台封鎖會員
	@GetMapping("/seal/{memberID}")
	public String sealOffMember(Model model,@PathVariable Integer memberID,HttpSession session) {
		
		Map<String, Integer> sealMap = new HashMap<String, Integer>();
		
		

		
		
		boolean seal = memberService.sealOffMember(memberID);
		if(seal == false) {
			System.out.println("封鎖失敗");
		}
//		session.setAttribute("seal",memberID);
		sealMap.put("mapaa",memberID);
		session.setAttribute("seal",sealMap);
			return "redirect:/test";
	
	}
	//後台解鎖會員
	@GetMapping("/sealOn/{memberID}")
	public String sealOnMember(Model model,@PathVariable Integer memberID,HttpSession session) {
		
		boolean seal1 = memberService.sealOnMember(memberID);
		if(seal1 == false) {
			System.out.println("解封失敗");
		}
		session.removeAttribute("seal");
			return "redirect:/test";
	
	}
	
	//按後台連到後台首頁
	@GetMapping("/backIndex")
	public String backIndex(Model model,HttpSession session) {
	
		
		
		return "backIndex";
	}
	
	
	//連到會員資料
	@GetMapping("/test")
	public String test(Model model,HttpSession session) {
	
		model.addAttribute("members",memberService.getAllMembers());
		
		return "backMembers";
	}
	//後台按輪播管理
	@GetMapping("/addCarousel")
	public String carouselAll(Model model,HttpSession session) {
		model.addAttribute("carousels",memberService.getAllCarousels());
		
		CarouselBean cb = new CarouselBean();
		model.addAttribute("CarouselBean", cb);
		return "backCarousel";
	}
	//後台新增輪播圖
	@PostMapping("/addCarousel")
	public String addCarousel(@ModelAttribute("CarouselBean") CarouselBean Cb1
							,Model model,HttpSession session) {
		
		MultipartFile CImage = Cb1.getCImage();
		String originalFilename = CImage.getOriginalFilename();
		Cb1.setCarouselFileName(originalFilename);
		// 建立Blob物件，交由 Hibernate 寫入資料庫
		if (CImage != null && !CImage.isEmpty()) {
			try {
				byte[] b = CImage.getBytes();
				Blob blob = new SerialBlob(b);
				Cb1.setCarouselImg(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		
		
		
		Timestamp CreateDate = new Timestamp(System.currentTimeMillis());
		Cb1.setCreateDate(CreateDate);
		
		
		memberService.addCarousel(Cb1);
		
		
		return "redirect:/addCarousel";
	}
	
	
	//後台刪除輪播圖
		@GetMapping("/deCar/{carouselID}")
		public String deleteCarousel(Model model,@PathVariable Integer carouselID) {
			
			
			boolean de1 = memberService.deleteCarousel(carouselID);
			if(de1 == false) {
				System.out.println("刪除失敗");
			}
			return "redirect:/addCarousel";
		
		}

		//連到歷史訂單
		@PostMapping("/orderSelectMember")
		public String orderSelectMember(Model model,HttpSession session,@RequestParam(value="idid") Integer id) {
		
			model.addAttribute("orderSelectMember",memberService.getAllMemberOrders(id));
			
			return "selectOrders";
		}
		
		
	
	//如果沒有登入就跳轉登入畫面
//	Object sess = session.getAttribute("LoginOK");
//	if(sess == null) {
//		return "redirect:/lognin";
//	}
	
	
	
}