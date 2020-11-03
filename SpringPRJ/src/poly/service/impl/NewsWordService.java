package poly.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import poly.dto.MongoNewsDTO;
import poly.persistance.mongo.IMongoNewsMapper;
import poly.persistance.mongo.IMongoTestMapper;
import poly.persistance.redis.IRedisNewsWordMapper;
import poly.service.INewsWordService;

@Service("NewsWordService")
public class NewsWordService implements INewsWordService {

	@Resource(name = "MongoTestMapper")
	IMongoTestMapper mongoTestMapper;

	@Resource(name = "MongoNewsMapper")
	IMongoNewsMapper mongoNewsMapper;
	
//	@Resource(name = "RedisNewsWordMapper")
//	IRedisNewsWordMapper redisNewsWordMapper;

	private Map<String, List<String>> WORD_POOL = new HashMap<>();

	Logger log = Logger.getLogger(this.getClass());
	
	/** 단어 데이터 초반에 불러오기
	 *
	 */
	@Override
	@PostConstruct
	public void loadWordPool() throws Exception {
		
		log.info(this.getClass().getName() + ".loadWordPool start");
		
		WORD_POOL = mongoNewsMapper.getWordPool();
		
		log.info(this.getClass().getName() + ".loadWordPool end");
		
	}
	
	////// wordpool에서 meanning 가져오기
	@Override
	public List<String> getWordMeaning(List<String> rList) {
		log.info(this.getClass().getName() + ".Meaning start");
		
		List<String> wList = mongoNewsMapper.getWordMeaning(rList);
		
		log.info(this.getClass().getName() + ".Meaning end");
		return wList;
	}
	
	/** @return : [{lemma : (String)"단어원형", pool : (List of String)"속한 풀", sntncIdx : (Integer)"문장 인덱스", wordIdx : (Integer)"단어 인덱스"}]
	 *
	 */
	@Override
	public List<Map<String, Object>> extractWords(MongoNewsDTO pDTO) throws Exception {
		
		log.info(this.getClass().getName() + ".extractWords start");
		
		List<Map<String, Object>> rList = new ArrayList<>();
		Map<String, Object> pMap = null;
		
		int sntncIdx = 0;
		
		// 각 단어의 동사원형으로 for each
		for(List<String> lemmasBySentence : pDTO.getLemmas()) {
			int wordIdx = 0;
			for(String lemma : lemmasBySentence) {
				if(WORD_POOL.containsKey(lemma.toLowerCase())) {
					WORD_POOL.remove(lemma.toLowerCase());           // 중복 단어 제거
					pMap = new HashMap<String, Object>();
					pMap.put("lemma", lemma);
					pMap.put("word", pDTO.getTokens().get(sntncIdx).get(wordIdx));
					pMap.put("pool", WORD_POOL.get(lemma.toLowerCase()));
					pMap.put("sntncIdx", sntncIdx);
					pMap.put("wordIdx", wordIdx);
					rList.add(pMap);
					pMap = null;
				}
				wordIdx++;
			}
			sntncIdx++;
		}
		
		log.info(this.getClass().getName() + ".extractWords end");
		return rList;
	}

	@Override
	public List<Map<String, Object>> getTodaySentences() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	// meaning 가져오기 test
	@Override
	public String meaningtest(String word) throws Exception {
		
		log.info(this.getClass().getName() + ".getWordMeaning start");
		
		String mean = mongoNewsMapper.meaningtest(word);
		
		log.info(this.getClass().getName() + ".getWordMeaning end");
		return mean;
		
	}

}