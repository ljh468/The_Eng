package poly.dto;

import java.util.ArrayList;
import java.util.List;

import com.mongodb.DBObject;

public class WordQuizDTO {

	private String url;
	private String new_title;
	private String title_trans;
	private List<String> original_sent;
	private List<String> quiz_sent;
	private List<String> word;
	private List<String> lemma;
	private List<String> answersentence;
	private List<String> translation;  // 문장번역
	private List<String> distinct_idx; // 중복을 제거한 문장 인덱스
	
	private int correctCounter;
	private int totalQs;
	private int answeredQCount;
	
	public WordQuizDTO() {
		this.url = new String();
		this.new_title = new String();
		this.title_trans = new String();
		this.original_sent = new ArrayList<>();
		this.quiz_sent = new ArrayList<>();
		this.word = new ArrayList<>();		
		this.lemma = new ArrayList<>();		
		this.answersentence = new ArrayList<>();
		this.distinct_idx = new ArrayList<>();
	}
	
	@SuppressWarnings("unchecked")
	   public WordQuizDTO(DBObject quiz) {
		
		this.url = (String) (quiz).get("url");
		this.new_title = (String) (quiz).get("new_title");
		this.title_trans = (String) (quiz).get("title_trans");
		this.original_sent = (List <String>) (quiz).get("original_sent");
		this.quiz_sent = (List <String>) (quiz).get("quiz_sent");
		this.word = (List <String>) (quiz).get("word");
		this.lemma = (List <String>) (quiz).get("lemma");
		this.answersentence = (List <String>) (quiz).get("answersentence");
		this.translation = (List <String>) (quiz).get("translation");
		this.distinct_idx = (List <String>) (quiz).get("distinct_idx");
		  
	   }
	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public List<String> getOriginal_sent() {
		return original_sent;
	}
	public void setOriginal_sent(List<String> original_sent) {
		this.original_sent = original_sent;
	}
	public List<String> getQuiz_sent() {
		return quiz_sent;
	}
	public void setQuiz_sent(List<String> quiz_sent) {
		this.quiz_sent = quiz_sent;
	}
	public List<String> getWord() {
		return word;
	}
	public void setWord(List<String> word) {
		this.word = word;
	}

	public List<String> getDistinct_idx() {
		return distinct_idx;
	}

	public void setDistinct_idx(List<String> distinct_idx) {
		this.distinct_idx = distinct_idx;
	}

	public int getCorrectCounter() {
		return correctCounter;
	}
	public void setCorrectCounter(int correctCounter) {
		this.correctCounter = correctCounter;
	}
	public int getTotalQs() {
		return totalQs;
	}
	public void setTotalQs(int totalQs) {
		this.totalQs = totalQs;
	}
	public int getAnsweredQCount() {
		return answeredQCount;
	}
	public void setAnsweredQCount(int answeredQCount) {
		this.answeredQCount = answeredQCount;
	}
	public List<String> getAnswersentence() {
		return answersentence;
	}
	public void setAnswersentence(List<String> answersentence) {
		this.answersentence = answersentence;
	}

	public List<String> getTranslation() {
		return translation;
	}

	public void setTranslation(List<String> translation) {
		this.translation = translation;
	}

	public List<String> getLemma() {
		return lemma;
	}

	public void setLemma(List<String> lemma) {
		this.lemma = lemma;
	}

	public String getNew_title() {
		return new_title;
	}

	public void setNew_title(String new_title) {
		this.new_title = new_title;
	}

	public String getTitle_trans() {
		return title_trans;
	}

	public void setTitle_trans(String title_trans) {
		this.title_trans = title_trans;
	}
	
	
	
}