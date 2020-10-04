package poly.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;

import poly.dto.MongoNewsDTO;
import poly.persistance.mongo.IMongoTestMapper;
import poly.service.INewsService;
import poly.service.INewsWordService;

@Controller
public class QuizController {

	@Resource(name = "MongoTestMapper")
	private IMongoTestMapper mongoTestMapper;
	
	@Resource(name = "NewsService")
	private INewsService newsService;
	
	@Resource(name = "NewsWordService")
	private INewsWordService newsWordService;

	private Logger log = Logger.getLogger(this.getClass());

	// mongoDB에서 herald뉴스중 가장 최근뉴스 가져오기
	@RequestMapping(value = "heraldQuiz")
	public MongoNewsDTO heraldQuiz(HttpServletRequest request, Model model, HttpSession session) throws Exception {

		log.info("heraldQuiz start!");
		DBObject query = new BasicDBObject("news_name", "herald");
		// name이 gildong인 데이터를 query변수에 대입
		MongoNewsDTO rDTO = mongoTestMapper.getHeraldNews();

		log.info("rDTO.getInsertDate : " + rDTO.getInsertDate());
		log.info("rDTO.getNews_url : " + rDTO.getNews_url());
		log.info("rDTO.getNews_name : " + rDTO.getNews_name());
		log.info("rDTO.getNews_title : " + rDTO.getNews_title());
		log.info("rDTO.getOriginal_sentences : " + rDTO.getOriginal_sentences());
		log.info("rDTO.getTokens : " + rDTO.getTokens());
		log.info("rDTO.getLemmas : " + rDTO.getLemmas());
		log.info("rDTO.getTranslation : " + rDTO.getTranslation());

		log.info("heraldQuiz end!");
		
		model.addAttribute("news_title", rDTO.getNews_title());
		log.info("model : " + model.addAttribute("news_title", rDTO.getNews_title()));
		return rDTO;

	}

	// mongoDB에서 times뉴스중 가장 최근뉴스 가져오기
	@RequestMapping(value = "timesQuiz")
	public MongoNewsDTO timesQuiz(HttpServletRequest request, Model model, HttpSession session) throws Exception {

		log.info("timesQuiz start!");
		DBObject query = new BasicDBObject("news_name", "times");
		// name이 길동인 데이터를 query변수에 대입
		MongoNewsDTO rDTO = mongoTestMapper.getTimesNews();

		log.info("rDTO.getInsertDate : " + rDTO.getInsertDate());
		log.info("rDTO.getNews_url : " + rDTO.getNews_url());
		log.info("rDTO.getNews_name : " + rDTO.getNews_name());
		log.info("rDTO.getNews_title : " + rDTO.getNews_title());
		log.info("rDTO.getOriginal_sentences : " + rDTO.getOriginal_sentences());
		log.info("rDTO.getTokens : " + rDTO.getTokens());
		log.info("rDTO.getLemmas : " + rDTO.getLemmas());
		log.info("rDTO.getTranslation : " + rDTO.getTranslation());

		log.info("timesQuiz end!");
		return rDTO;
		// mongoTestMapper의 selectWithCondition에 query파라미터를 return

	}

	// mongoDB에서 로이터뉴스중 가장 최근뉴스 가져오기
	@RequestMapping(value = "reutersQuiz")
	public MongoNewsDTO reutersQuiz(HttpServletRequest request, Model model, HttpSession session) throws Exception {

		log.info("reuterQuiz start!");
		DBObject query = new BasicDBObject("news_name", "reuters");
		// name이 길동인 데이터를 query변수에 대입
		MongoNewsDTO rDTO = mongoTestMapper.getReutersNews();

		log.info("rDTO.getInsertDate : " + rDTO.getInsertDate());
		log.info("rDTO.getNews_url : " + rDTO.getNews_url());
		log.info("rDTO.getNews_name : " + rDTO.getNews_name());
		log.info("rDTO.getNews_title : " + rDTO.getNews_title());
		log.info("rDTO.getOriginal_sentences : " + rDTO.getOriginal_sentences());
		log.info("rDTO.getTokens : " + rDTO.getTokens());
		log.info("rDTO.getLemmas : " + rDTO.getLemmas());
		log.info("rDTO.getTranslation : " + rDTO.getTranslation());

		log.info("reuterQuiz end!");
		return rDTO;
		// mongoTestMapper의 selectWithCondition에 query파라미터를 return

	}

	// mongoDB에서 yonhap뉴스중 가장 최근뉴스 가져오기
	@RequestMapping(value = "yonhapQuiz")
	public MongoNewsDTO yonhapQuiz(HttpServletRequest request, Model model, HttpSession session) throws Exception {

		log.info("yonhapQuiz start!");
		DBObject query = new BasicDBObject("news_name", "yonhap");
		// name이 gildong인 데이터를 query변수에 대입
		MongoNewsDTO rDTO = mongoTestMapper.getYonhapNews();

		log.info("rDTO.getInsertDate : " + rDTO.getInsertDate());
		log.info("rDTO.getNews_url : " + rDTO.getNews_url());
		log.info("rDTO.getNews_name : " + rDTO.getNews_name());
		log.info("rDTO.getNews_title : " + rDTO.getNews_title());
		log.info("rDTO.getOriginal_sentences : " + rDTO.getOriginal_sentences());
		log.info("rDTO.getTokens : " + rDTO.getTokens());
		log.info("rDTO.getLemmas : " + rDTO.getLemmas());
		log.info("rDTO.getTranslation : " + rDTO.getTranslation());

		log.info("yonhapQuiz end!");
		return rDTO;
		// mongoTestMapper의 selectWithCondition에 query파라미터를 return

	}
	// test
		@RequestMapping(value = "extractWords")
		@ResponseBody
		public List<Map<String, Object>> extractWords(HttpServletRequest request, HttpServletResponse response, HttpSession session, ModelMap model)
				throws Exception {
			log.info(this.getClass().getName() + ".extractWords start");
			MongoNewsDTO pDTO = mongoTestMapper.getHeraldNews();
			List<Map<String, Object>> rList = newsWordService.extractWords(pDTO);
			
			log.info(this.getClass().getName() + ".extractWords end");
			
			return rList;
		}
}
