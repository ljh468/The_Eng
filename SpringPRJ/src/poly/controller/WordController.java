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
import poly.service.INewsWordService;
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
	
	@Resource(name = "NewsWordService")
	INewsWordService newsWordService;
	
	@RequestMapping(value = "Word/wordCard")
	public String wordCard(HttpServletRequest request, ModelMap model, HttpSession session ) throws Exception {

		log.info("wordCard 시작");
		
		log.info("wordCard 종료");

		return "/Word/wordCard";
	}

	@RequestMapping(value = "Word/wordStudy")
	public String wordStudy(HttpServletRequest request, ModelMap model, HttpSession session ) throws Exception {

		log.info("wordStudy 시작");
		
		   String user_id = (String) session.getAttribute("user_id");
		      if (user_id == null) {
		    	  
		         return "/The/TheLogin";
		         
		      }
		
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

		// 생성된 QuizBank컬렉션에서 url로 조회하여 데이터를 가져옴
		WordQuizDTO rDTO = mongoTestMapper.getQuiz(query);
		
		
		List<String> rList = rDTO.getLemma();
		log.info("rList : " + rDTO.getLemma());
		for(String lemma : rList) {
			System.out.println(lemma);
		}
		
		// 어휘의 뜻을 가져오기위해 Wordpool에서 조회함
		// List형태로 가져옴
		List<String> wList = newsWordService.getWordMeaning(rList);
		for(String meaning : wList) {
			System.out.println(meaning);
		}
		
		log.info("wordStudy 종료");
		model.addAttribute("wList", wList); // 단어의 뜻
		model.addAttribute("rList", rList); // 단어
		return "/Word/wordStudy";
	}
	
	// 어휘의 뜻을 가져오기위한 Mapping -> wordpool에서 meaning을 조회 TEST
	@RequestMapping(value = "Word/meaningtest")
	public String meaningtest(HttpServletRequest request, ModelMap model, HttpSession session ) throws Exception {
		String word ="supermarket";
		String mean = newsWordService.meaningtest(word);
		
		return mean;
	}
	
	
}
