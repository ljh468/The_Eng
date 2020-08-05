package poly.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.TheDTO;
import poly.persistance.mapper.ITheMapper;
import poly.service.ITheService;

@Service("TheService")
public class TheService implements ITheService{
	
	@Resource(name="TheMapper")
	private ITheMapper theMapper;

	@Override
	public TheDTO getUserInfo(TheDTO tDTO) {
		return theMapper.getUserInfo(tDTO);
	}

	@Override
	public int UserSignUp(TheDTO tDTO) {
		return theMapper.UserSignUp(tDTO);
	}


	@Override
	public TheDTO idCheck(String userId) {
		return theMapper.idCheck(userId);
	}

}
