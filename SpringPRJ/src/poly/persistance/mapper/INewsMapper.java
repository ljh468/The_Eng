package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.NewsDTO;

@Mapper("NewsMapper")
public interface INewsMapper {

	// 수집한 데이터 DB에 등록
	int InsertNewsInfo(NewsDTO pDTO)throws Exception;
	// 저장된 뉴스 가져오기
	List<NewsDTO> getNewsInfoFromDB();
	
}