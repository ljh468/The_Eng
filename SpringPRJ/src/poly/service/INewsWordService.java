package poly.service;

import java.util.List;
import java.util.Map;

import poly.dto.MongoNewsDTO;
import poly.dto.UserDTO;

public interface INewsWordService {

	List<Map<String, Object>> extractWords(MongoNewsDTO pDTO) throws Exception;

	void loadWordPool() throws Exception;

	
}
