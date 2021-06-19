package kr.co.mlec.member.dao;

import kr.co.mlec.member.vo.MemberVO;

public interface MemberDAO {

	
	/**
	 * login
	 */
	public MemberVO login(MemberVO loginVO);
}
