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

import poly.dto.MongoNewsDTO;
import poly.dto.QuizInfoDTO;
import poly.dto.WordQuizDTO;
import poly.persistance.mongo.IMongoQuizMapper;
import poly.persistance.mongo.IMongoTestMapper;
import poly.service.IAudioService;
import poly.service.IMailService;
import poly.service.INewsService;
import poly.service.INewsWordService;
import poly.service.IUserService;
import poly.util.CmmUtil;
import poly.util.TTSUtil;

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
   
   @Resource(name = "AudioService")
   private IAudioService audioService;

   @Resource(name = "MongoQuizMapper")
   IMongoQuizMapper mongoQuizMapper;

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
   public String TodayHeraldNews(HttpServletRequest request, ModelMap model, HttpSession session) throws Exception {
      // Today main에서 news_name을 받아와 각뉴스에 맞는 자료 추출
      String news_name = request.getParameter("news_name");
      log.info("news_name : " + news_name);
      String user_id = (String) session.getAttribute("user_id");
      log.info("TodaySentence 시작");
      log.info("Quiz start!");

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

         /*
          * getQuizInfo ( 유저정보 불러오기 ) url, id 정보 조회안되면, index = 0로 insert
          */
         log.info("getQuizInfo Start!");
         String news_url = rDTO.getNews_url();
         QuizInfoDTO qDTO = mongoQuizMapper.getQuizInfo(user_id, news_url);
         log.info("qDTO : " + qDTO.getIdx());
         log.info("qDTO : " + qDTO.getnews_url());
         log.info("qDTO : " + qDTO.getUser_id());

         log.info("getQuizInfo End!");
         // getQuizInfo 불러오기 끝

         model.addAttribute("idx", qDTO.getIdx());
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

         log.info("getQuizInfo Start!");
         String news_url = rDTO.getNews_url();
         QuizInfoDTO qDTO = mongoQuizMapper.getQuizInfo(user_id, news_url);
         log.info("getQuizInfo End!");

         model.addAttribute("idx", qDTO.getIdx());
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

         log.info("getQuizInfo Start!");
         String news_url = rDTO.getNews_url();
         QuizInfoDTO qDTO = mongoQuizMapper.getQuizInfo(user_id, news_url);
         log.info("getQuizInfo End!");

         model.addAttribute("idx", qDTO.getIdx());
         model.addAttribute("news_name", "The Korea Times");
         model.addAttribute("news_title", rDTO.getNews_title());
         model.addAttribute("news_url", rDTO.getNews_url());
         model.addAttribute("original_sentences", rDTO.getOriginal_sentences());
         model.addAttribute("insertdate", rDTO.getInsertDate());

         return "Today/TodayNews";

      } // 연합 뉴스 추출
      else if (news_name.equals("yonhap")) {
         log.info("yonhapGET Start!");
         MongoNewsDTO rDTO = mongoTestMapper.getYonhapNews();
         log.info("yonhapGET End!");

         log.info("getQuizInfo Start!");
         String news_url = rDTO.getNews_url();
         QuizInfoDTO qDTO = mongoQuizMapper.getQuizInfo(user_id, news_url);
         log.info("getQuizInfo End!");

         model.addAttribute("idx", qDTO.getIdx());
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
   @SuppressWarnings("finally")
   @RequestMapping(value = "Today/TodaySentence")
   public String TodaySentence(HttpServletRequest request, ModelMap model) throws Exception {
      
      try {
      log.info("TodaySentence 시작");
      
      String idxstring = request.getParameter("idx");
      int idx = Integer.parseInt(idxstring);
      log.info("idx : " + idx);
      String news_title = CmmUtil.nvl(request.getParameter("news_title"));
      String news_name = CmmUtil.nvl(request.getParameter("news_name"));
      String news_url = CmmUtil.nvl(request.getParameter("news_url")); // 뉴스의 url로 조회하기 위함
      String insertdate = CmmUtil.nvl(request.getParameter("insertdate"));
      log.info("news_url2 : "+ news_url);
      log.info("news_name 2 : " + news_name);
      DBObject query = new BasicDBObject("url", news_url);
      log.info("query : " + query);

      // 생성된 QuizBank컬렌션에서 url로 조회하여 데이터를 가져옴
      WordQuizDTO rDTO = mongoTestMapper.getQuiz(query);
      
      log.info("news_url: " + news_url);
      log.info("news_name: " + news_name);
      log.info("insertdate: " + insertdate);
      log.info("news_title: " + news_title);
      log.info("original_sent : " + rDTO.getOriginal_sent().get(idx));
      log.info("translation : " + rDTO.getTranslation().get(idx));
      log.info("quiz_sent : " + rDTO.getQuiz_sent().get(idx));
      log.info("answer_sent : " + rDTO.getAnswersentence().get(idx));
      log.info("word : " + rDTO.getWord().get(idx));
      log.info("idx : " + idx);
      
      model.addAttribute("idx",idx);
      model.addAttribute("news_title", news_title);
      model.addAttribute("quiz_sent", rDTO.getQuiz_sent().get(idx));
      model.addAttribute("word", rDTO.getWord().get(idx));
      model.addAttribute("answer_sent", rDTO.getAnswersentence().get(idx));
      model.addAttribute("news_url", news_url);
      model.addAttribute("news_name", news_name);
      model.addAttribute("insertdate", insertdate);
      model.addAttribute("original_sent", rDTO.getOriginal_sent().get(idx));
      model.addAttribute("translation", rDTO.getTranslation().get(idx));   

      log.info("TodaySentence 종료 ");

      log.info("TodaySentence 종료 ");
      
      return "/Today/TodaySentence";
      }catch(Exception e) {
         e.printStackTrace();
         String msg = "모든 문제를 푸셨습니다.";
         // index가 넘어간 에러시
         // alert("모든 문제를 푸셨습니다.");
         String url = "/Today/TodayMain.do";
         model.addAttribute("msg", msg);
         model.addAttribute("url", url);
         return "/redirect";
         
      }
   }

   /**
    * ########################################## 오늘의퀴즈 ( 뉴스의 주요문장 퀴즈 추출 )
    * ##########################################
    * 
    * @throws Exception
    */
   @RequestMapping(value = "Today/TodayExam")
   public String TodayExam(HttpServletRequest request, ModelMap model, HttpSession session) throws Exception {

      log.info("TodayExam 시작");

      String user_id = (String) session.getAttribute("user_id");
      String news_url = CmmUtil.nvl(request.getParameter("news_url"));
      String news_name = CmmUtil.nvl(request.getParameter("news_name"));
      String insertdate = CmmUtil.nvl(request.getParameter("insertdate"));
      String news_title = CmmUtil.nvl(request.getParameter("news_title"));
      String idxstring = CmmUtil.nvl(request.getParameter("idx"));
      
      log.info("news_name 3 : " + news_name);
      int idx = Integer.valueOf(idxstring);
      ///////////////////////////////////////////////////////////////////////////////////////////////
      // TEST //getParameter로 받으면
      String quiz = CmmUtil.nvl(request.getParameter("quiz_sent"));
      // (특수문자가 안나옴) The & lt;input type=& #39;text& #39; value=& #39;Mi& #39; id= &
      // #39;answer&
      log.info("quiz : " + quiz);
      /////////////////////////////////////////////////////////////////////////////////////////////

      DBObject query = new BasicDBObject("url", news_url);
      WordQuizDTO rDTO = mongoTestMapper.getQuiz(query);

      model.addAttribute("quiz_sent", rDTO.getQuiz_sent().get(idx));
      model.addAttribute("word", rDTO.getWord().get(idx));
      model.addAttribute("answer_sent", rDTO.getAnswersentence().get(idx));
      model.addAttribute("news_url", news_url);
      model.addAttribute("news_name", news_name);
      model.addAttribute("insertdate", insertdate);
      model.addAttribute("news_title", news_title);
      model.addAttribute("original_sent", rDTO.getOriginal_sent().get(idx));
      model.addAttribute("translation", rDTO.getTranslation().get(idx));
      model.addAttribute("idx", idx);

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
    * ########################################## 오늘의 영어문장 강세 측정
    * 
    * ##########################################
    * 
    * @throws Exception
    */
   @RequestMapping(value = "Today/TodayRecord")
   public String TodayRecord(HttpServletRequest request, ModelMap model, HttpSession session) throws Exception {

      log.info("TodayRecord 시작");

      String idxstring = CmmUtil.nvl(request.getParameter("idx"));
      int idx = Integer.valueOf(idxstring);

      String news_name = CmmUtil.nvl(request.getParameter("news_name"));
      String news_url = CmmUtil.nvl(request.getParameter("news_url"));
      String news_title = CmmUtil.nvl(request.getParameter("news_title"));
      String insertdate = CmmUtil.nvl(request.getParameter("insertdate"));
      String user_id = CmmUtil.nvl((String) session.getAttribute("user_id"));

      log.info("news_name : 4 " + news_name);
      // 퀴즈를 풀면 UserQuizInfo의 quizindex를 올려주기위한 nextQuiz()
      mongoQuizMapper.nextQuiz(user_id, news_url);

      DBObject query = new BasicDBObject("url", news_url);
      WordQuizDTO rDTO = mongoTestMapper.getQuiz(query);

      model.addAttribute("answer_sent", rDTO.getAnswersentence().get(idx));
      model.addAttribute("original_sent" , rDTO.getOriginal_sent().get(idx));
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
   
   @RequestMapping(value = "Today/getTodaySentences")
   @ResponseBody
   public Map<String, Object> getTodaySentences(HttpServletRequest request, ModelMap model, HttpSession session) throws Exception {
	   
	   String news_url = request.getParameter("news_url");
	   DBObject query = new BasicDBObject("url", news_url);
	   WordQuizDTO rDTO = mongoTestMapper.getQuiz(query);
	   List<Map<String, Object>> resp = new ArrayList<>();
	   Set<String> sentSet = new HashSet<>();
	  
	   int i = 0;
	   for(String sent : rDTO.getOriginal_sent()) {
		   
		   if(sentSet.add(sent)) {
			   TTSUtil.saveTTS(i, sent, news_url);
			   Map<String, Object> sentMap = new HashMap<>();
			   sentMap.put("sentence", sent);
			   sentMap.put("index", i);
			   resp.add(sentMap);
		   }
		   i++;
	   }
	   Map<String, Object> rMap = new HashMap<>();
	   rMap.put("res", resp);
	   
	   log.info("TodayResult 시작");
	   log.info("TodayResult 종료");

      return rMap;
   }
   
   @RequestMapping(value = "audio/getTodaySentenceAudio", produces=MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public byte[] getTodaySentenceAudio(HttpServletRequest request, HttpServletResponse response, HttpSession session, ModelMap model)
			throws Exception {
		log.info(this.getClass().getName() + ".getTodaySentenceAudio start");
		String newsUrl = request.getParameter("newsUrl");
		String idx = request.getParameter("idx");
		byte[] res = audioService.getTodaySentenceAudio(newsUrl, idx);
		log.info(this.getClass().getName() + ".getTodaySentenceAudio end");
		return res;
	}
   
	@RequestMapping(value = "Today/analyzeAudio", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> analyzeAudio(HttpServletRequest request, HttpServletResponse response, HttpSession session, ModelMap model)
			throws Exception {
		log.info(this.getClass().getName() + ".analyzeAudio start");
		String data = request.getParameter("data");
		String newsUrl = request.getParameter("newsUrl");
		String sentenceAudioIdx = request.getParameter("sentenceAudioIdx");
		log.info("sentenceAudioIdx : " + sentenceAudioIdx);
		Map<String, Object> rMap = audioService.analyzeAudio(data, newsUrl, sentenceAudioIdx);
		log.info(this.getClass().getName() + ".analyzeAudio end");
		
		return rMap;
	}
	
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