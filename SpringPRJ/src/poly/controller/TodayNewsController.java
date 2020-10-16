package poly.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sound.midi.MidiDevice.Info;

import org.apache.log4j.Logger;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;

import poly.dto.MongoNewsDTO;
import poly.dto.UserDTO;
import poly.dto.WordQuizDTO;
import poly.persistance.mongo.IMongoTestMapper;
import poly.service.IMailService;
import poly.service.INewsService;
import poly.service.INewsWordService;
import poly.service.IUserService;
import poly.util.CmmUtil;
import poly.util.EncryptUtil;
import poly.util.RandomUtil;

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

	@Resource(name = "NewsWordService")
	private INewsWordService newsWordService;

	/**
	 * ########################################## 오늘의학습 메인페이지
	 * ##########################################
	 */
	@RequestMapping(value = "Today/TodayMain")
	public String TodayMain(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception {
		String user_id = (String) session.getAttribute("user_id");
		if (user_id == null) {
			return "/The/TheLogin";
		}
		// 각 신문사의 최신뉴스의 타이틀을 보여주기위해 DB에서 조회
		MongoNewsDTO hDTO = mongoTestMapper.getHeraldNews();
		String heraldtitle = hDTO.getNews_title();

		MongoNewsDTO rDTO = mongoTestMapper.getReutersNews();
		String reuterstitle = rDTO.getNews_title();

		MongoNewsDTO tDTO = mongoTestMapper.getTimesNews();
		String timestitle = tDTO.getNews_title();

		MongoNewsDTO yDTO = mongoTestMapper.getYonhapNews();
		String yonhaptitle = yDTO.getNews_title();

		model.addAttribute("heraldtitle", heraldtitle);
		model.addAttribute("reuterstitle", reuterstitle);
		model.addAttribute("timestitle", timestitle);
		model.addAttribute("yonhaptitle", yonhaptitle);
		model.addAttribute("user_id", user_id);
		return "/Today/TodayMain";
	}

	/**
	 * ########################################## 오늘의뉴스 (뉴스의 원문 추출)
	 * ##########################################
	 */
	@RequestMapping(value = "Today/TodayNews")
	public String TodayHeraldNews(HttpServletRequest request, ModelMap model) throws Exception {
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

			log.info("heraldGET End!");

			model.addAttribute("news_name", "The Korea Herald"); // news_name을 띄워주시위함
			model.addAttribute("news_title", rDTO.getNews_title()); // 뉴스타이틀
			model.addAttribute("news_url", rDTO.getNews_url()); // 뉴스 url
			model.addAttribute("original_sentences", rDTO.getOriginal_sentences()); // 뉴스의 문장
			model.addAttribute("insertdate", rDTO.getInsertDate()); // 뉴스의 날짜

			return "Today/TodayNews";
		} else if (news_name.equals("reuters")) {// 로이터 뉴스 추출
			log.info("reutersGET Start!");
			MongoNewsDTO rDTO = mongoTestMapper.getReutersNews();
			log.info("reutersGET End!");

			model.addAttribute("news_name", "Reuters News");
			model.addAttribute("news_title", rDTO.getNews_title());
			model.addAttribute("news_url", rDTO.getNews_url());
			model.addAttribute("original_sentences", rDTO.getOriginal_sentences());
			model.addAttribute("insertdate", rDTO.getInsertDate());

			return "Today/TodayNews";
		} // 코리아타임즈 뉴스 추출
		else if (news_name.equals("times")) {
			log.info("timesGET Start!");
			MongoNewsDTO rDTO = mongoTestMapper.getTimesNews();
			log.info("timesGET End!");

			model.addAttribute("news_name", "The Korea Times");
			model.addAttribute("news_title", rDTO.getNews_title());
			model.addAttribute("news_url", rDTO.getNews_url());
			model.addAttribute("original_sentences", rDTO.getOriginal_sentences());
			model.addAttribute("insertdate", rDTO.getInsertDate());

			return "Today/TodayNews";

		} // 연합 뉴스 추출
		else if (news_name.equals("yonhap")) {
			log.info("yonhapGET Start!");
			MongoNewsDTO rDTO = mongoTestMapper.getTimesNews();
			log.info("yonhapGET End!");

			model.addAttribute("news_name", "Yonhap News Agency");
			model.addAttribute("news_title", rDTO.getNews_title());
			model.addAttribute("news_url", rDTO.getNews_url());
			model.addAttribute("original_sentences", rDTO.getOriginal_sentences());
			model.addAttribute("insertdate", rDTO.getInsertDate());

			return "Today/TodayNews";
		} else
			return "Today/TodayMain";
	}

	/**
	 * ########################################## 오늘의문장 ( 뉴스의 주요문장 추출 )
	 * ##########################################
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "Today/TodaySentence")
	public String TodaySentence(HttpServletRequest request, ModelMap model) throws Exception {

		log.info("TodaySentence 시작");

		String news_name = CmmUtil.nvl(request.getParameter("news_name"));
		String news_url = CmmUtil.nvl(request.getParameter("news_url")); // 뉴스의 url로 조회하기 위함
		String news_title = CmmUtil.nvl(request.getParameter("news_title"));
		String insertdate = CmmUtil.nvl(request.getParameter("insertdate"));

		DBObject query = new BasicDBObject("url", news_url);
		log.info("query : " + query);

		// 생성된 QuizBank컬렌션에서 url로 조회하여 데이터를 가져옴
		WordQuizDTO rDTO = mongoTestMapper.getQuiz(query);
		
		log.info("news_url: " + news_url);
		log.info("news_name: " + news_name);
		log.info("insertdate: " + insertdate);
		log.info("news_title: " + news_title);
		log.info("original_sent : " + rDTO.getOriginal_sent().get(0));
		log.info("translation : " + rDTO.getTranslation().get(0));
		log.info("quiz_sent : " + rDTO.getQuiz_sent().get(0));
		log.info("answer_sent : " + rDTO.getAnswersentence().get(0));
		log.info("word : " + rDTO.getWord().get(0));
		
		model.addAttribute("quiz_sent", rDTO.getQuiz_sent().get(0));
		model.addAttribute("word", rDTO.getWord().get(0));
		model.addAttribute("answer_sent", rDTO.getAnswersentence().get(0));
		model.addAttribute("news_url", news_url);
		model.addAttribute("news_name", news_name);
		model.addAttribute("insertdate", insertdate);
		model.addAttribute("news_title", news_title);
		model.addAttribute("original_sent", rDTO.getOriginal_sent().get(0));
		model.addAttribute("translation", rDTO.getTranslation().get(0));		

		log.info("TodaySentence 종료 ");

		log.info("TodaySentence 종료 ");

		return "/Today/TodaySentence";
	}

	/**
	 * ########################################## 오늘의퀴즈 ( 뉴스의 주요문장 퀴즈 추출 )
	 * ##########################################
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "Today/TodayExam")
	public String TodayExam(HttpServletRequest request, ModelMap model) throws Exception {

		log.info("TodayExam 시작");

		String news_url = CmmUtil.nvl(request.getParameter("news_url"));
		String news_name = CmmUtil.nvl(request.getParameter("news_name"));
		String insertdate = CmmUtil.nvl(request.getParameter("insertdate"));
		String news_title = CmmUtil.nvl(request.getParameter("news_title"));
		
		
		///////////////////////////////////////////////////////////////////////////////////////////////
		//TEST   //getParameter로 받으면
		String quiz = CmmUtil.nvl(request.getParameter("quiz_sent"));
		// (특수문자가 안나옴) The & lt;input type=& #39;text& #39; value=& #39;Mi& #39; id= & #39;answer&
		log.info("quiz : "+quiz);
		/////////////////////////////////////////////////////////////////////////////////////////////
		
		
		DBObject query = new BasicDBObject("url", news_url);
		WordQuizDTO rDTO = mongoTestMapper.getQuiz(query);
		
		model.addAttribute("quiz_sent", rDTO.getQuiz_sent().get(0));
		model.addAttribute("word", rDTO.getWord().get(0));
		model.addAttribute("answer_sent", rDTO.getAnswersentence().get(0));
		model.addAttribute("news_url", news_url);
		model.addAttribute("news_name", news_name);
		model.addAttribute("insertdate", insertdate);
		model.addAttribute("news_title", news_title);
		model.addAttribute("original_sent", rDTO.getOriginal_sent().get(0));
		model.addAttribute("translation", rDTO.getTranslation().get(0));	
		
		
		log.info("TodayExam 종료");

		return "/Today/TodayExam";
	}
	// 빈칸을 채우고 제출하였을때 정답인지 아닌지 알려주는 
	@ResponseBody
	@RequestMapping(value = "/Today/answerCheck")
	public int passWordCheck(HttpServletRequest request) throws Exception {

		log.info("/Today/answerCheck 시작");

		int result = 0;

		String answer = request.getParameter("answer");
		String word = request.getParameter("word");

		log.info("answer : " + answer);
		log.info("word : " + word);

		if (answer.equals(word)) {
			result = 1;
		} else {
			result = 0;
		}

		log.info("result :" + result);
		log.info("/Today/answerCheck 종료");

		return result;
	}

	/**
	 * ########################################## 
	 * 오늘의 영어문장 강세 측정
	 * 
	 * ##########################################
	 * 
	 * @throws Exception
	 */
	@RequestMapping(value = "Today/TodayRecord")
	public String TodayRecord(HttpServletRequest request, ModelMap model) throws Exception {

		log.info("TodayRecord 시작");

		String news_name = CmmUtil.nvl(request.getParameter("news_name"));
		String news_url = CmmUtil.nvl(request.getParameter("news_url"));
		String news_title = CmmUtil.nvl(request.getParameter("news_title"));
		String insertdate = CmmUtil.nvl(request.getParameter("insertdate"));
		
		
		DBObject query = new BasicDBObject("url", news_url);
		WordQuizDTO rDTO = mongoTestMapper.getQuiz(query);
		
		model.addAttribute("answer_sent", rDTO.getAnswersentence().get(0));
		model.addAttribute("original_sent" + rDTO.getOriginal_sent().get(0));
		model.addAttribute("news_url", news_url);
		model.addAttribute("news_name", news_name);
		model.addAttribute("news_title", news_title);
		model.addAttribute("insertdate", insertdate);
		
		log.info("TodayRecord 종료");

		return "/Today/TodayRecord";
	}

	/**
	 * ########################################## 발음 및 강세 분석 (결과화면)
	 * ##########################################
	 */
	@RequestMapping(value = "Today/TodayResult")
	public String TodayResult() {

		log.info("TodayResult 시작");
		log.info("TodayResult 종료");

		return "/Today/TodayResult";
	}

}
