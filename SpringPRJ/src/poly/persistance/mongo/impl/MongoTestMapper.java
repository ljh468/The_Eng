package poly.persistance.mongo.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Component;

import com.mongodb.BasicDBObject;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;

import poly.dto.MongoNewsDTO;
import poly.dto.WordQuizDTO;
import poly.persistance.mongo.IMongoTestMapper;

@Component("MongoTestMapper")
// 유저가 사용하는 시스템에 대한 조작장치를 이야기 한다
public class MongoTestMapper implements IMongoTestMapper {

	@Autowired
	private MongoTemplate mongodb;
	// 생성자나 세터 등을 사용하여 의존성 주입을 하려고 할 때, 해당 빈을 찾아서 주입해주는 annotation.

	private static final String COL_NM = "news";

	Logger log = Logger.getLogger(this.getClass());

	// 몽고 DB의 news컬렉션에 insert
	@Override
	public void insert(Object obj) throws Exception {
		mongodb.insert(obj, "news");
	}

	// 몽고 DB의 quizBank컬렉션에 insert
	@Override
	public void insertQuiz(Object obj) throws Exception {
		mongodb.insert(obj, "quizBank");
	}

	/**
	 * ############################################## mongoDB에서 뉴스별 가장 최신뉴스 가져오기
	 * ##############################################
	 */
	@Override
	public MongoNewsDTO getHeraldNews() throws Exception {

		log.info(getClass().getName() + "getHeraldMapper start");
		DBObject firstNews = mongodb.getCollection(COL_NM).find(new BasicDBObject("news_name", "herald"))
				.sort(new BasicDBObject("insertDate", -1)).limit(1).next();
		MongoNewsDTO rDTO = new MongoNewsDTO(firstNews);
		return rDTO;
	}

	@Override
	public MongoNewsDTO getReutersNews() {
		log.info(getClass().getName() + "getReuterMapper start");
		DBObject firstNews = mongodb.getCollection(COL_NM).find(new BasicDBObject("news_name", "reuters"))
				.sort(new BasicDBObject("insertDate", -1)).limit(1).next();
		MongoNewsDTO rDTO = new MongoNewsDTO(firstNews);
		return rDTO;
	}
	
	@Override
	public MongoNewsDTO getTimesNews() throws Exception {

		log.info(getClass().getName() + "getTimesMapper start");
		DBObject firstNews = mongodb.getCollection(COL_NM).find(new BasicDBObject("news_name", "times"))
				.sort(new BasicDBObject("insertDate", -1)).limit(1).next();
		MongoNewsDTO rDTO = new MongoNewsDTO(firstNews);
		return rDTO;
	}
	@Override
	public MongoNewsDTO getYonhapNews() {
		log.info(getClass().getName() + "getYonhapMapper start");
		DBObject firstNews = mongodb.getCollection(COL_NM).find(new BasicDBObject("news_name", "yonhap"))
				.sort(new BasicDBObject("insertDate", -1)).limit(1).next();
		MongoNewsDTO rDTO = new MongoNewsDTO(firstNews);
		return rDTO;
	}
	
	// url로 퀴즈 가져오기
	@Override
	public WordQuizDTO getQuiz(DBObject query) throws Exception{
		log.info(getClass().getName() +"getQuiz start");
		DBObject quiz = mongodb.getCollection("quizBank").find(query).next();
		
		WordQuizDTO rDTO = new WordQuizDTO(quiz);
		return rDTO;
	}

	@Override
	public List<Map<String, Object>> test() throws Exception {
		// List형태로 데이터를 넘겨주기위한 메서드 test()

//		DBObject res = mongodb.getCollection("news").find().one();
		DBCursor res = mongodb.getCollection("news").find();
		// res 변수에 mongodb collection 이름이 news인 것을 찾아 정보를 저장
		List<Map<String, Object>> rList = new ArrayList<>();

		while (res.hasNext()) {
			DBObject obj = res.next();

			Map<String, Object> rMap = new HashMap<>();
			rMap.put("name", (String) obj.get("name"));
			// 키 이름이 name이고 mongodb name에 있는 정보를 (String) 후 put

			rMap.put("age", (Integer) obj.get("age"));
			rMap.put("sentence", (List<String>) obj.get("sentence"));
			// 키 이름 sentence에 mongodb sentence에 있는 정보를 형변환 후 put

			rList.add(rMap);
		}

		return rList;
	}

	// Mongodb에 조건을 추가한 메서드
	@Override
	public List<Map<String, Object>> selectWithCondition(DBObject query) throws Exception {
		DBCursor res = mongodb.getCollection("news").find(query);
		// find(query) = 컬렉션 이름이 news인 데이터를 res에 대입
		// iterator처럼 쓰는 것

		List<Map<String, Object>> rList = new ArrayList<>();
		while (res.hasNext()) {
			DBObject obj = res.next();
			// obj에 res를 대입
			Map<String, Object> rMap = new HashMap<>();
			rMap.put("url", (String) obj.get("news_url"));
			// 키 name에 name데이터를 put
			rMap.put("news_name", (String) obj.get("news_name"));
			rMap.put("sentence", (List<String>) obj.get("original_sentences"));

			rList.add(rMap);
		}

		return rList;
	}

	@Override
	public List<Map<String, Object>> getPastHeraldNews() throws Exception {
		
		log.info(getClass().getName() + "getPastHeraldMapper start");
		
		DBCursor res = mongodb.getCollection(COL_NM).find(new BasicDBObject("news_name", "herald")).sort(new BasicDBObject("insertDate", -1)).limit(5);
		
		List<Map<String, Object>> rList = new ArrayList<>();
		
		while (res.hasNext()) {
			DBObject obj = res.next();
			Map<String, Object> rMap = new HashMap<>();
			
			rMap.put("url", (String) obj.get("news_url"));
			rMap.put("news_title", (String) obj.get("news_title"));
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			String date = transFormat.format((Date) obj.get("insertDate"));
			rMap.put("date", date);
			
			rList.add(rMap);
			rMap=null;
		}
		return rList;
	}

	@Override
	public List<Map<String, Object>> getPastReutersNews() throws Exception {
		log.info(getClass().getName() + "getPastReutersMapper start");
		
		DBCursor res = mongodb.getCollection(COL_NM).find(new BasicDBObject("news_name", "reuters")).sort(new BasicDBObject("insertDate", -1)).limit(5);
		
		List<Map<String, Object>> rList = new ArrayList<>();
		
		while (res.hasNext()) {
			DBObject obj = res.next();
			Map<String, Object> rMap = new HashMap<>();
			
			rMap.put("url", (String) obj.get("news_url"));
			rMap.put("news_title", (String) obj.get("news_title"));
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			String date = transFormat.format((Date) obj.get("insertDate"));
			rMap.put("date", date);
			
			rList.add(rMap);
			rMap=null;
		}
		return rList;
	}

	@Override
	public List<Map<String, Object>> getPastTimesNews() throws Exception {
		log.info(getClass().getName() + "getPastTimesMapper start");
		
		DBCursor res = mongodb.getCollection(COL_NM).find(new BasicDBObject("news_name", "times")).sort(new BasicDBObject("insertDate", -1)).limit(5);
		
		List<Map<String, Object>> rList = new ArrayList<>();
		
		while (res.hasNext()) {
			DBObject obj = res.next();

			Map<String, Object> rMap = new HashMap<>();
			rMap.put("url", (String) obj.get("news_url"));
			rMap.put("news_title", (String) obj.get("news_title"));
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			String date = transFormat.format((Date) obj.get("insertDate"));
			rMap.put("date", date);
			
			rList.add(rMap);
			rMap=null;
		}
		return rList;
	}

	@Override
	public List<Map<String, Object>> getPastYonhapNews() throws Exception {
		log.info(getClass().getName() + "getPastYonhapMapper start");
		
		DBCursor res = mongodb.getCollection(COL_NM).find(new BasicDBObject("news_name", "yonhap")).sort(new BasicDBObject("insertDate", -1)).limit(5);
		
		List<Map<String, Object>> rList = new ArrayList<>();
		
		while (res.hasNext()) {
			DBObject obj = res.next();

			Map<String, Object> rMap = new HashMap<>();
			rMap.put("url", (String) obj.get("news_url"));
			// 키 name에 name데이터를 put
			rMap.put("news_title", (String) obj.get("news_title"));
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			String date = transFormat.format((Date) obj.get("insertDate"));
			rMap.put("date", date);
			
			rList.add(rMap);
			rMap=null;
		}
		return rList;
	}
}
