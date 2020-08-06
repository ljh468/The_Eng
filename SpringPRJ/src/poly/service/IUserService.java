package poly.service;

import poly.dto.UserDTO;

public interface IUserService {

	UserDTO getUserInfo(UserDTO tDTO);

	int UserSignUp(UserDTO tDTO);

	UserDTO idCheck(String userId);
	
}
