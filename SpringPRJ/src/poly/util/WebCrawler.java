package poly.util;

import java.io.IOException;
import java.util.Iterator;

import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;


public class WebCrawler {
	
	// 코리아헤럴드
	public static String[] crawlHerald() throws IOException {

		// 코리아헤럴드 주소
		String url = "http://www.koreaherald.com";

		// 페이지 내용 담을 객체
		Document doc = null;

		// 홈페이지 정보 가져오기
		doc = Jsoup.connect(url).get();

		// 홈페이지의 가운데 기사 뽑아오기
		Element element = doc.select("a.main_c_art_main").first();

		// 가운데 기사의 링크 가져오기
		String href = element.attr("href");

		// 기사 링크로 들어가기
		doc = Jsoup.connect(url + href).get();

		// 기사 내용 추출
		StringBuilder articleSb = new StringBuilder();

		Iterator<Element> it = doc.select("#articleText div.view_con_t").iterator();

		while (it.hasNext()) {
			articleSb.append(it.next().ownText());
		}

		element = doc.selectFirst("h1.view_tit");

		String title = element.text();

		return new String[] { title, articleSb.toString(), url + href };

	}	
	
	/**
	 *  bbc영어 웹크롤링
	 */
	public static String[] crawlbbc() throws IOException {
		
			int res = 0; // 크롤링 결과 (0보다 크면 크롤링 성공)

			// 코리아헤럴드 사이트 (https:// 는 보안때문에 불가)
			String url = "http://www.bbc.com/news/world";

			// JSOUP 라이브러리를 통해 사이트에 접속되면, 그 사이트 전체의 HTML 소스를 저장할 변수
			Document doc = null;

			// 사이트 접속
			doc = Jsoup.connect(url).get();

			// 사이트에 접속하여 전체 기사 중 메인 기사를 찾아 들어가야 함.

			// 웹 페이지 전체 소스 중 일부 태그를 선택하기 위해 사용
			// 메인페이지의 url을 가져오기 위함
			Element element_urlGet = doc.select("a.gs-c-promo-heading").first();

			// element_urlGet 소스에 href를 가져옴
			String href = element_urlGet.attr("href");
			
			// 기사 링크로 들어가기
			doc = Jsoup.connect("http://www.bbc.com"+href).get();

			// 뉴스의 제목
			Element element_title = doc.select("#main-heading").first();
			String news_title = CmmUtil.nvl(element_title.text().trim().toString());
			// <div class="view_tit_byline_l"><a
			// href="/search/list_name.php?byline=Ock+Hyun-ju">By Ock Hyun-ju</a></div>


			// <div class="view_con_t"> 뉴스의 내용
			Elements element_contents = doc.select("div.e1xue1i82");
			String news_contents = CmmUtil.nvl(element_contents.next().text().trim().toString());
			
		return new String[] { news_title, news_contents, "http://www.bbc.com"+href };
	}
	
	/**
	 * times 웹크롤링
	 */
	public static String[] crawltimes() throws IOException {
		int res = 0; // 크롤링 결과 (0보다 크면 크롤링 성공)

		// 코리아타임즈 사이트 (https:// 는 보안때문에 불가)
		String url = "https://www.koreatimes.co.kr/www2/index.asp";

		// JSOUP 라이브러리를 통해 사이트에 접속되면, 그 사이트 전체의 HTML 소스를 저장할 변수
		Document doc = null;
		// 사이트 접속
		doc = Jsoup.connect(url).get();
		// 사이트에 접속하여 전체 기사 중 메인 기사를 찾아 들어가야 함.
		// 웹 페이지 전체 소스 중 일부 태그를 선택하기 위해 사용

		Elements element_urlGet = doc.select("div.top1_headline a");
		
		// element_urlGet 소스에 href를 가져옴
		String newsUrl = (element_urlGet.attr("href")).toString();
		
		// 크롤링하는 값 앞에 기본 주소가 있어야 함.
		url = "http://www.koreatimes.co.kr" + newsUrl;
		
		// 메인 기사 주소로 재접속
		doc = Jsoup.connect(url).get();
		
		// 제목과 날짜
		Elements element_title_date = doc.select("div.view_HD_div"); 
		
		// 뉴스의 제목
		// 로그를 찍기 위함
		String news_title = element_title_date.select("div.view_headline").text();
				
		// 뉴스의 날짜
		String newsGetDate = element_title_date.select("div.view_date").text();
		String news_dt = newsGetDate.substring(9, 19);
		
		// 뉴스의 내용
		Elements element_contents = doc.select("div#startts span");
		String news_contents = element_contents.text();
		String test_news_contents = news_contents.substring(0, 100);
		
		return new String[] { news_title, news_contents, url };
	}
	
	/**
	 * yonhap 웹크롤링
	 */
	public static String[]crawlyonhap() throws IOException {
		int res = 0; // 크롤링 결과 (0보다 크면 크롤링 성공)

		// 연합뉴스 사이트 (https:// 는 보안때문에 불가)
		String url = "http://en.yna.co.kr";

		// JSOUP 라이브러리를 통해 사이트에 접속되면, 그 사이트 전체의 HTML 소스를 저장할 변수
		Document doc = null;

		// 사이트 접속
		doc = Jsoup.connect(url).get();
		//log.info(doc.toString());

		// 사이트에 접속하여 전체 기사 중 메인 기사를 찾아 들어가야 함.

		// 웹 페이지 전체 소스 중 일부 태그를 선택하기 위해 사용
		// 메인페이지의 url을 가져오기 위함
		Elements element_urlGet = doc.select("article.top-news-zone" + " div.box" + " a");
		//log.info("element_urlGet: "+ element_urlGet.toString());
		
		// element_urlGet 소스에 href를 가져옴
		url = "http:" + element_urlGet.attr("href");

		// 메인 기사 주소로 재접속
		doc = Jsoup.connect(url).get();

		// 뉴스의 제목
		Elements element_titleget = doc.select("h1.tit");
		String element_title = element_titleget.text();

		// <div class="view_tit_byline_l"><a
		// href="/search/list_name.php?byline=Ock+Hyun-ju">By Ock Hyun-ju</a></div>
		// 뉴스의 기자
		String element_author = "없음";

		// <div class="view_tit_byline_r">Published : Aug 26, 2020 - 15:44
		// &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Updated : Aug 26, 2020 - 20:36</div>
		// 뉴스의 날짜
		Elements element_dateget = doc.select("div.info-con" + " span.txt");
		String element_date = element_dateget.text();
		// split으로 앞의 불필요한 문자들을 삭제 후 삽입할 것
		// <div class="view_con_t"> 뉴스의 내용
		Elements element_contentsget = doc.select("div.article-story");
		String element_contents = element_contentsget.text();
		
		return new String[] { element_title, element_contents, url };
	}
	public static String getMeaning(String word) throws IOException {

		// 위키 주소
		String url = "https://en.wiktionary.org/wiki/" + word;

		// 페이지 내용 담을 객체
		Document doc = null;

		// 홈페이지 정보 가져오기
		doc = Jsoup.connect(url).get();

		// 첫번째 단어 가져오기
		Elements e = doc.select("ol > li");
		Iterator<Element> it = e.iterator();
		String meaning = null;
		while (it.hasNext()) {
			e.select("span.HQToggle").remove();
			e.select("ul").remove();
			e.select("dl").remove();
			if (e.text().trim().equals("")) {
				continue;
			} else {
				meaning = e.text().trim();
				break;
			}
		}

		return meaning;

	}
}
