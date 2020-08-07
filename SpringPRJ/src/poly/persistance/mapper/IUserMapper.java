package poly.persistance.mapper;

import config.Mapper;
import poly.dto.UserDTO;

@Mapper("UserMapper")
public interface IUserMapper {
	// 게시판 리스트
	UserDTO getUserInfo(UserDTO tDTO);

	int UserSignUp(UserDTO tDTO);

	UserDTO idCheck(String userId);

	UserDTO emailCheck(String userEmail);

}
