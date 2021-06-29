package kr.co.mlec.member.dao;

import kr.co.mlec.member.vo.MemberVO;

public interface MemberDAO {

	
	/**
	 * login
	 */
	public MemberVO login(MemberVO loginVO);
	
	/**
	 *  회원가입
	 */
	
	public void register(MemberVO registerVO) throws Exception;
	
	/**
	 * 마이페이지
	 */
	public MemberVO read(String id);
	
	/**
	 * 업데이트
	 */
	public void update(MemberVO member) throws Exception;
}