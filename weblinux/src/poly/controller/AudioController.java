package poly.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;

import poly.dto.WordQuizDTO;
import poly.persistance.mongo.IMongoQuizMapper;
import poly.persistance.mongo.IMongoTestMapper;
import poly.service.IAudioService;
import poly.service.INewsService;
import poly.service.INewsWordService;
import poly.util.TTSUtil;

@Controller
public class AudioController{
	
	private Logger log = Logger.getLogger(this.getClass());
	
	   @Resource(name = "NewsService")
	   INewsService newsService;

	   @Resource(name = "MongoTestMapper")
	   IMongoTestMapper mongoTestMapper;

	   @Resource(name = "NewsWordService")
	   private INewsWordService newsWordService;
	   
	   @Resource(name = "AudioService")
	   private IAudioService audioService;

	   @Resource(name = "MongoQuizMapper")
	   IMongoQuizMapper mongoQuizMapper;
	
	   
	// 오늘의 문장을 받기위한 Mapping (중복안되는 문장) (원어민 듣기에 사용될 문장) (url로 검색)
	@RequestMapping(value = "Today/getTodaySentences")
	   @ResponseBody
	   public Map<String, Object> getTodaySentences(HttpServletRequest request, ModelMap model, HttpSession session) throws Exception {
		   
		   String news_url = request.getParameter("news_url");
		   String idx = request.getParameter("idx");
		   DBObject query = new BasicDBObject("url", news_url);
		   WordQuizDTO rDTO = mongoTestMapper.getQuiz(query);
		   List<Map<String, Object>> resp = new ArrayList<>();
		   Set<String> sentSet = new HashSet<>();
		  
		   int i = Integer.parseInt(idx);
			   
		   String sent = rDTO.getAnswersentence().get(i);
		   if(sentSet.add(sent)) {
			   Map<String, Object> sentMap = new HashMap<>();
			   sentMap.put("sentence", sent);
			   sentMap.put("index", i);
			   
			   log.info("sentence ############" + sent);
			   log.info("index ############" + i);
			   resp.add(sentMap);
		   }
			   
		   Map<String, Object> rMap = new HashMap<>();
		   rMap.put("res", resp);
		   
		   log.info("TodayResult 시작");
		   log.info("TodayResult 종료");

	      return rMap;
	   }
	   
		// 원어민 목소리 파일을 가져오기위한 Mapping
	   @RequestMapping(value = "audio/getTodaySentenceAudio", produces=MediaType.APPLICATION_OCTET_STREAM_VALUE)
		@ResponseBody
		public byte[] getTodaySentenceAudio(HttpServletRequest request, HttpServletResponse response, HttpSession session, ModelMap model)
				throws Exception {
			log.info(this.getClass().getName() + ".getTodaySentenceAudio start");
			String newsUrl = request.getParameter("newsUrl");
			String idx = request.getParameter("idx");
			log.info("idx : " + idx);
			byte[] res = audioService.getTodaySentenceAudio(newsUrl, idx);
			log.info(this.getClass().getName() + ".getTodaySentenceAudio end");
			return res;
		}
	   
	   // 분석으로 넘기기위한 Mapping
		@RequestMapping(value = "Today/analyzeAudio", method = RequestMethod.POST)
		@ResponseBody
		public Map<String, Object> analyzeAudio(HttpServletRequest request, HttpServletResponse response, HttpSession session, ModelMap model)
				throws Exception {
			log.info(this.getClass().getName() + ".analyzeAudio start");
			String data = request.getParameter("data");
			String newsUrl = request.getParameter("newsUrl");
			String sentenceAudioIdx = request.getParameter("sentenceAudioIdx");
			log.info("sentenceAudioIdx : " + sentenceAudioIdx);
			log.info("newsUrl : " + newsUrl);
			Map<String, Object> rMap = audioService.analyzeAudio(data, newsUrl, sentenceAudioIdx);
			log.info(this.getClass().getName() + ".analyzeAudio end");
			
			return rMap;
		}
		
		// 원어민 목소리파일은 받기위한 Mapping
		@RequestMapping(value = "audio/getAnswerAudio", produces=MediaType.APPLICATION_OCTET_STREAM_VALUE)
		@ResponseBody
		public byte[] getAnswerAudio(HttpServletRequest request, HttpServletResponse response, HttpSession session, ModelMap model)
				throws Exception {
			log.info(this.getClass().getName() + ".getAnswerAudio start");
			String answer_temp_file = request.getParameter("file");
			
			log.info(this.getClass().getName() + ".getAnswerAudio end");
			return audioService.getAnswerAudio(answer_temp_file);
			//return audioService.getAnswerAudioFromOuter(answer_temp_file);
			
		}

}