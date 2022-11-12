package com.finalProject.demo.controller.front.memberManagement;

import javax.servlet.http.HttpServletRequest;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.finalProject.demo.model.entity.member.Member;
import com.finalProject.demo.service.member.MemberService;

@Controller
public class ForgotPwdController {

	@Autowired
	private MemberService mService;
	
	// ============================ 忘記密碼 ========================
	@GetMapping("/member/forgotpassword") 								
	public String forgotpassword(Model model,@ModelAttribute(name = "editpassword")Member member) {
			return "front/member/forgotpassword"; 			// 找 /forgotpassword.jsp 顯示畫面：登入畫面
	}
	
	// ============================ 忘記密碼:判斷email及手機號碼是否正確 ========================
			@PostMapping("/member/editpassword")
			public String findPassword(HttpServletRequest request, @ModelAttribute(name = "editpassword") Member member,
					RedirectAttributes re,Model model) {
		// ---- 資料傳到SQL ------
				
				Member mmm = mService.findPassword(member.getEmail(),member.getPhone());
				
					System.out.println("==================== 忘記密碼 =========================");
					if (mmm != null) { 			   // 若資料庫沒有的帳密則登入失敗
//						// 如果登入成功帳密存到Session
//						// 第一步：獲取session
//						HttpSession session = request.getSession();
//						// 第二步：將想要保存到數據存入session中
//						session.setAttribute("email", mmm.getEmail()); // 取得那欄位的帳號,從0(陣列)開始,放入session
//						session.setAttribute("phone", mmm.getPhone());
//						
//						// 完成了用戶名和密碼保存到session的操作
						model.addAttribute("mb", mmm);
//						System.out.println("確認忘記密碼成功");
						return "front/member/changepassword";
					} else {
						re.addAttribute("Msg", "驗證失敗!"); 			   // 畫面顯示：驗證失敗!
//						System.out.println("驗證忘記密碼失敗!");
						return "redirect:/member/forgotpassword"; 		   // 返回登入畫面
					}
			}
			
			// ============================ 修改密碼 ========================
			@PostMapping("/member/updatepassword")
			public String UpdatePassword(HttpServletRequest request, 
					@ModelAttribute(name="updatepassword")Member member, Model model) {
				System.out.println("===============送出修改按鈕=================");
				
//				HttpSession session = request.getSession();
//				String email = session.getAttribute("email").toString(); // 使用Session是因為要用抓這人的帳密來判斷這人的資料
//				String password = session.getAttribute("password").toString();
//				System.out.println("id: " + member.getMemberId());
				//先從資料庫抓會員
				Member mb = mService.findById(member.getMemberId());
				if(mb != null) {
					mb.setPassword(member.getPassword());
					String hashpw = BCrypt.hashpw(member.getPassword(), BCrypt.gensalt());
					mb.setPassword(hashpw);
					mService.insert(mb);
//					System.out.println("更新成功!");
//					model = getViewUser(request, model);		// 如果要顯示更新成功這三段就要開啟getViewUser方法
//					model.addAttribute("Msg", "更新成功!");
//					return "user/user";
					return "redirect:member/login";				// 使用此return是不會顯示更新成功
				}
				else {
//					System.out.println("更新失敗!");
					model.addAttribute("Msg", "更新失敗!"); // 畫面顯示：更新失敗!
					return "front/member/forgotpassword"; 		   // 返回登入畫面
				}
			}
}
