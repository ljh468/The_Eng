package poly.persistance.mongo;

import poly.dto.QuizInfoDTO;


// qiuz를 받아올때 user_id 와 Url로 저장
public interface IMongoQuizMapper {
	
	QuizInfoDTO getQuizInfo(String user_id, String newsUrl);
	
	void nextQuiz(String user_id, String newsUrl);

}
