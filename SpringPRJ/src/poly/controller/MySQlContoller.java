package poly.controller;

import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.stanford.nlp.pipeline.CoreSentence;
import poly.dto.MongoNewsDTO;
import poly.dto.NewsDTO;
import poly.persistance.mongo.IMongoTestMapper;
import poly.service.INewsService;
import poly.util.NLPUtil;
import poly.util.WebCrawler;

@Controller
public class MySQlContoller {
	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "NewsService")
	private INewsService newsService;

	@Resource(name = "MongoTestMapper")
	private IMongoTestMapper mongoTestMapper;

	// 수동으로 웹크롤링 및 MySQl에 저장
	@RequestMapping(value = "/MySQLsaveNews")
	public String MySQLsaveNews(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {

		log.info(this.getClass().getName() + "saveNews Start!");

		// herald 뉴스 크롤링
		log.info(this.getClass().getName() + "crawlHerald() start");
		String[] crawlRes = WebCrawler.crawlHerald();
		String title = crawlRes[0];
		String inputText = crawlRes[1];
		String newsUrl = crawlRes[2];
		String newsname = "herald";
		log.info("Herald_title : " + title);
		log.info("Herald_newsUrl : " + newsUrl);
		int res = newsService.MySQLsaveNews(title, inputText, newsUrl, newsname);
		log.info(this.getClass().getName() + "crawlHerald() end");
		crawlRes = null;

		// 로이터 news 뉴스 크롤링
		log.info(this.getClass().getName() + "crawlreuter() start");
		String[] crawlRes1 = WebCrawler.crawlreuters();
		String title1 = crawlRes1[0];
		String inputText1 = crawlRes1[1];
		String newsUrl1 = crawlRes1[2];
		String newsname1 = "reuters";
		log.info("Bbc_title1 : " + title1);
		log.info("Bbc_newsUrl1 : " + newsUrl1);

		res += newsService.MySQLsaveNews(title1, inputText1, newsUrl1, newsname1);
		log.info(this.getClass().getName() + "crawlreuter() end");
		crawlRes1 = null;

		// times 뉴스 크롤링
		log.info(this.getClass().getName() + "crawltimes() start");
		String[] crawlRes2 = WebCrawler.crawltimes();
		String title2 = crawlRes2[0];
		String inputText2 = crawlRes2[1];
		String newsUrl2 = crawlRes2[2];
		String newsname2 = "times";
		log.info("times_title2 : " + title2);
		log.info("times_newsUrl2 : " + newsUrl2);

		res += newsService.MySQLsaveNews(title2, inputText2, newsUrl2, newsname2);
		log.info(this.getClass().getName() + "crawltimes() end");
		crawlRes2 = null;

		// yonhap 뉴스 크롤링
		log.info(this.getClass().getName() + "crawlyonhap() start");
		String[] crawlRes3 = WebCrawler.crawlyonhap();
		String title3 = crawlRes3[0];
		String inputText3 = crawlRes3[1];
		String newsUrl3 = crawlRes3[2];
		String newsname3 = "yonhap";
		log.info("yonhap_title3 : " + title3);
		log.info("yonhap_newsUrl3 : " + newsUrl3);

		res += newsService.MySQLsaveNews(title3, inputText3, newsUrl3, newsname3);
		log.info(this.getClass().getName() + "crawlyonhap()) end");
		crawlRes3 = null;

		// 뉴스 저장 결과 넣어주기
		model.addAttribute("res", String.valueOf(res));

		log.info(this.getClass().getName() + "saveNews End!");

		return "/news/NewsForWEB";

	}

	// mySQL에서 데이터 가져와서 자연어처리하여 mongo에 저장
	@RequestMapping(value = "/mongoSaveNews")
	public String mongoSaveNews(HttpServletRequest request, HttpServletResponse response, ModelMap model)
			throws Exception {

		log.info(this.getClass().getName() + ".mongoSaveNews Start!");
		List<NewsDTO> rList = newsService.getNewsInfoFromDB();

		for (NewsDTO nDTO : rList) {

			Iterator<CoreSentence> it = NLPUtil.sentence(nDTO.getNews_contents());
			MongoNewsDTO mnDTO = new MongoNewsDTO(it);

			mnDTO.setNews_url(nDTO.getNews_url());
			mnDTO.setNews_name(nDTO.getNews_name());
			mnDTO.setNews_title(nDTO.getNews_title());
			mongoTestMapper.insert(mnDTO);
		}
		rList = null;

		log.info(this.getClass().getName() + ".mongoSaveNews End!");

		return "/mongoSaveNews";

	}

}
