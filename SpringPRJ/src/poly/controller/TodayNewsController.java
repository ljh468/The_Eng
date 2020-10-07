package poly.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.dto.MongoNewsDTO;
import poly.persistance.mongo.IMongoTestMapper;
import poly.service.IMailService;
import poly.service.INewsService;
import poly.service.IUserService;

@Controller
public class TodayNewsController {

	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "UserService")
	IUserService userService;

	@Resource(name = "MailService")
	IMailService MailService;

	@Resource(name = "NewsService")
	INewsService newsService;

	@Resource(name = "MongoTestMapper")
	IMongoTestMapper mongoTestMapper;
	/**
	 * ########################################## 
	 * 오늘의학습 메인페이지
	 * ##########################################
	 */
	@RequestMapping(value = "Today/TodayMain")
	public String TodayMain(HttpSession session, ModelMap model) {
		String user_id = (String) session.getAttribute("user_id");
		if (user_id == null) {
			return "/The/TheLogin";
		}

		model.addAttribute("user_id", user_id);
		return "/Today/TodayMain";
	}
	
	/**
	 * ########################################## 
	 * 오늘의뉴스 (뉴스의 원문 추출)
	 * ##########################################
	 */
	@RequestMapping(value = "Today/TodayNews")
	public String TodayHeraldNews(HttpServletRequest request, Model model, HttpSession session) throws Exception {
		// Today main에서 news_name을 받아와 각뉴스에 맞는 자료 추출
		String news_name = request.getParameter("news_name");

		log.info("TodaySentence 시작");
		log.info("heraldQuiz start!");
		
		// 코리아헤럴드 뉴스 추출
		if (news_name.equals("herald")) {
				log.info("heraldGET Start!");
			MongoNewsDTO rDTO = mongoTestMapper.getHeraldNews();

			log.info("rDTO.getInsertDate : " + rDTO.getInsertDate());
			log.info("rDTO.getNews_url : " + rDTO.getNews_url());
			log.info("rDTO.getNews_name : " + rDTO.getNews_name());
			log.info("rDTO.getNews_title : " + rDTO.getNews_title());
			log.info("rDTO.getOriginal_sentences : " + rDTO.getOriginal_sentences());
			log.info("rDTO.getTokens : " + rDTO.getTokens());
			log.info("rDTO.getLemmas : " + rDTO.getLemmas());
			log.info("rDTO.getTranslation : " + rDTO.getTranslation());

				log.info("heraldGET End!");
			
			model.addAttribute("news_name", "The Korea Herald");
			model.addAttribute("news_title", rDTO.getNews_title());
			model.addAttribute("original_sentences", rDTO.getOriginal_sentences());
			model.addAttribute("insertdate", rDTO.getInsertDate());


			return "Today/TodayNews";
		} 	// 로이터 뉴스 추출
			else if (news_name.equals("reuters")) {
				log.info("reutersGET Start!");	
			MongoNewsDTO rDTO = mongoTestMapper.getReutersNews();
				log.info("reutersGET End!");

			model.addAttribute("news_name", "Reuters News");
			model.addAttribute("news_title", rDTO.getNews_title());
			model.addAttribute("original_sentences", rDTO.getOriginal_sentences());
			model.addAttribute("insertdate", rDTO.getInsertDate());

			return "Today/TodayNews";
		} 	// 코리아타임즈 뉴스 추출
			else if (news_name.equals("times")) {
				log.info("timesGET Start!");
			MongoNewsDTO rDTO = mongoTestMapper.getTimesNews();
				log.info("timesGET End!");

			model.addAttribute("news_name", "The Korea Times");
			model.addAttribute("news_title", rDTO.getNews_title());
			model.addAttribute("original_sentences", rDTO.getOriginal_sentences());
			model.addAttribute("insertdate", rDTO.getInsertDate());

			return "Today/TodayNews";
			
		} 	// 연합 뉴스 추출
			else if (news_name.equals("yonhap")) {
				log.info("yonhapGET Start!");
			MongoNewsDTO rDTO = mongoTestMapper.getTimesNews();
				log.info("yonhapGET End!");

			model.addAttribute("news_name", "Yonhap News Agency");
			model.addAttribute("news_title", rDTO.getNews_title());
			model.addAttribute("original_sentences", rDTO.getOriginal_sentences());
			model.addAttribute("insertdate", rDTO.getInsertDate());

			return "Today/TodayNews";
		} else
			return null;
	}
	/**
	 * ########################################## 
	 * 오늘의문장 ( 뉴스의 주요문장 추출 )
	 * ##########################################
	 */
	@RequestMapping(value = "Today/TodaySentence")
	public String TodaySentence() {

		log.info("TodaySentence 시작");
		log.info("TodaySentence 종료 ");

		return "/Today/TodaySentence";
	}
	/**
	 * ########################################## 
	 * 오늘의퀴즈 ( 뉴스의 주요문장 퀴즈 추출 )
	 * ##########################################
	 */
	@RequestMapping(value = "Today/TodayExam")
	public String TodayExam() {

		log.info("TodayExam 시작");
		log.info("TodayExam 종료");

		return "/Today/TodayExam";
	}
	/**
	 * ########################################## 
	 * 오늘의 영어문장 강세 측정
	 * ##########################################
	 */
	@RequestMapping(value = "Today/TodayRecord")
	public String TodayRecord() {

		log.info("TodayRecord 시작");
		log.info("TodayRecord 종료");

		return "/Today/TodayRecord";
	}
	/**
	 * ########################################## 
	 * 발음 및 강세 분석 (결과화면)
	 * ##########################################
	 */
	@RequestMapping(value = "Today/TodayResult")
	public String TodayResult() {

		log.info("TodayResult 시작");
		log.info("TodayResult 종료");

		return "/Today/TodayResult";
	}

}
