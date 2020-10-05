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
import org.springframework.web.bind.annotation.ResponseBody;

import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;

import poly.dto.MongoNewsDTO;
import poly.dto.WordQuizDTO;
import poly.persistance.mongo.IMongoTestMapper;
import poly.service.INewsService;
import poly.service.INewsWordService;
import poly.util.CmmUtil;

@Controller
public class TodayQuizController {

	@Resource(name = "MongoTestMapper")
	private IMongoTestMapper mongoTestMapper;

	@Resource(name = "NewsService")
	private INewsService newsService;

	@Resource(name = "NewsWordService")
	private INewsWordService newsWordService;

	private Logger log = Logger.getLogger(this.getClass());

	@RequestMapping(value = "TodayHeraldQuiz")
	public String extractWords(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			ModelMap model) throws Exception {

		// 뉴스 가져오기
		MongoNewsDTO pDTO = mongoTestMapper.getHeraldNews();

		// 단어 추출 -
		// [{"wordIdx":5,"pool":["Business"],"lemma":"digit","word":"digit","sntncIdx":0},
		List<Map<String, Object>> rList = newsWordService.extractWords(pDTO);
		Map<String, Object> pMap = new HashMap<String, Object>();
		List<WordQuizDTO> quizList = new ArrayList<>();
		Iterator<Map<String, Object>> it = rList.iterator();
		
		while (it.hasNext()) {

			pMap = (Map<String, Object>) it.next();
			WordQuizDTO quizDTO = new WordQuizDTO();
			int wordIdx = (Integer) pMap.get("wordIdx"); // 문장안에서 주요단어가 몇번째인지 인덱스
			int sntncIdx = (Integer) pMap.get("sntncIdx"); // 원문에서 주요단어가 조회된 문장의인덱스
			String lemma = (String) pMap.get("lemma");
			String word = (String) pMap.get("word");
			String originalSent = pDTO.getOriginal_sentences().get(sntncIdx);
			
			quizDTO.setLemma(lemma);
			quizDTO.setAnswer(word);
			quizDTO.setOriginalSentence(originalSent);
			quizDTO.setTranslation(originalSent);
			
			
			// 정답을 공백처리
			quizDTO.setSentence(
					originalSent.replace(word, "<input type='text' value='" + word.substring(0, 2) + "' id='answer'>"));
			quizDTO.setAnswerSentence(
					originalSent.replace(word, "<span style='font-weight:bold;'>" + word + "</span>"));

			quizList.add(quizDTO);
		}
		model.addAttribute("quizList", quizList);
		log.info(quizList);
		return "/Today/TodayExam";

	}

}
