package poly.service;

import java.util.Map;

public interface IAudioService {

	byte[] getTodaySentenceAudio(String newsUrl, String idx) throws Exception;

	Map<String, Object> analyzeAudio(String data, String sentenceAudioIdx, String sentenceAudioIdx2) throws Exception;

	byte[] getAnswerAudio(String answer_temp_file) throws Exception;

	
}
