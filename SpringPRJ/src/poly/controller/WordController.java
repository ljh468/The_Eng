package poly.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.service.IMailService;
import poly.service.INewsService;
import poly.service.IUserService;

@Controller
public class WordController {
	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "UserService")
	IUserService userService;

	@Resource(name = "MailService")
	IMailService MailService;

	@Resource(name = "NewsService")
	INewsService newsService;
	
	@RequestMapping(value = "Word/wordCard")
	public String wordCard() {

		log.info("wordCard 시작");

		log.info("wordCard 종료");

		return "/Word/wordCard";
	}

	@RequestMapping(value = "Word/wordOption")
	public String wordOption() {

		log.info("wordOption 시작");

		log.info("wordOption 종료");

		return "/Word/wordOption";
	}

	@RequestMapping(value = "Word/wordStudy")
	public String wordStudy() {

		log.info("wordStudy 시작");

		log.info("wordStudy 종료");

		return "/Word/wordStudy";
	}

	@RequestMapping(value = "Word/wordResult")
	public String wordResult() {

		log.info("wordResult 시작");

		log.info("wordResult 종료");

		return "/Word/wordResult";
	}
	
}
