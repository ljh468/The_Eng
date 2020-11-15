package poly.persistance.mongo;

import java.util.List;
import java.util.Map;

import com.mongodb.DBObject;

import poly.dto.MongoNewsDTO;
import poly.dto.WordQuizDTO;

public interface IMongoTestMapper {

	public List<Map<String, Object>> test() throws Exception;

	public List<Map<String, Object>> selectWithCondition(DBObject query) throws Exception;

	public MongoNewsDTO getHeraldNews() throws Exception;

	public MongoNewsDTO getTimesNews() throws Exception;

	public MongoNewsDTO getReutersNews() throws Exception;

	public MongoNewsDTO getYonhapNews() throws Exception;
	
	public void insert(Object obj) throws Exception;

	public void insertQuiz(Object obj) throws Exception;

	public WordQuizDTO getQuiz(DBObject query) throws Exception;

	public List<Map<String, Object>> getPastHeraldNews()throws Exception;

	public List<Map<String, Object>> getPastReutersNews()throws Exception;

	public List<Map<String, Object>> getPastTimesNews()throws Exception;

	public List<Map<String, Object>> getPastYonhapNews()throws Exception;




}