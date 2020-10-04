package poly.service;


import java.util.List;
import java.util.Map;

import poly.dto.MongoNewsDTO;
import poly.dto.NewsDTO;

public interface INewsService {
	

	// 저장된 뉴스 DB에서 가져오기
	List<NewsDTO> getNewsInfoFromDB();

	public List<Map<String, Object>> crawlingAll() throws Exception;

	void testscheduleCrawl() throws Exception;
	
	// 웹크롤링한 뉴스 mySQL DB에 저장하기
	int MySQLsaveNews(String title, String inputText, String newsUrl, String newsname) throws Exception;



	
}