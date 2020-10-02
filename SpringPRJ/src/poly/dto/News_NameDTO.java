package poly.dto;

/**
 * @author 이협건
 * @version 1.1 공지사항 DTO
 */
public class News_NameDTO {

	private String herald; // 뉴스번호
	private String reuters; // 뉴스 제목
	private String times; // 뉴스 내용
	private String yonhap; // 등록한 날짜
	
	
	public String getHerald() {
		return herald;
	}
	public void setHerald(String herald) {
		this.herald = herald;
	}
	
	public String getTimes() {
		return times;
	}
	public void setTimes(String times) {
		this.times = times;
	}
	public String getYonhap() {
		return yonhap;
	}
	public void setYonhap(String yonhap) {
		this.yonhap = yonhap;
	}
	public String getReuters() {
		return reuters;
	}
	public void setReuters(String reuters) {
		this.reuters = reuters;
	}
}
