package poly.persistance.mongo.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Component;

import com.mongodb.BasicDBObject;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;

import poly.dto.QuizInfoDTO;
import poly.persistance.mongo.IMongoQuizMapper;

@Component("MongoQuizMapper")
public class MongoQuizMapper implements IMongoQuizMapper{
   
   @Autowired
   private MongoTemplate mongodb;
   
   
   // UserquizInfo에서 id와 url로 불러오기 ( 뉴스선택하면 ) 
   @Override
   public QuizInfoDTO getQuizInfo(String user_id, String news_url) {
      
      DBObject query = new BasicDBObject("user_id", user_id).append("news_url", news_url);
      
      DBCursor cursor = mongodb.getCollection("userQuizInfo").find(query);
      
      QuizInfoDTO qDTO = null;
      if(cursor.size()==0) {
         qDTO = new QuizInfoDTO(user_id, 0, news_url);
         mongodb.insert(qDTO, "userQuizInfo");
      }else {
         qDTO = new QuizInfoDTO(cursor.next());
      }
      return qDTO;
   }

   
   // userquiz의   index 를 추가 하기 위해 ( 문제를 풀고 제출할때 ajax으로  인덱스 업데이트)
   @Override
   public void nextQuiz(String user_id, String news_url) {
      
      DBObject query = new BasicDBObject("user_id", user_id).append("news_url", news_url);
      //DBObject update = new BasicDBObject("idx", new BasicDBObject("$inc", 1));  
      DBObject update = new BasicDBObject().append("$inc",new BasicDBObject().append("idx", 1));
      // #inc는 숫자를 하나씩 올려서 업데이트
      mongodb.getCollection("userQuizInfo").update(query, update, true, false);
      // user_id 와 url를 유지하여 jsp에서 현재 어디부분인지가 나올수 있도록 구현
   }
   
   
   
   
   
}