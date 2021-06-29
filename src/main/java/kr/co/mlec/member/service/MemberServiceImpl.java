package kr.co.mlec.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.mlec.member.dao.MemberDAO;
import kr.co.mlec.member.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public MemberVO login(MemberVO loginVO) {
		MemberVO member = memberDAO.login(loginVO);
		return member;
	}

	@Override
	public void registerMember(MemberVO member) throws Exception{
		memberDAO.register(member);
	}

	@Override
	public MemberVO getUser(String id) throws Exception{
		MemberVO member = memberDAO.read(id);
		return member;
	}

	@Override
	public void updateUser(MemberVO member) throws Exception {
		memberDAO.update(member);
	}


	
}