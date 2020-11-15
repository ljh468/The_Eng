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
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;

import poly.dto.MongoNewsDTO;
import poly.dto.QuizInfoDTO;
import poly.dto.UserDTO;
import poly.dto.WordQuizDTO;
import poly.persistance.mongo.IMongoQuizMapper;
import poly.persistance.mongo.IMongoTestMapper;
import poly.service.IAudioService;
import poly.service.IMailService;
import poly.service.INewsService;
import poly.service.INewsWordService;
import poly.service.IUserService;
import poly.util.CmmUtil;

@Controller
public class RestudyController {

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

	@RequestMapping(value = "Restudy/NewsSelect")
	public String TodayMain(HttpServletRequest request, HttpSession session, ModelMap model) throws Exception {
		String user_id = (String) session.getAttribute("user_id");
		if (user_id == null) {
			return "/The/TheLogin";
		}
		
		return "/Restudy/NewsSelect";
	}
	
	@ResponseBody
	@RequestMapping(value = "/Restudy/findNews", method = RequestMethod.POST)
	public List<Map<String, Object>> idCheck(HttpServletRequest request) throws Exception {
		log.info("News Search Start");

		String newsName = request.getParameter("newsName");
		
		List<Map<String, Object>> pList = new ArrayList<>();
		
		log.info("newsName : " + newsName);
		
		if(newsName.equals("times")) {
			log.info("times start!");
			pList = mongoTestMapper.getPastTimesNews();
		}else if(newsName.equals("reuters")) {
			log.info("reuters start!");
			pList = mongoTestMapper.getPastReutersNews();
		}else if(newsName.equals("herald")) {
			log.info("herald start!");
			pList = mongoTestMapper.getPastHeraldNews();
		}else if(newsName.equals("yonhap")) {
			log.info("yonhap start!");
			pList = mongoTestMapper.getPastYonhapNews();
		}
		
		
		log.info(pList);
		log.info("News Search End");
		return pList;
	}

	@RequestMapping(value = "/Restudy/ReExam")
	public String TodayExam(HttpServletRequest request, ModelMap model, HttpSession session) throws Exception {
		
		log.info(this.getClass().getName() + ".reExam Start!");
		
		   String user_id = (String) session.getAttribute("user_id");
		      if (user_id == null) {
		    	  
		         return "/The/TheLogin";
		         
		      }
		      
		String news_url = CmmUtil.nvl(request.getParameter("news_url"));
		String date = CmmUtil.nvl(request.getParameter("date"));
		String news_title = CmmUtil.nvl(request.getParameter("news_title"));
		
		log.info("news_url : " +news_url);
		log.info("date : " + date);
		log.info("news_title : " +news_title);
		
		DBObject query = new BasicDBObject("url", news_url);
		WordQuizDTO rDTO = mongoTestMapper.getQuiz(query);
		
		model.addAttribute("quiz_sent", rDTO.getQuiz_sent());
		model.addAttribute("word", rDTO.getWord());
		model.addAttribute("news_url", news_url);
		model.addAttribute("date", date);
		model.addAttribute("news_title", news_title);
		model.addAttribute("translation", rDTO.getTranslation());
		
		return "/Restudy/ReExam";
	}
}