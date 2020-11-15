package poly.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import poly.dto.UserDTO;
import poly.service.IMailService;
import poly.service.INewsService;
import poly.service.IUserService;
import poly.util.CmmUtil;
import poly.util.EncryptUtil;

@Controller
public class MypageContorller {
	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "UserService")
	IUserService userService;

	@Resource(name = "MailService")
	IMailService MailService;

	@Resource(name = "NewsService")
	INewsService newsService;
	
		// 회원정보 수정
		@RequestMapping(value = "/Mypage/TheUserCorrection")
		public String TheUserCorrection(HttpSession session, Model model) {

			log.info("/Mypage/TheUserCorrection 시작");

			String user_id = (String) session.getAttribute("user_id");
			
			user_id = (String) session.getAttribute("user_id");
				if (user_id == null) {
			    	  
					return "/The/TheLogin";
			         
			    }
			
			
			UserDTO uDTO = new UserDTO();

			uDTO.setUser_id(user_id);

			UserDTO res = userService.getUserCorrection(uDTO);

			if (res == null) {
				model.addAttribute("msg", "회원 정보가 없습니다. 자세한 내용은 고객센터에 문의해주세요.");
				model.addAttribute("url", "/Setting/TheMypage.do");
				return "/redirect";
			}

			model.addAttribute("res", res);

			log.info("/Mypage/TheUserCorrection 종료");

			return "/Mypage/TheUserCorrection";
		}
		// 회원정보 수정 Do
		@RequestMapping(value = "/Mypage/TheUserCorrectionDo")
		public String TheUserCorrectionDo(HttpSession session, Model model) {

			log.info("/Mypage/TheUserCorrectionDo 시작");

			String user_id = (String) session.getAttribute("user_id");
			
				if (user_id == null) {
			    	  
					return "/The/TheLogin";
			         
				}
			
			UserDTO uDTO = new UserDTO();

			uDTO.setUser_id(user_id);

			UserDTO res = userService.getUserCorrection(uDTO);

			model.addAttribute("res", res);
			log.info("/Mypage/TheUserCorrectionDo 종료");

			return "/Mypage/TheUserCorrectionDo";
		}
		
		// 회원정보 수정 proc
		@RequestMapping(value = "/Mypage/correctionProc")
		public String correectionProc(HttpSession session, HttpServletRequest request, Model model) {

			log.info("/Mypage/correctionProc 시작");

			String user_id = (String) session.getAttribute("user_id");
			String user_gender = request.getParameter("gender");
			String user_age = request.getParameter("age");
			
				if (user_id == null) {
			    	  
					return "/The/TheLogin";
			         
			    }
			
			UserDTO uDTO = new UserDTO();

			uDTO.setUser_id(user_id);
			uDTO.setUser_gender(user_gender);
			uDTO.setUser_age(user_age);

			int res = userService.setUserCorrection(uDTO);

			String msg;
			String url = "/Mypage/TheUserCorrection.do";

			if (res > 0) {
				msg = "회원정보 수정에 성공했습니다.";
			} else {
				msg = "회원정보 수정에 실패했습니다. 고객센터에 문의해주세요.";
			}

			log.info("model.addAttribute 시작");
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			log.info("model.addAttribute 종료");

			log.info("/Mypage/correctionProc 종료");

			return "/redirect";
		}
		
		// 비밀번호 변경
		@RequestMapping(value = "/Mypage/ThePassWordChange")
		public String ThePassWordChange(HttpSession session) {

			log.info("/Mypage/ThePassWordChange 시작");
			
			   String user_id = (String) session.getAttribute("user_id");
			      if (user_id == null) {
			    	  
			         return "/The/TheLogin";
			         
			      }
			      
			log.info("/Mypage/ThePassWordChange 종료");

			return "/Mypage/ThePassWordChange";
		}

		@RequestMapping(value = "/Mypage/passWordChangeProc")
		public String passWordChangeProc(HttpSession session, HttpServletRequest request, Model model) throws Exception {

			log.info("/Mypage/passWordChangeProc 시작");
			
			String user_id =(String) session.getAttribute("user_id");
			String user_pwd = request.getParameter("pwd");
			log.info("user_id :" + user_id);
			log.info("user_pwd :" + user_pwd);
			
			      if (user_id == null) {
			    	  
			         return "/The/TheLogin";
			         
			      }
			
			String HashEnc = EncryptUtil.enHashSHA256(user_pwd);

			UserDTO uDTO = new UserDTO();
			log.info("uDTO.set 시작");
			uDTO.setUser_id(user_id);
			uDTO.setUser_pwd(HashEnc);
			log.info("uDTO.set 종료");
			
			int res = userService.pwdChange(uDTO);
			
			String msg;
			String url = "/Setting/TheMypage.do";

			if (res > 0) {
				msg = "회원정보 수정에 성공했습니다.";
			} else {
				msg = "회원정보 수정에 실패했습니다. 고객센터에 문의해주세요.";
			}

			log.info("model.addAttribute 시작");
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			log.info("model.addAttribute 종료");

			log.info("/Mypage/passWordChangeProc 종료");

			return "/redirect";
		}
		
		// 비밀번호 중복확인
		@ResponseBody
	 	@RequestMapping(value = "/Mypage/passWordCheck", method = RequestMethod.POST)
		public int passWordCheck(HttpServletRequest request, HttpSession session) throws Exception {

			log.info("/The/passWordCheck 시작");
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
			log.info("/Setting/passWordCheck 종료");

			return result;
		}

		// 회원 탈퇴
		@RequestMapping(value = "/Mypage/TheUserDelete")
		public String TheUserDelete(HttpSession session) {

			log.info("/Mypage/TheUserDelete 시작");
			
			   String user_id = (String) session.getAttribute("user_id");
			      if (user_id == null) {
			    	  
			         return "/The/TheLogin";
			         
			      }
			      
			log.info("/Mypage/TheUserDelete 종료");

			return "/Mypage/TheUserDelete";
		}

		@RequestMapping(value = "/Mypage/TheUserDeleteProc")
		public String TheUserDeleteProc(HttpServletRequest request, Model model, HttpSession session) throws Exception {

			log.info("/The/TheUserDeleteProc 시작");
			String user_id = (String) session.getAttribute("user_id");
			
			      if (user_id == null) {
			    	  
			         return "/The/TheLogin";
			         
			      }
			
			UserDTO uDTO = new UserDTO();
			uDTO.setUser_id(user_id);

			int res = userService.deleteUser(uDTO);
			log.info("uDTO null? : " + (uDTO == null));

			String msg = "";
			String url = "";
			if (res > 0) {
				msg = "회원 탈퇴를 성공했습니다. 이용해 주셔서 감사합니다.";
			} else {
				msg = "회원 탈퇴를 실패했습니다. 고객센터에 문의해주세요.";
			}

			url = "/The/TheLogin.do";

			model.addAttribute("msg", msg);
			model.addAttribute("url", url);

			session.invalidate();

			log.info("The/TheUserDeleteProc 종료");

			return "/redirect";
		}

		// 탈퇴 입력문자열 확인
		@ResponseBody
		@RequestMapping(value = "/Mypage/TheUserDeleteCheck", method = RequestMethod.POST)
		public int TheUserDeleteCheck(HttpServletRequest request, HttpSession session) {

			log.info("/Mypage/TheUserDeleteCheck 시작");

			int result = 0;
			log.info("String 변수저장 시작");
			String DeleteCheck = request.getParameter("DeleteCheck");
			log.info("String 변수저장 종료");
			log.info("DeleteCheck : " + DeleteCheck);

			if (DeleteCheck.equals("Account_withdrawal")) {
				result = 1;
			} else {
				result = 0;
			}

			log.info("result :" + result);
			log.info("/Mypage/TheUserDeleteCheck 종료");

			return result;
		}
		
		
		// 관심분야 설정
		   @RequestMapping(value = "/Mypage/TheInterestSetting")
		   public String TheInterestSetting(HttpSession session, Model model) {

		      log.info("/The/Setting/Mypage/TheInterestSetting 시작");

		      String user_id = (String) session.getAttribute("user_id");
		      
			      if (user_id == null) {
			    	  
			         return "/The/TheLogin";
			         
			      }
		      
		      UserDTO uDTO = new UserDTO();

		      uDTO.setUser_id(user_id);

		      UserDTO res = userService.getUserCorrection(uDTO);

		      String user_interest = res.getUser_interest();

		      String[] interest = user_interest.split(",");

		      for (int i = 0; i < interest.length; i++) {
		         log.info("interest[" + i + "]: " + interest[i]);
		      }

		      model.addAttribute("interest", interest);
		      log.info("/Mypage/TheInterestSetting 종료");

		      return "/Mypage/TheInterestSetting";
		   }

		   @RequestMapping(value = "/Mypage/interestSettingProc")
			public String interestSettingProc(HttpSession session, HttpServletRequest request, Model model) {

				log.info("/Mypage/interestSettingProc 시작");
				
				String user_id =(String) session.getAttribute("user_id");
				String[] user_interest = request.getParameterValues("interest");
				log.info("user_id :" + user_id);
				log.info("user_interest :" + user_interest);
				
				      if (user_id == null) {
				    	  
				         return "/The/TheLogin";
				         
				      }
				
				String interests = "";
				
				if(user_interest != null) {
					interests = String.join(",", user_interest);
					log.info("interest : " + interests);
				} else {
					CmmUtil.nvl(interests);
				}
				
				UserDTO uDTO = new UserDTO();
				log.info("uDTO.set 시작");
				uDTO.setUser_id(user_id);
				uDTO.setUser_interest(interests);
				log.info("uDTO.set 종료");
				
				int res = userService.updateInterest(uDTO);
				
				String msg;
				String url = "/Setting/TheMypage.do";

				if (res > 0) {
					msg = "관심분야 수정에 성공했습니다.";
				} else {
					msg = "관심분야 수정에 실패했습니다. 고객센터에 문의해주세요.";
				}

				log.info("model.addAttribute 시작");
				model.addAttribute("msg", msg);
				model.addAttribute("url", url);
				log.info("model.addAttribute 종료");

				log.info("/Mypage/interestSettingProc 종료");

				return "/redirect";
		}
}
