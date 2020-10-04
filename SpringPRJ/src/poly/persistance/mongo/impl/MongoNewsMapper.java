package poly.persistance.mongo.impl;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;

import config.Mapper;
import poly.persistance.mongo.IMongoNewsMapper;

@Mapper("MongoNewsMapper")
// 유저가 사용하는 시스템에 대한 조작장치를 이야기 한다
public class MongoNewsMapper implements IMongoNewsMapper {

	@Autowired
	private MongoTemplate mongodb;
	// 생성자나 세터 등을 사용하여 의존성 주입을 하려고 할 때, 해당 빈을 찾아서 주입해주는 annotation.

	Logger log = Logger.getLogger(this.getClass());

	

	
}
