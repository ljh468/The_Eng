package poly.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import poly.dto.MongoNewsDTO;
import poly.persistance.mongo.IMongoTestMapper;
import poly.service.IMailService;
import poly.service.INewsService;
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
	
	private Logger log = Logger.getLogger(getClass());
	
	/** ##############################################################
	 * 크롤링 바로 자연어 처리 -> mongoDB 저장
	    ############################################################## */
	
	@RequestMapping(value = "insertNews", produces ="application/json; charset=UTF8")
	@Scheduled(cron = "0 0 7 ? * *")
	public String insertNews(HttpServletRequest request, Model model, HttpSession session) 
			throws Exception{
		
		log.info("### START ### : insertNews");
		
		// MongoDB에 키값으로 넣기 위한 obj 
				
		// crawlingAll메서드의 rList를 pList에 대입 
		List<MongoNewsDTO> pList = newsService.crawlingAll(); // 영어뉴스 웹크롤링
		int res=0;
		for(MongoNewsDTO rDTO : pList) {
		mongoTestMapper.insert(rDTO); // mongoDB에 저장
		res++;
		}
		model.addAttribute("res", String.valueOf(res)); // 수집된 뉴스기사
		log.info("### END ### : insertNews");
		
		
		return "/news/NewsForWEB";
	}
}
