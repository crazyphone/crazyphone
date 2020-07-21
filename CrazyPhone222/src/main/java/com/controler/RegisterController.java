package com.controler;

import java.io.File;
import java.sql.Blob;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.model.MemberBean;
import com.service.MemberService;

@Controller
public class RegisterController {
	@Autowired
	MemberService memberService;
	@Autowired
	ServletContext ctx;
	
	
	// 首頁跳轉註冊頁面
	@GetMapping("/register")
	public String register(Model model,HttpSession session) {

		MemberBean mb = new MemberBean();
		model.addAttribute("MemberBean", mb);
		return "_1register";
	}
	
	
	//接收
	@PostMapping("/register")
	public String register2(@ModelAttribute("MemberBean") MemberBean mb,Model model) {
		Map<String, String> errorMap = new HashMap<String, String>();
		
		model.addAttribute("ErrorKey",errorMap);
		
		if (mb.getMemberEmail() == null || mb.getMemberEmail().trim().length() == 0) {
			errorMap.put("AccountEmptyError", "帳號欄必須輸入");
		}
		if (mb.getMemberPwd() == null || mb.getMemberPwd().trim().length() == 0) {
			errorMap.put("PswAccountEmptyError", "密碼欄必須輸入");
		}
		if (mb.getMemberName() == null || mb.getMemberName().trim().length() == 0) {
			errorMap.put("NameEmptyError", "姓名欄必須輸入");
		}
		if (mb.getMemberPhone() == null || mb.getMemberPhone().trim().length() == 0) {
			errorMap.put("PhoneEmptyError", "手機欄必須輸入");
		}
		if (mb.getMemberAddress() == null || mb.getMemberAddress().trim().length() == 0) {
			errorMap.put("AddressEmptyError", "地址欄必須輸入");
		}
		if (mb.getMemberBirth() == null || mb.getMemberBirth().trim().length() == 0) {
			errorMap.put("BirthEmptyError", "生日欄必須輸入");
		}
		
		if (!errorMap.isEmpty()) {
			return "_1register";
		
		}
		//時間戳記
		Timestamp CreateDate = new Timestamp(System.currentTimeMillis());
		mb.setCreateDate(CreateDate);

		mb.setAuthorityID(1);
		mb.setMemberstatus("正常");
		
//		String aa = mb.getMemberBirth();
//		System.out.println("brith"+aa);
//		mb.setMemberBirth(aa);
		//圖片存進資料夾
//		MultipartFile MemberImage = mb.getMImage();
//		String originalFilename = MemberImage.getOriginalFilename();
//		
//		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
//		String rootDirectory = ctx.getRealPath("/");
//		try {
//			File imageFolder = new File(rootDirectory, "images");
//			if (!imageFolder.exists()) imageFolder.mkdirs();
//			File file = new File(imageFolder, mb.getMemberName()+ ext);
//			MemberImage.transferTo(file);
//			//存資料庫路徑
//			String ImPath="C:\\_JSP\\tomcat9\\webapps\\CrazyPhone22\\images\\" + mb.getMemberName()+ ext;
//			mb.setMemberImage(ImPath);
//		} catch(Exception e) {
//			e.printStackTrace();
//			throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
//		}
		
		// 圖片存到Blob欄位
		MultipartFile MImage = mb.getMImage();
		String originalFilename = MImage.getOriginalFilename();
		mb.setMemberFileName(originalFilename);
		// 建立Blob物件，交由 Hibernate 寫入資料庫
		if (MImage != null && !MImage.isEmpty()) {
			try {
				byte[] b = MImage.getBytes();
				Blob blob = new SerialBlob(b);
				mb.setMemberImage(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		
		if(mb.getMemberFileName() == "") {
			mb.setMemberFileName(null);
		}

		if(memberService.addMember(mb)) {
			System.out.println("帳號有了");
			errorMap.put("mailError", "帳號存在了,請重新輸入新的帳號");
			return "_1register";
			
		}else {
			System.out.println("帳號可以創建");
			memberService.addMember1(mb);
			model.addAttribute("str","恭喜您，註冊");
			return "_53Seconds";
		}
		
		
	}
}
