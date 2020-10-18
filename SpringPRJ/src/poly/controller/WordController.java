package poly.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;
import com.mysql.cj.Session;

import poly.dto.MongoNewsDTO;
import poly.dto.WordQuizDTO;
import poly.persistance.mongo.IMongoTestMapper;
import poly.service.IMailService;
import poly.service.INewsService;
import poly.service.IUserService;

@Controller
public class WordController {
	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "UserService")
	IUserService userService;

	@Resource(name = "MailService")
	IMailService MailService;

	@Resource(name = "NewsService")
	INewsService newsService;
	
	@Resource(name = "MongoTestMapper")
	IMongoTestMapper mongoTestMapper;
	
	@RequestMapping(value = "Word/wordCard")
	public String wordCard(HttpServletRequest request, ModelMap model, HttpSession session ) throws Exception {

		log.info("wordCard 시작");
		
		log.info("wordCard 종료");

		return "/Word/wordCard";
	}
	/*
	 * @RequestMapping(value = "Word/wordOption") public String
	 * wordOption(HttpServletRequest request, ModelMap model, HttpSession session )
	 * throws Exception {
	 * 
	 * log.info("wordOption 시작");
	 * 
	 * String news_name = request.getParameter("news_name"); String news_url = null;
	 * news_name = "herald"; if(news_name.equals("herald")) { MongoNewsDTO hDTO =
	 * mongoTestMapper.getHeraldNews(); news_url = hDTO.getNews_url(); }else
	 * if(news_name.equals("reuters")) { MongoNewsDTO rDTO =
	 * mongoTestMapper.getReutersNews(); news_url = rDTO.getNews_url(); }else
	 * if(news_name.equals("times")) { MongoNewsDTO tDTO =
	 * mongoTestMapper.getTimesNews(); news_url = tDTO.getNews_url(); }else
	 * if(news_name.equals("yonhap")) { MongoNewsDTO yDTO =
	 * mongoTestMapper.getYonhapNews(); news_url = yDTO.getNews_url(); }
	 * 
	 * DBObject query = new BasicDBObject("url", news_url); log.info("query : " +
	 * query);
	 * 
	 * // 생성된 QuizBank컬렌션에서 url로 조회하여 데이터를 가져옴 WordQuizDTO rDTO =
	 * mongoTestMapper.getQuiz(query);
	 * 
	 * List<String> rList = rDTO.getWord(); log.info("rList : " + rDTO.getWord());
	 * 
	 * model.addAttribute(rList);
	 * 
	 * for(String wordList : rList) { System.out.println(wordList); }
	 * log.info("wordOption 종료");
	 * 
	 * return "/Word/wordOption"; }
	 */

	

	@RequestMapping(value = "Word/wordStudy")
	public String wordStudy(HttpServletRequest request, ModelMap model, HttpSession session ) throws Exception {

		log.info("wordStudy 시작");
		
		String news_name = request.getParameter("news_name");
		String news_url = null;
		
		if(news_name.equals("herald")) {
			MongoNewsDTO hDTO = mongoTestMapper.getHeraldNews();
			news_url = hDTO.getNews_url();
		}else if(news_name.equals("reuters")) {
			MongoNewsDTO rDTO = mongoTestMapper.getReutersNews();
			news_url = rDTO.getNews_url();
		}else if(news_name.equals("times")) {
			MongoNewsDTO tDTO = mongoTestMapper.getTimesNews();
			news_url = tDTO.getNews_url();
		}else if(news_name.equals("yonhap")) {
			MongoNewsDTO yDTO = mongoTestMapper.getYonhapNews();
			news_url = yDTO.getNews_url();
		}
	
		DBObject query = new BasicDBObject("url", news_url);
		log.info("query : " + query);

		// 생성된 QuizBank컬렌션에서 url로 조회하여 데이터를 가져옴
		WordQuizDTO rDTO = mongoTestMapper.getQuiz(query);
		
		List<String> rList = rDTO.getWord();
		log.info("rList : " + rDTO.getWord());
		
		model.addAttribute("rList", rList);
		
		for(String wordList : rList) {
			System.out.println(wordList);
		}
		
		log.info("wordStudy 종료");

		return "/Word/wordStudy";
	}

	@RequestMapping(value = "Word/wordResult")
	public String wordResult(HttpServletRequest request, ModelMap model, HttpSession session ) throws Exception {
		
		log.info("wordResult 시작");
		
		String Os = request.getParameter("O");
		String Xs = request.getParameter("X");
		
		model.addAttribute("Os", Os);
		model.addAttribute("Xs", Xs);
		
		log.info("wordResult 종료");

		return "/Word/wordResult";
	}
	
}
