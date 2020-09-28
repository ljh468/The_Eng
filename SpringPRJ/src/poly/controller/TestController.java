package poly.controller;

<<<<<<< HEAD
=======
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

>>>>>>> 0412320d6ce4091245e2ee8708b77cacfd546164
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

<<<<<<< HEAD
import poly.service.IMailService;
import poly.service.INewsService;
import poly.service.IUserService;
import poly.util.NLPUtil;

@Controller
public class TestController {
	
=======
import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;

import poly.persistance.mongo.IMongoTestMapper;
import poly.service.IMailService;
import poly.service.INewsService;
import poly.service.IUserService;

@Controller
public class TestController {

>>>>>>> 0412320d6ce4091245e2ee8708b77cacfd546164
	@Resource(name = "UserService")
	IUserService userService;

	@Resource(name = "MailService")
	IMailService MailService;

	@Resource(name = "NewsService")
	INewsService newsService;

<<<<<<< HEAD
	@RequestMapping(value = "test", produces = "application/json; charset=UTF8")
	@ResponseBody
	public String test(HttpServletRequest request, Model model, HttpSession session) {
		NLPUtil.test();
		String res = userService.test();
		return res;
	}
	
	// 템플릿
		@RequestMapping(value = "template")
		public String template() {
			return "/template";
		}
		
	// ajax test
		@RequestMapping(value = "/hello/text")
		public String Hello() {

			return "/hello";
		}

		@ResponseBody
		@RequestMapping(value = "/hello/hello")
		public boolean Hello(HttpServletRequest request) {
			String value = request.getParameter("id");

			if (value.equals("헬로")) {
				return true;
			}

			return false;
		}
=======
	@Resource(name = "MongoTestMapper")
	IMongoTestMapper mongoTestMapper;

	@RequestMapping(value = "mongoSelect", produces = "application/json; charset=UTF8")
	@ResponseBody
	public List<Map<String, Object>> select(HttpServletRequest request, Model model, HttpSession session)
			throws Exception {
		return mongoTestMapper.test();
	}

	@RequestMapping(value = "mongoSelectWithCondition", produces = "application/json; charset=UTF8")
	@ResponseBody
	public List<Map<String, Object>> selectWithCondition(HttpServletRequest request, Model model, HttpSession session)
			throws Exception {
		DBObject query = new BasicDBObject("name", "gildong");
		// name이 gildong인 데이터를 query변수에 대입
		return mongoTestMapper.selectWithCondition(query);
		// mongoTestMapper의 selectWithCondition에 query파라미터를 return
	}

	@RequestMapping(value = "mongoInsert", produces = "application/json; charset=UTF8")
	@ResponseBody
	public List<Map<String, Object>> insert(HttpServletRequest request, Model model, HttpSession session)
			throws Exception {
		Map<String, Object> obj = new HashMap<>();
		obj.put("name", "chang0");
		// name key에 chang0을 put
		obj.put("age", 24);
		obj.put("sentence", new String[] { "gdgdgd", "12341234" });
		// sentence key 문자열 배열로 gdgdgd, 12341234를 put

		mongoTestMapper.insert(obj);
		// mongoTestMapper의 insert에 obj 파라미터를 대입

		return mongoTestMapper.test();
	}
	@RequestMapping(value = "mongoInsertNews", produces = "application/json; charset=UTF8")
	@ResponseBody
	public List<Map<String, Object>> insertNews(HttpServletRequest request, Model model, HttpSession session)
			throws Exception {
		Map<String, Object> obj = new HashMap<>();
		obj.put("title", "trump dies");
		obj.put("newsUrl", "www.trumpdies.com");
		// 임의로 값을 만들어 Key에 대입
		
		List<String> origSent = new ArrayList<>();
		origSent.add("trump dies");
		origSent.add("oh my god!!");
		// 임의 값을 만들어 List origSent에 값을 대입
		
		obj.put("originalSentences", origSent);
		// originalSentence key에 List형인 origSent를 put
		
		List<String[]> lemmas = new ArrayList<>();
		
		origSent.forEach(sentence ->{
			lemmas.add(sentence.split(" "));
		});
		
		obj.put("lemmas", lemmas);
		
		List<String> translation = new ArrayList<>();
		origSent.add("트럼프 뒤짐");
		origSent.add("헐~~");
		
		obj.put("translation", translation);
		
		mongoTestMapper.insert(obj);
		
		return null;
	}

	// 템플릿
	@RequestMapping(value = "template")
	public String template() {
		return "/template";
	}

	// ajax test
	@RequestMapping(value = "/hello/text")
	public String Hello() {

		return "/hello";
	}

	@ResponseBody
	@RequestMapping(value = "/hello/hello")
	public boolean Hello(HttpServletRequest request) {
		String value = request.getParameter("id");

		if (value.equals("헬로")) {
			return true;
		}

		return false;
	}
>>>>>>> 0412320d6ce4091245e2ee8708b77cacfd546164
}
