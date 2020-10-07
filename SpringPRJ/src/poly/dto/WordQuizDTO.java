package poly.dto;

import java.util.List;

public class WordQuizDTO {

	private String url;
	private List<String> original_sent;
	private List<String> quiz_sent;
	private List<String> word;
	private List<String> answersentence;
	
	private int idx;
	private int correctCounter;
	private int totalQs;
	private int answeredQCount;
	
	
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
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
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

}