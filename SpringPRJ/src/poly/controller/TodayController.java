package poly.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.dto.NewsDTO;
import poly.service.IMailService;
import poly.service.INewsService;
import poly.service.IUserService;

@Controller
public class TodayController {
	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "UserService")
	IUserService userService;

	@Resource(name = "MailService")
	IMailService MailService;

	@Resource(name = "NewsService")
	INewsService newsService;
	
	
		// 오늘의학습
		@RequestMapping(value = "Today/TodayMain")
		public String TodayMain(HttpSession session, ModelMap model) {
			String user_id = (String) session.getAttribute("user_id");
			if (user_id == null) {
				return "/The/TheLogin";
			}

			model.addAttribute("user_id", user_id);
			return "/Today/TodayMain";
		}

		@RequestMapping(value = "Today/TodayNews")
		public String TodayNews() {

			log.info("TodaySentence 시작");
			log.info("TodaySentence 종료 ");

			return "/Today/TodayNews";
		}

		@RequestMapping(value = "Today/TodaySentence")
		public String TodaySentence() {

			log.info("TodaySentence 시작");
			log.info("TodaySentence 종료 ");

			return "/Today/TodaySentence";
		}

		@RequestMapping(value = "Today/TodayExam")
		public String TodayExam() {

			log.info("TodayExam 시작");
			log.info("TodayExam 종료");

			return "/Today/TodayExam";
		}

		@RequestMapping(value = "Today/TodayRecord")
		public String TodayRecord() {

			log.info("TodayRecord 시작");
			log.info("TodayRecord 종료");

			return "/Today/TodayRecord";
		}

		@RequestMapping(value = "Today/TodayResult")
		public String TodayResult() {

			log.info("TodayResult 시작");
			log.info("TodayResult 종료");

			return "/Today/TodayResult";
		}

		
		
}
