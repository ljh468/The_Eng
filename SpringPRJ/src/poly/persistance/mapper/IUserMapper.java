package poly.persistance.mapper;

import config.Mapper;
import poly.dto.UserDTO;

@Mapper("UserMapper")
public interface IUserMapper {
	
	UserDTO getUserInfo(UserDTO tDTO);

	int UserSignUp(UserDTO tDTO);

	UserDTO idCheck(String userId);

	UserDTO emailCheck(String userEmail);

	int insertAuthNum(UserDTO uDTO);

	UserDTO authNumCheck(UserDTO uDTO);

}
