package poly.persistance.mongo;

import java.util.List;
import java.util.Map;

public interface IMongoNewsMapper {

	Map<String, List<String>> getWordPool() throws Exception;
	
	List<String> getWordMeaning(List<String> rList);

	String meaningtest(String word) throws Exception;

	int getLevel(String word) throws Exception;

	

	

}