package poly.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	/**  웹크롤링하고 바로 몽고 DB에 저장
	 * @param request
	 * @param model
	 * @param session
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "insertNews", produces ="application/json; charset=UTF8")
	@ResponseBody
	@Scheduled(cron = "0 0 7 ? * *")
	public List<Map<String, Object>> insertNews(HttpServletRequest request, Model model, HttpSession session) 
			throws Exception{
		
		log.info("###START### : insertNews");
		
		// MongoDB에 키값으로 넣기 위한 obj 
		Map<String, Object> obj = new HashMap<>();
				
		// crawlingAll메서드의 rList를 pList에 대입 
		List<Map<String, Object>> pList = newsService.crawlingAll();
		
		// 첫번째 값은 Map형의 herald 뉴스
		Map<String, Object> pMap = pList.get(0);
		
		Iterator<String> keys = pMap.keySet().iterator();
		
		int i = 1;
		while(keys.hasNext()) {
			
			obj.put("insertDate", pMap.get("insertDate"));
			obj.put("news_url", pMap.get("newsUrl"));
			obj.put("news_name", pMap.get("newsName"));
			obj.put("news_title", pMap.get("newsTitle"));	
			obj.put("originsentence", pMap.get("newsContents"));
			obj.put("lemmas",pMap.get("newsLemmas"));
			obj.put("tokens", pMap.get("newsTokens"));
			obj.put("translation",pMap.get("translation"));
			
			
			mongoTestMapper.insert(obj);
			log.info("###START### : obj.put");
			
			if(i == 4) {
				return null;
			}
			
			pMap = pList.get(i);
			
			obj = null;
			obj = new HashMap<>();
			
			i++;
			
		}
			pMap = null;
//		obj.put("newsName", pMap.get("newsName"));
//		obj.put("newsTitle", pMap.get("newsTitle"));	
//		obj.put("Lemma",pMap.get("newsLemmas"));
//		obj.put("Token", pMap.get("newsTokens"));
//		obj.put("OriginSentence", pMap.get("newsContents"));
//		obj.put("newsUrl", pMap.get("newsUrl"));
//		obj.put("InsertDate", pMap.get("insertDate"));
//		
//		mongoTestMapper.insert(obj);
//		
//		obj = null;
//		obj = new HashMap<>();
//		
//		log.info("###END### : insert Herald");
//		
//		// 두번째 값은 Map형의 UK 뉴
//		pMap = pList.get(1);
//		
//		obj.put("newsName", pMap.get("newsName"));
//		obj.put("newsTitle", pMap.get("newsTitle"));	
//		obj.put("Lemma", pMap.get("newsLemmas"));
//		obj.put("Token", pMap.get("newsTokens"));
//		obj.put("OriginSentence",pMap.get("newsContents"));
//		obj.put("newsUrl", pMap.get("newsUrl"));
//		obj.put("InsertDate", pMap.get("insertDate"));
//		
//		mongoTestMapper.insert(obj);
//		
//		obj = null;
//		obj = new HashMap<>();
//		
//		log.info("###END### : insert UK");
//		
//		// 세번째 값은 Map - Times
//		pMap = pList.get(2);
//		
//		obj.put("newsName", pMap.get("newsName"));
//		obj.put("newsTitle", pMap.get("newsTitle"));	
//		obj.put("Lemma",pMap.get("newsLemmas"));
//		obj.put("Token", pMap.get("newsokens"));
//		obj.put("OriginSentence",pMap.get("newsContents"));
//		obj.put("newsUrl", pMap.get("newsUrl"));
//		obj.put("InsertDate", pMap.get("insertDate"));
//		
//		mongoTestMapper.insert(obj);
//		
//		obj = null;
//		obj = new HashMap<>();
//		
//		log.info("###END### : insert Times");
//		
//		// 네번째 값은 Map - Yonhap
//		pMap = pList.get(3);
//		
//		obj.put("newsName", pMap.get("newsName"));
//		obj.put("newsTitle", pMap.get("newsTitle"));	
//		obj.put("Lemma",pMap.get("newsLemmas"));
//		obj.put("Token", pMap.get("newsTokens"));
//		obj.put("OriginSentence",pMap.get("newsContents"));
//		obj.put("newsUrl", pMap.get("newsUrl"));
//		obj.put("InsertDate", pMap.get("insertDate"));
//		
//		mongoTestMapper.insert(obj);
//		
//		obj = null;
//		obj = new HashMap<>();
//		
//		log.info("###END### : insert Yonhap");
		
		return null;
	}
}
