package poly.dto;

import com.mongodb.DBObject;

public class QuizInfoDTO {

	private String user_id;  // 사용자아이디
	private int idx; // 사용자의 퀴즈를 푼 idx (+1 씩 늘려줌)
	private String newsUrl; // 뉴스의 url (기본키)

	public QuizInfoDTO(String user_id, int idx, String newsUrl) {
		super();
		this.user_id = user_id;
		this.idx = idx;
		this.newsUrl = newsUrl;
	}

	public QuizInfoDTO(DBObject obj) {
		this.user_id = (String) obj.get("user_id");
		this.idx = (int) obj.get("idx");
		this.newsUrl = (String) obj.get("newsUrl");
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getNewsUrl() {
		return newsUrl;
	}

	public void setNewsUrl(String newsUrl) {
		this.newsUrl = newsUrl;
	}
	
	// user_id와 newUrl을 조회하여 idx를 업데이트 하기위한 toString() 메서드
	@Override
	public String toString() {
		return "QuizInfoDTO [user_id=" + user_id + ", idx=" + idx + ", newsUrl=" + newsUrl + "]";
	}

}
