package poly.dto;

/**
 * @author 김창영
 * @version 1.1 뉴스  DTO
 */
public class NewsDTO {
	
	private String news_no; // 뉴스번호
	private String news_title; // 뉴스 제목
	private String news_contents; // 뉴스 내용
	private String news_insertdate; // 등록한 날짜
	private String news_url; // 웹크롤링한 뉴스 url
	private String news_name; // 데이터를 수집한 뉴스신문사


	public String getNews_no() {
		return news_no;
	}

	public void setNews_no(String news_no) {
		this.news_no = news_no;
	}

	public String getNews_title() {
		return news_title;
	}

	public void setNews_title(String news_title) {
		this.news_title = news_title;
	}

	public String getNews_contents() {
		return news_contents;
	}

	public void setNews_contents(String news_content) {
		this.news_contents = news_content;
	}

	public String getNews_insertdate() {
		return news_insertdate;
	}

	public void setNews_insertdate(String news_insertdate) {
		this.news_insertdate = news_insertdate;
	}

	public String getNews_url() {
		return news_url;
	}

	public void setNews_url(String news_url) {
		this.news_url = news_url;
	}

	public String getNews_name() {
		return news_name;
	}

	public void setNews_name(String news_name) {
		this.news_name = news_name;
	}

	

	

}
