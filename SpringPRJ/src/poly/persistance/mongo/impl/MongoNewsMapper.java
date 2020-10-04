package poly.persistance.mongo.impl;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;

import com.mongodb.BasicDBObject;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;

import config.Mapper;
import poly.persistance.mongo.IMongoNewsMapper;

	@Mapper("MongoNewsMapper")
	public class MongoNewsMapper implements IMongoNewsMapper {
		@Autowired
		private MongoTemplate mongodb;
		// 생성자나 세터 등을 사용하여 의존성 주입을 하려고 할 때, 해당 빈을 찾아서 주입해주는 annotation.
		
		private static final String WORD_POOL = "wordPool";
//		private static final String WORD_USAGE = "wordUsage";
//		private static final String REVIEW_WORDS = "reviewWords";
//		private static final SimpleDateFormat SDF = new SimpleDateFormat("yyyyMMdd");

		Logger log = Logger.getLogger(this.getClass());
		
		// mongo wordPool에서 word, pool 뽑아오기
		@SuppressWarnings("unchecked")
		@Override
		public Map<String, List<String>> getWordPool() throws Exception {
			log.info(this.getClass().getName() + ".getWordPool start");

			DBObject query = new BasicDBObject("pool", new BasicDBObject("$in", Arrays.asList("TOEIC", "Academic", "Business")));
			DBCursor cursor = mongodb.getCollection(WORD_POOL).find(query);

			Map<String, List<String>> rMap = new HashMap<>();
			while (cursor.hasNext()) {
				DBObject obj = cursor.next();
				rMap.put((String) obj.get("word"), (List<String>) obj.get("pool"));
			}

			log.info(this.getClass().getName() + ".getWordPool end");
			return rMap;
		
}

	
}


