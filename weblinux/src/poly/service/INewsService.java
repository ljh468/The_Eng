package poly.service;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;

import poly.dto.MongoNewsDTO;
import poly.dto.NewsDTO;

public interface INewsService {
	

	// 저장된 뉴스 DB에서 가져오기
	List<NewsDTO> getNewsInfoFromDB();

	public List<MongoNewsDTO> crawlingAll() throws Exception;

	int testscheduleCrawl() throws Exception;
	
	// 웹크롤링한 뉴스 mySQL DB에 저장하기
	int MySQLsaveNews(String title, String inputText, String newsUrl, String newsname) throws Exception;

	JSONObject scoreTranslate(HttpServletRequest request) throws Exception;



	
}