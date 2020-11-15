package poly.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import poly.dto.UserDTO;
import poly.service.IMailService;
import poly.service.INewsService;
import poly.service.IUserService;

@Controller
public class MailController {
	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "UserService")
	IUserService userService;

	@Resource(name = "MailService")
	IMailService MailService;

	@Resource(name = "NewsService")
	INewsService newsService;
	
		// 이메일 중복확인
		@ResponseBody
		@RequestMapping(value = "The/emailCheck", method = RequestMethod.POST)
		public int emailCheck(HttpServletRequest request) throws Exception {
			log.info("emailCheck 시작");

			String userEmail = request.getParameter("userEmail");
			log.info("TheService.emailCheck 시작");
			UserDTO emailCheck = userService.emailCheck(userEmail);
			log.info("TheService.emailCheck 종료");

			int res = 0;

			log.info("if 시작");
			if (emailCheck != null)
				res = 1;

			log.info("result : " + res);
			log.info("if 종료");

			log.info("emailCheck 종료");
			return res;
		}

		public String RandomNum() {
			StringBuffer buffer = new StringBuffer();
			for (int i = 0; i < 6; i++) {
				int n = (int) (Math.random() * 10);
				buffer.append(n);

			}
			return buffer.toString();
		}

		@RequestMapping(value = "The/TheEmailCertify")
		public String EmailCertify(HttpSession session) {

			log.info("/The/TheEmailCertify 시작");
			
			   String user_id = (String) session.getAttribute("user_id");
			      if (user_id == null) {
			    	  
			         return "/The/TheLogin";
			         
			      }
			      
			log.info("/The/TheEmailCertify 종료");

			return "/The/TheEmailCertify";
		}

		// 이메일 인증
		@ResponseBody
		@RequestMapping(value = "The/TheEmailCertifyProc", method = RequestMethod.POST)
		public int TheEmailCertify(HttpServletRequest request, HttpSession session) throws Exception {
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

			if (res2 == 1) {
				log.info("update success");
			} else {
				log.info("update fail");
			}

			session.invalidate();
			log.info("/The/TheEmailCertify 종료");
			return result;
		}

		// 이메일 인증번호 확인
		@ResponseBody
		@RequestMapping(value = "The/authNumCheck", method = RequestMethod.POST)
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
