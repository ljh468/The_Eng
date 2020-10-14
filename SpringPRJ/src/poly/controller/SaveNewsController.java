package poly.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.dto.MongoNewsDTO;
import poly.dto.WordQuizDTO;
import poly.persistance.mongo.IMongoTestMapper;
import poly.service.IMailService;
import poly.service.INewsService;
import poly.service.INewsWordService;
import poly.service.IUserService;

@Controller
public class SaveNewsController {

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

	private Logger log = Logger.getLogger(getClass());

	/**
	 * ############################################################## 
	 * 크롤링 바로 자연어 처리
	 * mongoDB 저장 
	 * ##############################################################
	 */

	@RequestMapping(value = "insertNews", produces = "application/json; charset=UTF8")
	@Scheduled(cron = "0 0 7 ? * *")
	public String insertNews(HttpServletRequest request, Model model, HttpSession session) throws Exception {

		log.info("### START ### : insertNews");

		// ###############################
		// 웹크롤링 START!!
		// ###############################
		// crawlingAll메서드의 rList를 pList에 대입
		List<MongoNewsDTO> pList = newsService.crawlingAll(); // 영어뉴스 웹크롤링
		int res = 0;

		for (MongoNewsDTO rDTO : pList) {

			/**
			 * ###############################
			 * 퀴즈생성 START!!
			 * ###############################
			 *  rList 형태, 단어추출
			 * 추출된 단어형태:[{"wordIdx":5,"pool":["Business"],"lemma":"digit","word":"digit","sntncIdx":0},
			**/
			List<Map<String, Object>> rList = newsWordService.extractWords(rDTO);
			log.info("### START ### : insertQuiz");
			Map<String, Object> pMap = new HashMap<String, Object>(); // Map형태로 이루어진 rList를 나누기위한 객체생성
			Iterator<Map<String, Object>> it = rList.iterator();  // 주요단어와 비교한 문장 리스트를 돌리기위한 Iterator
			
			// String 타입의 변수를 리스트형태로 (이중배열)로넣기 위해 객체 생성
			List<String> wordList = new ArrayList<String>();
			List<String> sentList = new ArrayList<String>();
			List<String> answersentList = new ArrayList<String>();
			List<String> quizList = new ArrayList<String>();
			List<Integer> idx = new ArrayList<Integer>();
			//////////////////////////////////////////////////////
			WordQuizDTO quizDTO = new WordQuizDTO();
			int index = 0;
			while (it.hasNext()) {

				pMap = (Map<String, Object>) it.next();
				int sntncIdx = (Integer) pMap.get("sntncIdx");  // 주요단어가 들어간 문장인덱스
				String word = (String) pMap.get("word"); // 문장에 포함된 주요단어 추출
				String sent = (String) rDTO.getOriginal_sentences().get(sntncIdx); // 주요문장
				String quizSent = sent.replace(word,    // 단어를 빈칸으로만든 문장 
						"<input type='text' value='" + word.substring(0, 2) + "' id= 'answer'>");
				String answersent = sent.replace(word,  // 정답단어가 굵게 표현된 문장
						"<span style='font-weight:bold;'>" + word + "</span>");
				
				quizDTO.setUrl(rDTO.getNews_url()); // 뉴스 url DTO에 담기
				wordList.add(word);
				quizDTO.setWord(wordList); // 단어 list를 DTO에 담기
				sentList.add(sent);
				quizDTO.setOriginal_sent(sentList); // 문장 list를 DTO에 담기
				answersentList.add(answersent);
				quizDTO.setAnswersentence(answersentList); // 정답이 포함된 문장 list를 DTO에 담기
				quizList.add(quizSent); // 퀴즈로 생성된 문장 list를 DTO에 담기
				quizDTO.setQuiz_sent(quizList);
				
				
				idx.add(index);
				quizDTO.setIdx(idx);
				index += 1;
				
				
			}
			mongoTestMapper.insertQuiz(quizDTO);
			quizDTO=null;
			log.info("### END ### : insertQuiz");
		// ###############################
		// 퀴즈생성 END!!
		// ###############################
			
		// 웹크롤링한 영어뉴스 4가지 mongoDB에 저장	Eclipse Theme
		mongoTestMapper.insert(rDTO);
		rDTO =null;
		res++;
	}

	model.addAttribute("res",String.valueOf(res)); // 수집된 뉴스기사
	log.info("### END ### : insertNews");
	
	return"/news/NewsForWEB";

	}

	public String dis(String inputStr) {
		String result = "";
		for (int i = 0; i < inputStr.length(); i++) { // i가 0부터 사용자가 입력한 문자열의 길이만큼 반복문을 돌린다.
			if (!result.contains(String.valueOf(inputStr.charAt(i)))) { // 사용자가 입력받은 문자열의 i번째 문자를 String으로 바꾸고 result에 이
																		// 문자가 포함되어 있지 않다면
				result += String.valueOf(inputStr.charAt(i)); // result에 계속 추가, 즉 중복되지 않으면 추가
			}
		}
		return result;
	}
}
