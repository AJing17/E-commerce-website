package com.finalProject.demo.controller.back.Manager;

import com.finalProject.demo.mail.EmailSenderSerivce;
import com.finalProject.demo.model.entity.manager.Manager;
import com.finalProject.demo.service.Manager.ManagerService;
import com.finalProject.demo.util.JwtUtil;
import org.apache.coyote.Response;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.UUID;

@Controller
public class resetPwdController {

    @Autowired
    private ManagerService managerService;

    @Autowired
    private EmailSenderSerivce emailSenderSerivce;


    @GetMapping("Manager/forgotPassword")
    public String getAuthorizationManager(@ModelAttribute("manager")Manager manager){
        return "back/manager/forgotpassword";
    }


    @PostMapping("Manager/forgotPassword")
    public String postAuthorizationManager(@ModelAttribute("manager")Manager manager, Model model, HttpServletResponse response){
        if (manager.getEmail()!=null && !manager.getEmail().isEmpty()){
            if (manager.getPhone()!=null && !manager.getPhone().isEmpty()){
                Manager findManager = managerService.findEmail(manager.getEmail());
                if (findManager!=null){
                    if (findManager.getPhone().equals(manager.getPhone())){
                        //驗證成功:發送信件及新增token
                        //UUID 驗證
                        UUID uuid = UUID.randomUUID();
                        String authorization = uuid.toString();
                        //new token
                        String tokenfpd = JwtUtil.getJwtTokenfpd(findManager.getEmail(), findManager.getManagerName(), findManager.getManagerId(), authorization);
                        Cookie cookie = new Cookie("fpd", tokenfpd);
                        cookie.setMaxAge(60*60*24);
                        cookie.setPath("/Chezmoi/Manager");
                        response.addCookie(cookie);
//                        //返回token給用戶端
//                        response.setHeader("Authorization", "Bearer " + tokenfpd);
//                        //解決跨域導致token獲取不到token的問題
//                        response.setHeader("Access-Control-Expose-Headers","Authorization");

                        //Send email
                        String toEmail = findManager.getEmail();
                        String subject = "管理者 "+findManager.getManagerName()+" 您好";
                        String link = "http://localhost:8080/Chezmoi/Manager/Reset/Password/"+authorization ;
                        String text1 = "請點選以下連結重設密碼";
                        String text2 = "此連結有效時間為24小時，請在時間內重設密碼";
                        String text3 = "若您未曾要求重設密碼，請忽略此封信件";
                        emailSenderSerivce.sendManagerForgotPwd(toEmail,subject,link,text1,text2,text3);
                        return "back/manager/authorizationSuccess";
                    }else {
                        model.addAttribute("msg","手機驗證錯誤，請重新確認是否正確");
                        model.addAttribute("manager",manager);
                        return "back/manager/forgotpassword";
                    }
                }else {
                    model.addAttribute("msg","email驗證錯誤，請重新確認是否正確");
                    model.addAttribute("manager",manager);
                    return "back/manager/forgotpassword";
                }
            }
        }
        model.addAttribute("msg","請確實填寫email及手機號碼");
        model.addAttribute("manager",manager);
        return "back/manager/forgotpassword";
    }

    //重設密碼頁面
    @GetMapping("Manager/Reset/Password/{authorization}")
    public String resetPassword(
            @PathVariable("authorization")String authorization,
            HttpServletRequest request,
            @ModelAttribute("manager")Manager manager){
        String requestAuthorization =(String) request.getAttribute("Authorization");
        if (authorization.equals(requestAuthorization)){
            return "back/manager/changepassword";
        }
        return "back/manager/authorizationFalse";
    }

    @PostMapping("Manager/Reset/Password")
    public String updatePwd(
            @ModelAttribute("manager")Manager manager,
            HttpServletRequest request, RedirectAttributes re){
        Long managerId = manager.getManagerId();
        String id = (String)request.getAttribute("managerId");
        Long longId = Long.valueOf(id);
        if (managerId.equals(longId)){
            Manager byId = managerService.findById(managerId);
            String hashpw = BCrypt.hashpw(manager.getPassword(), BCrypt.gensalt());
            byId.setPassword(hashpw);
            managerService.insert(byId);
            re.addAttribute("msg","更改成功!請重新登入");
            return "redirect:/manager/login";
        }
        return "back/manager/authorizationFalse";
    }
}
