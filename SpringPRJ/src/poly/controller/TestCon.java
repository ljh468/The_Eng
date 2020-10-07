package poly.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
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

import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;

import poly.dto.MongoNewsDTO;
import poly.dto.WordQuizDTO;
import poly.persistance.mongo.IMongoTestMapper;
import poly.service.INewsService;
import poly.service.INewsWordService;

@Controller
public class TestCon {

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
		public String extractWords(HttpServletRequest request, HttpServletResponse response, HttpSession session,
				ModelMap model) throws Exception {

			// 뉴스 가져오기
			MongoNewsDTO pDTO = mongoTestMapper.getHeraldNews();

			// 단어 추출 -
			// [{"wordIdx":5,"pool":["Business"],"lemma":"digit","word":"digit","sntncIdx":0},
			List<Map<String, Object>> rList = newsWordService.extractWords(pDTO);

			Map<String, Object> pMap = new HashMap<String, Object>();
			
			List<WordQuizDTO> quizList = new ArrayList<WordQuizDTO>();
			Iterator<Map<String, Object>> it = rList.iterator();
			List<String> wordList = new ArrayList<String>();
			List<String> sentList = new ArrayList<String>();
			WordQuizDTO quizDTO = new WordQuizDTO();
			
			
		
			while (it.hasNext()) {

				pMap = (Map<String, Object>) it.next();
				int wordIdx = (Integer) pMap.get("wordIdx");
				int sntncIdx = (Integer) pMap.get("sntncIdx");
				log.info("sntncIdx : " + sntncIdx);
				String word = (String) pMap.get("word");
				String sent = (String) pDTO.getOriginal_sentences().get(sntncIdx);
				
				quizDTO.setUrl(pDTO.getNews_url());
				wordList.add(word);
				quizDTO.setWord(wordList);
				sentList.add(sent);
				quizDTO.setOriginal_sent(sentList);
			}	
			log.info("wordList : "+ wordList);
			log.info("pDTO : " +pDTO);
			mongoTestMapper.insert(quizDTO);
			return null;

		}
		
//		Integer a = new Integer(0);
//		Integer[] b = new Integer[pDTO.getOriginal_sentences().size() - 2];	
		// MAP의 KEY값을 이용하여 VALUE값 가져오기
//			log.info("rMap - sntIdx: " + pMap.get("sntncIdx"));
//			a = (Integer) pMap.get("sntncIdx");
//			b[k] = a;
//			k++;
//
//		}
//		for (int i = 0; i < b.length; i++) {
//			System.out.println(b[i]);
//
//		}
//		// 최빈값 찾기
//
//		int mode = 0;
//		int[] index = new int[100];
//		int max = Integer.MIN_VALUE;
//		int i = 0;
//
//		for (i = 0; i < b.length; i++) {
//			index[b[i]]++;
//			log.info("index: " + index[b[i]]);
//		}
//		for (i = 0; i < index.length; i++) {
//			if (max < index[i]) {
//				max = index[i];
//				mode = i;
//			}
//		}
//		System.out.println("최빈값 : " + mode);
//
//		List<String> result = new ArrayList<String>();
//		result = pDTO.getOriginal_sentences();
//
//		String ss = (String) pMap.get("word");
//
//		log.info(ss);

//		result.get(mode).replace(, "");

//		model.addAttribute("quizList", quizList);
//		return "/Today/TodayExam";

	}



