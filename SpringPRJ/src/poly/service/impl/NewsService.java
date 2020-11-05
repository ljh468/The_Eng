package poly.service.impl;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.log4j.Logger;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import com.mongodb.BasicDBObject;
import com.mongodb.DBObject;

import edu.stanford.nlp.pipeline.CoreSentence;
import poly.dto.MongoNewsDTO;
import poly.dto.NewsDTO;
import poly.dto.WordQuizDTO;
import poly.persistance.mapper.INewsMapper;
import poly.persistance.mongo.IMongoTestMapper;
import poly.service.INewsService;
import poly.util.CmmUtil;
import poly.util.NLPUtil;
import poly.util.WebCrawler;

@Service("NewsService")
public class NewsService implements INewsService {

	@Resource(name = "NewsMapper")
	private INewsMapper newsMapper;

	@Resource(name = "MongoTestMapper")
	private IMongoTestMapper mongoTestMapper;

	// 로그파일 출력개체
	private Logger log = Logger.getLogger(this.getClass());
	
	// ###############################################
	// 모든 영어 뉴스 크롤링 crawlingAll  !!
	// ###############################################
	@Override
	public List<MongoNewsDTO> crawlingAll() throws Exception {

		log.info("###START### : " + this.getClass().getName() + "crawlingAll start");
		
		List<MongoNewsDTO> rList = new ArrayList<>();

		log.info("###START### : CrawlHerald");
		// KoreaHerald Crawl

		String[] crawlRes = WebCrawler.crawlHerald();
		String title = crawlRes[0];
		String inputText = crawlRes[1];
		String newsUrl = crawlRes[2];
		String newsName = "herald";
		Iterator<CoreSentence> hContents = NLPUtil.sentence(inputText);

		MongoNewsDTO hDTO = new MongoNewsDTO(hContents);

		hDTO.setNews_title(title);
		hDTO.setNews_url(newsUrl);
		hDTO.setNews_name(newsName);

		log.info("###END### : CrawlHerald");

		rList.add(hDTO);
		hDTO = null;
		
		/////////////////////////////////////////////////

		log.info("###START### : Crawlreuters");

		String[] crawlRes1 = WebCrawler.crawlreuters();
		String title1 = crawlRes1[0];
		String inputText1 = crawlRes1[1];
		String newsUrl1 = crawlRes1[2];
		String newsName1 = "reuters";

		Iterator<CoreSentence> rContents = NLPUtil.sentence(inputText1);

		MongoNewsDTO rDTO = new MongoNewsDTO(rContents);

		rDTO.setNews_title(title1);
		rDTO.setNews_url(newsUrl1);
		rDTO.setNews_name(newsName1);

		log.info("###END### : CrawlReuters");

		rList.add(rDTO);
		rDTO = null;

		///////////////////////////////////////////////////

		log.info("###START### : CrawlTimes");

		String[] crawlRes2 = WebCrawler.crawltimes();
		String title2 = crawlRes2[0];
		String inputText2 = crawlRes2[1];
		String newsUrl2 = crawlRes2[2];
		String newsName2 = "times";

		Iterator<CoreSentence> tContents = NLPUtil.sentence(inputText2);

		MongoNewsDTO tDTO = new MongoNewsDTO(tContents);

		tDTO.setNews_title(title2);
		tDTO.setNews_url(newsUrl2);
		tDTO.setNews_name(newsName2);

		log.info("###END### : CrawlTimes");

		rList.add(tDTO);
		tDTO = null;

		///////////////////////////////////////////////////
		log.info("###STart### : CrawlYonhap");
		String[] crawlRes3 = WebCrawler.crawlyonhap();
		String title3 = crawlRes3[0];
		String inputText3 = crawlRes3[1];
		String newsUrl3 = crawlRes3[2];
		String newsName3 = "yonhap";

		Iterator<CoreSentence> yContents = NLPUtil.sentence(inputText3);
		MongoNewsDTO yDTO = new MongoNewsDTO(yContents);

		yDTO.setNews_title(title3);
		yDTO.setNews_url(newsUrl3);
		yDTO.setNews_name(newsName3);

		log.info("###END### : CrawlTimes");

		rList.add(yDTO);
		yDTO = null;
		
		log.info("###END### : " + this.getClass().getName() + "crawlingAll end");
		return rList;
	}

	
	// 웹크롤링한 뉴스 MYSQL DB에 저장
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
	// mySQL DB에 저장    TESTscheduleCrawl
	public int testscheduleCrawl() throws Exception {
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
		return res;
	}
	
	///////////////////////////////////////
	//     파이썬으로 보내서 번역 유사도 확인
	@Override
	public JSONObject scoreTranslate(HttpServletRequest request) throws Exception {
		String requestURL = "http://localhost:5000/scoreTranslate";
		log.info("url : " + request.getParameter("url"));
		log.info("idx : " + request.getParameter("idx"));
		log.info("userAnswer : " + request.getParameter("userAnswer"));
		int idx = Integer.parseInt(request.getParameter("idx"));
		String url = CmmUtil.nvl((String)request.getParameter("url"));
//		String idxst = CmmUtil.nvl(request.getParameter("idx"));
//		int idx = Integer.parseInt(idxst);
//		int idxi = Integer.valueOf(idxst);
		
		
		
		DBObject query = new BasicDBObject("url", url);
		WordQuizDTO nDTO = mongoTestMapper.getQuiz(query);
		
		
		log.info("idx : " + idx);
		log.info("url : " + url);
		log.info("Translation : " + nDTO.getTranslation());
		log.info("getTitle_trans : " + nDTO.getTitle_trans());
		log.info("getOriginal_sent : " + nDTO.getOriginal_sent());
		
		
		String original = nDTO.getTranslation().get(idx);
		log.info("userAnswer : " + request.getParameter("userAnswer"));
		HttpClient httpClient = new DefaultHttpClient();
		
		HttpPost httpPost = new HttpPost(requestURL);
		
		List<NameValuePair> params = new ArrayList<NameValuePair>();
		params.add(new BasicNameValuePair("userAnswer", request.getParameter("userAnswer")));
		params.add(new BasicNameValuePair("original", original));
		httpPost.setEntity(new UrlEncodedFormEntity(params, "UTF-8"));
		
		HttpResponse response = httpClient.execute(httpPost);
		HttpEntity resEntity = response.getEntity();
		System.out.println(response.getStatusLine());
		StringBuffer sb = new StringBuffer();
		if(resEntity != null) {
			try(InputStream instream = resEntity.getContent()){
				BufferedReader reader = new BufferedReader(new InputStreamReader(instream));
		        String line = null;
		        while ((line = reader.readLine()) != null) {
		        	sb.append(line);
		        }
			}
		}
		log.info("sb : " + sb);
		JSONObject res = new JSONObject();
		res.put("original", original);
		res.put("score", sb.toString());
		log.info("score : " + sb.toString());
		log.info("res : " + res);
		return res;
	}
}
