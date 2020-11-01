package poly.persistance.mongo;

import java.util.List;
import java.util.Map;

public interface IMongoNewsMapper {

	Map<String, List<String>> getWordPool() throws Exception;

	String getWordMeaning(String word) throws Exception;

	List<String> getWordMeaning(List<String> rList);

	

	

}