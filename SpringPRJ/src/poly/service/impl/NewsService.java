package poly.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import edu.stanford.nlp.pipeline.CoreSentence;
import poly.dto.MongoNewsDTO;
import poly.dto.NewsDTO;
import poly.persistance.mapper.INewsMapper;
import poly.persistance.mongo.IMongoTestMapper;
import poly.service.INewsService;
import poly.util.NLPUtil;
import poly.util.WebCrawler;

@Service("NewsService")
public class NewsService implements INewsService {

	@Resource(name = "NewsMapper")
	private INewsMapper newsMapper;

	@Resource(name = "MongoTestMapper")
	private IMongoTestMapper mongTestMapper;

	// 로그파일 출력개체
	private Logger log = Logger.getLogger(this.getClass());
	
	
	/** ##############################################################
	 * 크롤링 바로 자연어 처리 -> mongoDB 저장
	    ############################################################## */
	@Override
	public List<Map<String, Object>> crawlingAll() throws Exception {

		log.info("###START### : " + this.getClass().getName() + "crawlingAll start");

		Date date = new Date();

		List<Map<String, Object>> rList = new ArrayList<>();

		log.info("###START### : CrawlHerald");
		// KoreaHerald Crawl
		Map<String, Object> hCrawlMap = new HashMap<>();

		String[] crawlRes = WebCrawler.crawlHerald();
		String title = crawlRes[0];
		String inputText = crawlRes[1];
		String newsUrl = crawlRes[2];

		Iterator<CoreSentence> hContents = NLPUtil.sentence(inputText);

		MongoNewsDTO hDTO = new MongoNewsDTO(hContents);

		List<List<String>> hTokenList = hDTO.getTokens();
		List<List<String>> hLemmaList = hDTO.getLemmas();
		List<String> hOriginalSentence = hDTO.getOriginal_sentences();
		List<String> hTranslation = hDTO.getTranslation();

		hCrawlMap.put("insertDate", date);
		hCrawlMap.put("newsName", "herald");
		hCrawlMap.put("newsUrl", newsUrl);
		hCrawlMap.put("newsTitle", title);
		hCrawlMap.put("newsContents", hOriginalSentence);
		hCrawlMap.put("newsLemmas", hLemmaList);
		hCrawlMap.put("newsTokens", hTokenList);
		hCrawlMap.put("translation", hTranslation);

		log.info("###END### : CrawlHerald");

		rList.add(hCrawlMap);
		hCrawlMap = null;
		/////////////////////////////////////////////////

		log.info("###START### : Crawlreuters");

		Map<String, Object> rCrawlMap = new HashMap<>();

		String[] crawlRes1 = WebCrawler.crawlreuters();
		String title1 = crawlRes1[0];
		String inputText1 = crawlRes1[1];
		String newsUrl1 = crawlRes1[2];

		Iterator<CoreSentence> rContents = NLPUtil.sentence(inputText1);

		MongoNewsDTO rDTO = new MongoNewsDTO(rContents);

		List<List<String>> rTokenList = rDTO.getTokens();
		List<List<String>> rLemmaList = rDTO.getLemmas();
		List<String> rOriginalSentence = rDTO.getOriginal_sentences();
		List<String> rTranslation = rDTO.getTranslation();
		
		rCrawlMap.put("insertDate", date);
		rCrawlMap.put("newsName", "reuters");
		rCrawlMap.put("newsUrl", newsUrl1);
		rCrawlMap.put("newsTitle", title1);
		rCrawlMap.put("newsContents", rOriginalSentence);
		rCrawlMap.put("newsLemmas", rLemmaList);
		rCrawlMap.put("newsTokens", rTokenList);
		rCrawlMap.put("translation", rTranslation);

		log.info("###END### : CrawlReuters");

		rList.add(rCrawlMap);
		rCrawlMap = null;
		///////////////////////////////////////////////////

		log.info("###START### : CrawlTimes");

		Map<String, Object> tCrawlMap = new HashMap<>();

		String[] crawlRes2 = WebCrawler.crawltimes();
		String title2 = crawlRes2[0];
		String inputText2 = crawlRes2[1];
		String newsUrl2 = crawlRes2[2];

		Iterator<CoreSentence> tContents = NLPUtil.sentence(inputText2);

		MongoNewsDTO tDTO = new MongoNewsDTO(tContents);

		List<List<String>> tTokenList = tDTO.getTokens();
		List<List<String>> tLemmaList = tDTO.getLemmas();
		List<String> tOriginalSentence = tDTO.getOriginal_sentences();
		List<String> tTranslation = tDTO.getTranslation();
		
		tCrawlMap.put("insertDate", date);
		tCrawlMap.put("newsName", "times");
		tCrawlMap.put("newsUrl", newsUrl2);
		tCrawlMap.put("newsTitle", title2);
		tCrawlMap.put("newsContents", tOriginalSentence);
		tCrawlMap.put("newsLemmas", tLemmaList);
		tCrawlMap.put("newsTokens", tTokenList);
		tCrawlMap.put("translation", tTranslation);

		log.info("###END### : Crawl Times");

		rList.add(tCrawlMap);
		rCrawlMap = null;
		///////////////////////////////////////////////////

		Map<String, Object> yCrawlMap = new HashMap<>();

		String[] crawlRes3 = WebCrawler.crawlyonhap();
		String title3 = crawlRes3[0];
		String inputText3 = crawlRes3[1];
		String newsUrl3 = crawlRes3[2];

		Iterator<CoreSentence> yContents = NLPUtil.sentence(inputText3);

		MongoNewsDTO yDTO = new MongoNewsDTO(yContents);

		List<List<String>> yTokenList = yDTO.getTokens();
		List<List<String>> yLemmaList = yDTO.getLemmas();
		List<String> yOriginalSentence = yDTO.getOriginal_sentences();
		List<String> yTranslation = yDTO.getTranslation();
		
		yCrawlMap.put("insertDate", date);
		yCrawlMap.put("newsName", "yonhap");
		yCrawlMap.put("newsUrl", newsUrl3);
		yCrawlMap.put("newsTitle", title3);
		yCrawlMap.put("newsContents", yOriginalSentence);
		yCrawlMap.put("newsLemmas", yLemmaList);
		yCrawlMap.put("newsTokens", yTokenList);
		yCrawlMap.put("translation", yTranslation);
		
		rList.add(yCrawlMap);
		yCrawlMap = null;
		return rList;
	}
	
	
	// 웹크롤링한 뉴스  MYSQL DB에 저장
		@Override
		public int MySQLsaveNews(String title, String inputText, String newsUrl, String newsname) throws Exception {

			log.info(this.getClass().getName() + "saveNews start");

			NewsDTO pDTO = new NewsDTO();

			pDTO.setNews_title(title);
			pDTO.setNews_contents(inputText);
			pDTO.setNews_url(newsUrl);
			pDTO.setNews_name(newsname);

			log.info("nDTO : " + pDTO.getNews_title());
			log.info("nDTO : " + pDTO.getNews_contents());
			log.info("nDTO : " + pDTO.getNews_url());
			log.info("nDTO : " + pDTO.getNews_name());

			int saved = newsMapper.InsertNewsInfo(pDTO);
			pDTO = null;

			return saved;
		}

		// MySQl DB에서 데이터 가져오기
	@Override
	public List<NewsDTO> getNewsInfoFromDB() {
		return newsMapper.getNewsInfoFromDB();
	}
	
	
	@Override
	// @Scheduled(cron = "0 0 7 ? * *")
	// mySQL DB에 저장
	public void testscheduleCrawl() throws Exception {
		int res = 0;
		
		
		log.info(this.getClass().getName() + "crawlHerald() start");
		String[] crawlRes = WebCrawler.crawlHerald();
		String title = crawlRes[0];
		String inputText = crawlRes[1];
		String newsUrl = crawlRes[2];
		String newsname = "herald";

		log.info("title : " + title);
		log.info("inputText : " + inputText);
		log.info("newsUrl : " + newsUrl);
		res = MySQLsaveNews(title, inputText, newsUrl, newsname);
		log.info(this.getClass().getName() + "crawlHerald() end");

		log.info(this.getClass().getName() + "crawlreuters() start");
		String[] crawlRes1 = WebCrawler.crawlreuters();
		String title1 = crawlRes1[0];
		String inputText1 = crawlRes1[1];
		String newsUrl1 = crawlRes1[2];
		String newsname1 = "reuters";
		res += MySQLsaveNews(title1, inputText1, newsUrl1, newsname1);
		log.info(this.getClass().getName() + "crawlbbc() end");

		log.info(this.getClass().getName() + "crawltimes() start");
		String[] crawlRes2 = WebCrawler.crawltimes();
		String title2 = crawlRes2[0];
		String inputText2 = crawlRes2[1];
		String newsUrl2 = crawlRes2[2];
		String newsname2 = "times";
		res += MySQLsaveNews(title2, inputText2, newsUrl2, newsname2);
		log.info(this.getClass().getName() + "crawltimes() end");

		log.info(this.getClass().getName() + "crawlyonhap() start");
		String[] crawlRes3 = WebCrawler.crawlyonhap();
		String title3 = crawlRes3[0];
		String inputText3 = crawlRes3[1];
		String newsUrl3 = crawlRes3[2];
		String newsname3 = "yonhap";
		res += MySQLsaveNews(title3, inputText3, newsUrl3, newsname3);
		log.info(this.getClass().getName() + "crawlyonhap()) end");

		// 뉴스 결과 넣어주기
		// model.addAttribute("res", String.valueOf(res));

		log.info(this.getClass().getName() + ".getNewsInfoFromWEB End!");
		

	}

}
