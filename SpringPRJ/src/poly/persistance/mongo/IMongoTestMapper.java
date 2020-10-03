package poly.persistance.mongo;

import java.util.List;
import java.util.Map;

import com.mongodb.DBObject;

import poly.dto.MongoNewsDTO;

public interface IMongoTestMapper {

	public boolean createCollection(String colNm) throws Exception;

	public void insertWords() throws Exception;

	public List<Map<String, Object>> test() throws Exception;

	public List<Map<String, Object>> selectWithCondition(DBObject query) throws Exception;

	public void insert(Object obj) throws Exception;

	public MongoNewsDTO getHeraldNews() throws Exception;

	public MongoNewsDTO getTimesNews() throws Exception;

	public MongoNewsDTO getReutersNews() throws Exception;

	public MongoNewsDTO getYonhapNews() throws Exception;

	



}