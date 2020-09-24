package poly.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import poly.service.IMailService;
import poly.service.INewsService;
import poly.service.IUserService;
import poly.util.NLPUtil;

@Controller
public class TestController {
	
	@Resource(name = "UserService")
	IUserService userService;

	@Resource(name = "MailService")
	IMailService MailService;

	@Resource(name = "NewsService")
	INewsService newsService;

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
}
