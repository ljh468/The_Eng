package poly.service;

import poly.dto.TheDTO;

public interface ITheService {

	TheDTO getUserInfo(TheDTO tDTO);

	int UserSignUp(TheDTO tDTO);

	TheDTO idCheck(String userId);
	
}
