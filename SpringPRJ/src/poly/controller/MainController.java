package poly.controller;

import static poly.util.CmmUtil.nvl;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.annotation.Resource;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import poly.dto.UserDTO;
import poly.service.IMailService;
import poly.service.IUserService;
import poly.service.impl.UserService;

@Controller
public class MainController {

	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "UserService")
	IUserService userService;
	
	@Resource(name = "MailService")
	IMailService MailService;

	@RequestMapping(value = "index")
	public String Index(HttpSession session,ModelMap model) {
		String user_id = (String)session.getAttribute("user_id");
		if(user_id == null) {
			return "/The/TheLogin";
		}
		
		model.addAttribute("user_id", user_id);
		return "/index";
	}

	@RequestMapping(value = "The/TheLogin")
	public String TheLogin() {
		log.info("TheLogin 시작");
		log.info("TheLogin 종료");
		return "/The/TheLogin";
	}
	
	@RequestMapping(value = "template")
	public String template() {
		return "/template";
	}
	
	// 로그인 proc
	@RequestMapping(value = "The/TheLoginProc")
	public String TheLoginProc(HttpServletRequest request, Model model, HttpSession session) throws Exception {

		log.info("/The/TheLoginProc 시작");
		String id = nvl(request.getParameter("id"));
		String pwd = nvl(request.getParameter("pwd"));

		log.info("id :" + id);
		log.info("pwd :" + pwd);

		UserDTO tDTO = new UserDTO();

		tDTO.setUser_id(id);
		tDTO.setUser_pwd(pwd);

		tDTO = userService.getUserInfo(tDTO);
		log.info("uDTO null? : " + (tDTO == null));

		String msg = "";
		String url = "";
		if (tDTO == null) {
			msg = "로그인 실패";
		} else {
			log.info("tDTO.User_id : " + tDTO.getUser_id());
			log.info("tDTO.User_name : " + tDTO.getUser_email());
			msg = "로그인 성공";
			session.setAttribute("user_id", tDTO.getUser_id());
			session.setAttribute("user_name", tDTO.getUser_email());
		}

		url = "/index.do";

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		log.info("The/TheLoginProc 종료");

		return "/redirect";
	}
	// 로그아웃
	@RequestMapping(value = "The/TheLogout")
	public String TheLogout(HttpSession session, Model model) throws Exception {

		log.info("/The/TheLogout 시작");

		String msg = "";
		String url = "";

		msg = "로그아웃 성공";

		url = "/The/TheLogin.do";
		session.invalidate();

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		log.info("/The/TheLogout 종료");
		
		return "/redirect";
	}
	
	@RequestMapping(value = "/hello/text")
	public String Hello() {
		
		return "/hello";
	}
	
	@ResponseBody
	@RequestMapping(value = "/hello/hello")
	public boolean Hello(HttpServletRequest request) {
		String value = request.getParameter("id");
		
		if(value.equals("헬로")) {
			return true;
		}
		
		return false;
	}

	@RequestMapping(value = "The/TheSignUp")
	public String TheSignUp() {

		log.info("TheSignUp 시작");

		log.info("TheSignUp 종료");

		return "/The/TheSignup";
	}
	
	// 회원가입proc
	@RequestMapping(value = "The/TheSignUpProc", method = RequestMethod.GET)
	public String TheSignUpProc(HttpServletRequest request, ModelMap model,HttpSession session) {

		log.info("/The/TheSignUpProc 시작");
		
		log.info("request.getParameter 시작");
		
		String user_id = request.getParameter("id");
		String user_pwd = request.getParameter("pwd");
		String user_email = request.getParameter("email");
		String user_gender = request.getParameter("gender");
		String user_age = request.getParameter("age");
		String[] user_interest = request.getParameterValues("interest");
		
		
		log.info("request.getParameter 종료");
		
		log.info("user_id : " + user_id);
		log.info("user_pwd : " + user_pwd);
		log.info("user_name : " + user_email);
		log.info("user_gender : " + user_gender);
		
		// 매우중요!! - 콤마로 조인
		String interests = String.join(",", user_interest);
		log.info("interest : " + interests);
		
		session.setAttribute("user_email", user_email);
		
		UserDTO tDTO = new UserDTO();
		log.info("tDTO.set 시작");
		tDTO.setUser_id(user_id);
		tDTO.setUser_pwd(user_pwd);
		tDTO.setUser_email(user_email);
		tDTO.setUser_gender(user_gender);
		tDTO.setUser_age(user_age);
		tDTO.setUser_interest(interests);
		
		log.info("tDTO.set 종료");
		log.info("tDTO" + tDTO);

		log.info("TheService.TheSignUp 시작");
		int res = userService.UserSignUp(tDTO);
		log.info("TheService.TheSignUp 종료");
		log.info("res : " + res);

		String msg;
		String url = "/The/TheEmailCertify.do";

		if (res > 0) {
			msg = "회원가입에 성공했습니다.";
		} else {
			msg = "회원가입에 실패했습니다.";
		}

		log.info("model.addAttribute 시작");
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		log.info("model.addAttribute 종료");
		
		log.info("TheSignUpProc 종료");

		return "/redirect";
	}
	
	// 아이디 중복확인
	@ResponseBody
    @RequestMapping(value="/The/idCheck", method = RequestMethod.POST)
    public int idCheck(HttpServletRequest request) throws Exception {
        log.info("idCheck 시작");
        
        String userId = request.getParameter("userId");
        
        log.info("TheService.idCheck 시작");
        UserDTO idCheck = userService.idCheck(userId);
        log.info("TheService.idCheck 종료");
        
        int res = 0;
        
        log.info("if 시작");
        if(idCheck!=null) res=1;
        
        log.info("result : " + res);
        log.info("if 종료");
        
        log.info("idCheck 종료");
        return res;
    }
	
	// 이메일 중복확인
	@ResponseBody
	@RequestMapping(value="/The/emailCheck", method = RequestMethod.POST)
	public int emailCheck(HttpServletRequest request) throws Exception{
		log.info("emailCheck 시작");
		
		String userEmail = request.getParameter("userEmail");
		log.info("TheService.emailCheck 시작");
        UserDTO emailCheck = userService.emailCheck(userEmail);
        log.info("TheService.emailCheck 종료");
        
        int res = 0;
        
        log.info("if 시작");
        if(emailCheck!=null) res=1;
        
        log.info("result : " + res);
        log.info("if 종료");
        
        log.info("emailCheck 종료");
        return res;
	}
	public String RandomNum() {
    	StringBuffer buffer = new StringBuffer();
    	for(int i = 0; i < 6; i++) {
    		int n = (int)(Math.random() * 10);
    		buffer.append(n);
    		
    	}
    	return buffer.toString();
    }
 	
 	@RequestMapping(value = "/The/TheEmailCertify")
	public String EmailCertify(HttpSession session) {

		log.info("/The/TheEmailCertify 시작");	
		
		log.info("/The/TheEmailCertify 종료");

		return "/The/TheEmailCertify";
	}
 
 	// 이메일 인증
 	@ResponseBody
	@RequestMapping(value="/The/TheEmailCertifyProc", method = RequestMethod.POST)
	public int TheEmailCertify(HttpServletRequest request, HttpSession session) throws Exception{
		log.info("/The/TheEmailCertify 시작");
        
    	int result = 0;
    	String email = request.getParameter("email");
    	log.info("email : " + email);
    	String authNum = "";
    	
    	authNum = RandomNum();
    	log.info("authNum : " + authNum);
    	 	    	
		
    	UserDTO uDTO = new UserDTO();
		uDTO.setUser_email(email);
		uDTO.setUser_authNum(authNum);
		log.info("setUser_authNum : " + uDTO.getUser_authNum());
		log.info("setUser_email : " + uDTO.getUser_email());
		
		int res = MailService.doSendMail(uDTO);
		
		if (res == 1) {
			log.info(this.getClass().getName() + "mail.sendMail success");
			result = 1;
		} else {
			log.info(this.getClass().getName() + "mail.sendMail fail");
			result = 0;
		}
		log.info("setUser_email : " + uDTO.getUser_email());
		
		log.info("insertAuthNum 시작");
		int res2 = userService.insertAuthNum(uDTO);
		log.info("insertAuthNum 종료");
		log.info("res2 : " + res2);
		
		if(res2 == 1) {
			log.info("update success");
		} else {
			log.info("update fail");
		}
		
		session.invalidate();
        log.info("/The/TheEmailCertify 종료");
        return result;
	}
 	
 	@ResponseBody
    @RequestMapping(value = "/The/authNumCheck", method = RequestMethod.POST)
    public int authNumCheck(HttpServletRequest request) throws Exception {
    	log.info("/myOrder/authNumCheck 시작");
    	
    	int result = 0;
    	log.info("request.getParameter 시작");
    	String auth = request.getParameter("auth");
    	log.info("auth : " + auth);
    	log.info("request.getParameter 종료");
    	
    	UserDTO uDTO = new UserDTO();

		uDTO.setUser_authNum(auth);

		
    	log.info("userService.authNumCheck 시작");
		UserDTO authNumCheck = userService.authNumCheck(uDTO);
		log.info("userService.authNumCheck 종료");
		log.info("authNumCheck null ? " + (authNumCheck == null));
		
		log.info("if 시작");
		if (authNumCheck != null) {
			log.info(this.getClass().getName() + "authNumCheck success");
			result = 1;
		} else {
			log.info(this.getClass().getName() + "authNumCheck fail");
			result = 0;
		}
		log.info("if 종료");
		
    	log.info("/The/authNumCheck 종료");
    	return result;
    }
 	
 

 	
}
