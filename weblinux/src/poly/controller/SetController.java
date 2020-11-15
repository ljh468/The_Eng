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
import poly.util.EncryptUtil;

@Controller
public class SetController {
	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "UserService")
	IUserService userService;

	@Resource(name = "MailService")
	IMailService MailService;

	@Resource(name = "NewsService")
	INewsService newsService;
	
		// 설정 창
		@RequestMapping(value = "Setting/setting")
		public String setting() {

			log.info("/Setting/setting 시작");

			log.info("/Setting/setting 종료");

			return "/Setting/setting";
		}

		// 튜토리얼 다시보기
		@RequestMapping(value = "/Setting/TheReViewTutorial")
		public String TheReViewTutorial(HttpSession session) {

			log.info("/The/Setting/TheReViewTutorial 시작");
			
			   String user_id = (String) session.getAttribute("user_id");
			      if (user_id == null) {
			    	  
			         return "/The/TheLogin";
			         
			      }
			
			log.info("/The/Setting/TheReViewTutorial 종료");

			return "/Setting/TheReViewTutorial";
		}

		// 앱 소개
		@RequestMapping(value = "/Setting/TheAppIntroduction")
		public String TheAppIntroduction(HttpSession session) {

			log.info("/The/Setting/TheAppIntroduction 시작");
			
			   String user_id = (String) session.getAttribute("user_id");
			      if (user_id == null) {
			    	  
			         return "/The/TheLogin";
			         
			      }
			
			log.info("/The/Setting/TheAppIntroduction 종료");

			return "/Setting/TheAppIntroduction";
		}

		// 마이페이지
		@RequestMapping(value = "/Setting/TheMypage")
		public String TheMypage(HttpSession session) {

			log.info("/The/TheMypage 시작");
			
			   String user_id = (String) session.getAttribute("user_id");
			      if (user_id == null) {
			    	  
			         return "/The/TheLogin";
			         
			      }
			
			log.info("/The/TheMypage 종료");

			return "/Setting/TheMypage";
		}

		// 마이페이지 비밀번호 확인
		@RequestMapping(value = "/Setting/TheMypageCheck")
		public String TheMypageCheck() {

			log.info("/The/Setting/TheMypageCheck 시작");

			log.info("/The/Setting/TheMypageCheck 종료");

			return "/Setting/TheMypageCheck";
		}
		// 마이페이지 비밀번호 확인 proc
		@ResponseBody
	 	@RequestMapping(value = "/Setting/TheMypageCheckProc", method = RequestMethod.POST)
		public int TheMypageCheckProc(HttpServletRequest request, HttpSession session) throws Exception {

			log.info("/The/TheMypageCheckProc 시작");
			int result = 0;
			log.info("String 변수저장 시작");
			String user_pwd = request.getParameter("pwd");
			String user_id = (String) session.getAttribute("user_id");
			log.info("String 변수저장 종료");
			log.info("user_pwd : " + user_pwd);
			log.info("user_id : " + user_id);
			
			String HashEnc = EncryptUtil.enHashSHA256(user_pwd);
			
			UserDTO uDTO = new UserDTO();
			log.info("uDTO.set 시작");
			uDTO.setUser_pwd(HashEnc);
			uDTO.setUser_id(user_id);
			log.info("uDTO.set 종료");
			
			log.info("userService.Userinquire 시작");
			UserDTO res = userService.Userinquire(uDTO);
			log.info("userService.Userinquire 종료");
			log.info("res : " + res);
			
			if(res != null) {
				result = 1;
			} else {
				result = 0;
			}
			
			log.info("result :" + result);
			log.info("/Setting/TheMypageCheckProc 종료");

			return result;
		}
}
